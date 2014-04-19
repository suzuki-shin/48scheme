{-# OPTIONS_GHC -Wall #-}
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment (getArgs)

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input = case parse symbol "lisp" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value"

main :: IO ()
main = do
  args <- getArgs
--   print $ args!!0
  putStrLn (readExpr (args !! 0))

