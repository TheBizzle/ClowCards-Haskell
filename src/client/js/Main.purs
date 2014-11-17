module Main (main) where

import Control.Monad.Eff(Eff(..))
import Control.Monad.JQuery(append, css, JQuery(..), ready, select)

import Data.Foldable(for_)

import AppState(AppState(..))
import Cards(Card(..), cards)
import DOM(DOM(..))
import Element(genCardCheckbox)
import JQueryUI(accordion, attrStr, button, buttonset, change, children, click, each, flipChecked, refreshButton, siblings, spinner, tabs, val)

main = ready $ do
  initJQUI
  AppState { cardHolder = cardHolder } <- initState
  cleanupCSS
  populateCardSetCustomizer cardHolder

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

cleanupCSS :: forall eff. Eff (dom :: DOM | eff) JQuery
cleanupCSS = do
  mainBox <- byID "main-box"
  css { overflow: "auto" } mainBox

initState :: forall eff. Eff (dom :: DOM | eff) AppState
initState = do
  adderButtonElem    <- byID "adder-button"
  adderTableElem     <- byID "adder-table"
  cardHolderElem     <- byID "card-holder"
  cardNumSpinnerElem <- byID "card-num-spinner"
  nameInputElem      <- byID "name-input"
  pickButtonElem     <- byID "pick-btn"
  return $ AppState { adderButton:    adderButtonElem
                    , adderTable:     adderTableElem
                    , cardHolder:     cardHolderElem
                    , cardNumSpinner: cardNumSpinnerElem
                    , nameInput:      nameInputElem
                    , pickButton:     pickButtonElem
                    , playerNums:     []
                    }

populateCardSetCustomizer :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
populateCardSetCustomizer cardHolder = do
  for_ cards $ appendCard cardHolder
  foreach ".dynamic-check-button" button
  foreach ".dynamic-check-label"  innerClick
    where
      foreach x f = children x cardHolder >>= f
      appendCard elem (Card { name = name, isEnabled = isEnabled }) =
        genCardCheckbox name isEnabled >>= flip append elem

innerClick :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
innerClick this = do
  forAttr <- attrStr "for" this
  btn     <- byID forAttr
  flipChecked btn
  refreshButton btn
  change btn

byID :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
byID id = select $ "#" ++ id

(|>) a f = f a
