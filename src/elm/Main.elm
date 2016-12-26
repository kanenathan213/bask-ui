import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Date exposing ( Date )
import Time exposing ( Time )
import Task

-- APP
main : Program (Maybe Model)
main =
  Html.programWithFlags {
    init = init,
    view = view,
    update = update,
    subscriptions = \_ -> Sub.none
  }

-- MODEL

type alias Model =
  {
  -- , todaysDate : Date
    skinType : Int
  -- , currentTime : Platform.Task a Time
  , sunIndex : Int
  , userInputLocation : String
  , lat : Int
  , long : Int
  }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SetSkinType newSkinType ->
      { model | skinType = newSkinType }
        ! []

-- dateString : Model -> String
-- dateString newModel =
--   case newModel.date of
--     Nothing -> "No date here"
--     Just date ->
--       " "
--       ++ (toString <| Date.dayOfWeek date)
--       ++ " "
--       ++ (toString <| Date.day date)
--       ++ " "
--       ++ (toString <| Date.month date)
--       ++ " "
--       ++ (toString <| Date.year date)

-- now : Cmd Msg
-- now =
--   Task.perform (always (SetDate Maybe Date)) (Just >> SetDate) Date.now

emptyModel : Model
emptyModel =
    {
    -- ,  todaysDate = Date.now
       skinType = 0
    -- ,  currentTime = Time.now
    ,  sunIndex = 0
    ,  userInputLocation = "\\"
    ,  lat = 0
    ,  long = 0
    }

init : Maybe Model -> ( Model, Cmd Msg )
init savedModel =
    Maybe.withDefault emptyModel savedModel ! []

-- UPDATE
type Msg
  =
    -- SetDate Date
  SetSkinType Int
  -- | SetCurrentTime (Maybe Time)
  -- | SetSunIndex Int
  -- | SetLat Int
  -- | SetLong Int
  -- | SetLocation String

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ][
    div [ class "row" ][
      -- div [ class "col-xs-12" ] [ text <| "Today's date is " ++ dateString model ],
      div [ class "col-xs-12" ] [ text <| "I'm in New York City" ]
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
