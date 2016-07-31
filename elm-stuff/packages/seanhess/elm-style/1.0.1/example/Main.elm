module Main exposing (..)


-- THIRD PARTY IMPORTS


import Html exposing (..)
import Html.Attributes exposing (style)


-- MY IMPORTS


import MyStyles


-- MODEL


type alias Model =
  { header : List String
  , title : String
  , description : String
  , subDescription : String
  , callToAction : String
  }


initialModel : Model
initialModel =
  { header = [ "examples", "docs", "community", "blog" ]
  , title = "elm"
  , description = "the best of functional programming in your browser"
  , subDescription = "writing great code should be easy ... now it is"
  , callToAction = "try or install"
  }


-- VIEW


header : Model -> Html msg
header model =
  div
  [ style MyStyles.header ]
  (List.map (\x -> div [] [ text x ]) model.header)


title : Model -> Html msg
title model =
  div
  [ style MyStyles.title ]
  [ text model.title ]


description : Model -> Html msg
description model =
  div
  [ style MyStyles.description ]
  [ text model.description ]


subDescription : Model -> Html msg
subDescription model =
  div
  [ style MyStyles.subDescription ]
  [ text model.subDescription ]


callToAction : Model -> Html msg
callToAction model =
  div
  [ style MyStyles.callToAction ]
  [ text model.callToAction ]


view : Model -> Html msg
view model =
  div
  [ style MyStyles.container ]
  [ div
    [ style MyStyles.top ]
    [ header model
    , title model
    , description model
    , subDescription model
    , callToAction model
    ]

  , div
    [ style MyStyles.bottom ]
    []
  ]


-- WIRING


main : Html msg
main =
  view initialModel
