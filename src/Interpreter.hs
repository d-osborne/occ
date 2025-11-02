-- CompSoc Continuation Language Interpreter

module Interpreter where

import Data.List (findIndex)
import Debug.Trace (trace)

import Parser (cparse, CStmt, CExpr, CArgument, CStmt(..), CExpr(..), CArgument(..))
import Lexer (clex)

store :: (Int, Int) -> [(Int, Int)] -> [(Int, Int)]
store (pos, val) vars = add_pair (findIndex (\(x,y) -> x == pos) vars)
    where add_pair (Just i) = (pos, val):((take i vars) ++ (drop (i + 1) vars))
          add_pair Nothing = (pos, val):vars

load :: Int -> [(Int, Int)] -> Int
load pos vars = y
    where get_pair (Just i) = head (drop i vars)
          get_pair Nothing = error "Referenced undeclared variable"
          (x, y) = get_pair (findIndex (\(x,y) -> x == pos) vars)

mark :: (Int, [CStmt]) -> [(Int, [CStmt])] -> [(Int, [CStmt])]
mark (pos, val) vars = add_pair (findIndex (\(x,y) -> x == pos) vars)
    where add_pair (Just i) = error "Attempt to redefine Rnavigation point"
          add_pair Nothing = (pos, val):vars

find :: Int -> [(Int, [CStmt])] -> [CStmt]
find pos vars = y
    where get_pair (Just i) = head (drop i vars)
          get_pair Nothing = error "Attempt to Tescalate to non-existent Rnavigation point"
          (x, y) = get_pair (findIndex (\(x,y) -> x == pos) vars)

eval :: CExpr -> Int
eval (CNumber x) = x
eval (CNegate expr) = -(eval expr)
eval (CAdd ex ey) = (eval ex) + (eval ey)
eval (CMultiply ex ey) = (eval ex) * (eval ey)
eval (CDivide ex ey) = (eval ex) `div` (eval ey)

exec :: CStmt -> [Int] -> [(Int, Int)] -> ([Int], [(Int, Int)], Int)

exec (SPush expr) stk vars = (val:stk, vars, val)
    where val = eval expr

exec (SStore (ArgDirect e1) (ArgDirect e2)) stk vars = (stk, (store (val1, val2) vars), val2)
    where val1 = eval e1
          val2 = eval e2

exec (SStore (ArgDirect e1) (ArgStack)) (s:stk) vars = (stk, (store (val1, s) vars), s)
    where val1 = eval e1

exec (SStore (ArgStack) (ArgStack)) (s2:(s1:stk)) vars = (stk, (store (s1, s2) vars), s2)

exec (SLoad (ArgDirect e1)) stk vars = (ldvr:stk, vars, ldvr)
    where val1 = eval e1
          ldvr = load val1 vars

exec (SLoad (ArgStack)) (s:stk) vars = (ldvr:stk, vars, ldvr)
    where ldvr = load s vars

exec SNegate (s:stk) vars = ((-s):stk, vars, (-s))

exec SAdd (s2:(s1:stk)) vars = (result:stk, vars, result)
    where result = s1 + s2

exec SMultiply (s2:(s1:stk)) vars = (result:stk, vars, result)
    where result = s1 * s2

exec SDivide (s2:(s1:stk)) vars = (result:stk, vars, result)
    where result = s1 `div` s2

exec SRevDivide (s1:(s2:stk)) vars = (result:stk, vars, result)
    where result = s1 `div` s2

execs :: [CStmt] -> [Int] -> [(Int, Int)] -> [(Int, [CStmt])] -> ([Int], [(Int, Int)], [(Int, [CStmt])], Int)

execs ((SWaypoint x):[]) stk vars pts = (stk, vars, pts, 0)

execs ((SWaypoint (ArgStack)):stmts) stk vars pts = execs stmts (tail stk) vars npts
    where npts = mark (head stk, stmts) pts

execs ((SWaypoint (ArgDirect e1)):stmts) stk vars pts = execs stmts stk vars npts
    where npts = mark (eval e1, stmts) pts

execs ((SGoto (ArgStack)):stmts) stk vars pts = execs nstmts (tail stk) vars pts
    where nstmts = find (head stk) pts

execs ((SGoto (ArgDirect e1)):stmts) stk vars pts = execs nstmts stk vars pts
    where nstmts = find (eval e1) pts

execs ((SConditionalGoto (ArgStack)):stmts) (s:stk) vars pts = if s == 0 then execs stmts (tail stk) vars pts else execs nstmts (tail stk) vars pts
    where nstmts = find (head stk) pts

execs ((SConditionalGoto (ArgDirect e1)):stmts) (s:stk) vars pts = if s == 0 then execs stmts stk vars pts else execs nstmts stk vars pts
    where nstmts = find (eval e1) pts

execs ((SSkipOnZero):s2:stmts) (s:stk) vars pts = if s == 0 then execs stmts stk vars pts else execs (s2:stmts) stk vars pts

execs (stmt:[]) stk vars pts = (nstk, nvars, pts, result)
    where (nstk, nvars, result) = exec stmt stk vars
execs (stmt:stmts) stk vars pts = execs stmts nstk nvars pts
    where (nstk, nvars, result) = exec stmt stk vars

interpret stk vars pts = do
    putStr "$> "
    src <- getLine
    let tokens = clex src
    --print tokens
    let asf = cparse src
    --print asf
    let (nstk, nvars, npts, result) = execs asf stk vars pts
    print result
    interpret nstk nvars npts

main :: IO ()
main = do
    putStrLn "Oxford CompSoc Continuation Interpreter (occi)"
    interpret [] [] []