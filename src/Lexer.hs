-- CompSoc Continuation Language Lexer

module Lexer where

import Data.Char (isSpace)

data Keyword
    = Alice
    | Bob
    | Cnight
    | DropTables
    | Evil
    | FourierJosephTransform
    | GraphaelGGarley
    | Heraphael
    | Isntraphael
    | JoPonting
    | Kewmap
    | LeoLee
    | Michael
    | Gold
    | Smith
    | Nyancat
    | Obama
    | PNP
    | Qmipmap
    | Rnav
    | SompCoc
    | Tescalator
    | UnemployedUnicycle
    | Whitespace
    | SpaceAlice
    deriving (Eq, Show)

data LError
    = UnexpectedToken [Char]
    deriving (Eq, Show)

cvt_token :: [Char] -> [Keyword]
cvt_token "Alice" = [Alice]
cvt_token "Bob" = [Bob]
cvt_token "Cnight" = [Cnight]
cvt_token "DropTables�" = [DropTables]
cvt_token "DropTables" = [DropTables]
cvt_token "Evil" = [Evil]
cvt_token "Fourier\"Joseph\"Transform" = [FourierJosephTransform]
cvt_token "Heraphael" = [Heraphael]
cvt_token "Isn'traphael" = [Isntraphael]
cvt_token "Michael" = [Michael]
cvt_token "Gold" = [Gold]
cvt_token "smith" = [Smith]
cvt_token "Kewmap" = [Kewmap]
cvt_token "NYANCAT!!!!" = [Nyancat]
cvt_token "Obama" = [Obama]
cvt_token "Qmipmap" = [Qmipmap]
cvt_token "Rnav" = [Rnav]
cvt_token "SompCoc" = [SompCoc]
cvt_token "Tescalator" = [Tescalator]
cvt_token _ = []

clex :: [Char] -> Either [Keyword] LError
clex src = scrub_whitespace (inner_clex "" src [])

scrub_whitespace :: Either [Keyword] LError -> Either [Keyword] LError
scrub_whitespace (Right x) = Right x
scrub_whitespace (Left xs) = Left (reverse (inner_scrub [] xs))
    where inner_scrub xs [] = xs
          inner_scrub [] (y:ys) = if y == Whitespace then inner_scrub [] ys else inner_scrub [y] ys
          inner_scrub (x:xs) (y:ys) = if (x == Michael || x == Gold) && y == Whitespace then error "Whitespace not permitted in Goldsmith notation" else
                                            (if y == Whitespace then inner_scrub (x:xs) ys else inner_scrub (y:(x:xs)) ys)

--clex src = merge_alice_space (inner_clex "" src [])

--merge_alice_space :: Either [Keyword] LError -> Either [Keyword] LError
--merge_alice_space (Right x) = Right x
--merge_alice_space (Left xs) = Left (reverse (inner_merge [] xs))
--    where inner_merge xs [] = xs
--          inner_merge [] (y:ys) = inner_merge [y] ys
--          inner_merge (x:xs) (y:ys) = if x == Whitespace && y == Alice then inner_merge (SpaceAlice:xs) ys else inner_merge (y:(x:xs)) ys


inner_clex_space :: [Char] -> [Keyword] -> Either [Keyword] LError
inner_clex_space src words
    | src == ""          = Left (words ++ [Whitespace])
    | isSpace (head src) = inner_clex " " (tail src) words
    | otherwise          = inner_clex [(head src)] (tail src) (words ++ [Whitespace])

anySpaceCons :: Bool -> Bool -> Bool
anySpaceCons False _ = False
anySpaceCons _ False = False
anySpaceCons _ _ = True

allSpace :: [Char] -> Bool
allSpace xs = foldr anySpaceCons True (map isSpace xs)

inner_clex :: [Char] -> [Char] -> [Keyword] -> Either [Keyword] LError

-- What happens when we reach the end of stream?
inner_clex "" "" words = Left words

-- Handle whitespace
--inner_clex " " (' ':src) words = inner_clex " " src words
--inner_clex " " src words = if src /= "" then inner_clex [(head src)] (tail src) (words ++ [Whitespace]) else Left (words ++ [Whitespace])

-- Check if we've found a token
inner_clex tok src words
    | allSpace tok && src /= ""  = inner_clex_space src words
    | result == []               = if src /= "" then inner_clex (tok ++ [(head src)]) (tail src) words else Right (UnexpectedToken tok)
    | otherwise                  = if src /= "" then inner_clex [(head src)] (tail src) (words ++ result) else Left (words ++ result)
    where result = cvt_token tok

inner_clex tok "" words = Right (UnexpectedToken tok)