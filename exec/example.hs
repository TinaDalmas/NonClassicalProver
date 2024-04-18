
import Text.ParserCombinators.Parsec

-- Define a data structure to hold the list of strings
data KripkeStructure = KripkeStructure [String] deriving Show

-- Define a parser to parse a single point
pointParser :: Parser String
pointParser = do
  spaces
  point <- many1 (noneOf ", \n")
  spaces
  return point

-- Define a parser to parse a comma-separated list of points
kripkeParser :: Parser KripkeStructure
kripkeParser = do
  points <- pointParser `sepBy` (char ',' >> spaces)
  eof
  return (KripkeStructure points)

-- Main function to parse user input and convert it into KripkeStructure
main :: IO ()
main = do
  putStrLn "Specify W (e.g., \"x, y, w, x\"):"
  input <- getLine
  case parse kripkeParser "user input" input of
    Left err -> putStrLn $ "Error: " ++ show err
    Right (KripkeStructure points) -> do
      putStrLn "Parsed Kripke Structure:"
      print points