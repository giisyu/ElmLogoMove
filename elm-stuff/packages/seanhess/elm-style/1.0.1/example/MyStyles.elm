module MyStyles exposing (..)


-- NATIVE IMPORTS


import Color exposing (..)


-- THIRD PARTY IMPORTS


import Html exposing (Attribute)
import Html.Attributes exposing (style)


-- MY IMPORTS


import Style exposing (..)


type alias Styles = List ( String, String )


columnLayout : Styles
columnLayout =
  [ display flex'
  , flexDirection column
  ]


centerLayout : Styles
centerLayout =
  [ display flex'
  , justifyContent center
  , alignItems center
  ]


container : Styles
container =
  List.concat
        [ columnLayout
        , [ position absolute
          , width (pc 100)
          , height (pc 100)
          , fontFamily "sans-serif"
          ]
        ]



top : Styles
top =
  let
    bgColor = color' (hsl (193 * pi / 180) 1 0.53)

  in
    List.concat
          [ columnLayout
          ,  [ flex (toString 1)
             , backgroundColor bgColor
             ]
          ]



header : Styles
header =
  [ display flex'
  , justifyContent spaceAround
  , margin <| (px 20) ++ " " ++ auto
  , fontSize (px 20)
  , color <| color' (hsl (202 * pi / 180) 0.24 0.27)
  , width (pc 100)
  , maxWidth (px 700)
  ]


title : Styles
title =
  List.concat
      [ centerLayout
      , [ fontSize (px 100)
        , color (color' white)
        , flex (toString 1)
        ]
      ]



description : Styles
description =
  List.concat
      [ centerLayout
      , [ fontSize (px 24)
        , color (color' white)
        , marginBottom (px 10)
        ]
      ]


subDescription : Styles
subDescription =
  List.concat
      [ centerLayout
      , [ fontSize (px 16)
        , color (color' white)
        , marginBottom (px 40)
        ]
      ]


callToAction : Styles
callToAction =
  List.concat
      [ centerLayout
      , [ fontSize (px 24)
        , color (color' white)
        , marginBottom (px 40)
        ]
      ]


bottom : Styles
bottom =
  [ flex (toString 1)
  , backgroundColor (color' white)
  ]
