﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation IsEqual (x : Qubit[], res : Qubit[]) : Unit {
        body (...) {
            mutable n = Length(x);
            for(i in 0..n/2 - 1){
                CCNOT(x[i], x[n-1-i], res[i]);
                X(x[i]); X(x[n-1-i]);
                CCNOT(x[i], x[n-1-i], res[i]);
                X(x[i]); X(x[n-1-i]);
			}
        }
        adjoint auto;
    }
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            mutable n = Length(x);
            using(res = Qubit[n/2]){
                ApplyWithA(IsEqual(x, _), Controlled X(_, y), res);
		    }
        }
        adjoint auto;
    }
}