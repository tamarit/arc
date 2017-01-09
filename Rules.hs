{-# OPTIONS_GHC -w #-}

module Rules where 

import RulesLib

import Language.C
import Language.C.Data.Ident

import Data.Generics

nameRulesAll = ["remove_identity", "reduce_to_0", "undo_distributive", "join_addition_assign", "mult_ternary_2_ternary", "sum_ternary_2_ternary", "if_else_2_assign_ternary", "if_2_assign_ternary", "empty_else", "remove_empty_if", "remove_useless_statement", "strength_reduction", "useless_assign", "replace_var_equal", "contiguous_same_if", "just_one_iteration_removal", "loop_inv_code_motion", "common_subexp_elimination"]
dictRulesAll = [("remove_identity", Left rule_remove_identity_0), ("reduce_to_0", Left rule_reduce_to_0_105), ("undo_distributive", Left rule_undo_distributive_112), ("join_addition_assign", Left rule_join_addition_assign_169), ("mult_ternary_2_ternary", Left rule_mult_ternary_2_ternary_178), ("sum_ternary_2_ternary", Left rule_sum_ternary_2_ternary_189), ("if_else_2_assign_ternary", Right rule_if_else_2_assign_ternary_200), ("if_2_assign_ternary", Right rule_if_2_assign_ternary_223), ("empty_else", Right rule_empty_else_241), ("remove_empty_if", Right rule_remove_empty_if_253), ("remove_useless_statement", Right rule_remove_useless_statement_262), ("strength_reduction", Right rule_strength_reduction_272), ("useless_assign", Right rule_useless_assign_409), ("replace_var_equal", Right rule_replace_var_equal_422), ("contiguous_same_if", Right rule_contiguous_same_if_461), ("just_one_iteration_removal", Right rule_just_one_iteration_removal_482), ("loop_inv_code_motion", Right rule_loop_inv_code_motion_545), ("common_subexp_elimination", Right rule_common_subexp_elimination_604)]
nameRules = [r | r <- nameRulesAll, not $ isPrefix "feat_" r]
dictRules = [item | item@(r, _) <- dictRulesAll, not $ isPrefix "feat_" r]
stmtRules :: [TransState -> CStatAnn -> [((String, CStatAnn, CStatAnn), TransState,[(String, CStatAnn)])]]
stmtRules = [r | (_, Right r) <- dictRules]
exprRules :: [TransState -> CExprAnn -> [((String, CExprAnn, CExprAnn), TransState,[(String, CStatAnn)])]]
exprRules = [r | (_, Left r) <- dictRules]
pragmasRules = []

-- remove_identity
rule_remove_identity_0
	state old@(CBinary CMulOp var_a_1 var_b_2 _)
	| True && (and [var_cond_3, var_cond_4]) =
	[(("remove_identity",old,var_a_1), state, (concat [unknown_3, unknown_4]))]
	where
		(var_cond_3, unknown_3) = (isIdenity CMulOp var_b_2)
		(var_cond_4, unknown_4) = (writesNothing [(CBlockStmt (CExpr (Just var_b_2) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CMulOp var_b_5 var_a_6 _)
	| True && (and [var_cond_7, var_cond_8]) =
	[(("remove_identity",old,var_a_6), state, (concat [unknown_7, unknown_8]))]
	where
		(var_cond_7, unknown_7) = (isIdenity CMulOp var_b_5)
		(var_cond_8, unknown_8) = (writesNothing [(CBlockStmt (CExpr (Just var_b_5) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CDivOp var_a_9 var_b_10 _)
	| True && (and [var_cond_11, var_cond_12]) =
	[(("remove_identity",old,var_a_9), state, (concat [unknown_11, unknown_12]))]
	where
		(var_cond_11, unknown_11) = (isIdenity CDivOp var_b_10)
		(var_cond_12, unknown_12) = (writesNothing [(CBlockStmt (CExpr (Just var_b_10) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CRmdOp var_a_13 var_b_14 _)
	| True && (and [var_cond_15, var_cond_16]) =
	[(("remove_identity",old,var_a_13), state, (concat [unknown_15, unknown_16]))]
	where
		(var_cond_15, unknown_15) = (isIdenity CRmdOp var_b_14)
		(var_cond_16, unknown_16) = (writesNothing [(CBlockStmt (CExpr (Just var_b_14) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CAddOp var_a_17 var_b_18 _)
	| True && (and [var_cond_19, var_cond_20]) =
	[(("remove_identity",old,var_a_17), state, (concat [unknown_19, unknown_20]))]
	where
		(var_cond_19, unknown_19) = (isIdenity CAddOp var_b_18)
		(var_cond_20, unknown_20) = (writesNothing [(CBlockStmt (CExpr (Just var_b_18) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CAddOp var_b_21 var_a_22 _)
	| True && (and [var_cond_23, var_cond_24]) =
	[(("remove_identity",old,var_a_22), state, (concat [unknown_23, unknown_24]))]
	where
		(var_cond_23, unknown_23) = (isIdenity CAddOp var_b_21)
		(var_cond_24, unknown_24) = (writesNothing [(CBlockStmt (CExpr (Just var_b_21) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CSubOp var_a_25 var_b_26 _)
	| True && (and [var_cond_27, var_cond_28]) =
	[(("remove_identity",old,var_a_25), state, (concat [unknown_27, unknown_28]))]
	where
		(var_cond_27, unknown_27) = (isIdenity CSubOp var_b_26)
		(var_cond_28, unknown_28) = (writesNothing [(CBlockStmt (CExpr (Just var_b_26) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CShlOp var_a_29 var_b_30 _)
	| True && (and [var_cond_31, var_cond_32]) =
	[(("remove_identity",old,var_a_29), state, (concat [unknown_31, unknown_32]))]
	where
		(var_cond_31, unknown_31) = (isIdenity CShlOp var_b_30)
		(var_cond_32, unknown_32) = (writesNothing [(CBlockStmt (CExpr (Just var_b_30) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CShrOp var_a_33 var_b_34 _)
	| True && (and [var_cond_35, var_cond_36]) =
	[(("remove_identity",old,var_a_33), state, (concat [unknown_35, unknown_36]))]
	where
		(var_cond_35, unknown_35) = (isIdenity CShrOp var_b_34)
		(var_cond_36, unknown_36) = (writesNothing [(CBlockStmt (CExpr (Just var_b_34) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CLeOp var_a_37 var_b_38 _)
	| True && (and [var_cond_39, var_cond_40]) =
	[(("remove_identity",old,var_a_37), state, (concat [unknown_39, unknown_40]))]
	where
		(var_cond_39, unknown_39) = (isIdenity CLeOp var_b_38)
		(var_cond_40, unknown_40) = (writesNothing [(CBlockStmt (CExpr (Just var_b_38) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CGrOp var_a_41 var_b_42 _)
	| True && (and [var_cond_43, var_cond_44]) =
	[(("remove_identity",old,var_a_41), state, (concat [unknown_43, unknown_44]))]
	where
		(var_cond_43, unknown_43) = (isIdenity CGrOp var_b_42)
		(var_cond_44, unknown_44) = (writesNothing [(CBlockStmt (CExpr (Just var_b_42) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CLeqOp var_a_45 var_b_46 _)
	| True && (and [var_cond_47, var_cond_48]) =
	[(("remove_identity",old,var_a_45), state, (concat [unknown_47, unknown_48]))]
	where
		(var_cond_47, unknown_47) = (isIdenity CLeqOp var_b_46)
		(var_cond_48, unknown_48) = (writesNothing [(CBlockStmt (CExpr (Just var_b_46) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CGeqOp var_a_49 var_b_50 _)
	| True && (and [var_cond_51, var_cond_52]) =
	[(("remove_identity",old,var_a_49), state, (concat [unknown_51, unknown_52]))]
	where
		(var_cond_51, unknown_51) = (isIdenity CGeqOp var_b_50)
		(var_cond_52, unknown_52) = (writesNothing [(CBlockStmt (CExpr (Just var_b_50) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CEqOp var_a_53 var_b_54 _)
	| True && (and [var_cond_55, var_cond_56]) =
	[(("remove_identity",old,var_a_53), state, (concat [unknown_55, unknown_56]))]
	where
		(var_cond_55, unknown_55) = (isIdenity CEqOp var_b_54)
		(var_cond_56, unknown_56) = (writesNothing [(CBlockStmt (CExpr (Just var_b_54) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CEqOp var_b_57 var_a_58 _)
	| True && (and [var_cond_59, var_cond_60]) =
	[(("remove_identity",old,var_a_58), state, (concat [unknown_59, unknown_60]))]
	where
		(var_cond_59, unknown_59) = (isIdenity CEqOp var_b_57)
		(var_cond_60, unknown_60) = (writesNothing [(CBlockStmt (CExpr (Just var_b_57) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CNeqOp var_a_61 var_b_62 _)
	| True && (and [var_cond_63, var_cond_64]) =
	[(("remove_identity",old,var_a_61), state, (concat [unknown_63, unknown_64]))]
	where
		(var_cond_63, unknown_63) = (isIdenity CNeqOp var_b_62)
		(var_cond_64, unknown_64) = (writesNothing [(CBlockStmt (CExpr (Just var_b_62) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CNeqOp var_b_65 var_a_66 _)
	| True && (and [var_cond_67, var_cond_68]) =
	[(("remove_identity",old,var_a_66), state, (concat [unknown_67, unknown_68]))]
	where
		(var_cond_67, unknown_67) = (isIdenity CNeqOp var_b_65)
		(var_cond_68, unknown_68) = (writesNothing [(CBlockStmt (CExpr (Just var_b_65) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CAndOp var_a_69 var_b_70 _)
	| True && (and [var_cond_71, var_cond_72]) =
	[(("remove_identity",old,var_a_69), state, (concat [unknown_71, unknown_72]))]
	where
		(var_cond_71, unknown_71) = (isIdenity CAndOp var_b_70)
		(var_cond_72, unknown_72) = (writesNothing [(CBlockStmt (CExpr (Just var_b_70) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CAndOp var_b_73 var_a_74 _)
	| True && (and [var_cond_75, var_cond_76]) =
	[(("remove_identity",old,var_a_74), state, (concat [unknown_75, unknown_76]))]
	where
		(var_cond_75, unknown_75) = (isIdenity CAndOp var_b_73)
		(var_cond_76, unknown_76) = (writesNothing [(CBlockStmt (CExpr (Just var_b_73) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CXorOp var_a_77 var_b_78 _)
	| True && (and [var_cond_79, var_cond_80]) =
	[(("remove_identity",old,var_a_77), state, (concat [unknown_79, unknown_80]))]
	where
		(var_cond_79, unknown_79) = (isIdenity CXorOp var_b_78)
		(var_cond_80, unknown_80) = (writesNothing [(CBlockStmt (CExpr (Just var_b_78) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CXorOp var_b_81 var_a_82 _)
	| True && (and [var_cond_83, var_cond_84]) =
	[(("remove_identity",old,var_a_82), state, (concat [unknown_83, unknown_84]))]
	where
		(var_cond_83, unknown_83) = (isIdenity CXorOp var_b_81)
		(var_cond_84, unknown_84) = (writesNothing [(CBlockStmt (CExpr (Just var_b_81) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary COrOp var_a_85 var_b_86 _)
	| True && (and [var_cond_87, var_cond_88]) =
	[(("remove_identity",old,var_a_85), state, (concat [unknown_87, unknown_88]))]
	where
		(var_cond_87, unknown_87) = (isIdenity COrOp var_b_86)
		(var_cond_88, unknown_88) = (writesNothing [(CBlockStmt (CExpr (Just var_b_86) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary COrOp var_b_89 var_a_90 _)
	| True && (and [var_cond_91, var_cond_92]) =
	[(("remove_identity",old,var_a_90), state, (concat [unknown_91, unknown_92]))]
	where
		(var_cond_91, unknown_91) = (isIdenity COrOp var_b_89)
		(var_cond_92, unknown_92) = (writesNothing [(CBlockStmt (CExpr (Just var_b_89) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CLndOp var_a_93 var_b_94 _)
	| True && (and [var_cond_95, var_cond_96]) =
	[(("remove_identity",old,var_a_93), state, (concat [unknown_95, unknown_96]))]
	where
		(var_cond_95, unknown_95) = (isIdenity CLndOp var_b_94)
		(var_cond_96, unknown_96) = (writesNothing [(CBlockStmt (CExpr (Just var_b_94) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CLndOp var_b_97 var_a_98 _)
	| True && (and [var_cond_99, var_cond_100]) =
	[(("remove_identity",old,var_a_98), state, (concat [unknown_99, unknown_100]))]
	where
		(var_cond_99, unknown_99) = (isIdenity CLndOp var_b_97)
		(var_cond_100, unknown_100) = (writesNothing [(CBlockStmt (CExpr (Just var_b_97) undefNodeAnn))])
rule_remove_identity_0
	state old@(CBinary CLorOp var_a_101 var_b_102 _)
	| True && (and [var_cond_103, var_cond_104]) =
	[(("remove_identity",old,var_a_101), state, (concat [unknown_103, unknown_104]))]
	where
		(var_cond_103, unknown_103) = (isIdenity CLorOp var_b_102)
		(var_cond_104, unknown_104) = (writesNothing [(CBlockStmt (CExpr (Just var_b_102) undefNodeAnn))])
rule_remove_identity_0 _ _ = []

-- reduce_to_0
rule_reduce_to_0_105
	state old@(CBinary CMulOp var_a_106 (CConst (CIntConst var_0_107 _)) _)
	| (getCInteger var_0_107) == 0 && True && (and [var_cond_108]) =
	[(("reduce_to_0",old,(CConst (CIntConst (cInteger 0 ) undefNodeAnn))), state, (concat [unknown_108]))]
	where
		(var_cond_108, unknown_108) = (writesNothing [(CBlockStmt (CExpr (Just var_a_106) undefNodeAnn))])
rule_reduce_to_0_105
	state old@(CBinary CMulOp (CConst (CIntConst var_0_109 _)) var_a_110 _)
	| (getCInteger var_0_109) == 0 && (and [var_cond_111]) =
	[(("reduce_to_0",old,(CConst (CIntConst (cInteger 0 ) undefNodeAnn))), state, (concat [unknown_111]))]
	where
		(var_cond_111, unknown_111) = (writesNothing [(CBlockStmt (CExpr (Just var_a_110) undefNodeAnn))])
rule_reduce_to_0_105 _ _ = []

-- undo_distributive
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_b_113 var_a_114 _) (CBinary CMulOp var_c_115 var_a_116 _) _)
	| (exprEqual var_a_116 var_a_114) && True && (and [var_cond_117, var_cond_118, var_cond_119]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_116 (CBinary CAddOp var_b_113 var_c_115 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_117, unknown_118, unknown_119]))]
	where
		(var_cond_117, unknown_117) = (writesNothing [(CBlockStmt (CExpr (Just var_a_116) undefNodeAnn))])
		(var_cond_118, unknown_118) = (writesNothing [(CBlockStmt (CExpr (Just var_b_113) undefNodeAnn))])
		(var_cond_119, unknown_119) = (writesNothing [(CBlockStmt (CExpr (Just var_c_115) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_c_120 var_a_121 _) (CBinary CMulOp var_b_122 var_a_123 _) _)
	| (exprEqual var_a_123 var_a_121) && True && (and [var_cond_124, var_cond_125, var_cond_126]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_123 (CBinary CAddOp var_b_122 var_c_120 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_124, unknown_125, unknown_126]))]
	where
		(var_cond_124, unknown_124) = (writesNothing [(CBlockStmt (CExpr (Just var_a_123) undefNodeAnn))])
		(var_cond_125, unknown_125) = (writesNothing [(CBlockStmt (CExpr (Just var_b_122) undefNodeAnn))])
		(var_cond_126, unknown_126) = (writesNothing [(CBlockStmt (CExpr (Just var_c_120) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_a_127 var_b_128 _) (CBinary CMulOp var_c_129 var_a_130 _) _)
	| (exprEqual var_a_130 var_a_127) && True && (and [var_cond_131, var_cond_132, var_cond_133]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_130 (CBinary CAddOp var_b_128 var_c_129 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_131, unknown_132, unknown_133]))]
	where
		(var_cond_131, unknown_131) = (writesNothing [(CBlockStmt (CExpr (Just var_a_130) undefNodeAnn))])
		(var_cond_132, unknown_132) = (writesNothing [(CBlockStmt (CExpr (Just var_b_128) undefNodeAnn))])
		(var_cond_133, unknown_133) = (writesNothing [(CBlockStmt (CExpr (Just var_c_129) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_c_134 var_a_135 _) (CBinary CMulOp var_a_136 var_b_137 _) _)
	| (exprEqual var_a_136 var_a_135) && True && (and [var_cond_138, var_cond_139, var_cond_140]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_136 (CBinary CAddOp var_b_137 var_c_134 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_138, unknown_139, unknown_140]))]
	where
		(var_cond_138, unknown_138) = (writesNothing [(CBlockStmt (CExpr (Just var_a_136) undefNodeAnn))])
		(var_cond_139, unknown_139) = (writesNothing [(CBlockStmt (CExpr (Just var_b_137) undefNodeAnn))])
		(var_cond_140, unknown_140) = (writesNothing [(CBlockStmt (CExpr (Just var_c_134) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_b_141 var_a_142 _) (CBinary CMulOp var_a_143 var_c_144 _) _)
	| (exprEqual var_a_143 var_a_142) && True && (and [var_cond_145, var_cond_146, var_cond_147]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_143 (CBinary CAddOp var_b_141 var_c_144 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_145, unknown_146, unknown_147]))]
	where
		(var_cond_145, unknown_145) = (writesNothing [(CBlockStmt (CExpr (Just var_a_143) undefNodeAnn))])
		(var_cond_146, unknown_146) = (writesNothing [(CBlockStmt (CExpr (Just var_b_141) undefNodeAnn))])
		(var_cond_147, unknown_147) = (writesNothing [(CBlockStmt (CExpr (Just var_c_144) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_a_148 var_c_149 _) (CBinary CMulOp var_b_150 var_a_151 _) _)
	| (exprEqual var_a_151 var_a_148) && True && (and [var_cond_152, var_cond_153, var_cond_154]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_151 (CBinary CAddOp var_b_150 var_c_149 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_152, unknown_153, unknown_154]))]
	where
		(var_cond_152, unknown_152) = (writesNothing [(CBlockStmt (CExpr (Just var_a_151) undefNodeAnn))])
		(var_cond_153, unknown_153) = (writesNothing [(CBlockStmt (CExpr (Just var_b_150) undefNodeAnn))])
		(var_cond_154, unknown_154) = (writesNothing [(CBlockStmt (CExpr (Just var_c_149) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_a_155 var_b_156 _) (CBinary CMulOp var_a_157 var_c_158 _) _)
	| (exprEqual var_a_157 var_a_155) && True && (and [var_cond_159, var_cond_160, var_cond_161]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_157 (CBinary CAddOp var_b_156 var_c_158 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_159, unknown_160, unknown_161]))]
	where
		(var_cond_159, unknown_159) = (writesNothing [(CBlockStmt (CExpr (Just var_a_157) undefNodeAnn))])
		(var_cond_160, unknown_160) = (writesNothing [(CBlockStmt (CExpr (Just var_b_156) undefNodeAnn))])
		(var_cond_161, unknown_161) = (writesNothing [(CBlockStmt (CExpr (Just var_c_158) undefNodeAnn))])
rule_undo_distributive_112
	state old@(CBinary CAddOp (CBinary CMulOp var_a_162 var_c_163 _) (CBinary CMulOp var_a_164 var_b_165 _) _)
	| (exprEqual var_a_164 var_a_162) && True && (and [var_cond_166, var_cond_167, var_cond_168]) =
	[(("undo_distributive",old,(CBinary CMulOp var_a_164 (CBinary CAddOp var_b_165 var_c_163 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_166, unknown_167, unknown_168]))]
	where
		(var_cond_166, unknown_166) = (writesNothing [(CBlockStmt (CExpr (Just var_a_164) undefNodeAnn))])
		(var_cond_167, unknown_167) = (writesNothing [(CBlockStmt (CExpr (Just var_b_165) undefNodeAnn))])
		(var_cond_168, unknown_168) = (writesNothing [(CBlockStmt (CExpr (Just var_c_163) undefNodeAnn))])
rule_undo_distributive_112 _ _ = []

-- join_addition_assign
rule_join_addition_assign_169
	state old@(CAssign CAssignOp var_a_170 (CBinary CAddOp var_a_171 var_b_172 _) _)
	| (exprEqual var_a_171 var_a_170) && (and [var_cond_173]) =
	[(("join_addition_assign",old,(CAssign CAddAssOp var_a_171 var_b_172 undefNodeAnn)), state, (concat [unknown_173]))]
	where
		(var_cond_173, unknown_173) = (writesNothing [(CBlockStmt (CExpr (Just var_a_171) undefNodeAnn))])
rule_join_addition_assign_169
	state old@(CAssign CAssignOp var_a_174 (CBinary CAddOp var_b_175 var_a_176 _) _)
	| (exprEqual var_a_176 var_a_174) && True && (and [var_cond_177]) =
	[(("join_addition_assign",old,(CAssign CAddAssOp var_a_176 var_b_175 undefNodeAnn)), state, (concat [unknown_177]))]
	where
		(var_cond_177, unknown_177) = (writesNothing [(CBlockStmt (CExpr (Just var_a_176) undefNodeAnn))])
rule_join_addition_assign_169 _ _ = []

-- mult_ternary_2_ternary
rule_mult_ternary_2_ternary_178
	state old@(CBinary CMulOp var_lop_179 (CCond var_cond_180 (Just var_then__181) var_else__182 _) _)
	| True && (and [var_cond_183]) =
	[(("mult_ternary_2_ternary",old,(CCond var_cond_180 (Just (CBinary CMulOp var_lop_179 var_then__181 undefNodeAnn)) (CBinary CMulOp var_lop_179 var_else__182 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_183]))]
	where
		(var_cond_183, unknown_183) = (writesNothing [(CBlockStmt (CExpr (Just var_lop_179) undefNodeAnn))])
rule_mult_ternary_2_ternary_178
	state old@(CBinary CMulOp (CCond var_cond_184 (Just var_then__185) var_else__186 _) var_lop_187 _)
	| True && (and [var_cond_188]) =
	[(("mult_ternary_2_ternary",old,(CCond var_cond_184 (Just (CBinary CMulOp var_lop_187 var_then__185 undefNodeAnn)) (CBinary CMulOp var_lop_187 var_else__186 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_188]))]
	where
		(var_cond_188, unknown_188) = (writesNothing [(CBlockStmt (CExpr (Just var_lop_187) undefNodeAnn))])
rule_mult_ternary_2_ternary_178 _ _ = []

-- sum_ternary_2_ternary
rule_sum_ternary_2_ternary_189
	state old@(CBinary CAddOp var_lop_190 (CCond var_cond_191 (Just var_then__192) var_else__193 _) _)
	| True && (and [var_cond_194]) =
	[(("sum_ternary_2_ternary",old,(CCond var_cond_191 (Just (CBinary CAddOp var_lop_190 var_then__192 undefNodeAnn)) (CBinary CAddOp var_lop_190 var_else__193 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_194]))]
	where
		(var_cond_194, unknown_194) = (writesNothing [(CBlockStmt (CExpr (Just var_lop_190) undefNodeAnn))])
rule_sum_ternary_2_ternary_189
	state old@(CBinary CAddOp (CCond var_cond_195 (Just var_then__196) var_else__197 _) var_lop_198 _)
	| True && (and [var_cond_199]) =
	[(("sum_ternary_2_ternary",old,(CCond var_cond_195 (Just (CBinary CAddOp var_lop_198 var_then__196 undefNodeAnn)) (CBinary CAddOp var_lop_198 var_else__197 undefNodeAnn) undefNodeAnn)), state, (concat [unknown_199]))]
	where
		(var_cond_199, unknown_199) = (writesNothing [(CBlockStmt (CExpr (Just var_lop_198) undefNodeAnn))])
rule_sum_ternary_2_ternary_189 _ _ = []

-- if_else_2_assign_ternary
rule_if_else_2_assign_ternary_200 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_if_else_2_assign_ternary_203 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_if_else_2_assign_ternary_202 bs [] True )]) ++ []
rule_if_else_2_assign_ternary_200 _ _ = []

rule_if_else_2_assign_ternary_203 (True,[var_ini_211,[],[],[],var_end_212], [(CBlockStmt (CIf var_cond_204 (CCompound _ var_internal_205 _) (Just (CCompound _ var_internal_206 _)) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_207 var_then__208 _)) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_209 var_else__210 _)) _))]) ident nodeInfo old state0 | (exprEqual var_lhs_209 var_lhs_207) && True && (and [var_cond_213]) && True =
	concat ([[(("if_else_2_assign_ternary", old, (CCompound ident (var_ini_211 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_209 (CCond var_cond_204 (Just var_then__208) var_else__210 undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ var_end_212) nodeInfo)),state0, ((concat [unknown_213]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_213, unknown_213) = (writesNothing [(CBlockStmt (CExpr (Just var_lhs_209) undefNodeAnn))])
rule_if_else_2_assign_ternary_203 _ _ _ _ _ = []

rule_if_else_2_assign_ternary_202 [] acc False =
	[(True,[acc],[])]
rule_if_else_2_assign_ternary_202 [] acc _ =
	[(False,[acc],[])]
rule_if_else_2_assign_ternary_202 (stat@(CBlockStmt (CIf var_cond_214 (CCompound _ var_internal_215 _) (Just (CCompound _ var_internal_216 _)) _)):tail_) accsl True =
	let
		listItems = rule_if_else_2_assign_ternary_202 tail_ [] False 
		listItems217 = rule_if_else_2_assign_ternary_217 var_internal_215 [] True 
		listItems218 = rule_if_else_2_assign_ternary_218 var_internal_216 [] True 
	in [(True, (accsl:(inter217 ++ inter218 ++ inter)),(stat:(pats217 ++ pats218 ++ pats))) | (True,inter,pats) <- listItems, (True, inter217, pats217) <- listItems217, (True, inter218, pats218) <- listItems218] ++ (rule_if_else_2_assign_ternary_202 tail_ (accsl ++ [stat]) True)
rule_if_else_2_assign_ternary_202 (other:tail_) acc  bool1 =
	rule_if_else_2_assign_ternary_202 tail_ (acc ++ [other]) bool1

rule_if_else_2_assign_ternary_217 [] acc False =
	[(True,[acc],[])]
rule_if_else_2_assign_ternary_217 [] acc _ =
	[(False,[acc],[])]
rule_if_else_2_assign_ternary_217 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_219 var_then__220 _)) _)):tail_) accsl True =
	let
		listItems = rule_if_else_2_assign_ternary_217 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_if_else_2_assign_ternary_217 tail_ (accsl ++ [stat]) True)
rule_if_else_2_assign_ternary_217 (other:tail_) acc  bool1 =
	rule_if_else_2_assign_ternary_217 tail_ (acc ++ [other]) bool1

rule_if_else_2_assign_ternary_218 [] acc False =
	[(True,[acc],[])]
rule_if_else_2_assign_ternary_218 [] acc _ =
	[(False,[acc],[])]
rule_if_else_2_assign_ternary_218 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_221 var_else__222 _)) _)):tail_) accsl True =
	let
		listItems = rule_if_else_2_assign_ternary_218 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_if_else_2_assign_ternary_218 tail_ (accsl ++ [stat]) True)
rule_if_else_2_assign_ternary_218 (other:tail_) acc  bool1 =
	rule_if_else_2_assign_ternary_218 tail_ (acc ++ [other]) bool1


-- if_2_assign_ternary
rule_if_2_assign_ternary_223 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_if_2_assign_ternary_226 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_if_2_assign_ternary_225 bs [] True )]) ++ []
rule_if_2_assign_ternary_223 _ _ = []

rule_if_2_assign_ternary_226 (True,[var_ini_231,[],[],var_end_232], [(CBlockStmt (CIf var_cond_227 (CCompound _ var_internal_228 _) Nothing _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_229 var_then__230 _)) _))]) ident nodeInfo old state0 | True && (and [var_cond_233]) && True =
	concat ([[(("if_2_assign_ternary", old, (CCompound ident (var_ini_231 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_229 (CCond var_cond_227 (Just var_then__230) var_lhs_229 undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ var_end_232) nodeInfo)),state0, ((concat [unknown_233]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_233, unknown_233) = (writesNothing [(CBlockStmt (CExpr (Just var_lhs_229) undefNodeAnn))])
rule_if_2_assign_ternary_226 _ _ _ _ _ = []

rule_if_2_assign_ternary_225 [] acc False =
	[(True,[acc],[])]
rule_if_2_assign_ternary_225 [] acc _ =
	[(False,[acc],[])]
rule_if_2_assign_ternary_225 (stat@(CBlockStmt (CIf var_cond_234 (CCompound _ var_internal_235 _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_if_2_assign_ternary_225 tail_ [] False 
		listItems236 = rule_if_2_assign_ternary_236 var_internal_235 [] True 
	in [(True, (accsl:(inter236 ++ inter)),(stat:(pats236 ++ pats))) | (True,inter,pats) <- listItems, (True, inter236, pats236) <- listItems236] ++ (rule_if_2_assign_ternary_225 tail_ (accsl ++ [stat]) True)
rule_if_2_assign_ternary_225 (other:tail_) acc  bool1 =
	rule_if_2_assign_ternary_225 tail_ (acc ++ [other]) bool1

rule_if_2_assign_ternary_236 [] acc False =
	[(True,[acc],[])]
rule_if_2_assign_ternary_236 [] acc _ =
	[(False,[acc],[])]
rule_if_2_assign_ternary_236 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_237 var_then__238 _)) _)):tail_) accsl True =
	let
		listItems = rule_if_2_assign_ternary_236 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_if_2_assign_ternary_236 tail_ (accsl ++ [stat]) True)
rule_if_2_assign_ternary_236 (other:tail_) acc  bool1 =
	rule_if_2_assign_ternary_236 tail_ (acc ++ [other]) bool1


-- empty_else
rule_empty_else_241 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_empty_else_244 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_empty_else_243 bs [] True )]) ++ []
rule_empty_else_241 _ _ = []

rule_empty_else_244 (True,[var_var_internal_239_247,var_then__248,var_var_internal_240_249], [(CBlockStmt (CIf var_cond_245 (CCompound _ var_internal_246 _) (Just (CCompound _ [] _)) _))]) ident nodeInfo old state0 | True && (and []) && True =
	concat ([[(("empty_else", old, (CCompound ident (var_var_internal_239_247 ++ [(CBlockStmt (CIf var_cond_245 (CCompound [] (var_then__248) undefNodeAnn) Nothing undefNodeAnn))] ++ var_var_internal_240_249) nodeInfo)),state0, ((concat []) ++ (concat [])) )] | (and [])] ++ [])
rule_empty_else_244 _ _ _ _ _ = []

rule_empty_else_243 [] acc False =
	[(True,[acc],[])]
rule_empty_else_243 [] acc _ =
	[(False,[acc],[])]
rule_empty_else_243 (stat@(CBlockStmt (CIf var_cond_250 (CCompound _ var_internal_251 _) (Just (CCompound _ [] _)) _)):tail_) accsl True =
	let
		listItems = rule_empty_else_243 tail_ [] False 
		listItems252 = rule_empty_else_252 var_internal_251 [] 
	in [(True, (accsl:(inter252 ++ inter)),(stat:(pats252 ++ pats))) | (True,inter,pats) <- listItems, (True, inter252, pats252) <- listItems252] ++ (rule_empty_else_243 tail_ (accsl ++ [stat]) True)
rule_empty_else_243 (other:tail_) acc  bool1 =
	rule_empty_else_243 tail_ (acc ++ [other]) bool1

rule_empty_else_252 all [] =
	[(True,[all],[])]

-- remove_empty_if
rule_remove_empty_if_253 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_remove_empty_if_256 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_remove_empty_if_255 bs [] True )]) ++ []
rule_remove_empty_if_253 _ _ = []

rule_remove_empty_if_256 (True,[var_ini_258,var_end_259], [(CBlockStmt (CIf var_cond_257 (CCompound _ [] _) Nothing _))]) ident nodeInfo old state0 | True && (and [var_cond_260]) && True =
	concat ([[(("remove_empty_if", old, (CCompound ident (var_ini_258 ++ var_end_259) nodeInfo)),state0, ((concat [unknown_260]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_260, unknown_260) = (writesNothing [(CBlockStmt (CExpr (Just var_cond_257) undefNodeAnn))])
rule_remove_empty_if_256 _ _ _ _ _ = []

rule_remove_empty_if_255 [] acc False =
	[(True,[acc],[])]
rule_remove_empty_if_255 [] acc _ =
	[(False,[acc],[])]
rule_remove_empty_if_255 (stat@(CBlockStmt (CIf var_cond_261 (CCompound _ [] _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_remove_empty_if_255 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_remove_empty_if_255 tail_ (accsl ++ [stat]) True)
rule_remove_empty_if_255 (other:tail_) acc  bool1 =
	rule_remove_empty_if_255 tail_ (acc ++ [other]) bool1


-- remove_useless_statement
rule_remove_useless_statement_262 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_remove_useless_statement_265 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_remove_useless_statement_264 bs [] True )]) ++ []
rule_remove_useless_statement_262 _ _ = []

rule_remove_useless_statement_265 (True,[var_ini_267,var_end_268], [(CBlockStmt var_mid_266)]) ident nodeInfo old state0 | True && (and [var_cond_269, var_cond_270]) && True =
	concat ([[(("remove_useless_statement", old, (CCompound ident (var_ini_267 ++ var_end_268) nodeInfo)),state0, ((concat [unknown_269, unknown_270]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_269, unknown_269) = (isExpr var_mid_266)
		(var_cond_270, unknown_270) = (writesNothing [(CBlockStmt var_mid_266)])
rule_remove_useless_statement_265 _ _ _ _ _ = []

rule_remove_useless_statement_264 [] acc False =
	[(True,[acc],[])]
rule_remove_useless_statement_264 [] acc _ =
	[(False,[acc],[])]
rule_remove_useless_statement_264 (stat@(CBlockStmt var_mid_271):tail_) accsl True =
	let
		listItems = rule_remove_useless_statement_264 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_remove_useless_statement_264 tail_ (accsl ++ [stat]) True)
rule_remove_useless_statement_264 (other:tail_) acc  bool1 =
	rule_remove_useless_statement_264 tail_ (acc ++ [other]) bool1


-- strength_reduction
rule_strength_reduction_272 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_strength_reduction_275 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_strength_reduction_274 bs [] True )]) ++ (concat [(rule_strength_reduction_309 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_strength_reduction_308 bs [] True )]) ++ (concat [(rule_strength_reduction_343 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_strength_reduction_342 bs [] True )]) ++ (concat [(rule_strength_reduction_377 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_strength_reduction_376 bs [] True )]) ++ []
rule_strength_reduction_272 _ _ = []

rule_strength_reduction_275 (True,[var_ini_286,var_ini1_287,var_end1_288,var_end_289], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_276 var_init_277 _))) (Just (CBinary CLeOp var_i_278 var_n_279 _)) (Just (CUnary CPostIncOp var_i_280 _)) (CCompound _ var_internal_281 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_282 (CBinary CAddOp var_b_283 (CBinary CMulOp var_c_284 var_i_285 _) _) _)) _))]) ident nodeInfo old state0 | (exprEqual var_i_285 var_i_280) && (exprEqual var_i_280 var_i_278) && (exprEqual var_i_278 var_i_276) && True && (and [var_cond_290, var_cond_291, var_cond_292, var_cond_293, var_cond_294]) && True =
	concat ([[(("strength_reduction", old, (CCompound ident (var_ini_286 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_t_295))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_t_295 (CConst (CIntConst (cInteger 0 ) undefNodeAnn)) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_285 var_init_277 undefNodeAnn))) (Just (CBinary CLeOp var_i_285 var_n_279 undefNodeAnn)) (Just (CUnary CPostIncOp var_i_285 undefNodeAnn)) (CCompound [] (var_ini1_287 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_282 (CBinary CAddOp var_b_283 (CVar (Ident "t" 116 undefNode) undefNodeAnn) undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAddAssOp (CVar (Ident "t" 116 undefNode) undefNodeAnn) var_c_284 undefNodeAnn)) undefNodeAnn))] ++ var_end1_288) undefNodeAnn) undefNodeAnn))] ++ var_end_289) nodeInfo)),state1, ((concat [unknown_290, unknown_291, unknown_292, unknown_293, unknown_294]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_290, unknown_290) = (isConstant var_c_284)
		(var_cond_291, unknown_291) = (noWrites var_i_285 var_ini1_287)
		(var_cond_292, unknown_292) = (noWrites var_i_285 var_end1_288)
		(var_cond_293, unknown_293) = (noWrites var_i_285 [(CBlockStmt (CExpr (Just var_b_283) undefNodeAnn))])
		(var_cond_294, unknown_294) = (noWrites var_i_285 [(CBlockStmt (CExpr (Just var_a_282) undefNodeAnn))])
		(var_t_295, var_t_295_ident, patPragmaDict1,  state1) = buildFreeVar "t" state0
		patPragmaDict = patPragmaDict1
rule_strength_reduction_275 _ _ _ _ _ = []

rule_strength_reduction_274 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_274 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_274 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_296 var_init_297 _))) (Just (CBinary CLeOp var_i_298 var_n_299 _)) (Just (CUnary CPostIncOp var_i_300 _)) (CCompound _ var_internal_301 _) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_274 tail_ [] False 
		listItems302 = rule_strength_reduction_302 var_internal_301 [] True 
	in [(True, (accsl:(inter302 ++ inter)),(stat:(pats302 ++ pats))) | (True,inter,pats) <- listItems, (True, inter302, pats302) <- listItems302] ++ (rule_strength_reduction_274 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_274 (other:tail_) acc  bool1 =
	rule_strength_reduction_274 tail_ (acc ++ [other]) bool1

rule_strength_reduction_302 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_302 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_302 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_303 (CBinary CAddOp var_b_304 (CBinary CMulOp var_c_305 var_i_306 _) _) _)) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_302 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_strength_reduction_302 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_302 (other:tail_) acc  bool1 =
	rule_strength_reduction_302 tail_ (acc ++ [other]) bool1

rule_strength_reduction_309 (True,[var_ini_320,var_ini1_321,var_end1_322,var_end_323], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_310 var_init_311 _))) (Just (CBinary CLeOp var_i_312 var_n_313 _)) (Just (CUnary CPostIncOp var_i_314 _)) (CCompound _ var_internal_315 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_316 (CBinary CAddOp (CBinary CMulOp var_c_317 var_i_318 _) var_b_319 _) _)) _))]) ident nodeInfo old state0 | (exprEqual var_i_318 var_i_314) && (exprEqual var_i_314 var_i_312) && (exprEqual var_i_312 var_i_310) && True && (and [var_cond_324, var_cond_325, var_cond_326, var_cond_327, var_cond_328]) && True =
	concat ([[(("strength_reduction", old, (CCompound ident (var_ini_320 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_t_329))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_t_329 (CConst (CIntConst (cInteger 0 ) undefNodeAnn)) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_318 var_init_311 undefNodeAnn))) (Just (CBinary CLeOp var_i_318 var_n_313 undefNodeAnn)) (Just (CUnary CPostIncOp var_i_318 undefNodeAnn)) (CCompound [] (var_ini1_321 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_316 (CBinary CAddOp var_b_319 (CVar (Ident "t" 116 undefNode) undefNodeAnn) undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAddAssOp (CVar (Ident "t" 116 undefNode) undefNodeAnn) var_c_317 undefNodeAnn)) undefNodeAnn))] ++ var_end1_322) undefNodeAnn) undefNodeAnn))] ++ var_end_323) nodeInfo)),state1, ((concat [unknown_324, unknown_325, unknown_326, unknown_327, unknown_328]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_324, unknown_324) = (isConstant var_c_317)
		(var_cond_325, unknown_325) = (noWrites var_i_318 var_ini1_321)
		(var_cond_326, unknown_326) = (noWrites var_i_318 var_end1_322)
		(var_cond_327, unknown_327) = (noWrites var_i_318 [(CBlockStmt (CExpr (Just var_b_319) undefNodeAnn))])
		(var_cond_328, unknown_328) = (noWrites var_i_318 [(CBlockStmt (CExpr (Just var_a_316) undefNodeAnn))])
		(var_t_329, var_t_329_ident, patPragmaDict1,  state1) = buildFreeVar "t" state0
		patPragmaDict = patPragmaDict1
rule_strength_reduction_309 _ _ _ _ _ = []

rule_strength_reduction_308 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_308 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_308 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_330 var_init_331 _))) (Just (CBinary CLeOp var_i_332 var_n_333 _)) (Just (CUnary CPostIncOp var_i_334 _)) (CCompound _ var_internal_335 _) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_308 tail_ [] False 
		listItems336 = rule_strength_reduction_336 var_internal_335 [] True 
	in [(True, (accsl:(inter336 ++ inter)),(stat:(pats336 ++ pats))) | (True,inter,pats) <- listItems, (True, inter336, pats336) <- listItems336] ++ (rule_strength_reduction_308 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_308 (other:tail_) acc  bool1 =
	rule_strength_reduction_308 tail_ (acc ++ [other]) bool1

rule_strength_reduction_336 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_336 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_336 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_337 (CBinary CAddOp (CBinary CMulOp var_c_338 var_i_339 _) var_b_340 _) _)) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_336 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_strength_reduction_336 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_336 (other:tail_) acc  bool1 =
	rule_strength_reduction_336 tail_ (acc ++ [other]) bool1

rule_strength_reduction_343 (True,[var_ini_354,var_ini1_355,var_end1_356,var_end_357], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_344 var_init_345 _))) (Just (CBinary CLeOp var_i_346 var_n_347 _)) (Just (CUnary CPostIncOp var_i_348 _)) (CCompound _ var_internal_349 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_350 (CBinary CAddOp var_b_351 (CBinary CMulOp var_i_352 var_c_353 _) _) _)) _))]) ident nodeInfo old state0 | (exprEqual var_i_352 var_i_348) && (exprEqual var_i_348 var_i_346) && (exprEqual var_i_346 var_i_344) && True && (and [var_cond_358, var_cond_359, var_cond_360, var_cond_361, var_cond_362]) && True =
	concat ([[(("strength_reduction", old, (CCompound ident (var_ini_354 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_t_363))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_t_363 (CConst (CIntConst (cInteger 0 ) undefNodeAnn)) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_352 var_init_345 undefNodeAnn))) (Just (CBinary CLeOp var_i_352 var_n_347 undefNodeAnn)) (Just (CUnary CPostIncOp var_i_352 undefNodeAnn)) (CCompound [] (var_ini1_355 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_350 (CBinary CAddOp var_b_351 (CVar (Ident "t" 116 undefNode) undefNodeAnn) undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAddAssOp (CVar (Ident "t" 116 undefNode) undefNodeAnn) var_c_353 undefNodeAnn)) undefNodeAnn))] ++ var_end1_356) undefNodeAnn) undefNodeAnn))] ++ var_end_357) nodeInfo)),state1, ((concat [unknown_358, unknown_359, unknown_360, unknown_361, unknown_362]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_358, unknown_358) = (isConstant var_c_353)
		(var_cond_359, unknown_359) = (noWrites var_i_352 var_ini1_355)
		(var_cond_360, unknown_360) = (noWrites var_i_352 var_end1_356)
		(var_cond_361, unknown_361) = (noWrites var_i_352 [(CBlockStmt (CExpr (Just var_b_351) undefNodeAnn))])
		(var_cond_362, unknown_362) = (noWrites var_i_352 [(CBlockStmt (CExpr (Just var_a_350) undefNodeAnn))])
		(var_t_363, var_t_363_ident, patPragmaDict1,  state1) = buildFreeVar "t" state0
		patPragmaDict = patPragmaDict1
rule_strength_reduction_343 _ _ _ _ _ = []

rule_strength_reduction_342 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_342 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_342 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_364 var_init_365 _))) (Just (CBinary CLeOp var_i_366 var_n_367 _)) (Just (CUnary CPostIncOp var_i_368 _)) (CCompound _ var_internal_369 _) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_342 tail_ [] False 
		listItems370 = rule_strength_reduction_370 var_internal_369 [] True 
	in [(True, (accsl:(inter370 ++ inter)),(stat:(pats370 ++ pats))) | (True,inter,pats) <- listItems, (True, inter370, pats370) <- listItems370] ++ (rule_strength_reduction_342 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_342 (other:tail_) acc  bool1 =
	rule_strength_reduction_342 tail_ (acc ++ [other]) bool1

rule_strength_reduction_370 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_370 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_370 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_371 (CBinary CAddOp var_b_372 (CBinary CMulOp var_i_373 var_c_374 _) _) _)) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_370 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_strength_reduction_370 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_370 (other:tail_) acc  bool1 =
	rule_strength_reduction_370 tail_ (acc ++ [other]) bool1

rule_strength_reduction_377 (True,[var_ini_388,var_ini1_389,var_end1_390,var_end_391], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_378 var_init_379 _))) (Just (CBinary CLeOp var_i_380 var_n_381 _)) (Just (CUnary CPostIncOp var_i_382 _)) (CCompound _ var_internal_383 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_384 (CBinary CAddOp (CBinary CMulOp var_i_385 var_c_386 _) var_b_387 _) _)) _))]) ident nodeInfo old state0 | (exprEqual var_i_385 var_i_382) && (exprEqual var_i_382 var_i_380) && (exprEqual var_i_380 var_i_378) && True && (and [var_cond_392, var_cond_393, var_cond_394, var_cond_395, var_cond_396]) && True =
	concat ([[(("strength_reduction", old, (CCompound ident (var_ini_388 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_t_397))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_t_397 (CConst (CIntConst (cInteger 0 ) undefNodeAnn)) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_385 var_init_379 undefNodeAnn))) (Just (CBinary CLeOp var_i_385 var_n_381 undefNodeAnn)) (Just (CUnary CPostIncOp var_i_385 undefNodeAnn)) (CCompound [] (var_ini1_389 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_384 (CBinary CAddOp var_b_387 (CVar (Ident "t" 116 undefNode) undefNodeAnn) undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAddAssOp (CVar (Ident "t" 116 undefNode) undefNodeAnn) var_c_386 undefNodeAnn)) undefNodeAnn))] ++ var_end1_390) undefNodeAnn) undefNodeAnn))] ++ var_end_391) nodeInfo)),state1, ((concat [unknown_392, unknown_393, unknown_394, unknown_395, unknown_396]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_392, unknown_392) = (isConstant var_c_386)
		(var_cond_393, unknown_393) = (noWrites var_i_385 var_ini1_389)
		(var_cond_394, unknown_394) = (noWrites var_i_385 var_end1_390)
		(var_cond_395, unknown_395) = (noWrites var_i_385 [(CBlockStmt (CExpr (Just var_b_387) undefNodeAnn))])
		(var_cond_396, unknown_396) = (noWrites var_i_385 [(CBlockStmt (CExpr (Just var_a_384) undefNodeAnn))])
		(var_t_397, var_t_397_ident, patPragmaDict1,  state1) = buildFreeVar "t" state0
		patPragmaDict = patPragmaDict1
rule_strength_reduction_377 _ _ _ _ _ = []

rule_strength_reduction_376 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_376 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_376 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_398 var_init_399 _))) (Just (CBinary CLeOp var_i_400 var_n_401 _)) (Just (CUnary CPostIncOp var_i_402 _)) (CCompound _ var_internal_403 _) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_376 tail_ [] False 
		listItems404 = rule_strength_reduction_404 var_internal_403 [] True 
	in [(True, (accsl:(inter404 ++ inter)),(stat:(pats404 ++ pats))) | (True,inter,pats) <- listItems, (True, inter404, pats404) <- listItems404] ++ (rule_strength_reduction_376 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_376 (other:tail_) acc  bool1 =
	rule_strength_reduction_376 tail_ (acc ++ [other]) bool1

rule_strength_reduction_404 [] acc False =
	[(True,[acc],[])]
rule_strength_reduction_404 [] acc _ =
	[(False,[acc],[])]
rule_strength_reduction_404 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_405 (CBinary CAddOp (CBinary CMulOp var_i_406 var_c_407 _) var_b_408 _) _)) _)):tail_) accsl True =
	let
		listItems = rule_strength_reduction_404 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_strength_reduction_404 tail_ (accsl ++ [stat]) True)
rule_strength_reduction_404 (other:tail_) acc  bool1 =
	rule_strength_reduction_404 tail_ (acc ++ [other]) bool1


-- useless_assign
rule_useless_assign_409 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_useless_assign_412 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_useless_assign_411 bs [] True )]) ++ []
rule_useless_assign_409 _ _ = []

rule_useless_assign_412 (True,[var_ini_415,var_fin_416], [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_413 var_lhs_414 _)) _))]) ident nodeInfo old state0 | (exprEqual var_lhs_414 var_lhs_413) && (and [var_cond_417]) && True =
	concat ([[(("useless_assign", old, (CCompound ident (var_ini_415 ++ var_fin_416) nodeInfo)),state0, ((concat [unknown_417]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_417, unknown_417) = (writesNothing [(CBlockStmt (CExpr (Just var_lhs_414) undefNodeAnn))])
rule_useless_assign_412 _ _ _ _ _ = []

rule_useless_assign_411 [] acc False =
	[(True,[acc],[])]
rule_useless_assign_411 [] acc _ =
	[(False,[acc],[])]
rule_useless_assign_411 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_lhs_418 var_lhs_419 _)) _)):tail_) accsl True =
	let
		listItems = rule_useless_assign_411 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_useless_assign_411 tail_ (accsl ++ [stat]) True)
rule_useless_assign_411 (other:tail_) acc  bool1 =
	rule_useless_assign_411 tail_ (acc ++ [other]) bool1


-- replace_var_equal
rule_replace_var_equal_422 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_replace_var_equal_425 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_replace_var_equal_424 bs [] True )]) ++ (concat [(rule_replace_var_equal_444 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_replace_var_equal_443 bs [] True )]) ++ []
rule_replace_var_equal_422 _ _ = []

rule_replace_var_equal_425 (True,[var_var_internal_420_429,var_body_430,var_var_internal_421_431], [(CBlockStmt (CIf (CBinary CEqOp var_a_426 var_b_427 _) (CCompound _ var_internal_428 _) Nothing _))]) ident nodeInfo old state0 | True && (and [var_cond_432, var_cond_433]) && True =
	concat ([[(("replace_var_equal", old, (CCompound ident (var_var_internal_420_429 ++ [(CBlockStmt (CIf (CBinary CEqOp var_a_426 var_b_427 undefNodeAnn) (CCompound [] ((substitute var_body_430 var_a_426 var_b_427)) undefNodeAnn) Nothing undefNodeAnn))] ++ var_var_internal_421_431) nodeInfo)),state0, ((concat [unknown_432, unknown_433]) ++ (concat [unknown_434, unknown_435])) )] | (and [var_cond_434, var_cond_435])] ++ [[(("replace_var_equal", old, (CCompound ident (var_var_internal_420_429 ++ [(CBlockStmt (CIf (CBinary CEqOp var_a_426 var_b_427 undefNodeAnn) (CCompound [] ((substitute var_body_430 var_b_427 var_a_426)) undefNodeAnn) Nothing undefNodeAnn))] ++ var_var_internal_421_431) nodeInfo)),state0, ((concat [unknown_432, unknown_433]) ++ (concat [unknown_436, unknown_437])) )] | (and [var_cond_436, var_cond_437])] ++ [])
	where
		(var_cond_432, unknown_432) = (writesNothing [(CBlockStmt (CExpr (Just var_a_426) undefNodeAnn))])
		(var_cond_433, unknown_433) = (writesNothing [(CBlockStmt (CExpr (Just var_b_427) undefNodeAnn))])
		(var_cond_434, unknown_434) = (noWrites var_a_426 var_body_430)
		(var_cond_435, unknown_435) = (True, [])
		(var_cond_436, unknown_436) = (noWrites var_b_427 var_body_430)
		(var_cond_437, unknown_437) = (True, [])
rule_replace_var_equal_425 _ _ _ _ _ = []

rule_replace_var_equal_424 [] acc False =
	[(True,[acc],[])]
rule_replace_var_equal_424 [] acc _ =
	[(False,[acc],[])]
rule_replace_var_equal_424 (stat@(CBlockStmt (CIf (CBinary CEqOp var_a_438 var_b_439 _) (CCompound _ var_internal_440 _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_replace_var_equal_424 tail_ [] False 
		listItems441 = rule_replace_var_equal_441 var_internal_440 [] 
	in [(True, (accsl:(inter441 ++ inter)),(stat:(pats441 ++ pats))) | (True,inter,pats) <- listItems, (True, inter441, pats441) <- listItems441] ++ (rule_replace_var_equal_424 tail_ (accsl ++ [stat]) True)
rule_replace_var_equal_424 (other:tail_) acc  bool1 =
	rule_replace_var_equal_424 tail_ (acc ++ [other]) bool1

rule_replace_var_equal_441 all [] =
	[(True,[all],[])]
rule_replace_var_equal_444 (True,[var_var_internal_420_448,var_body_449,var_var_internal_421_450], [(CBlockStmt (CIf (CBinary CEqOp var_b_445 var_a_446 _) (CCompound _ var_internal_447 _) Nothing _))]) ident nodeInfo old state0 | True && (and [var_cond_451, var_cond_452]) && True =
	concat ([[(("replace_var_equal", old, (CCompound ident (var_var_internal_420_448 ++ [(CBlockStmt (CIf (CBinary CEqOp var_a_446 var_b_445 undefNodeAnn) (CCompound [] ((substitute var_body_449 var_a_446 var_b_445)) undefNodeAnn) Nothing undefNodeAnn))] ++ var_var_internal_421_450) nodeInfo)),state0, ((concat [unknown_451, unknown_452]) ++ (concat [unknown_453, unknown_454])) )] | (and [var_cond_453, var_cond_454])] ++ [[(("replace_var_equal", old, (CCompound ident (var_var_internal_420_448 ++ [(CBlockStmt (CIf (CBinary CEqOp var_a_446 var_b_445 undefNodeAnn) (CCompound [] ((substitute var_body_449 var_b_445 var_a_446)) undefNodeAnn) Nothing undefNodeAnn))] ++ var_var_internal_421_450) nodeInfo)),state0, ((concat [unknown_451, unknown_452]) ++ (concat [unknown_455, unknown_456])) )] | (and [var_cond_455, var_cond_456])] ++ [])
	where
		(var_cond_451, unknown_451) = (writesNothing [(CBlockStmt (CExpr (Just var_a_446) undefNodeAnn))])
		(var_cond_452, unknown_452) = (writesNothing [(CBlockStmt (CExpr (Just var_b_445) undefNodeAnn))])
		(var_cond_453, unknown_453) = (noWrites var_a_446 var_body_449)
		(var_cond_454, unknown_454) = (True, [])
		(var_cond_455, unknown_455) = (noWrites var_b_445 var_body_449)
		(var_cond_456, unknown_456) = (True, [])
rule_replace_var_equal_444 _ _ _ _ _ = []

rule_replace_var_equal_443 [] acc False =
	[(True,[acc],[])]
rule_replace_var_equal_443 [] acc _ =
	[(False,[acc],[])]
rule_replace_var_equal_443 (stat@(CBlockStmt (CIf (CBinary CEqOp var_b_457 var_a_458 _) (CCompound _ var_internal_459 _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_replace_var_equal_443 tail_ [] False 
		listItems460 = rule_replace_var_equal_460 var_internal_459 [] 
	in [(True, (accsl:(inter460 ++ inter)),(stat:(pats460 ++ pats))) | (True,inter,pats) <- listItems, (True, inter460, pats460) <- listItems460] ++ (rule_replace_var_equal_443 tail_ (accsl ++ [stat]) True)
rule_replace_var_equal_443 (other:tail_) acc  bool1 =
	rule_replace_var_equal_443 tail_ (acc ++ [other]) bool1

rule_replace_var_equal_460 all [] =
	[(True,[all],[])]

-- contiguous_same_if
rule_contiguous_same_if_461 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_contiguous_same_if_464 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_contiguous_same_if_463 bs [] True True )]) ++ []
rule_contiguous_same_if_461 _ _ = []

rule_contiguous_same_if_464 (True,[var_pre_469,var_body1_470,[],var_body2_471,var_post_472], [(CBlockStmt (CIf var_cond_465 (CCompound _ var_internal_466 _) Nothing _)), (CBlockStmt (CIf var_cond_467 (CCompound _ var_internal_468 _) Nothing _))]) ident nodeInfo old state0 | (exprEqual var_cond_467 var_cond_465) && (and [var_cond_473]) && True =
	concat ([[(("contiguous_same_if", old, (CCompound ident (var_pre_469 ++ [(CBlockStmt (CIf var_cond_467 (CCompound [] (var_body1_470 ++ var_body2_471) undefNodeAnn) Nothing undefNodeAnn))] ++ var_post_472) nodeInfo)),state0, ((concat [unknown_473]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_473, unknown_473) = (noWritesInRead var_body1_470 [(CBlockStmt (CExpr (Just var_cond_467) undefNodeAnn))])
rule_contiguous_same_if_464 _ _ _ _ _ = []

rule_contiguous_same_if_463 [] acc False False =
	[(True,[acc],[])]
rule_contiguous_same_if_463 [] acc _ _ =
	[(False,[acc],[])]
rule_contiguous_same_if_463 (stat@(CBlockStmt (CIf var_cond_474 (CCompound _ var_internal_475 _) Nothing _)):tail_) accsl True True =
	let
		listItems = rule_contiguous_same_if_463 tail_ [] False True 
		listItems476 = rule_contiguous_same_if_476 var_internal_475 [] 
	in [(True, (accsl:(inter476 ++ inter)),(stat:(pats476 ++ pats))) | (True,inter,pats) <- listItems, (True, inter476, pats476) <- listItems476] ++ (rule_contiguous_same_if_463 tail_ (accsl ++ [stat]) True True )
rule_contiguous_same_if_463 (stat@(CBlockStmt (CIf var_cond_477 (CCompound _ var_internal_478 _) Nothing _)):tail_) accsl False True =
	let
		listItems = rule_contiguous_same_if_463 tail_ [] False False 
		listItems479 = rule_contiguous_same_if_479 var_internal_478 [] 
	in [(True, (accsl:(inter479 ++ inter)),(stat:(pats479 ++ pats))) | (True,inter,pats) <- listItems, (True, inter479, pats479) <- listItems479] ++ (rule_contiguous_same_if_463 tail_ (accsl ++ [stat]) False True)
rule_contiguous_same_if_463 (other:tail_) acc  bool1 bool2 =
	rule_contiguous_same_if_463 tail_ (acc ++ [other]) bool1 bool2

rule_contiguous_same_if_476 all [] =
	[(True,[all],[])]
rule_contiguous_same_if_479 all [] =
	[(True,[all],[])]

-- just_one_iteration_removal
rule_just_one_iteration_removal_482 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_just_one_iteration_removal_485 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_just_one_iteration_removal_484 bs [] True )]) ++ (concat [(rule_just_one_iteration_removal_516 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_just_one_iteration_removal_515 bs [] True )]) ++ []
rule_just_one_iteration_removal_482 _ _ = []

rule_just_one_iteration_removal_485 (True,[var_var_internal_480_496,[],[],[],[],var_var_internal_481_497], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_486 var_ini_487 _))) (Just (CBinary CLeOp var_i_488 var_n_489 _)) (Just (CUnary CPostIncOp var_i_490 _)) (CCompound _ var_internal_491 _) _)), (CBlockStmt (CIf (CBinary CEqOp var_i_492 var_other_493 _) (CCompound _ var_internal_494 _) Nothing _)), (CBlockStmt var_one_stat_495)]) ident nodeInfo old state0 | (exprEqual var_i_492 var_i_490) && (exprEqual var_i_490 var_i_488) && (exprEqual var_i_488 var_i_486) && True && (and [var_cond_498, var_cond_499, var_cond_500, var_cond_501]) && True =
	concat ([[(("just_one_iteration_removal", old, (CCompound ident (var_var_internal_480_496 ++ [(CBlockStmt (substitute var_one_stat_495 var_i_492 var_other_493))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_i_492 var_n_489 undefNodeAnn)) undefNodeAnn))] ++ var_var_internal_481_497) nodeInfo)),state0, ((concat [unknown_498, unknown_499, unknown_500, unknown_501]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_498, unknown_498) = (writesNothing [(CBlockStmt (CExpr (Just var_ini_487) undefNodeAnn))])
		(var_cond_499, unknown_499) = (writesNothing [(CBlockStmt (CExpr (Just var_n_489) undefNodeAnn))])
		(var_cond_500, unknown_500) = (writesNothing [(CBlockStmt (CExpr (Just var_other_493) undefNodeAnn))])
		(var_cond_501, unknown_501) = (noWrites var_i_492 [(CBlockStmt var_one_stat_495)])
rule_just_one_iteration_removal_485 _ _ _ _ _ = []

rule_just_one_iteration_removal_484 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_484 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_484 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_502 var_ini_503 _))) (Just (CBinary CLeOp var_i_504 var_n_505 _)) (Just (CUnary CPostIncOp var_i_506 _)) (CCompound _ var_internal_507 _) _)):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_484 tail_ [] False 
		listItems508 = rule_just_one_iteration_removal_508 var_internal_507 [] True 
	in [(True, (accsl:(inter508 ++ inter)),(stat:(pats508 ++ pats))) | (True,inter,pats) <- listItems, (True, inter508, pats508) <- listItems508] ++ (rule_just_one_iteration_removal_484 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_484 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_484 tail_ (acc ++ [other]) bool1

rule_just_one_iteration_removal_508 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_508 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_508 (stat@(CBlockStmt (CIf (CBinary CEqOp var_i_509 var_other_510 _) (CCompound _ var_internal_511 _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_508 tail_ [] False 
		listItems512 = rule_just_one_iteration_removal_512 var_internal_511 [] True 
	in [(True, (accsl:(inter512 ++ inter)),(stat:(pats512 ++ pats))) | (True,inter,pats) <- listItems, (True, inter512, pats512) <- listItems512] ++ (rule_just_one_iteration_removal_508 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_508 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_508 tail_ (acc ++ [other]) bool1

rule_just_one_iteration_removal_512 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_512 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_512 (stat@(CBlockStmt var_one_stat_513):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_512 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_just_one_iteration_removal_512 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_512 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_512 tail_ (acc ++ [other]) bool1

rule_just_one_iteration_removal_516 (True,[var_var_internal_480_527,[],[],[],[],var_var_internal_481_528], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_517 var_ini_518 _))) (Just (CBinary CLeOp var_i_519 var_n_520 _)) (Just (CUnary CPostIncOp var_i_521 _)) (CCompound _ var_internal_522 _) _)), (CBlockStmt (CIf (CBinary CEqOp var_other_523 var_i_524 _) (CCompound _ var_internal_525 _) Nothing _)), (CBlockStmt var_one_stat_526)]) ident nodeInfo old state0 | (exprEqual var_i_524 var_i_521) && (exprEqual var_i_521 var_i_519) && (exprEqual var_i_519 var_i_517) && True && (and [var_cond_529, var_cond_530, var_cond_531, var_cond_532]) && True =
	concat ([[(("just_one_iteration_removal", old, (CCompound ident (var_var_internal_480_527 ++ [(CBlockStmt (substitute var_one_stat_526 var_i_524 var_other_523))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_i_524 var_n_520 undefNodeAnn)) undefNodeAnn))] ++ var_var_internal_481_528) nodeInfo)),state0, ((concat [unknown_529, unknown_530, unknown_531, unknown_532]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_529, unknown_529) = (writesNothing [(CBlockStmt (CExpr (Just var_ini_518) undefNodeAnn))])
		(var_cond_530, unknown_530) = (writesNothing [(CBlockStmt (CExpr (Just var_n_520) undefNodeAnn))])
		(var_cond_531, unknown_531) = (writesNothing [(CBlockStmt (CExpr (Just var_other_523) undefNodeAnn))])
		(var_cond_532, unknown_532) = (noWrites var_i_524 [(CBlockStmt var_one_stat_526)])
rule_just_one_iteration_removal_516 _ _ _ _ _ = []

rule_just_one_iteration_removal_515 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_515 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_515 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_533 var_ini_534 _))) (Just (CBinary CLeOp var_i_535 var_n_536 _)) (Just (CUnary CPostIncOp var_i_537 _)) (CCompound _ var_internal_538 _) _)):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_515 tail_ [] False 
		listItems539 = rule_just_one_iteration_removal_539 var_internal_538 [] True 
	in [(True, (accsl:(inter539 ++ inter)),(stat:(pats539 ++ pats))) | (True,inter,pats) <- listItems, (True, inter539, pats539) <- listItems539] ++ (rule_just_one_iteration_removal_515 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_515 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_515 tail_ (acc ++ [other]) bool1

rule_just_one_iteration_removal_539 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_539 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_539 (stat@(CBlockStmt (CIf (CBinary CEqOp var_other_540 var_i_541 _) (CCompound _ var_internal_542 _) Nothing _)):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_539 tail_ [] False 
		listItems543 = rule_just_one_iteration_removal_543 var_internal_542 [] True 
	in [(True, (accsl:(inter543 ++ inter)),(stat:(pats543 ++ pats))) | (True,inter,pats) <- listItems, (True, inter543, pats543) <- listItems543] ++ (rule_just_one_iteration_removal_539 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_539 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_539 tail_ (acc ++ [other]) bool1

rule_just_one_iteration_removal_543 [] acc False =
	[(True,[acc],[])]
rule_just_one_iteration_removal_543 [] acc _ =
	[(False,[acc],[])]
rule_just_one_iteration_removal_543 (stat@(CBlockStmt var_one_stat_544):tail_) accsl True =
	let
		listItems = rule_just_one_iteration_removal_543 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_just_one_iteration_removal_543 tail_ (accsl ++ [stat]) True)
rule_just_one_iteration_removal_543 (other:tail_) acc  bool1 =
	rule_just_one_iteration_removal_543 tail_ (acc ++ [other]) bool1


-- loop_inv_code_motion
rule_loop_inv_code_motion_545 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_loop_inv_code_motion_548 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_loop_inv_code_motion_547 bs [] True )]) ++ (concat [(rule_loop_inv_code_motion_577 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_loop_inv_code_motion_576 bs [] True )]) ++ []
rule_loop_inv_code_motion_545 _ _ = []

rule_loop_inv_code_motion_548 (True,[var_body0_1_557,var_body1_1_558,var_body2_1_559,var_body0_2_560], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_549 var_ini_550 _))) (Just var_cond_551) (Just var_inv_552) (CCompound _ var_internal_553 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_554 (CBinary CMulOp var_a_555 var_b_556 _) _)) _))]) ident nodeInfo old state0 | True && (and [var_cond_561, var_cond_562, var_cond_563, var_cond_564]) && True =
	concat ([[(("loop_inv_code_motion", old, (CCompound ident (var_body0_1_557 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_k_565))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_k_565 var_b_556 undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_549 var_ini_550 undefNodeAnn))) (Just var_cond_551) (Just var_inv_552) (CCompound [] (var_body1_1_558 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_554 (CBinary CMulOp var_a_555 var_k_565 undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ var_body2_1_559) undefNodeAnn) undefNodeAnn))] ++ var_body0_2_560) nodeInfo)),state1, ((concat [unknown_561, unknown_562, unknown_563, unknown_564]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_561, unknown_561) = (writesNothing [(CBlockStmt (CExpr (Just var_b_556) undefNodeAnn))])
		(var_cond_562, unknown_562) = (noReads var_i_549 [(CBlockStmt (CExpr (Just var_b_556) undefNodeAnn))])
		(var_cond_563, unknown_563) = (notCond (isConstant var_b_556))
		(var_cond_564, unknown_564) = (notCond (isVariable var_b_556))
		(var_k_565, var_k_565_ident, patPragmaDict1,  state1) = buildFreeVar "k" state0
		patPragmaDict = patPragmaDict1
rule_loop_inv_code_motion_548 _ _ _ _ _ = []

rule_loop_inv_code_motion_547 [] acc False =
	[(True,[acc],[])]
rule_loop_inv_code_motion_547 [] acc _ =
	[(False,[acc],[])]
rule_loop_inv_code_motion_547 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_566 var_ini_567 _))) (Just var_cond_568) (Just var_inv_569) (CCompound _ var_internal_570 _) _)):tail_) accsl True =
	let
		listItems = rule_loop_inv_code_motion_547 tail_ [] False 
		listItems571 = rule_loop_inv_code_motion_571 var_internal_570 [] True 
	in [(True, (accsl:(inter571 ++ inter)),(stat:(pats571 ++ pats))) | (True,inter,pats) <- listItems, (True, inter571, pats571) <- listItems571] ++ (rule_loop_inv_code_motion_547 tail_ (accsl ++ [stat]) True)
rule_loop_inv_code_motion_547 (other:tail_) acc  bool1 =
	rule_loop_inv_code_motion_547 tail_ (acc ++ [other]) bool1

rule_loop_inv_code_motion_571 [] acc False =
	[(True,[acc],[])]
rule_loop_inv_code_motion_571 [] acc _ =
	[(False,[acc],[])]
rule_loop_inv_code_motion_571 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_572 (CBinary CMulOp var_a_573 var_b_574 _) _)) _)):tail_) accsl True =
	let
		listItems = rule_loop_inv_code_motion_571 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_loop_inv_code_motion_571 tail_ (accsl ++ [stat]) True)
rule_loop_inv_code_motion_571 (other:tail_) acc  bool1 =
	rule_loop_inv_code_motion_571 tail_ (acc ++ [other]) bool1

rule_loop_inv_code_motion_577 (True,[var_body0_1_586,var_body1_1_587,var_body2_1_588,var_body0_2_589], [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_578 var_ini_579 _))) (Just var_cond_580) (Just var_inv_581) (CCompound _ var_internal_582 _) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_583 (CBinary CMulOp var_b_584 var_a_585 _) _)) _))]) ident nodeInfo old state0 | True && (and [var_cond_590, var_cond_591, var_cond_592, var_cond_593]) && True =
	concat ([[(("loop_inv_code_motion", old, (CCompound ident (var_body0_1_586 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_k_594))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_k_594 var_b_584 undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_578 var_ini_579 undefNodeAnn))) (Just var_cond_580) (Just var_inv_581) (CCompound [] (var_body1_1_587 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_583 (CBinary CMulOp var_a_585 var_k_594 undefNodeAnn) undefNodeAnn)) undefNodeAnn))] ++ var_body2_1_588) undefNodeAnn) undefNodeAnn))] ++ var_body0_2_589) nodeInfo)),state1, ((concat [unknown_590, unknown_591, unknown_592, unknown_593]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_590, unknown_590) = (writesNothing [(CBlockStmt (CExpr (Just var_b_584) undefNodeAnn))])
		(var_cond_591, unknown_591) = (noReads var_i_578 [(CBlockStmt (CExpr (Just var_b_584) undefNodeAnn))])
		(var_cond_592, unknown_592) = (notCond (isConstant var_b_584))
		(var_cond_593, unknown_593) = (notCond (isVariable var_b_584))
		(var_k_594, var_k_594_ident, patPragmaDict1,  state1) = buildFreeVar "k" state0
		patPragmaDict = patPragmaDict1
rule_loop_inv_code_motion_577 _ _ _ _ _ = []

rule_loop_inv_code_motion_576 [] acc False =
	[(True,[acc],[])]
rule_loop_inv_code_motion_576 [] acc _ =
	[(False,[acc],[])]
rule_loop_inv_code_motion_576 (stat@(CBlockStmt (CFor (Left (Just (CAssign CAssignOp var_i_595 var_ini_596 _))) (Just var_cond_597) (Just var_inv_598) (CCompound _ var_internal_599 _) _)):tail_) accsl True =
	let
		listItems = rule_loop_inv_code_motion_576 tail_ [] False 
		listItems600 = rule_loop_inv_code_motion_600 var_internal_599 [] True 
	in [(True, (accsl:(inter600 ++ inter)),(stat:(pats600 ++ pats))) | (True,inter,pats) <- listItems, (True, inter600, pats600) <- listItems600] ++ (rule_loop_inv_code_motion_576 tail_ (accsl ++ [stat]) True)
rule_loop_inv_code_motion_576 (other:tail_) acc  bool1 =
	rule_loop_inv_code_motion_576 tail_ (acc ++ [other]) bool1

rule_loop_inv_code_motion_600 [] acc False =
	[(True,[acc],[])]
rule_loop_inv_code_motion_600 [] acc _ =
	[(False,[acc],[])]
rule_loop_inv_code_motion_600 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_c_601 (CBinary CMulOp var_b_602 var_a_603 _) _)) _)):tail_) accsl True =
	let
		listItems = rule_loop_inv_code_motion_600 tail_ [] False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_loop_inv_code_motion_600 tail_ (accsl ++ [stat]) True)
rule_loop_inv_code_motion_600 (other:tail_) acc  bool1 =
	rule_loop_inv_code_motion_600 tail_ (acc ++ [other]) bool1


-- common_subexp_elimination
rule_common_subexp_elimination_604 state0 old@(CCompound ident bs nodeInfo)=
	(concat [(rule_common_subexp_elimination_607 item ident nodeInfo old state0) | item@(True,_,_) <- (rule_common_subexp_elimination_606 bs [] True True )]) ++ []
rule_common_subexp_elimination_604 _ _ = []

rule_common_subexp_elimination_607 (True,[var_ini_612,var_mid_613,var_fin_614], [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_608 var_c_609 _)) _)), (CBlockStmt (CExpr (Just (CAssign CAssignOp var_b_610 var_c_611 _)) _))]) ident nodeInfo old state0 | (exprEqual var_c_611 var_c_609) && True && (and [var_cond_615, var_cond_616]) && True =
	concat ([[(("common_subexp_elimination", old, (CCompound ident (var_ini_612 ++ [(CBlockDecl (CDecl [CTypeSpec (CIntType undefNodeAnn)] [(Just (CDeclr (Just ((getIdent var_t_617))) [] Nothing [] undefNodeAnn), Nothing, Nothing)] undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_t_617 var_c_611 undefNodeAnn)) undefNodeAnn))] ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_608 var_t_617 undefNodeAnn)) undefNodeAnn))] ++ var_mid_613 ++ [(CBlockStmt (CExpr (Just (CAssign CAssignOp var_b_610 var_t_617 undefNodeAnn)) undefNodeAnn))] ++ var_fin_614) nodeInfo)),state1, ((concat [unknown_615, unknown_616]) ++ (concat [])) )] | (and [])] ++ [])
	where
		(var_cond_615, unknown_615) = (notCond (isConstant var_c_611))
		(var_cond_616, unknown_616) = (notCond (isVariable var_c_611))
		(var_t_617, var_t_617_ident, patPragmaDict1,  state1) = buildFreeVar "t" state0
		patPragmaDict = patPragmaDict1
rule_common_subexp_elimination_607 _ _ _ _ _ = []

rule_common_subexp_elimination_606 [] acc False False =
	[(True,[acc],[])]
rule_common_subexp_elimination_606 [] acc _ _ =
	[(False,[acc],[])]
rule_common_subexp_elimination_606 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_a_618 var_c_619 _)) _)):tail_) accsl True True =
	let
		listItems = rule_common_subexp_elimination_606 tail_ [] False True 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_common_subexp_elimination_606 tail_ (accsl ++ [stat]) True True )
rule_common_subexp_elimination_606 (stat@(CBlockStmt (CExpr (Just (CAssign CAssignOp var_b_620 var_c_621 _)) _)):tail_) accsl False True =
	let
		listItems = rule_common_subexp_elimination_606 tail_ [] False False 
	in [(True, (accsl:(inter)),(stat:(pats))) | (True,inter,pats) <- listItems] ++ (rule_common_subexp_elimination_606 tail_ (accsl ++ [stat]) False True)
rule_common_subexp_elimination_606 (other:tail_) acc  bool1 bool2 =
	rule_common_subexp_elimination_606 tail_ (acc ++ [other]) bool1 bool2

