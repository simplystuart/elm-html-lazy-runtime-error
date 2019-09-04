module Page.GrandChild exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Events exposing (..)
import Process
import Task



-- MODEL


type Model
    = Waiting
    | Ready Int


init : ( Model, Cmd Msg )
init =
    ( Waiting, Task.perform (\_ -> Wake) <| Process.sleep 500 )



-- UPDATE


type Msg
    = Wake
    | Click


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Wake ->
            case model of
                Waiting ->
                    ( Ready 0, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Click ->
            case model of
                Ready i ->
                    ( Ready <| i + 1, Cmd.none )

                _ ->
                    ( model, Cmd.none )



-- VIEW


view : Model -> Html.Html Msg
view model =
    case model of
        Waiting ->
            div [] [ text "Waiting..." ]

        Ready i ->
            button [ onClick Click ]
                [ text <|
                    String.join " "
                        [ "Clicked", String.fromInt i, "times" ]
                ]
