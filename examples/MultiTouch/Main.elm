module Main exposing (..)

{-| Multi touch example.

Compile using `elm-make Main.elm --output Main.js`

-}

import MultiTouch
import Html exposing (..)
import Html.Attributes as HtmlA


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL #############################################################


type alias Model =
    { lastTouchEvent : TouchEvent }


type TouchEvent
    = None
    | Start MultiTouch.Event
    | Move MultiTouch.Event
    | End MultiTouch.Event
    | Cancel MultiTouch.Event


model : Model
model =
    Model None



-- UPDATE ############################################################


type Msg
    = TouchStart MultiTouch.Event
    | TouchMove MultiTouch.Event
    | TouchEnd MultiTouch.Event
    | TouchCancel MultiTouch.Event


update : Msg -> Model -> Model
update msg model =
    case msg of
        TouchStart coordinates ->
            Model (Start coordinates)

        TouchMove coordinates ->
            Model (Move coordinates)

        TouchEnd coordinates ->
            Model (End coordinates)

        TouchCancel coordinates ->
            Model (Cancel coordinates)



-- VIEW ##############################################################


view : Model -> Html Msg
view model =
    div
        (HtmlA.style [ ( "height", "100%" ) ] :: touchEvents)
        [ p [] [ text "Try to touch anywhere (only works on touch devices)" ]
        , p [] [ text <| toString model.lastTouchEvent ]
        ]


touchEvents : List (Html.Attribute Msg)
touchEvents =
    [ MultiTouch.onStart TouchStart
    , MultiTouch.onMove TouchMove
    , MultiTouch.onEnd TouchEnd
    , MultiTouch.onCancel TouchCancel
    ]
