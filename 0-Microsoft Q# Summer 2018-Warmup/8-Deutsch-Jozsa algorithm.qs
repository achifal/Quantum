﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable flag = true;
            using(x = Qubit[N+1])
            {
                X(x[N]);
                for(i in 0..N)
                {
                    H(x[i]);
                }
                Uf(x[0..N-1], x[N]);
                for(i in 0..N - 1)
                {
                    H(x[i]);
                    if(M(x[i])==One){
                        set flag = false;
					}
                }
                ResetAll(x);
		    }
            return flag;
        }
    }
}