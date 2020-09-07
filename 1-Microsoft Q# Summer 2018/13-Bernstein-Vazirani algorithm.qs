﻿
﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable res = new Int[N];
            using(qs = Qubit[N + 1])
            {
                X(qs[N]);
                for(i in 0..N)
                {
                    H(qs[i]);
				}
                Uf(qs[0..N-1], qs[N]);
                for(i in 0..N-1)
                {
                    H(qs[i]);
                    set res w/= i <- M(qs[i]) == One ? 1 | 0;
				}
                ResetAll(qs);
			}
            return res;
        }
    }
}