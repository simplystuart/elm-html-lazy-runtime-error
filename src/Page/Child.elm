module Page.Child exposing (Model, Msg, init, update, view)

import Html
import Page.GrandChild



-- MODEL


type Model
    = GrandChild Page.GrandChild.Model


init : ( Model, Cmd Msg )
init =
    Tuple.mapBoth GrandChild (Cmd.map GrandChildMsg) Page.GrandChild.init



-- UPDATE


type Msg
    = GrandChildMsg Page.GrandChild.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update (GrandChildMsg msg_) (GrandChild model_) =
    Tuple.mapBoth GrandChild (Cmd.map GrandChildMsg) <|
        Page.GrandChild.update msg_ model_



-- VIEW


view : Model -> Html.Html Msg
view (GrandChild model_) =
    Html.map GrandChildMsg <| Page.GrandChild.view model_
