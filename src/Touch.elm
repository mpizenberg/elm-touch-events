-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Touch
    exposing
        ( Coordinates
        )

{-| This module exposes types
common to both single and multi touch interactions.

@docs Coordinates

-}


{-| A simple type alias for the clientX and clientY coordinates
of a JavaScript [Touch](https://developer.mozilla.org/en-US/docs/Web/API/Touch) object.
-}
type alias Coordinates =
    { clientX : Float
    , clientY : Float
    }
