import Html as H
import Html.App as App
import Html.Attributes as HA
import Html.Events as HE


import Touch exposing ( TouchEvent(..), Touch )
import SingleTouch exposing ( SingleTouch, onSingleTouch )


main =
    App.program
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }




-- MODEL #############################################################




type alias Model =
    { singleTouch : Maybe SingleTouch
    }


init : (Model, Cmd Msg)
init = (Model Nothing, Cmd.none)




-- UPDATE ############################################################




type Msg
    = SingleTouchMsg TouchEvent Touch


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SingleTouchMsg touchEvent touch ->
            ( {model | singleTouch = Just <| SingleTouch touchEvent touch}
            , Cmd.none
            )




-- VIEW ##############################################################




view : Model -> H.Html Msg
view model =
    H.div []
        [ H.text "Try to touch the image below and watch the model changing."
        , H.br [] []
        , H.img ([ HA.src "http://lorempixel.com/600/300/" ] ++ onAllTouch) []
        , H.br [] []
        , H.text <| toString model
        ]


onAllTouch : List (H.Attribute Msg)
onAllTouch =
    [ onSingleTouch TouchStart Touch.preventAndStop <| SingleTouchMsg TouchStart
    , onSingleTouch TouchMove Touch.preventAndStop <| SingleTouchMsg TouchMove
    , onSingleTouch TouchEnd Touch.preventAndStop <| SingleTouchMsg TouchEnd
    , onSingleTouch TouchCancel Touch.preventAndStop <| SingleTouchMsg TouchEnd
    ]
