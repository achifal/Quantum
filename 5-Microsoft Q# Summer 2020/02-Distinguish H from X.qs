﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable flag = false;
        using(q = Qubit()){
            unitary(q);
            X(q);
            unitary(q);
            set flag = M(q) == Zero;
            if(!flag){
                X(q);  
		    }
		}
        return flag ? 0 | 1;
    }
}