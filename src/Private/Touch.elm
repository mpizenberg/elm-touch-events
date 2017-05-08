-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Private.Touch exposing (..)

{-| This module exposes internally types and constants
common to both single and multi touch interactions.
-}

import Touch
import Json.Decode as Decode exposing (Decoder)
import Html.Events


type alias Touch =
    { identifier : Int
    , coordinates : Touch.Coordinates
    }


toTuple : Touch -> ( Int, Touch.Coordinates )
toTuple touch =
    ( touch.identifier, touch.coordinates )


decode : Decoder Touch
decode =
    Decode.map2 Touch
        (Decode.field "identifier" Decode.int)
        (Decode.map2 Touch.Coordinates
            (Decode.field "clientX" Decode.float)
            (Decode.field "clientY" Decode.float)
        )


stopOptions : Html.Events.Options
stopOptions =
    { stopPropagation = True
    , preventDefault = True
    }
