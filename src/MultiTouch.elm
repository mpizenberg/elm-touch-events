-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module MultiTouch
    exposing
        ( MultiTouch
        , onMultiTouch
        )

{-| This module exposes types and functions
to deal with multitouch interactions.

@docs MultiTouch, onMultiTouch
-}

import Html as H
import Html.Events as HE
import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)
import Touch exposing (TouchEvent(..), Touch)
import Touch_private exposing (touchDecoder)


-- MODEL #############################################################


{-| Type alias for a multitouch event.

The properties `touches`, `targetTouches` and `changedTouches`
are represented by dictionaries in which the keys are the
unique Int identifier of the Touch interactions.

To have more info about these properties and how to use them,
please refer to the [Mozilla documentation]
(https://developer.mozilla.org/en-US/docs/Web/Events/touchstart)
-}
type alias MultiTouch =
    { touchType : TouchEvent
    , touches : Dict Int Touch
    , targetTouches : Dict Int Touch
    , changedTouches : Dict Int Touch
    }



-- EVENTS HANDLING ###################################################


{-| An multitouch event handler.

```
import Touch as T
import MultiTouch as MT

type Msg
  = MultiTouchMsg T.TouchEvent MT.MultiTouch

view model =
  H.div [ ST.onMultiTouch T.TouchStart T.preventAndStop <| MultiTouchMsg T.TouchStart ] []
```
-}
onMultiTouch : TouchEvent -> HE.Options -> (MultiTouch -> msg) -> H.Attribute msg
onMultiTouch touchEvent options msgMaker =
    HE.onWithOptions
        (case touchEvent of
            TouchStart ->
                "touchstart"

            TouchMove ->
                "touchmove"

            TouchEnd ->
                "touchend"

            TouchCancel ->
                "touchcancel"
        )
        options
        (Decode.map msgMaker <| decodeMultiTouch touchEvent)


decodeMultiTouch : TouchEvent -> Decoder MultiTouch
decodeMultiTouch touchEvent =
    Decode.map3 (MultiTouch touchEvent)
        (Decode.at [ "touches" ] touchListDecoder)
        (Decode.at [ "targetTouches" ] touchListDecoder)
        (Decode.at [ "changedTouches" ] touchListDecoder)


touchListDecoder : Decoder (Dict Int Touch)
touchListDecoder =
    Decode.maybe touchDecoder
        |> Decode.dict
        |> Decode.map (Dict.values >> (List.filterMap identity) >> Dict.fromList)
