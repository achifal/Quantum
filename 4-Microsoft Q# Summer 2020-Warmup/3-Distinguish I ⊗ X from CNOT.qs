﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using(q = Qubit[2]){
			Adjoint unitary(q);
            mutable flag = (M(q[1]) == One);
            if(flag == true){
                X(q[1]);     
			}
            return flag ? 0 | 1;
		}
    }
}