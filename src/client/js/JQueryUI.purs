module JQueryUI where

import DOM(DOM())
import Prelude(Unit())

import Control.Monad.Eff(Eff())
import Control.Monad.Eff.JQuery(JQuery())

import Data.Tuple(Tuple())

foreign import data Click    :: *
foreign import data Focus    :: *
foreign import data Keypress :: *
foreign import data Keyup    :: *
foreign import data Unfocus  :: *

type Reaction a = forall b eff. (a -> Eff (dom :: DOM | eff) b) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .accordion(config)
foreign import accordion :: forall eff r. { | r } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .button()
foreign import button :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .buttonset()
foreign import buttonset :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .change()
foreign import change :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .change(f)
foreign import change1 :: forall eff. (JQuery -> Eff (dom :: DOM | eff) JQuery) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .click(f)
foreign import click :: Reaction Click

-- .each(f)
foreign import each :: forall eff. (JQuery -> Eff (dom :: DOM | eff) JQuery) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- x[0].checked = !x[0].checked
foreign import flipChecked :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit

-- .load(f)
foreign import load :: forall eff. (JQuery -> Eff (dom :: DOM | eff) JQuery) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .button('refresh')
foreign import refreshButton :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit

-- .replaceWith(elem)
foreign import replaceWith :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .siblings(filterStr)
foreign import siblings :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .spinner()
foreign import spinner :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .tabs()
foreign import tabs :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .val(newVal)
foreign import val :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .attr(str)
foreign import attrStr :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) String

-- .children(str)
foreign import children :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .insertBefore(elem)
foreign import insertBefore :: forall eff. JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .focus(f)
foreign import focus :: Reaction Focus

-- .keypress(f)
foreign import keypress :: Reaction Keypress

-- .keyup(f)
foreign import keyup :: Reaction Keyup

-- .unfocus(f)
foreign import unfocus :: Reaction Unfocus

-- .map(...).get()
foreign import mapLabelsToPairs :: forall eff. JQuery -> Eff (dom :: DOM | eff) (Array (Tuple String Boolean))
