# elm-touch-events [![][badge-doc]][doc] [![][badge-license]][license]

[badge-doc]: https://img.shields.io/badge/documentation-latest-yellow.svg?style=flat-square
[doc]: http://package.elm-lang.org/packages/mpizenberg/elm-touch-events/latest
[badge-license]: https://img.shields.io/badge/license-MPL%202.0-blue.svg?style=flat-square
[license]: https://www.mozilla.org/en-US/MPL/2.0/

This package aims at handling touch (multitouch) events.

## Motivation

If you are new to elm like me (discovered elm at version 0.17.1)
you may realize that touch interactions are not handled by default in elm.
Originally, I needed to develop a user study (about outlining interactions)
and I chose elm (with some excitement since it was my first elm project)
to do it.
Unfortunately it would not work on tablets (that are best fitted for this study).
So here I am, rolling up my sleeves to create a package handling multitouch events.

## Installation

```bash
elm-package install mpizenberg/elm-touch-events
```

## Usage

This package provides types and functions to deal with single and multitouch events.
For example, if you are in need of simple single touch interactions,
you may use the following types and functions :

```elm
-- Defined in Touch module: the type of touch event that can be triggered
type TouchEvent
    = TouchStart
    | TouchMove
    | TouchEnd
    | TouchCancel

-- Defined in Touch module: a simple type alias to represent a JavaScript Touch object
type alias Touch =
    { clientX : Float
    , clientY : Float
    }

-- Defined in SingleTouch module: To put somewhere in your model
type alias SingleTouch =
    { touchType : TouchEvent
    , touch : Touch
    }

-- Defined in SingleTouch module: A simple touch event handler that can be
-- used in views with a msg builder (Touch -> msg)
onSingleTouch : TouchEvent -> HE.Options -> (Touch -> msg) -> H.Attribute msg
```

To try this package, please use a touchscreen platform (mobile, tablet, ...)
since mouses do not generate touch interactions.

You can find a complete very simple example of a single touch interaction
in the file `examples/singleTouch.elm`.

For a complete multitouch example, please refer to the file
`examples/multiTouch.elm`.

## Documentation

The package documentation is available on the [elm package website][doc].

## License

This Source Code Form is subject to the terms of the Mozilla Public License,v. 2.0.
If a copy of the MPL was not distributed with this file,
You can obtain one at https://mozilla.org/MPL/2.0/.

## Authors

Original author: Matthieu Pizenberg (matthieu.pizenberg@gmail.com)
