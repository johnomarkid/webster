module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Json
import Json.Decode as DecJson
import SubtitleView


-- Model


type alias Model =
  { playerId : String
  , currentTime : Int
  , autoplay : Bool
  }


initialModel : Model
initialModel =
  { playerId = "my-video-player"
  , currentTime = 0
  , autoplay = False
  }



-- Set up mailboxes and Signals


actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp


model : Signal Model
model =
  Signal.foldp update initialModel actions.signal



-- Ports


port timeUpdated : Signal String
port timeUpdated =
  Signal.map (\v -> v.playerId) model



--Update


type Action
  = NoOp
  | PlayVideo
  | TimeUpdate


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    PlayVideo ->
      let
        secs =
          Debug.log "hey" model
      in
        model

    TimeUpdate ->
      let
        -- create a port to get currentTime from js. update model.
        -- currentTime will be used to create subtitle viewer.
        uppp =
          Debug.log "time updated: " "hao"
      in
        model


playerView : Signal.Address Action -> Model -> Html
playerView address model =
  video
    [ id model.playerId
    , controls True
    , src "../app/vids/Intouchable.mp4"
      --, property "playbackRate" (Json.string "0.5")
    , default True
      --, property "currentTime" (Json.int 30)
    , on "timeupdate" DecJson.value (\v -> Signal.message address (TimeUpdate))
    ]
    []


view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ playerView address model
    , button
        [ onClick address PlayVideo ]
        [ text "play video" ]
      --, SubtitleView.view (Signal.forwardTo address SubtitleView.Action) "hi"
    ]


main : Signal Html
main =
  Signal.map (view actions.address) model



-- TODO: subtitles working. html5 only supports .webvtt so create custom view.
-- how to track time from player?
-- create port so js can find the video player and report back time.
-- http://stackoverflow.com/questions/31901397/how-to-set-focus-on-an-element-in-elm
-- https://github.com/evancz/elm-todomvc/blob/bc37c9b97db9e1c1d5db9debf0d900c77461e584/Todo.elm#L330
-- try to have play come from elm
-- use port to send js message that video is playing. always the same video
-- id so no need to send sel from port.
