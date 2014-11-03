module Main (main) where

import Control.Monad.Eff(Eff(..))
import Control.Monad.JQuery(JQuery(..), ready, select)

import DOM(DOM(..))
import JQueryUI(accordion, attrStr, button, buttonset, change, click, each, flipChecked, refreshButton, siblings, spinner, tabs, val)

main = ready $ do
  initJQUI

initJQUI :: forall eff. Eff (dom :: DOM | eff) JQuery
initJQUI = do
  select ".collapsible-accordion" >>= (accordion { heightStyle: "fill" })
  select ".ui-spinner-button"     >>= click spinAButton
  foreach ".ui-button"    mkButton
  foreach ".ui-tabs"      mkTabs
  foreach ".ui-spinner"   spinIt
  foreach ".checkboxes"   mkButtonSet
  foreach ".check-set"    mkButtonSet
  foreach ".radio-set"    mkButtonSet
  foreach ".check-button" mkButton
  foreach ".check-label"  checkIt
    where
      foreach x f = select x >>= each f
      checkIt     = click innerClick
      mkButton    = button
      mkButtonSet = buttonset
      mkTabs      = tabs
      spinAButton this = do
                           sibs <- siblings "input" this
                           change sibs
      spinIt this = do
                      spinner this
                      val "1" this
      innerClick this = do
                          forAttr <- attrStr "for" this
                          btn     <- select $ "#" ++ forAttr
                          flipChecked btn
                          refreshButton btn
                          change btn
