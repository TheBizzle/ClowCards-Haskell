import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Setup

import System.Process

main :: IO ()
main = defaultMainWithHooks simpleUserHooks { buildHook = buildJS, cleanHook = cleanJS }

buildJS :: PackageDescription -> LocalBuildInfo -> UserHooks -> BuildFlags -> IO ()
buildJS a b c d = do
  readProcess "npm"   ["install"] []
  readProcess "bower" ["update"]  []
  readProcess "gulp"  ["build"]   []
  indexJS <- readProcess "pulp" ["browserify"] []
  writeFile "target/js/index.js" indexJS
  (buildHook simpleUserHooks) a b c d

cleanJS :: PackageDescription -> () -> UserHooks -> CleanFlags -> IO ()
cleanJS _ _ _ _ = do
  readProcess "gulp" ["clean"] []
  readProcess "rm"   ["-rf", "./node_modules/", "./bower_components/"] []
  return ()
