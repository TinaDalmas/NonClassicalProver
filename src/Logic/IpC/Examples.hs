module Logic.Propositional.Examples where

import Logic.Propositional

-- | A valid formula, apparently
weirdform :: Form
weirdform = disSet
  [ Neg (At 'r')
  , (At 'r')
  ]
