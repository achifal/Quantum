﻿namespace Solution {
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            mutable choice = RandomInt(2);
            if(choice != 0){
                H(q);
			}
            return M(q) == One ? choice == 0 ? 1 | 0 | -1;  
        }
    }
}