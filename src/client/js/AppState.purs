module AppState(AppState(..)) where

import Control.Monad.Eff.JQuery(JQuery())

data AppState = AppState
  { adderButton    :: JQuery
  , adderTable     :: JQuery
  , cardHolder     :: JQuery
  , cardNumSpinner :: JQuery
  , nameInput      :: JQuery
  , pickButton     :: JQuery
  , playerNums     :: Array Number
  }
