module ArrayOps where

import Control.Monad.Eff(Eff())
import Control.Monad.Eff.Random(RANDOM())

foreign import shuffle :: forall a eff. (Array a) -> Eff (rand :: RANDOM | eff) (Array a)
