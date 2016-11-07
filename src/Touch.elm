-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Touch exposing
    ( TouchEvent(..), Touch
    , preventAndStop
    )


{-| This module exposes types and constants
common to both single and multi touch interactions.

@docs TouchEvent, Touch, preventAndStop
-}


import Html as H
import Html.Events as HE
import Json.Decode as JD exposing ((:=))
import Dict exposing (Dict)




-- MODEL #############################################################




{-| The different types of touch events.
-}
type TouchEvent
    = TouchStart
    | TouchMove
    | TouchEnd
    | TouchCancel


{-| A simple type alias for the clientX and clientY properties
of a JavaScript [Touch](https://developer.mozilla.org/en-US/docs/Web/API/Touch) object.
-}
type alias Touch =
    { clientX : Float
    , clientY : Float
    }




-- EVENTS HANDLING ###################################################




{-| Options to prevent default and stop propagation of an event.

You might want this options to prevent from emulating mouse events
if you are developing an interface for both mobile and regular platforms.

You might also need this to prevent from scrolling in a touch interaction.
-}
preventAndStop : HE.Options
preventAndStop =
    { stopPropagation = True
    , preventDefault = True
    }
