﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
 
    operation Solve (qs : Qubit[]) : Unit {
        using(q = Qubit()){
            repeat{
                H(qs[0]); H(qs[1]);
                Controlled X(qs, q);
                let res = MResetZ(q);
            }
            until(res == Zero)
            fixup{
                ResetAll(qs);     
			}
            X(qs[0]);
            X(qs[1]);
        }
    }
}