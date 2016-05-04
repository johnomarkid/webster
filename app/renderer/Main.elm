module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Json


main =
  video
    [ controls True
    , src "../app/vids/Intouchable.mp4"
      --, property "playbackRate" (Json.string "0.5")
    , default True
    ]
    [ track
        [ kind "subtitles"
        , src "../app/vids/Intouchable.srt"
        , srclang "fr"
        , default True
        ]
        []
    ]



-- TODO: subtitles working. html5 only supports .webvtt so create custom view.
-- how to track time from player?
-- create port so js can find the video player and report back time.
-- http://stackoverflow.com/questions/31901397/how-to-set-focus-on-an-element-in-elm
-- https://github.com/evancz/elm-todomvc/blob/bc37c9b97db9e1c1d5db9debf0d900c77461e584/Todo.elm#L330
