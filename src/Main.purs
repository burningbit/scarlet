module Main where

import Prelude

import Components.Login (loginView)
import Data.Maybe (fromJust)
import Effect (Effect)
import Partial.Unsafe (unsafePartial)
import React as React
import ReactDOM (render)
import Web.DOM.Document (toNonElementParentNode)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

-- ui = D.h1 [] [D.text "Hello World"]

appId = do
  win <- window
  doc <- document win
  getElementById "app" (toNonElementParentNode $ toDocument doc)


app = do 
  appId' <- appId
  pure $ unsafePartial fromJust appId'

-- app :: forall eff. Effect (dom :: DOM | eff) Element
-- main :: Effect Unit
main = void $ do
  elem <- app
  render (React.unsafeCreateLeafElement loginView {}) elem