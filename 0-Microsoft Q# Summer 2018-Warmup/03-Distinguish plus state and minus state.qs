﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            H(q);
            let tmp = M(q);
            if(tmp == One){
                return -1;     
			}
            else{
                return 1;     
			}
        }
    }
}