﻿namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[], parity : Int) : Unit {
        using(q = Qubit[Length(qs)-1]){
            for(i in 0..Length(qs)-2){
                H(q[i]);        
			}
            if(parity == 1){
                X(qs[0]);     
			}
			for(i in 0..Length(qs)-2){
                CNOT(q[i], qs[i]);     
                CNOT(q[i], qs[i+1]);
                CNOT(qs[i+1], q[i]);
			}
		}
    }
}