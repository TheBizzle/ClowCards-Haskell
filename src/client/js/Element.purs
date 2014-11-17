module Element (genCardCheckbox, genCardEntryColumn, genPlayerRow) where

import Control.Monad.Eff(Eff(..))
import Control.Monad.JQuery(append, create, find, JQuery(..), remove, removeClass)

import Data.String(toLower)

import DOM(DOM(..))
import JQueryUI(attrStr, click, load, replaceWith)
import StringUtils(slugify)

(|>) a f = f a

genCardCheckbox :: forall eff. String -> Boolean -> Eff (dom :: DOM | eff) JQuery
genCardCheckbox cardname isEnabled = create html
  where
    name    = slugify cardname
    checked = if isEnabled then " checked" else ""
    html    =
      """
      <input type="checkbox" id='check-""" ++ name ++ """' name="version" class='check-button version-button dynamic-check-button'""" ++ checked ++ """/>
      <label for='check-""" ++ name ++ """' class="unselectable check-label dynamic-check-label">""" ++ cardname ++ """</label>
      """

genCardEntryColumn :: forall eff. String -> String -> String -> String -> Eff (dom :: DOM | eff) JQuery
genCardEntryColumn name id url faction = do
    column    <- create "<td></td>"
    cardEntry <- genCardEntry name id url faction
    append cardEntry column

genPlayerRow :: forall eff. String -> String -> String -> (JQuery -> Eff (dom :: DOM| eff) JQuery) -> Eff (dom :: DOM | eff) JQuery
genPlayerRow name id imgID onClickF = do
    imgJQ          <- create imgHTML
    clickableImgJQ <- click onClickF imgJQ
    elemJQ         <- create elemHTML
    findAndReplace ".placeholder" clickableImgJQ elemJQ
  where
    imgHTML      = "<img id='" ++ imgID ++ "' src='/assets/images/index/priority/simple-x.png' class='player-button'>"
    elemHTML =
      """
      <table id='""" ++ id ++ """' class="player-table round-bordered card-row has-headroom">
        <tr>
          <td class="player-content">
            <table>
              <tr>
                <td>
                  <span class="player-name">""" ++ name ++ """</span>
                </td>
                <td>
                  <div class="placeholder">
                </td>
              </tr>
            </table>
          </td>
          <td>
            <div class="row-divider"></div>
          </td>
          <td class="row-content">
            <table>
              <tr class="row-content-row">
              </tr>
            </table>
          </td>
        </tr>
      </table>
      """

genCardEntry :: forall eff. String -> String -> String -> String -> Eff (dom :: DOM | eff) JQuery
genCardEntry name id url faction = do
    jq     <- create html
    imgJQ  <- genCardImage id url faction
    textJQ <- genCardText name
    r1     <- findAndReplace imgHolderClass imgJQ jq
    findAndReplace textHolderClass textJQ r1
  where
    imgHolderClass  = ".img-placeholder"
    textHolderClass = ".text-placeholder"
    html            =
      """
      <div class='entry-wrapper horiz-centered-children'>
        <div class='""" ++ imgHolderClass ++ """'></div>
        <br>
        <div class='""" ++ textHolderClass ++ """'></div>
      </div>
      """

genCardImage :: forall eff. String -> String -> String -> Eff (dom :: DOM | eff) JQuery
genCardImage id url faction = do
    jq      <- create "<span></span>"
    animJQ  <- genLoadingAnim id bgClass
    imgJQ   <- genCardCoreImage id url animJQ bgClass
    withImg <- append imgJQ jq
    append animJQ withImg
  where
    bgClass = faction |> (toLower >>> (\x -> x ++ "-backgrounded"))

genCardText :: forall eff. String -> Eff (dom :: DOM | eff) JQuery
genCardText text = create html
  where
    html =
      """
      <div class='entry-text-outer'>
        <div class='entry-text-middle'>
          <div class='entry-text-inner'>
            """ ++ text ++ """
          </div>
        </div>
      </div>
      """

genCardCoreImage :: forall eff. String -> String -> JQuery -> String -> Eff (dom :: DOM | eff) JQuery
genCardCoreImage id url anim bgClass = do
    jq <- create html
    load loadFunc jq
  where
    html      = "<img id='" ++ id ++ "' class='entry-image hidden " ++ bgClass ++ "' src='" ++ url ++ "'>"
    domCopyOf elem = do
      soulmateID <- attrStr "id" elem
      create $ "#" ++ soulmateID
    loadFunc this = do
      a <- domCopyOf anim
      remove a
      t <- domCopyOf this
      removeClass "hidden" t

genLoadingAnim :: forall eff. String -> String -> Eff (dom :: DOM | eff) JQuery
genLoadingAnim idBasis bgClass = create html
  where
    id   = idBasis ++ "-loading"
    html =
      """
      <div id='""" ++ id ++ """' class='entry-image """ ++ bgClass ++ """fade-anim-wrapper'>
        <div class="fade-anim-circle fade-anim-1"></div>
        <div class="fade-anim-circle fade-anim-2"></div>
        <div class="fade-anim-circle fade-anim-3"></div>
        <div class="fade-anim-circle fade-anim-4"></div>
        <div class="fade-anim-circle fade-anim-5"></div>
        <div class="fade-anim-circle fade-anim-6"></div>
      </div>
      """

findAndReplace :: forall eff. String -> JQuery -> JQuery -> Eff (dom :: DOM | eff) JQuery
findAndReplace findTerm replaceTerm root = do
  found <- find findTerm root
  replaceWith replaceTerm found
