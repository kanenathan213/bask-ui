import Html exposing (Html, Attribute, div, span, fieldset, input, label, text)
import Html.Attributes exposing (name, style, type_, class)
import Html.Events exposing (onClick)
import Task
import Date exposing (Date)

-- APP
main : Program Never Model Msg
main =
  Html.program {
    init = init,
    view = view,
    update = update,
    subscriptions = (\_ -> Sub.none)
  }

-- MODEL
type alias Model =
  {
    updateDate : Result String Date
  , currentDate : Maybe Date
  , skinType : SkinType
  , sunIndex : Float
  , userInputLocation : String
  , lat : Float
  , long : Float
  }

init : (Model , Cmd Msg)
init =
  ( {
     updateDate = Err "No date yet"
  ,  currentDate = Nothing
  ,  skinType = PaleCaucasian
  ,  sunIndex = 0
  ,  userInputLocation = "\\"
  ,  lat = 0
  ,  long = 0
   }
  , Task.perform (GetDateSuccess NoOp) Date.now
  )


type SkinType
  = PaleCaucasian
  | BlondCaucasian
  | DarkerCaucasian
  | Mediterranean
  | MiddleEastern
  | Black

-- UPDATE
type Msg
  = NoOp
  | SwitchTo SkinType
  | GetDateSuccess Msg Date
  | GetDateFailure String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)
    SwitchTo newSkinType ->
      ( { model | skinType = newSkinType }
      , Cmd.none
      )
    GetDateSuccess _ date ->
      ( { model | currentDate = Just date }
      , Cmd.none
      )
    GetDateFailure msg ->
      ( { model | updateDate = Err msg }
      , Cmd.none
      )

currentDateString : Maybe Date -> String
currentDateString date =
    case date of
      Just blarg ->
        toString blarg
      Nothing ->
        ""

-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ][
    div [ class "row" ][
      div [ class "col-xs-12" ] [ text <| "Today's date is " ++ currentDateString model.currentDate ],
      div [ class "col-xs-12" ] [
        div []
        [ fieldset []
          [ radio "Pale white" (SwitchTo PaleCaucasian)
          , radio "Light white" (SwitchTo BlondCaucasian)
          , radio "Tan white" (SwitchTo DarkerCaucasian)
          , radio "Brown" (SwitchTo Mediterranean)
          , radio "Dark Brown" (SwitchTo MiddleEastern)
          , radio "Black" (SwitchTo Black)
        ]
          , text (toString model.skinType)
        ]
      ]
    ]
  ]

radio : String -> msg -> Html msg
radio value msg =
  div [ class "radio-inline" ] [
    label [ style [("padding", "20px")]] [
      input [ type_ "radio", name "font-size", onClick msg ] [],
      span [] [
        text value
      ]
    ]
  ]

-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
