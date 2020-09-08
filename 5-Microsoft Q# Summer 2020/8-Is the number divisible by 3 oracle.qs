﻿namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Increment(inputs: Qubit[]): Unit is Adj+Ctl{
        mutable N = 2;
        CNOT(inputs[1], inputs[0]); 
        CNOT(inputs[0], inputs[1]); 
        X(inputs[0]);
	}
 
    operation Decrement(inputs: Qubit[]): Unit is Adj+Ctl{
        mutable N = 2;
        CNOT(inputs[0], inputs[1]); 
        CNOT(inputs[1], inputs[0]); 
        X(inputs[1]);
	}
 
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let N = Length(inputs);
        using(q = Qubit[2]){
            for(i in 0..N-1){
                if(i % 2 == 0){
                    Controlled Increment([inputs[i]], q);            
				}
                else{
                    Controlled Decrement([inputs[i]], q);            
				}
			}
            (ControlledOnInt(0, X))(q, output);
            (ControlledOnInt(3, X))(q, output);
            for(i in 0..N-1){
                if(i % 2 == 0){
                    Controlled Decrement([inputs[i]], q);            
				}
                else{
                    Controlled Increment([inputs[i]], q);            
				}
			}
		}
    }
}