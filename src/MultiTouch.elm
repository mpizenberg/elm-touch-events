-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module MultiTouch
    exposing
        ( Event
        , onStart
        , onMove
        , onEnd
        , onCancel
        )

{-| This module exposes types and functions
to deal with multitouch interactions.

@docs Event, onStart, onMove, onEnd, onCancel

-}

import Html
import Html.Events as Events
import Touch
import Private.Touch exposing (Touch)
import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)


{-| Type alias for a multitouch event.

The properties `touches`, `targetTouches` and `changedTouches`
are represented by dictionaries in which the keys are the
unique Int identifier of the touch interactions.

To have more info about these properties and how to use them,
please refer to the [Mozilla documentation]
(<https://developer.mozilla.org/en-US/docs/Web/Events/touchstart>)

-}
type alias Event =
    { changedTouches : Dict Int Touch.Coordinates
    , targetTouches : Dict Int Touch.Coordinates
    , touches : Dict Int Touch.Coordinates
    }


{-| Triggered on a "touchstart" event.
-}
onStart : (Event -> msg) -> Html.Attribute msg
onStart tag =
    on "touchstart" tag


{-| Triggered on a "touchmove" event.
-}
onMove : (Event -> msg) -> Html.Attribute msg
onMove tag =
    on "touchmove" tag


{-| Triggered on a "touchend" event.
-}
onEnd : (Event -> msg) -> Html.Attribute msg
onEnd tag =
    on "touchend" tag


{-| Triggered on a "touchcancel" event.
-}
onCancel : (Event -> msg) -> Html.Attribute msg
onCancel tag =
    on "touchcancel" tag



-- HELPER FUNCTIONS ##################################################


on : String -> (Event -> msg) -> Html.Attribute msg
on event tag =
    Decode.map tag decodeMultiTouch
        |> Events.onWithOptions event Private.Touch.stopOptions


decodeMultiTouch : Decoder Event
decodeMultiTouch =
    Decode.map3 Event
        (Decode.field "changedTouches" decodeTouches)
        (Decode.field "targetTouches" decodeTouches)
        (Decode.field "touches" decodeTouches)


decodeTouches : Decoder (Dict Int Touch.Coordinates)
decodeTouches =
    Decode.maybe Private.Touch.decode
        |> Decode.dict
        |> Decode.map (Dict.values >> filterTouches >> Dict.fromList)


filterTouches : List (Maybe Touch) -> List ( Int, Touch.Coordinates )
filterTouches =
    List.filterMap (Maybe.map touchTuple)


touchTuple : Touch -> ( Int, Touch.Coordinates )
touchTuple touch =
    ( touch.identifier, touch.coordinates )
