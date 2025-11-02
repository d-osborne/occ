{
module Parser where

import Lexer (Keyword, LError, clex,
    Keyword(..))
}

%name innerParse
%tokentype { Keyword }
%error { parseError }

%token
    alice               { Alice }
    bob                 { Bob }
    cnight              { Cnight }
    droptables          { DropTables }
    evil                { Evil }
    fourier             { FourierJosephTransform }
    heraphael           { Heraphael }
    isntraphael         { Isntraphael }
    michael             { Michael }
    gold                { Gold }
    smith               { Smith }
    kewmap              { Kewmap }
    nyancat             { Nyancat }
    obama               { Obama }
    qmipmap             { Qmipmap }
    rnav                { Rnav }
    sompcoc             { SompCoc }
    tescalator          { Tescalator }

%%

CStmtList   : CStmt                 { [$1] }
            | CStmtList CStmt { $1 ++ [$2] }

CStmt   : droptables CExpr CExpr alice      { SStore (ArgDirect $2) (ArgDirect $3) }
        | droptables CExpr alice            { SStore (ArgDirect $2) (ArgStack) }
        | droptables alice                  { SStore (ArgStack) (ArgStack) }
        | cnight alice                      { SLoad ArgStack }
        | cnight CExpr alice                { SLoad (ArgDirect $2) }
        | CExpr alice                       { SPush $1 }
        | rnav CExpr alice                  { SWaypoint (ArgDirect $2) }
        | rnav alice                        { SWaypoint (ArgStack) }
        | tescalator CExpr alice            { SGoto (ArgDirect $2) }
        | tescalator alice                  { SGoto (ArgStack) }
        | heraphael alice                   { SSkipOnZero }
        | heraphael tescalator CExpr alice  { SConditionalGoto (ArgDirect $3) }
        | heraphael tescalator alice        { SConditionalGoto (ArgStack) }
        | isntraphael alice                 { SNegate }
        | nyancat alice                     { SAdd }
        | fourier alice                     { SMultiply }
        | evil alice                        { SDivide }
        | sompcoc evil alice                { SRevDivide }


CExpr   : kewmap CExpr qmipmap  { $2 }
        | isntraphael CExpr     { CNegate $2 }
        | CExpr fourier CExpr   { CMultiply $1 $3 }
        | CExpr evil CExpr      { CDivide $1 $3 }
        | CExpr nyancat CExpr   { CAdd $1 $3 }
        | GoldsmithNumber       { CNumber (justGoldsmith $1) }

GoldsmithNumber : michael gold smith            { GoldsmithNumber 1 }
                | michael GoldsmithNumber smith { GoldsmithNumber ((justGoldsmith $2) + 1) }

{

type CStmtList = [CStmt]

data CStmt
    = SPush CExpr
    | SStore CArgument CArgument
    | SLoad CArgument
    | SNegate
    | SAdd
    | SMultiply
    | SDivide
    | SRevDivide
    | SWaypoint CArgument
    | SGoto CArgument
    | SConditionalGoto CArgument
    | SSkipOnZero
    deriving (Eq, Show)

data CArgument
    = ArgStack
    | ArgDirect CExpr
    | ArgVariable CExpr
    deriving (Eq, Show)

data CExpr
    = CNumber Int
    | CNegate CExpr
    | CAdd CExpr CExpr
    | CMultiply CExpr CExpr
    | CDivide CExpr CExpr
    deriving (Eq, Show)

data GoldsmithNumber
    = GoldsmithNumber Int
    deriving (Eq, Show)

justGoldsmith (GoldsmithNumber x) = x

parseError :: [Keyword] -> a
parseError xs = error ("Parsing error " ++ (show xs))

invokeParse (Left xs) = innerParse xs
invokeParse (Right x) = error (show x)

cparse = invokeParse . clex
}