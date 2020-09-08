﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        using(q = Qubit()){
            repeat{
                ApplyToEach(H, qs);
                CCNOT(qs[0], qs[1], q);
            }
            until(M(q) == Zero)
            fixup{
                Reset(q);
                ApplyToEach(H, qs);
			}
	    }
    }
}