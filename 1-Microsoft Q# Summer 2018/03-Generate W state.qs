﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            mutable n = Length(qs);
            mutable half = n/2;
            if(n == 1){
                X(qs[0]);     
			}
            else{
                Solve(qs[0..half-1]);
                using(x=Qubit()){
                    H(x);
                    for(i in 0..half-1){
                        (Controlled SWAP) ([x], (qs[i], qs[half+i]));           
					}
                    for(i in half..n-1){
                        CNOT(qs[i], x);           
					}
				}
			}
        }
    }
}