module Main (..) where

import CounterList exposing (init, update, view)
import StartApp.Simple as StartApp

main =
  StartApp.start { model = init, view = view, update = update }

