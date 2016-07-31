module View exposing (..)

import Model exposing (..)
import Util exposing (..)

import Html exposing (div,Html,pre,h2)
import Html.Attributes as HtmlAttri exposing (class,style)
import Html.App exposing (program)
import Html.Lazy as Html

import Svg exposing (..)
import Svg.Attributes as SvgAttri exposing (..)
import Svg.Events exposing (on)
import Svg.Lazy exposing (lazy)

import Style exposing (..)

import Mouse exposing (..)

import Json.Decode as Json
import String
import Array exposing (..)



containerCss =
  HtmlAttri.style [ Style.display "flex"
                  , Style.justifyContent Style.center]

generaterCss =
     HtmlAttri.style [  Style.overflow Style.scroll
                  , Style.backgroundColor "#ffffff"
                  , Style.padding <| px 20
                  , Style.width <| pc 20]


logoAreaCss : Attribute Msg
logoAreaCss =
  HtmlAttri.style [Style.backgroundColor "#ffffff"
                  ,Style.width <| px 600
                  ,Style.height <| px 550
                  ,Style.margin <| px 20]


view : Model -> Html Msg
view model =
  div [containerCss]
      [ lazy logoArea model
      , lazy generaterArea model]

viewboxSize = "-300 -300 923.141 922.95"

logoArea : Model -> Html Msg
logoArea model =
  div [logoAreaCss]
      [
        svg
         [ version "1.1", x "0", y "0", viewBox viewboxSize]
         <| Array.toList
         <| Array.map (\piece ->  makeSvg piece)
         <| currentPieces model.drag model.pieces
      ]

generaterArea model =
  div [generaterCss] [
                    div []
                    [Html.lazy generater <| Array.toList model.pieces]]



moveStr : Position -> String
moveStr {x,y} =
  "translate(" ++ (toString x) ++ " " ++ (toString y) ++ ")"

rotateString : Int -> Float -> Float -> String
rotateString num x y =
  "rotate(" ++ (String.join " " <| List.map toString [toFloat num, x , y]) ++ ")"

rotatePiece : Piece -> String
rotatePiece {svgType,points,rotate,width,height,x,y} =
  case svgType of
    Rect ->
      rotateString rotate (x + width/2) (y+ height/2)
    _ ->
      let (ax,ay) = List.foldl (\(a,b) (c,d) -> (a+c,b+d)) (0,0) points
          n = toFloat <| List.length points
      in rotateString rotate (ax/n) (ay/n)

matrixStr : List Float -> String
matrixStr list =
  if List.isEmpty list then ""
  else
    let strings = List.map toString list |> String.join " "
    in "matrix(" ++ strings ++ ")"

transformStr piece =
  String.join " " [
                   moveStr piece.position
                  , matrixStr piece.matrix
                  , rotatePiece piece]


transformAttri : Piece -> Attribute Msg
transformAttri piece =
    SvgAttri.transform <| transformStr piece

onMouseDown : Int -> Attribute Msg
onMouseDown n =
  on "mousedown" (Json.map (DragStart n) Mouse.position)



makeAttribute : Piece -> List (Attribute Msg)
makeAttribute piece =
          [ onMouseDown piece.id
          , fill piece.fill
          , SvgAttri.x <| toString piece.x
          , SvgAttri.y <| toString piece.y
          , SvgAttri.width <| toString piece.width
          , SvgAttri.height <| toString piece.height
          , points <| String.join " " <| List.map (\(x,y) -> toString x ++"," ++ toString y ) piece.points
          , transformAttri piece ]

makeSvg piece =
  case piece.svgType of
    Polygon -> polygon (makeAttribute piece) []
    Rect -> rect (makeAttribute piece) []



------svg string generater


generater pieces =
    Html.pre [] [text <|generateSvgStr pieces]



generateSvgStr pieces =
  "<svg viewBox=" ++ (toString <| viewboxSize) ++ " >"  ++
  (String.concat <| List.map pieceStr pieces)
  ++ "</svg>"

pieceStr piece =
  case piece.svgType of
    Polygon ->String.join " " <| ["<polygon"] ++  polynakami piece ++ ["/>\n"]
    Rect ->String.join " " <| ["<rect"] ++ rectnakami piece ++ ["/>\n"]

polynakami : Piece -> List String
polynakami piece =
            [ "fill="++ toString piece.fill
            , String.append "points=" <| toString <| String.join " " <| List.map (\(x,y) -> toString x ++"," ++ toString y ) piece.points
            , "transform="++ (toString <| transformStr piece) ]

rectnakami : Piece -> List String
rectnakami piece =
            [ "fill=" ++ toString piece.fill
            , String.append "x=" <| toString <| toString piece.x
            , String.append "y=" <| toString <| toString piece.y
            , String.append "width=" <| toString <| toString piece.width
            , String.append "height=" <| toString <| toString piece.height
            , String.append "transform=" <| toString <|transformStr piece ]
