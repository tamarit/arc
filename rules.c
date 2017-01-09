// Copyright (c) 2013-2016, The IMDEA Software Institute and
// Copyright (c) 2013-2016, Universidad Politécnica de Madrid

// See LICENSE.txt and AUTHORS.txt for licensing and authorship



/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
// Rules for expressions
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////

// Remove the identity of a binary operator
remove_identity
{
	pattern:
	{
		bin_op(cop(op),cexpr(a),cexpr(b));
	}
	condition:
	{
        // b is the identity of op
		is_identity(cop(op),cexpr(b));
        // Because it is removed
        pure(cexpr(b)); 
	}
	generate:
	{
		cexpr(a);
	}
}

// Reduce an operation to 0 when the right operator is 0
reduce_to_0
{
    pattern:
    {
        cexpr(a) * 0;
    }
    condition:
    {
        // Because it is removed
        pure(cexpr(a));
    }
    generate:
    {
        0;
    }
}

undo_distributive
{
    pattern:
    {
        (cexpr(b) * cexpr(a)) + (cexpr(c) * cexpr(a));
    }
    condition:
    {
        // The evaluation order changes
        pure(cexpr(a));
        pure(cexpr(b));
        pure(cexpr(c));
    }
    generate:
    {
        cexpr(a) * (cexpr(b) + cexpr(c));
    }
}


/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
// Syntactic transformations / Normalization
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////

// // Transform a for statement without block in a if statemst with block
// for_wo_block_2_for_w_block
// {
//     pattern:
//     {
//         for(cexpr(i) = cexpr(initial_value); cexpr(cond); cexpr(inc))
//             cstmt(body);
//     }
//     condition:
//     {
//         // If it is a block we do not want to remove it
//     	not(is_block(cstmt(body)));
//     }
//     generate:
//     {
//         for(cexpr(i) = cexpr(initial_value); cexpr(cond); cexpr(inc))
//         {
//             cstmt(body);
//         }
//     }
// }


// // Transform a if statement without block in a if statemst with block
// if_wo_block_2_if_w_block
// {
//     pattern:
//     {
//         if(cexpr(cond))
//             cstmt(body);
//     }
//     condition:
//     {
//         // We do not want to apply the rule if it is already a block
//         not(is_block(cstmt(body)));
//     }
//     generate:
//     {
//         if(cexpr(cond))
//         {
//             cstmt(body);
//         }
//     }
// }

// // Transform a if statement without else block into a if statement with
// if_wo_else_2_if_w_else
// {
//     pattern:
//     {
//         if(cexpr(cond))
//         {
//             cstmts(body);
//         }
//     }
//     generate:
//     {
//         if(cexpr(cond))
//         {
//             cstmts(body);
//         }
//         else
//         {}
//     }
// }

// Transform a simple assignment into an addition assignment  
join_addition_assign
{
    pattern:
    {
        cexpr(a) = cexpr(a) + cexpr(b);
    }
    condition:
    {
        // One of these expression is lost in the resulting code
        pure(cexpr(a));
    }
    generate:
    {
        cexpr(a) += cexpr(b);
    }
}

// move external multiplication operation inside a ternary expression
mult_ternary_2_ternary
{
    pattern:
    {
        cexpr(lop) * (cexpr(cond)?cexpr(then_):cexpr(else_));
    }
    condition:
    {
        // It can be evaluated twice in the new code
        pure(cexpr(lop));
    }
    generate:
    {
        cexpr(cond)? cexpr(lop) * cexpr(then_):cexpr(lop) * cexpr(else_);
    }
}

// move external multiplication operation inside a ternary expression
sum_ternary_2_ternary
{
    pattern:
    {
        cexpr(lop) + (cexpr(cond)?cexpr(then_):cexpr(else_));
    }
    condition:
    {
        // The evaluation order changes, so we need to assure that
        // the evaluation of this expression does not affect the rest.
        pure(cexpr(lop));
    }
    generate:
    {
        cexpr(cond)? cexpr(lop) + cexpr(then_):cexpr(lop) + cexpr(else_);
    }
}

// // converts an assignement to a ternary in an if statement
// assign_ternary_2_if_else
// {
//     pattern:
//     {
//         cstmts(ini);
//         cexpr(lhs) = cexpr(cond)?cexpr(then_):cexpr(else_);
//         cstmts(end);
//     }
//     condition:
//     {
//         // The evaluation order changes, so we need to assure that
//         // the evaluation of this expression does not affect the rest.
//         pure(cexpr(lhs));
//     }
//     generate:
//     {
//         cstmts(ini);
//         if (cexpr(cond))
//         {
//             cexpr(lhs) = cexpr(then_);
//         }
//         else
//         {
//             cexpr(lhs) = cexpr(else_);
//         }
//         cstmts(end);
//     }
// }

// converts an if-else statement in an assignement to a ternary 
if_else_2_assign_ternary
{
    pattern:
    {
        cstmts(ini);
        if (cexpr(cond))
        {
            cexpr(lhs) = cexpr(then_);
        }
        else
        {
            cexpr(lhs) = cexpr(else_);
        }
        cstmts(end);
    }
    condition:
    {
        // The evaluation order changes, so we need to assure that
        // the evaluation of this expression does not affect the rest.
        pure(cexpr(lhs));
    }
    generate:
    {
        cstmts(ini);
        cexpr(lhs) = cexpr(cond)?cexpr(then_):cexpr(else_);
        cstmts(end);
    }
}

// converts an if statement (without else) in an assignement to a ternary 
if_2_assign_ternary
{
    pattern:
    {
        cstmts(ini);
        if (cexpr(cond))
        {
            cexpr(lhs) = cexpr(then_);
        }
        cstmts(end);
    }
    condition:
    {
        // Its evaluation can be duplicated;
        // Morevover, the evaluation order has changed.
        pure(cexpr(lhs));
    }
    generate:
    {
        cstmts(ini);
        cexpr(lhs) = cexpr(cond)?cexpr(then_):cexpr(lhs);
        cstmts(end);
    }
}

// remove an empty else
empty_else
{
    pattern:
    {
        if (cexpr(cond))
        {
            cstmts(then_);
        }
        else {}
    }
    generate:
    {
        if (cexpr(cond))
        {
            cstmts(then_);
        }
    }
}

// // Remove a ternary operator 
// remove_ternary
// {
//     pattern:
//     {
//         cexpr(cond)?cexpr(then_):cexpr(else_);
//     }
//     condition:
//     {
//         // Evaluated twice in the resulting code
//         pure(cexpr(cond));
//         // Evaluated both in the resulting code while in the pattern only one of them.
//         pure(cexpr(then_));
//         pure(cexpr(else_));
//     }
//     generate:
//     {
//         cexpr(cond) * cexpr(then_) + (1 - cexpr(cond)) * cexpr(else_);
//     }
// }


//Removes a useless if statement
remove_empty_if
{
    pattern:
    {
        cstmts(ini);
        if(cexpr(cond))
        {}
        cstmts(end);
    }
    condition:
    {
        // Because it is going to dissapear.
        // An alternative would be to replace the if-statement by cond.
        pure(cexpr(cond));
    }
    generate:
    {
        cstmts(ini);
        cstmts(end);
    }
}

//Removes a statment that does not affect to the overall computation
remove_useless_statement
{
    pattern:
    {
        cstmts(ini);
        cstmt(mid);
        cstmts(end);
    }
    condition:
    {
        is_expr(cstmt(mid));
        pure(cstmt(mid));
    }
    generate:
    {
        cstmts(ini);
        cstmts(end);
    }    
}

/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
// Optimization/ Partial Evaluation
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////

// Loop-based strength reduction 
strength_reduction
{
    pattern:
    {
        cstmts(ini);
        for(cexpr(i) = cexpr(init);cexpr(i) < cexpr(n);cexpr(i)++)
        {
            cstmts(ini1);
            cexpr(a) = cexpr(b) + (cexpr(c) * cexpr(i));
            cstmts(end1);
        }
        cstmts(end);
    }
    condition:
    {
        // Should be a constant expression
        is_cons(cexpr(c));
        // Control var is not modified inside the body (here split in multiple vars)
        no_writes(cexpr(i), cstmts(ini1));
        no_writes(cexpr(i), cstmts(end1));
        no_writes(cexpr(i), cexpr(b));
        no_writes(cexpr(i), cexpr(a));
    }
    generate:
    {   
        cstmts(ini);
        cdecl(cint(),cexpr(t));
        cexpr(t) = 0;
        for(cexpr(i) = cexpr(init);cexpr(i) < cexpr(n);cexpr(i)++)
        {
            cstmts(ini1);
            cexpr(a) = cexpr(b) + t;
            t += cexpr(c);
            cstmts(end1);
        }
        cstmts(end);
    }
}

// remove a useless assignment 
useless_assign
{
    pattern:
    {
        cstmts(ini);
        cexpr(lhs) = cexpr(lhs);
        cstmts(fin);
    }
    condition:
    {
        // It dissapears in the resulting code
        pure(cexpr(lhs));
    }
    generate:
    {
        cstmts(ini);
        cstmts(fin);
    }
}

// Replace an expression that is equal to another in 
// an if statement context
replace_var_equal
{
    pattern:
    {
        if (cexpr(a) == cexpr(b))
        {
            cstmts(body);
        }
    }
    condition:
    {
        // One is going to be replaced by the other
        // So some will be removed, and some replicated.
        pure(cexpr(a));
        pure(cexpr(b));
    }
    generate:
    {
        if (cexpr(a) == cexpr(b))
        {
            gen_list:
            {   
                if_then:
                {
                    no_writes(cexpr(a),cstmts(body));
                    subs(cstmts(body),cexpr(a),cexpr(b));
                }
                if_then:
                {
                    no_writes(cexpr(b),cstmts(body));
                    subs(cstmts(body),cexpr(b),cexpr(a));
                }
            }
        }
    } 
}

contiguous_same_if
{
    pattern:
    {
        cstmts(pre);
        if (cexpr(cond))
        {
            cstmts(body1);
        }
        if (cexpr(cond))
        {
            cstmts(body2);
        }
        cstmts(post);
    }
    condition:
    {
        no_writes_in_read(cstmts(body1), cexpr(cond));
    }
    generate:
    {
        cstmts(pre);
        if (cexpr(cond))
        {
            cstmts(body1);
            cstmts(body2);
        }
        cstmts(post);
    }
}


// remove a for loop that just run one statemnt during its iterations
just_one_iteration_removal
{
    pattern:
    {
        for (cexpr(i) = cexpr(ini); cexpr(i) < cexpr(n); cexpr(i)++)
        {
            if (cexpr(i) == cexpr(other))
            {
                cstmt(one_stat);
            }
        }
    }
    condition:
    {
        // These vars dissapear
        pure(cexpr(ini));
        pure(cexpr(n));
        // This can be replicated
        pure(cexpr(other));
        // Control var should bot modifedf during the evaluation of one_stat
        no_writes(cexpr(i), cstmt(one_stat));
    }
    generate:
    {
        subs(cstmt(one_stat),cexpr(i),cexpr(other));
        // Final value of cexpr(i);
        cexpr(i) = cexpr(n);
    }
}

// // Join two assignments to the same variable in a single one
// join_assignments
// {
//     pattern:
//     {
//         cstmts(ini);
//         cexpr(v1) = cexpr(val_v1);
//         cstmts(mid);
//         cexpr(v1) = cexpr(val_v2);
//         cstmts(end);
//     }
//     condition:
//     {
//         // What v1 writes is not used by mid
//         no_writes_in_read(cexpr(v1),cstmts(mid));
//         // These vars are going to be replaced
//         pure(cexpr(val_v1));  
//         pure(cexpr(val_v2));        
//     }
//     generate:
//     {
//         cstmts(ini);
//         cstmts(mid);
//         cexpr(v1) = subs(cexpr(val_v2),cexpr(v1),cexpr(val_v1));
//         cstmts(end);
//     }  
// }




// Extracts an expression within a loop that evualuates to the same value 
// in all iterations. The extraction is performed by an assignment before 
// entering the loop and, then using the variable instead of the expression
// inside the loop.
loop_inv_code_motion
{
    pattern:
    {
        cstmts(body0_1);
        for (cexpr(i) = cexpr(ini); cexpr(cond); cexpr(inv))
        {
            cstmts(body1_1);
            cexpr(c) = cexpr(a) * cexpr(b);
            cstmts(body2_1);
        }
        cstmts(body0_2);
    }
    condition:
    {
        // The evaluation order and the number of times is is evaluated changes.
        pure(cexpr(b));
        // It does not depends on the control
        no_reads(cexpr(i), cexpr(b));
        // If it is a variable or a constant the transformation is useless. 
        // This, this is an optimization to reduce the number of candidates.
        not(is_cons(cexpr(b)));
        not(is_var(cexpr(b)));
    }
    generate:
    {   
        cstmts(body0_1);
        cdecl(cint(),cexpr(k));
        cexpr(k) = cexpr(b);
        for (cexpr(i) = cexpr(ini); cexpr(cond); cexpr(inv))
        {
            cstmts(body1_1);
            cexpr(c) = cexpr(a) * cexpr(k);
            cstmts(body2_1); 
        }
        cstmts(body0_2);
    }
}


// Creates an auxiliar variable to avoid evaluating
// twice a common expression
common_subexp_elimination
{
    pattern:
    {
        cstmts(ini);
        cexpr(a) = cexpr(c);
        cstmts(mid);
        cexpr(b) = cexpr(c);
        cstmts(fin);
    }
    condition:
    {
        // Optimization to disable useless transformations
        not(is_cons(cexpr(c)));
        not(is_var(cexpr(c)));
    }
    generate:
    {
        cstmts(ini);
        cdecl(cint(),cexpr(t));
        cexpr(t) = cexpr(c);
        cexpr(a) = cexpr(t);
        cstmts(mid);
        cexpr(b) = cexpr(t);
        cstmts(fin);
    }
}

