import Html exposing (Html, Attribute, div, fieldset, input, label, text)
import Html.Attributes exposing (name, style, type_)
import Html.Events exposing (onClick)
import Debug exposing (log)

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

emptyModel : Model
emptyModel =
    {
    -- ,  todaysDate = Date.now
       skinType = PaleCaucasian
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
      log "hi"
      { model | skinType = newSkinType }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ fieldset []
        [ radio "PaleCaucasian" (SwitchTo PaleCaucasian)
        , radio "BlondCaucasian" (SwitchTo BlondCaucasian)
        , radio "DarkerCaucasian" (SwitchTo DarkerCaucasian)
        , radio "Mediterranean" (SwitchTo Mediterranean)
        , radio "MiddleEastern" (SwitchTo MiddleEastern)
        , radio "Black" (SwitchTo Black)
        ]
    -- , [ text toString model.skinType ]
    ]

radio : String -> msg -> Html msg
radio value msg =
  label
    [ style [("padding", "20px")]
    ]
    [ input [ type_ "radio", name "font-size", onClick msg ] []
    , text value
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
