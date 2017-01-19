port module App exposing (..)

import Html exposing (Html, text, div, input)
import Html.Attributes exposing (id, type_)


-- MODEL


type alias Model =
    { date : Maybe String }


init : ( Model, Cmd Msg )
init =
    ( { date = Nothing }, initializeJquery () )



-- UPDATE


type Msg
    = NewDate String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewDate newDate ->
            ( { date = Just newDate }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (Maybe.withDefault "No date selected" model.date) ]
        , input [ id "datepicker", type_ "text" ] []
        ]



-- SUBSCRIPTIONS


port initializeJquery : () -> Cmd msg


port newDate : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    newDate NewDate
