module StringUtils (slugify, stripMargin, stripMarginSimple) where

import Prelude((<>), flip)

import Data.Foldable(Foldable, foldl)
import Data.String(toLower)
import Data.String.Regex(parseFlags, regex, replace)
import Data.Tuple(Tuple(..))

slugify :: String -> String
slugify str = foldl foldFunc lowered replacements
  where
    lowered      = toLower str
    g            = parseFlags "g"
    replacements = [(Tuple (regex "['.,]" g) ""), (Tuple (regex " " g) "-")]
    foldFunc acc (Tuple reg sub) = replace reg sub acc

stripMargin :: String -> String -> String
stripMargin str delim = replace (regex r flags) "\n" str
  where
    flags = parseFlags "g"
    r     = "(?:^|\n[ \t]*)" <> delim

stripMarginSimple :: String -> String
stripMarginSimple = flip stripMargin "\\|"
