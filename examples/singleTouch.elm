module Main exposing (..)

import Html as H
import Html.Attributes as HA
import Html.Events as HE
import Touch exposing (TouchEvent(..), Touch)
import SingleTouch exposing (SingleTouch, onSingleTouch)


main =
    H.beginnerProgram
        { model = init
        , update = update
        , view = view
        }



-- MODEL #############################################################


type alias Model =
    { singleTouch : Maybe SingleTouch
    }


init : Model
init =
    Model Nothing



-- UPDATE ############################################################


type Msg
    = SingleTouchMsg SingleTouch


update : Msg -> Model -> Model
update msg model =
    case msg of
        SingleTouchMsg singleTouch ->
            { model | singleTouch = Just singleTouch }



-- VIEW ##############################################################


view : Model -> H.Html Msg
view model =
    H.div []
        [ H.p [] [ H.text "Try to touch the image below and watch the model changing." ]
        , H.p [] [ H.text "(Only works on mobile platforms)" ]
        , H.img ([ HA.src "http://lorempixel.com/600/300/" ] ++ onAllTouch) []
        , H.p [] [ H.text <| toString model ]
        ]


onAllTouch : List (H.Attribute Msg)
onAllTouch =
    [ onSingleTouch TouchStart Touch.preventAndStop <| SingleTouchMsg
    , onSingleTouch TouchMove Touch.preventAndStop <| SingleTouchMsg
    , onSingleTouch TouchEnd Touch.preventAndStop <| SingleTouchMsg
    , onSingleTouch TouchCancel Touch.preventAndStop <| SingleTouchMsg
    ]
