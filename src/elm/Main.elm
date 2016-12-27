import Html exposing (Html, Attribute, div, span, fieldset, input, label, text)
import Html.Attributes exposing (name, style, type_, class)
import Html.Events exposing (onClick)

-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram {
    model = emptyModel,
    view = view,
    update = update
  }

-- MODEL
type alias Model =
  {
    skinType : SkinType
  , sunIndex : Float
  , userInputLocation : String
  , lat : Float
  , long : Float
  }

type SkinType
  = PaleCaucasian
  | BlondCaucasian
  | DarkerCaucasian
  | Mediterranean
  | MiddleEastern
  | Black
  | Nothing

emptyModel : Model
emptyModel =
    {
    -- ,  todaysDate = Date.now
       skinType = Nothing
    -- ,  currentTime = Time.now
    ,  sunIndex = 0.1
    ,  userInputLocation = "\\"
    ,  lat = 0.1
    ,  long = 0.1
    }

-- UPDATE
type Msg
  =
  SwitchTo SkinType

update : Msg -> Model -> Model
update msg model =
  case msg of
    SwitchTo newSkinType ->
      { model | skinType = newSkinType }

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ][
    div [ class "row" ][
      -- div [ class "col-xs-12" ] [ text <| "Today's date is " ++ dateString model ],
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
  div [ class "radio" ] [
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
