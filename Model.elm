module Model exposing (..)

import Mouse exposing (Position)
import Array exposing (..)
import Keyboard exposing (KeyCode)

-- # Model
type Msg
    = DragStart Id Position
    | DragAt Id Position
    | DragEnd Id Position
    | Keydowns KeyCode

type alias Model =
  { pieces : Array Piece
  , drag : Maybe Drag
  , select : Id }

type alias Id = Int
type SvgType = Polygon | Rect


type alias Piece =
  { id : Id
  , svgType : SvgType
  , position : Position
  , rotate : Int
  , fill : String
  , points : List (Float,Float)
  , x : Float
  , y : Float
  , width : Float
  , height : Float
  , matrix : List Float}

type alias Drag =
    { id : Id
    , start : Position
    , current : Position
    }


logoInit =
  [{id = 0 ,svgType = Polygon , fill = "#F0AD00", points = [(161.649,152.782),(231.514,82.916), (91.783,82.916)] , x = 0, y = 0, width = 0,height = 0,matrix = [], rotate = 0, position = Position 0 0 }
  ,{id = 1 ,svgType = Polygon , fill = "#7FD13B" , points = [(8.867,0),(79.241,70.375),(232.213,70.375),(161.838,0)], x = 0, y = 0, width = 0,height = 0,matrix = [],rotate = 0, position = Position 0 0}
  ,{id = 2 ,svgType = Rect , fill = "#7FD13B" ,points = [] , x = 192.99, y = 107.392 ,width =  107.676 , height = 108.167 ,matrix = [0.7071,0.7071,-0.7071,0.7071,186.4727,-127.2386],rotate = 0 ,position = Position 0 0}
  ,{id = 3 ,svgType = Polygon , fill = "#60B5CC", points = [(323.298,143.724),(323.298,0),(179.573,0)], x = 0, y = 0, width = 0,height = 0,matrix = [],rotate = 0, position = Position 0 0}
  ,{id = 4 ,svgType = Polygon , fill = "#5A6378", points = [(152.781,161.649),(0,8.868), (0,314.432)], x = 0, y = 0, width = 0,height = 0,matrix = [],rotate = 0, position = Position 0 0}
  ,{id = 5 ,svgType = Polygon , fill = "#F0AD00", points = [(255.522,246.655) ,(323.298,314.432) ,(323.298,178.879)], x = 0, y = 0, width = 0,height = 0,matrix = [],rotate = 0, position = Position 0 0}
  ,{id = 6 ,svgType = Polygon , fill = "#60B5CC", points = [(161.649,170.517) ,(8.869,323.298) ,(314.43,323.298)], x = 0, y = 0, width = 0,height = 0,matrix = [],rotate = 0, position = Position 0 0}]
