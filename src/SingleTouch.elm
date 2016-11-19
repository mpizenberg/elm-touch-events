-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module SingleTouch
    exposing
        ( SingleTouch
        , onSingleTouch
        )

{-| This module exposes types and functions
to deal with simple single touch interactions.

@docs SingleTouch, onSingleTouch
-}

import Html as H
import Html.Events as HE
import Json.Decode as Decode exposing (Decoder)
import Touch exposing (TouchEvent(..), Touch)
import Touch_private exposing (touchDecoder)


-- MODEL #############################################################


{-| A simple type alias for a single touch event.
-}
type alias SingleTouch =
    { touchType : TouchEvent
    , touch : Touch
    }



-- EVENTS HANDLING ###################################################


{-| A single touch event handler.

```
import Touch as T
import SingleTouch as ST

type Msg
  = TouchMsg T.TouchEvent T.Touch

view model =
  H.div [ ST.onSingleTouch T.TouchStart T.preventAndStop <| TouchMsg T.TouchStart ] []
```
-}
onSingleTouch : TouchEvent -> HE.Options -> (SingleTouch -> msg) -> H.Attribute msg
onSingleTouch touchEvent options msgMaker =
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
        (Decode.map msgMaker <| singleTouchEventDecoder touchEvent)


{-| A touch event (touchstart, touchmove, ...) decoder for only 1 touch.
-}
singleTouchEventDecoder : TouchEvent -> Decoder SingleTouch
singleTouchEventDecoder touchEvent =
    Decode.map (SingleTouch touchEvent << Tuple.second)
        (Decode.at [ "changedTouches", "0" ] <| touchDecoder)
