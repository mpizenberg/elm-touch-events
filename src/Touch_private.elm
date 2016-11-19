-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Touch_private exposing (..)

{-| This module exposes internally types and constants
common to both single and multi touch interactions.
-}

import Json.Decode as Decode exposing (Decoder)
import Touch exposing (Touch)


-- EVENTS HANDLING ###################################################


{-| A Touch decoder.

You might only use this in case you want to build your own decoders.
-}
touchDecoder : Decoder ( Int, Touch )
touchDecoder =
    Decode.map2 (,)
        (Decode.field "identifier" Decode.int)
        (Decode.map2 Touch
            (Decode.field "clientX" Decode.float)
            (Decode.field "clientY" Decode.float)
        )
