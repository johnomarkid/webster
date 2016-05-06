module SubtitleView (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
  String


type Action
  = NoOp


view : Signal.Address Action -> Model -> Html
view address model =
  div [] [ text "hey" ]



-- parse srt file. might have to use port
-- http://stackoverflow.com/questions/31891123/elm-parse-text-file-into-html
