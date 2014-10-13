import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Setup

import System.Process

main :: IO ()
main = defaultMainWithHooks simpleUserHooks { buildHook = buildJS, cleanHook = cleanJS }

buildJS :: PackageDescription -> LocalBuildInfo -> UserHooks -> BuildFlags -> IO ()
buildJS _ _ _ _ = do
  _ <- readProcess "npm"   ["install"] []
  _ <- readProcess "gulp" ["build"]    []
  return ()

cleanJS :: PackageDescription -> () -> UserHooks -> CleanFlags -> IO ()
cleanJS _ _ _ _ = do
  _ <- readProcess "gulp" ["clean"]                 []
  _ <- readProcess "rm"   ["-rf", "./node_modules"] []
  return ()
