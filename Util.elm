module Util exposing (..)

import Model exposing (..)
import Array exposing (Array)

currentPieces :  Maybe Drag -> Array Piece -> Array Piece
currentPieces drag pieces =
     let mPieces =
       drag `Maybe.andThen`
         (\{id ,start , current} ->
              Just (idUpdate id
                             (\({position} as piece) ->
                                  { piece | position =  { x = (position.x + current.x - start.x)
                                                        , y = (position.y + current.y - start.y) }})
                             pieces ) )
    in Maybe.withDefault pieces mPieces

idUpdate : Id -> ({a | id : Int } -> {a | id : Int } ) -> Array {a | id : Int} -> Array {a | id : Int }
idUpdate selectId f array =
  Array.indexedMap (\idx ({id}as a ) -> if id == selectId then f a else a ) array
