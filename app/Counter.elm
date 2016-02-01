module Counter (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)
import StartApp.Simple as StartApp
import String



-- MODEL
type alias Model =
  { count : Int }

init n =
  { count = n }

-- UPDATE
type Action
  = Increment
  | Decrement

update action model =
  case action of
    Increment ->
      if model.count < 10 then
        { model | count = model.count + 1 }
      else
        model
    Decrement ->
      if model.count > 0 then
        { model | count = model.count - 1 }
      else
        model

-- VIEW

view address model =
  div []
  [ button [ onClick address Decrement ] [ text "-" ]
  , div [] [ text (toString model.count) ]
  , button [ onClick address Increment ] [ text "+" ]
  ]

type alias Context =
  { actions : Signal.Address Action
  , remove : Signal.Address ()
  }


viewWithRemoveButton : Context -> Model -> Html
viewWithRemoveButton context model =
  div []
  [ button [ onClick context.actions Decrement ] [ text "-" ]
  , div [ countStyle ] [ text (toString model.count) ]
  , button [ onClick context.actions Increment ] [ text "+" ]
  , button [ onClick context.remove () ] [ text "X" ]
  ]

  
countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]