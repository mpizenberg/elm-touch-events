-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Touch
    exposing
        ( Coordinates
        , clientPos
        )

{-| This module exposes types
common to both single and multi touch interactions.

@docs Coordinates, clientPos

-}

import Private.Touch


{-| A simple type alias for the coordinates of a JavaScript
[Touch](https://developer.mozilla.org/en-US/docs/Web/API/Touch) object.
-}
type alias Coordinates =
    Private.Touch.Coordinates


{-| Retrieve the clientX and clientY coordinates.
-}
clientPos : Coordinates -> ( Float, Float )
clientPos coordinates =
    ( .clientX coordinates, .clientY coordinates )
