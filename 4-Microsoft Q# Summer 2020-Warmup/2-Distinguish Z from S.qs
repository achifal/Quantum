﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using(q = Qubit()){
            H(q);
			Adjoint unitary(q);
            Adjoint unitary(q);
            H(q);
            mutable flag = (M(q) == Zero);
            if(flag == false){
                X(q);     
			}
            return flag ? 0 | 1;
		}
    }
}