﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using(q = Qubit()){
            X(q);
            H(q);
			Adjoint unitary(q);
            H(q);
            mutable flag = (M(q) == One);
            if(flag == true){
                X(q);     
			}
            return flag ? 0 | 1;
		}
    }
}