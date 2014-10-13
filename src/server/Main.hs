{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative

import Snap.Core
import Snap.Util.FileServe
import Snap.Http.Server

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (sendFile "./src/client/html/main.html") <|>
    dir "stylesheets" (serveDirectory "target/stylesheets") <|>
    dir "js"          (serveDirectory "target/js") <|>
    dir "static"      (serveDirectory "public")
