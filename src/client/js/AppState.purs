module AppState where

import Control.Monad.JQuery(JQuery(..))

data AppState = AppState
  { adderBtn       :: JQuery
  , adderTable     :: JQuery
  , cardHolder     :: JQuery
  , cardNumSpinner :: JQuery
  , nameInput      :: JQuery
  , pickBtn        :: JQuery
  , playerNums     :: [Number]
  }
