﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            H(qs[1]);
            return M(qs[0]) == Zero ? M(qs[1])==Zero ? 0 | 1 | M(qs[1]) == Zero ? 2 | 3; 
        }
    }
}