-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Touch_private exposing (..)


{-| This module exposes internally types and constants
common to both single and multi touch interactions.
-}


import Json.Decode as JD exposing ( (:=) )
import Touch exposing ( Touch )




-- EVENTS HANDLING ###################################################




{-| A Touch decoder.

You might only use this in case you want to build your own decoders.
-}
touchDecoder : JD.Decoder (Int, Touch)
touchDecoder =
    JD.object2 (,)
        ("identifier" := JD.int)
        ( JD.object2 Touch
            ("clientX" := JD.float)
            ("clientY" := JD.float)
        )
