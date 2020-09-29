﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable flag = false;
        using(q = Qubit[2]){
            X(q[0]);
            unitary(q);  
            X(q[0]);
            set flag = M(q[1]) == One;
            if(flag){
                X(q[1]);     
			}
		}
        return flag ? 0 | 1;
    }
}