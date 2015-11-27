module IndexOps where

import DOM(DOM())
import Global(readInt)
import JQueryUI(insertBefore, Keypress(), Keyup())
import Prelude((+), ($), (/=), (<>), (<$>), (>>>), (>>=), bind, const, flip, map, negate, return, show, Unit(), unit)

import Control.Bind((>=>))
import Control.Monad.Eff(Eff())
import Control.Monad.Eff.JQuery(append, clear, find, JQuery(), remove, removeClass, select)
import Control.Monad.Eff.Random(RANDOM(), randomInt)

import Data.Array((!!), filter, last, singleton)
import Data.Foldable(for_)
import Data.Maybe(fromMaybe, Maybe())
import Data.String(split)

import Cards(Card(..))
import Element(genCardEntryColumn, genPlayerRow)
import StringUtils(slugify)

import qualified Data.Int as Int

(|>) :: forall a b. a -> (a -> b) -> b
(|>) a f = f a

genCardImageURL :: String -> String
genCardImageURL name = "/static/images/index/" <> (slugify name) <> ".png"

genCards :: forall eff. Int -> Int -> (Array Card) -> Eff (dom :: DOM | eff) Unit
genCards cardCount playerCount cards =
  do
    elem <- select "#name-input"
    clearErrorFuzz elem
    return unit
--    handleIt
--  where
--    handleIt =
--      if totalCards <= maxCards then do
--        clearCardBuckets
--        let cardIterator = resetIterator
--        forE 0 cardCount $ const genCardForEachPlayer
--      else
--        alert msg
--    maxCards   = length $ filter (\Card { isEnabled = isEnabled } -> isEnabled) cards
--    totalCards = playerCount * cardCount
--    msg        = """
--                 You attempted to generate """ <> (show totalCards) <> """ cards, but there are only """ <> (show maxCards) <> """ available.
--
--                 Please reduce the number of cards drawn or active players and try again.
--                 """

-- Needs translation
type RowAdder = forall eff. JQuery -> (Array Int) -> JQuery -> Eff (dom :: DOM | eff) JQuery
foreign import addRow :: RowAdder -> RowAdder

insertCardForID :: forall eff. String -> Card -> Eff (dom :: DOM, random :: RANDOM | eff) JQuery
insertCardForID id (Card { name: name, faction: faction }) =
  do
    randNum <- randomInt 1 100000 -- Magic safety number (for fake GUIDs)
    let cardID = (slugify name) <> "-" <> (show randNum)
    let imgURL = genCardImageURL name
    column  <- genCardEntryColumn name cardID imgURL (show faction)
    elem    <- byID id
    jq      <- find ".row-content-row" elem
    append column jq

makeImageVisibleByID :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
makeImageVisibleByID id = do
  img    <- byID id
  loader <- byID $ id <> "-loading"
  removeClass "hidden" img
  remove loader

genPlayerID :: Int -> String
genPlayerID num = "player-" <> (show num)

genNumFromID :: String -> Maybe Int
genNumFromID = ((split "-") >>> (!! 1) >>> ((<$>) $ readInt 10)) >>> (>>= Int.fromNumber)

maxPlayerCount :: Int
maxPlayerCount = 10

genRow :: forall eff. String -> (Array Int) -> JQuery -> Eff (dom :: DOM | eff) Unit
genRow name playerNums adderTable =
  do
    elem <- genPlayerRow name id elemID (const $ removeRow id newNums)
    insertBefore adderTable elem
    return unit
  where
    num     = playerNums |> (last >>> (fromMaybe 0) >>> (\x -> x + 1))
    id      = genPlayerID num
    elemID  = (show id) <> "-elem"
    newNums = num |> (singleton >>> (<> playerNums))

-- BAD!
removeRow :: forall eff. String -> (Array Int) -> Eff (dom :: DOM | eff) Unit
removeRow id nums =
  do
    elem <- byID id
    remove elem
    return unit
  where
    filterNums =
      let num = fromMaybe (-1) $ genNumFromID id
      in filter (/= num)

--genCardForEachPlayer :: forall eff. (Array Int) -> Eff (dom :: DOM | eff) Unit
--genCardForEachPlayer playerNums =
--  (map genPlayerID) >>> (flip for_ f)
--    where
--      exhaustionAlert = alert "Card pool exhausted!  Pick fewer cards!"
--      cardOpt         = Nothing -- nextCard -- Zip it ahead of time (whatever that means)
--      f id            = cardOpt |> ((map $ insertCardForID id) >>> fromMaybe exhaustionAlert)

clearErrorFuzz :: forall eff. JQuery -> Eff (dom :: DOM | eff) JQuery
clearErrorFuzz = removeClass "glowing-border"

clearCardBuckets :: forall eff. (Array Int) -> Eff (dom :: DOM | eff) Unit
clearCardBuckets = (map genPlayerID) >>> (flip for_ f)
  where
    f = (byID >=> (find ".row-content-row") >=> clear)

-- BAD!
--handleRowKey :: Keypress -> Unit
--handleRowKey = onEnter $ const (addRow genRow)

foreign import handleRowKey :: forall a eff. Keypress -> Eff (eff) a

-- BAD!
--handleNumPickerKey :: Keypress -> Unit
--handleNumPickerKey = onEnter $ const (genCards 0 0 [])
--
foreign import handleNumPickerKey :: forall a eff. Keyup -> Eff (eff) a

byID :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
byID id = select $ "#" <> id

foreign import data Alert :: !

foreign import alert :: forall eff. String -> Eff (alert :: Alert | eff) Unit

foreign import onEnter :: forall eff. (Unit -> Eff (eff) Unit) -> Keypress -> Eff (eff) Unit
