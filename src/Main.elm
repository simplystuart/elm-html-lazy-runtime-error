module Main exposing (main)

import Browser
import Html
import Html.Lazy
import Page.Child



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> Tuple.mapBoth Child (Cmd.map ChildMsg) Page.Child.init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type Model
    = Child Page.Child.Model



-- UPDATE


type Msg
    = ChildMsg Page.Child.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update (ChildMsg msg_) (Child model_) =
    Tuple.mapBoth Child (Cmd.map ChildMsg) <|
        Page.Child.update msg_ model_



-- VIEW


view : Model -> Html.Html Msg
view (Child model_) =
    Html.map ChildMsg <| Html.Lazy.lazy Page.Child.view model_
