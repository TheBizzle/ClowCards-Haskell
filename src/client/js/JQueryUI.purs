module JQueryUI where

import Control.Monad.Eff
import Control.Monad.JQuery(DOM(..), JQuery(..))

-- .accordion(config)
foreign import accordion
  "function(config) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.accordion(config); \
  \    }; \
  \  }; \
  \}" :: forall eff r. { | r } -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .button()
foreign import button
  "function(ob) { \
  \  return function() { \
  \    ob.button(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .buttonset()
foreign import buttonset
  "function(ob) { \
  \  return function() { \
  \    ob.buttonset(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .change()
foreign import change
  "function(ob) { \
  \  return function() { \
  \    ob.change(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .click(f)
foreign import click
  "function(f) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.click(f); \
  \    }; \
  \  }; \
  \}" :: forall eff a. (Unit -> Eff eff a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .each(f)
foreign import each
  "function(f) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.each(f); \
  \    }; \
  \  }; \
  \}" :: forall eff a. (Unit -> Eff eff a) -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- x[0].checked = !x[0].checked
foreign import flipChecked
  "function(ob) { \
  \  return function () { \
  \    ob[0].checked = !ob[0].checked; \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit

-- .button('refresh')
foreign import refreshButton
  "function(ob) { \
  \  return function() { \
  \    ob.button('refresh'); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit

-- .siblings(filterStr)
foreign import siblings
  "function(filterStr) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.siblings(filterStr); \
  \    }; \
  \  }; \
  \}" :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery

-- .spinner()
foreign import spinner
  "function(ob) { \
  \  return function() { \
  \    ob.spinner(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .tabs()
foreign import tabs
  "function(ob) { \
  \  return function() { \
  \    ob.tabs(); \
  \  }; \
  \}" :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery

-- .val(newVal)
foreign import val
  "function(newVal) { \
  \  return function(ob) { \
  \    return function() { \
  \      ob.val(newVal); \
  \    }; \
  \  }; \
  \}" :: forall eff. String -> JQuery -> Eff (dom :: DOM | eff) JQuery
