{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer (Keyword, LError, clex,
    Keyword(..))
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Keyword)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,160) ([65024,236,26608,7,0,12544,16,0,16384,608,512,19,16,32768,0,1024,1024,12320,1,768,0,76,64,0,4866,0,1,49280,4,26608,7,0,12544,16,0,0,608,512,0,784,1,0,0,0,1536,6,1024,0,32,0,0,0,0,0,49280,4,0,0,0,45312,25,0,16384,1036,0,0,0,0,1216,0,38,12288,1,0,0,0,0,0,0,4096,259,0,0,16580,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_innerParse","CStmtList","CStmt","CExpr","GoldsmithNumber","alice","bob","cnight","droptables","evil","fourier","heraphael","isntraphael","michael","gold","smith","kewmap","nyancat","qmipmap","rnav","sompcoc","tescalator","space","spacealice","%eof"]
        bit_start = st Prelude.* 27
        bit_end = (st Prelude.+ 1) Prelude.* 27
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..26]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_5
action_0 (11) = happyShift action_6
action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (14) = happyShift action_9
action_0 (15) = happyShift action_10
action_0 (16) = happyShift action_11
action_0 (19) = happyShift action_12
action_0 (20) = happyShift action_13
action_0 (22) = happyShift action_14
action_0 (23) = happyShift action_15
action_0 (24) = happyShift action_16
action_0 (4) = happyGoto action_17
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_5
action_1 (11) = happyShift action_6
action_1 (12) = happyShift action_7
action_1 (13) = happyShift action_8
action_1 (14) = happyShift action_9
action_1 (15) = happyShift action_10
action_1 (16) = happyShift action_11
action_1 (19) = happyShift action_12
action_1 (20) = happyShift action_13
action_1 (22) = happyShift action_14
action_1 (23) = happyShift action_15
action_1 (24) = happyShift action_16
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (8) = happyShift action_39
action_3 (12) = happyShift action_40
action_3 (13) = happyShift action_41
action_3 (20) = happyShift action_42
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_26

action_5 (8) = happyShift action_38
action_5 (15) = happyShift action_21
action_5 (16) = happyShift action_11
action_5 (19) = happyShift action_12
action_5 (6) = happyGoto action_37
action_5 (7) = happyGoto action_4
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (8) = happyShift action_36
action_6 (15) = happyShift action_21
action_6 (16) = happyShift action_11
action_6 (19) = happyShift action_12
action_6 (6) = happyGoto action_35
action_6 (7) = happyGoto action_4
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (8) = happyShift action_34
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (8) = happyShift action_33
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (8) = happyShift action_31
action_9 (24) = happyShift action_32
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (8) = happyShift action_30
action_10 (15) = happyShift action_21
action_10 (16) = happyShift action_11
action_10 (19) = happyShift action_12
action_10 (6) = happyGoto action_29
action_10 (7) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (16) = happyShift action_11
action_11 (17) = happyShift action_28
action_11 (7) = happyGoto action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (15) = happyShift action_21
action_12 (16) = happyShift action_11
action_12 (19) = happyShift action_12
action_12 (6) = happyGoto action_26
action_12 (7) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (8) = happyShift action_25
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (8) = happyShift action_24
action_14 (15) = happyShift action_21
action_14 (16) = happyShift action_11
action_14 (19) = happyShift action_12
action_14 (6) = happyGoto action_23
action_14 (7) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (12) = happyShift action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (8) = happyShift action_20
action_16 (15) = happyShift action_21
action_16 (16) = happyShift action_11
action_16 (19) = happyShift action_12
action_16 (6) = happyGoto action_19
action_16 (7) = happyGoto action_4
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_5
action_17 (11) = happyShift action_6
action_17 (12) = happyShift action_7
action_17 (13) = happyShift action_8
action_17 (14) = happyShift action_9
action_17 (15) = happyShift action_10
action_17 (16) = happyShift action_11
action_17 (19) = happyShift action_12
action_17 (20) = happyShift action_13
action_17 (22) = happyShift action_14
action_17 (23) = happyShift action_15
action_17 (24) = happyShift action_16
action_17 (27) = happyAccept
action_17 (5) = happyGoto action_18
action_17 (6) = happyGoto action_3
action_17 (7) = happyGoto action_4
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_2

action_19 (8) = happyShift action_56
action_19 (12) = happyShift action_40
action_19 (13) = happyShift action_41
action_19 (20) = happyShift action_42
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_12

action_21 (15) = happyShift action_21
action_21 (16) = happyShift action_11
action_21 (19) = happyShift action_12
action_21 (6) = happyGoto action_29
action_21 (7) = happyGoto action_4
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (8) = happyShift action_55
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_54
action_23 (12) = happyShift action_40
action_23 (13) = happyShift action_41
action_23 (20) = happyShift action_42
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_10

action_25 _ = happyReduce_17

action_26 (12) = happyShift action_40
action_26 (13) = happyShift action_41
action_26 (20) = happyShift action_42
action_26 (21) = happyShift action_53
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (18) = happyShift action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (18) = happyShift action_51
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (12) = happyShift action_40
action_29 (13) = happyShift action_41
action_29 (20) = happyShift action_42
action_29 _ = happyReduce_22

action_30 _ = happyReduce_16

action_31 _ = happyReduce_13

action_32 (8) = happyShift action_50
action_32 (15) = happyShift action_21
action_32 (16) = happyShift action_11
action_32 (19) = happyShift action_12
action_32 (6) = happyGoto action_49
action_32 (7) = happyGoto action_4
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_18

action_34 _ = happyReduce_19

action_35 (8) = happyShift action_48
action_35 (12) = happyShift action_40
action_35 (13) = happyShift action_41
action_35 (15) = happyShift action_21
action_35 (16) = happyShift action_11
action_35 (19) = happyShift action_12
action_35 (20) = happyShift action_42
action_35 (6) = happyGoto action_47
action_35 (7) = happyGoto action_4
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_5

action_37 (8) = happyShift action_46
action_37 (12) = happyShift action_40
action_37 (13) = happyShift action_41
action_37 (20) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_6

action_39 _ = happyReduce_8

action_40 (15) = happyShift action_21
action_40 (16) = happyShift action_11
action_40 (19) = happyShift action_12
action_40 (6) = happyGoto action_45
action_40 (7) = happyGoto action_4
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (15) = happyShift action_21
action_41 (16) = happyShift action_11
action_41 (19) = happyShift action_12
action_41 (6) = happyGoto action_44
action_41 (7) = happyGoto action_4
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (15) = happyShift action_21
action_42 (16) = happyShift action_11
action_42 (19) = happyShift action_12
action_42 (6) = happyGoto action_43
action_42 (7) = happyGoto action_4
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (12) = happyShift action_40
action_43 (13) = happyShift action_41
action_43 (20) = happyShift action_42
action_43 _ = happyReduce_25

action_44 (12) = happyShift action_40
action_44 (13) = happyShift action_41
action_44 (20) = happyShift action_42
action_44 _ = happyReduce_23

action_45 (12) = happyShift action_40
action_45 (13) = happyShift action_41
action_45 (20) = happyShift action_42
action_45 _ = happyReduce_24

action_46 _ = happyReduce_7

action_47 (8) = happyShift action_58
action_47 (12) = happyShift action_40
action_47 (13) = happyShift action_41
action_47 (20) = happyShift action_42
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_4

action_49 (8) = happyShift action_57
action_49 (12) = happyShift action_40
action_49 (13) = happyShift action_41
action_49 (20) = happyShift action_42
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_15

action_51 _ = happyReduce_27

action_52 _ = happyReduce_28

action_53 _ = happyReduce_21

action_54 _ = happyReduce_9

action_55 _ = happyReduce_20

action_56 _ = happyReduce_11

action_57 _ = happyReduce_14

action_58 _ = happyReduce_3

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (SStore (ArgDirect happy_var_2) (ArgDirect happy_var_3)
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SStore (ArgDirect happy_var_2) (ArgStack)
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 _
	_
	 =  HappyAbsSyn5
		 (SStore (ArgStack) (ArgStack)
	)

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 _
	_
	 =  HappyAbsSyn5
		 (SLoad ArgStack
	)

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SLoad (ArgDirect happy_var_2)
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (SPush happy_var_1
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SWaypoint (ArgDirect happy_var_2)
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  5 happyReduction_10
happyReduction_10 _
	_
	 =  HappyAbsSyn5
		 (SWaypoint (ArgStack)
	)

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SGoto (ArgDirect happy_var_2)
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  5 happyReduction_12
happyReduction_12 _
	_
	 =  HappyAbsSyn5
		 (SGoto (ArgStack)
	)

happyReduce_13 = happySpecReduce_2  5 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn5
		 (SSkipOnZero
	)

happyReduce_14 = happyReduce 4 5 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (SConditionalGoto (ArgDirect happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 _
	_
	_
	 =  HappyAbsSyn5
		 (SConditionalGoto (ArgStack)
	)

happyReduce_16 = happySpecReduce_2  5 happyReduction_16
happyReduction_16 _
	_
	 =  HappyAbsSyn5
		 (SNegate
	)

happyReduce_17 = happySpecReduce_2  5 happyReduction_17
happyReduction_17 _
	_
	 =  HappyAbsSyn5
		 (SAdd
	)

happyReduce_18 = happySpecReduce_2  5 happyReduction_18
happyReduction_18 _
	_
	 =  HappyAbsSyn5
		 (SMultiply
	)

happyReduce_19 = happySpecReduce_2  5 happyReduction_19
happyReduction_19 _
	_
	 =  HappyAbsSyn5
		 (SDivide
	)

happyReduce_20 = happySpecReduce_3  5 happyReduction_20
happyReduction_20 _
	_
	_
	 =  HappyAbsSyn5
		 (SRevDivide
	)

happyReduce_21 = happySpecReduce_3  6 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  6 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (CNegate happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  6 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (CMultiply happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  6 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (CDivide happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (CAdd happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CNumber (justGoldsmith happy_var_1)
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 _
	_
	_
	 =  HappyAbsSyn7
		 (GoldsmithNumber 1
	)

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (GoldsmithNumber ((justGoldsmith happy_var_2) + 1)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 27 27 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Alice -> cont 8;
	Bob -> cont 9;
	Cnight -> cont 10;
	DropTables -> cont 11;
	Evil -> cont 12;
	FourierJosephTransform -> cont 13;
	Heraphael -> cont 14;
	Isntraphael -> cont 15;
	Michael -> cont 16;
	Gold -> cont 17;
	Smith -> cont 18;
	Kewmap -> cont 19;
	Nyancat -> cont 20;
	Qmipmap -> cont 21;
	Rnav -> cont 22;
	SompCoc -> cont 23;
	Tescalator -> cont 24;
	Whitespace -> cont 25;
	SpaceAlice -> cont 26;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 27 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Keyword)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
innerParse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
