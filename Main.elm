module Main exposing (..)

import View exposing (..)
import Model exposing (..)


import String
import Array exposing (..)

import Keyboard exposing (KeyCode)
import Mouse exposing (..)

import Debug exposing (log)

import Html.App exposing (program)

import Util exposing (..)

main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

init : (Model,Cmd Msg )
init =
   { pieces = Array.fromList logoInit
   , drag = Nothing
   , select = 0 } ! []

update : Msg -> Model -> (Model,Cmd Msg)
update msg ({ pieces , drag } as model) =
  updatehelp msg model ! []

updatehelp msg ({ pieces , drag } as model) =
  case msg of
    DragStart n xy ->
      {model | drag = Just { id = n
                            , start =  xy
                            , current = xy }
             , select = n          }

    DragAt n xy ->
       let drag' = (Maybe.map (\{id,start} -> { id = id , start = start , current = xy}) drag)
       in {model | drag = drag' }

    DragEnd n _ ->
      {model | pieces =  currentPieces drag model.pieces
             , drag = Nothing }

    Keydowns code ->
      case code of
        37 -> --left key
          let pieces' = updateArray  (\a -> { a | rotate = a.rotate - 5 }) model.select model.pieces
          in {model | pieces = pieces'}
        39 -> --right key
          let pieces' = updateArray (\a -> { a | rotate = a.rotate + 5 }) model.select model.pieces
          in {model | pieces = pieces'}
        38 ->
           {model | pieces = movedPieces (-) model.select model.pieces}
        40 ->
           {model | pieces = movedPieces (+) model.select model.pieces}
        _ ->
          model

movePixel = 10

movedPieces f id pieces =
     let move ({position} as piece) =  {piece | position = {position | y = f position.y movePixel } }
     in updateArray move id pieces

updateArray : (a -> a) -> Int -> Array a -> Array a
updateArray f num array =
  case Maybe.map (\a -> Array.set num (f a) array) (Array.get num array) of
    Just a -> a
    Nothing -> array


subscriptions : Model -> Sub Msg
subscriptions model =
  case model.drag of
    Nothing ->
      Sub.batch [Keyboard.downs Keydowns ]

    Just {id} ->
      Sub.batch [ Mouse.moves (DragAt id), Mouse.ups (DragEnd id) ]
