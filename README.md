# elm-touch-events [![][badge-doc]][doc] [![][badge-license]][license]

[badge-doc]: https://img.shields.io/badge/documentation-latest-yellow.svg?style=flat-square
[doc]: http://package.elm-lang.org/packages/mpizenberg/elm-touch-events/latest
[badge-license]: https://img.shields.io/badge/license-MPL%202.0-blue.svg?style=flat-square
[license]: https://www.mozilla.org/en-US/MPL/2.0/

> WARNING: this package is being merged into [elm-pointer-events].
> It won't be updated to 0.19

[elm-pointer-events]: https://github.com/mpizenberg/elm-pointer-events

This package aims at handling single and multitouch events.

## Motivation

If you are new to elm like me (discovered elm at version 0.17.1)
you may realize that touch interactions are not handled by default in elm.
Originally, I needed to develop a user study (about outlining interactions)
and I chose elm (with some excitement since it was my first elm project)
to do it.
Unfortunately it would not work on tablets (that are best fitted for this study).
So here I am, rolling up my sleeves to create a package handling multitouch events.

## Want to contribute?

I tried to make this package idiomatic and simple to use,
especially since version 3.0 (previous were a bit tedious to use).
However, if you have difficulties using it, or ideas to improve this,
don't hesitate to reach me on slack (mattpiz) and to use github issues.

One thing that would be very nice,
is trying to build a gestures package (swipe, pinch, ...) on top of this.
I don't have time or use case for now,
but if you're interested in doing so, let me know!

## Installation

```bash
elm-package install mpizenberg/elm-touch-events
```

## Usage

This package provides types and functions to deal with single and multitouch events.
For example, if you are in need of multitouch interactions,
you may use the following functions in your view.

```elm
onStart : (Touch.Event -> msg) -> Html.Attribute msg
onMove : (Touch.Event -> msg) -> Html.Attribute msg
onEnd : (Touch.Event -> msg) -> Html.Attribute msg
```

To try this package, please use a touch device (mobile, tablet, ...)
since mouses do not generate touch interactions.

You can find a complete simple example of a single touch interaction
in the file `examples/SingleTouch/Main.elm`.
A multitouch example is also available in `examples/MultiTouch/Main.elm`.
To test those, you can use the following command in their respective dir,
and then open the `index.html` in your browser with mobile emulation
activated.

```shell
elm-make Main.elm --output Main.js
```

## Documentation

The package documentation is available on the [elm package website][doc].

## License

This Source Code Form is subject to the terms of the Mozilla Public License,v. 2.0.
If a copy of the MPL was not distributed with this file,
You can obtain one at https://mozilla.org/MPL/2.0/.

## Authors

Original author: Matthieu Pizenberg (matthieu.pizenberg@gmail.com)
