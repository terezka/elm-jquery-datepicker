port module Main exposing (..)

import Html exposing (Html, program, text, div, input)
import Html.Attributes exposing (id, type_)


main : Program Never Model Msg
main =
    program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { date : Maybe String }


init : ( Model, Cmd Msg )
init =
    ( { date = Nothing }
    , initializeJquery ()
    )



-- UPDATE


type Msg
    = NewDate String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewDate newDate ->
            ( { date = Just newDate }
            , Cmd.none
            )



-- VIEW


view : Model -> Html Msg
view model =
    let
      selectedDateText =
        case model.date of
          Just date ->
            "Elm knows that the picked date is: " ++ date

          Nothing ->
            "No date selected yet"
    in
    div []
        [ div [ id "selected-date" ] [ text selectedDateText ]
        , input [ id "datepicker", type_ "text" ] []
        ]



-- SUBSCRIPTIONS


port initializeJquery : () -> Cmd msg


port newDate : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions _ =
    newDate NewDate
