﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[]) : Unit {
        using(q = Qubit()){
            repeat{
                for(i in 0..Length(qs)-1){
                    H(qs[i]);           
				}
                Controlled X(qs, q);
                let res = M(q);
                if(res == One){
                    X(q);        
				}
            }
            until(res == Zero)
            fixup{
                ResetAll(qs);     
			}
        }
    }
}