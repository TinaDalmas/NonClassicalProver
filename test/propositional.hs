module Main where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

import Logic.Propositional
import qualified Logic.Propositional.Prove.List as List

main :: IO ()
main = hspec $ do
  describe "Prove.List.isProvable" $ do
    it "Top" $ List.isProvable Top
    it "dis p (Neg p)" $ List.isProvable $ dis p (Neg p)
    it "Neg $ Con p (Neg p)" $ List.isProvable $ Neg $ Con p (Neg p)
    it "Neg (Imp p q) --> Con p (Neg q)" $ List.isProvable $ Neg (Imp p q) --> Con p (Neg q)
  describe "not . Prove.List.isProvable" $ do
    it "Bot" $ not . List.isProvable $ bot
    it "Con p (Neg p)" $ not . List.isProvable $ Con p (Neg p)
    it "Con r (dis p (Neg p))" $ not . List.isProvable $ Con r (dis p (Neg p))
