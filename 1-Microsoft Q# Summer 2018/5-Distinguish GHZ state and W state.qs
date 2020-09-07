﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            let first = M(qs[0]);
            mutable k = 1;
            for(i in 1..Length(qs)-1){
                if(M(qs[i])==first)
                {
                    set k+=1;        
				}
			}
            return k == Length(qs) ? 0 | 1;
        }
    }
}