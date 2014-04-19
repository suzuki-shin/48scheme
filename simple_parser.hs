{-# OPTIONS_GHC -Wall #-}
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
--   print $ args!!0
  putStrLn (readExpr (args !! 0))

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value"

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces :: Parser ()
spaces = skipMany1 space
