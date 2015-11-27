module Main (main) where

import AppState(AppState(..))
import Cards(Card(..), cards)
import DOM(DOM())
import Element(genCardCheckbox)
import Global(isNaN, readFloat)
import IndexOps(addRow, clearErrorFuzz, genCardImageURL, genCards, handleNumPickerKey, handleRowKey)
import JQueryUI(accordion, attrStr, button, buttonset, change, change1, children, click, each, flipChecked, focus, keypress, keyup, mapLabelsToPairs, refreshButton, siblings, spinner, tabs, unfocus, val)
import Prelude(($), (==), (<), (<>), (>), (>>=), (>>>), (||), bind, const, flip, map, Monad, return, show, Unit(), unit)

import Control.Monad.Eff(Eff())
import Control.Monad.Eff.JQuery(append, create, css, getValue, JQuery(), ready, select, setAttr)

import Data.Array(filter)
import Data.Foldable(for_)
import Data.Foreign(unsafeFromForeign)
import Data.Maybe(Maybe(..))
import Data.String(length)

import qualified Data.List as List
import qualified Data.Map  as Map

main :: forall eff. Eff (dom :: DOM | eff) JQuery
main =
  ready $ do
    preloadPriorityImages
    preloadCardImages
    initJQUI
    state@(AppState { cardHolder = cardHolder }) <- initState -- $ resetCardIterator
    cleanupCSS
    populateCardSetCustomizer cardHolder
    findEnabledCards cardHolder
    initEventListeners state
    return unit

initJQUI :: forall eff. Eff (dom :: DOM | eff) Unit
initJQUI =
  do
    select ".collapsible-accordion" >>= (accordion { heightStyle: "fill" })
    --select ".ui-spinner-button"     >>= click spinAButton
    foreach ".ui-button"    mkButton
    foreach ".ui-tabs"      mkTabs
    foreach ".ui-spinner"   spinIt
    foreach ".checkboxes"   mkButtonSet
    foreach ".check-set"    mkButtonSet
    foreach ".radio-set"    mkButtonSet
    foreach ".check-button" mkButton
    foreach ".check-label"  checkIt
    return unit
      where
        foreach x f = select x >>= each f
        checkIt jq  = click (\_ -> innerClick jq) jq
        mkButton    = button
        mkButtonSet = buttonset
        mkTabs      = tabs
        spinAButton jq =
          do
            sibs <- siblings "input" jq
            change sibs
        spinIt this =
          do
            spinner this
            val "1" this

cleanupCSS :: forall eff. Eff (dom :: DOM | eff) Unit
cleanupCSS =
  do
    mainBox <- byID "main-box"
    css { overflow: "auto" } mainBox
    return unit

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

populateCardSetCustomizer :: forall eff. JQuery -> Eff (dom :: DOM | eff) Unit
populateCardSetCustomizer cardHolder = do
  for_ cards $ appendCard cardHolder
  foreach ".dynamic-check-button" button
  foreach ".dynamic-check-label"  innerClick
  return unit
    where
      foreach x f = children x cardHolder >>= f
      appendCard elem (Card { name = name, isEnabled = isEnabled }) =
        genCardCheckbox name isEnabled >>= flip append elem

innerClick :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
innerClick this =
  do
    forAttr <- attrStr "for" this
    btn     <- byID forAttr
    flipChecked btn
    refreshButton btn
    change btn

findEnabledCards :: forall eff. JQuery -> Eff (dom :: DOM | eff) (Array Card)
findEnabledCards cardHolder = do
  labels <- children "label" cardHolder
  pairs  <- mapLabelsToPairs labels
  let labelEnabledMap = pairs |> (List.toList >>> Map.fromList)
  return $ filter (checkCardIsEnabled labelEnabledMap) cards
    where
      checkCardIsEnabled lookupMap (Card { name = name }) = (Map.lookup name lookupMap) == Just true

initEventListeners :: forall eff. AppState -> Eff (dom :: DOM | eff) Unit
initEventListeners (AppState { adderButton: adderButton, cardNumSpinner: cardNumSpinner, nameInput: nameInput, pickButton: pickButton }) =
  do
    --click    (const $ const genCards)       adderButton
    keypress handleRowKey                    nameInput
    focus    (clearFuzz nameInput)           nameInput
    unfocus  (unfocusFunc nameInput)         nameInput
    keyup    handleNumPickerKey              cardNumSpinner
    --click    (const $ const genCards)       pickButton
    change1  changeFunc                      cardNumSpinner
    return unit
  where
    clearFuzz elem _ = clearErrorFuzz elem
    unfocusFunc elem _ =
      do
        fMyValue <- getValue elem
        let myValue = unsafeFromForeign fMyValue :: String
        if (length myValue) > 0 then return elem else return elem -- Purposely botched
    changeFunc elem =
      do
        fValue <- getValue elem
        let sValue = unsafeFromForeign fValue :: String
        let value  = readFloat sValue
        let newValue = if (isNaN value) || (value < 0.0) then 0.0 else value
        val (show newValue) elem

preloadPriorityImages :: forall eff. Eff (dom :: DOM | eff) Unit
preloadPriorityImages = for_ urls preload
  where
    genURL name = "/static/images/index/priority/" <> name <> ".png"
    imageNames  = ["question-mark", "simple-plus", "simple-x"]
    urls        = map genURL imageNames

preloadCardImages :: forall eff. Eff (dom :: DOM | eff) Unit
preloadCardImages = for_ urls preload
  where
    urls = map (\(Card { name = name }) -> genCardImageURL name) cards

preload :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
preload url =
  do
    tag <- create "<img/>"
    setAttr "src" url tag

byID :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
byID id = select $ "#" <> id

(|>) :: forall a b. a -> (a -> b) -> b
(|>) a f = f a
