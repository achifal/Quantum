﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable flag1 = false;
        mutable flag2 = false;
        using(q = Qubit[2]){
            H(q[0]);
            Controlled unitary([q[0]], q[1]);
            Controlled unitary([q[0]], q[1]);
            H(q[0]);
            set flag1 = M(q[0]) == Zero;
            ResetAll(q);
            H(q[0]);
            CNOT(q[0], q[1]);
            Controlled unitary([q[0]], q[1]);
            if(flag1){
                S(q[0]);     
			}
            H(q[0]);
            set flag2 = M(q[0]) == Zero;
            ResetAll(q);
		}
        if(flag1){
            return flag2 ? 0 | 2;       
		}
        else{
            return flag2 ? 1 | 3;  
		}
    }
}