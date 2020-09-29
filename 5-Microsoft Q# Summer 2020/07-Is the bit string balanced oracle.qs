﻿namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let N = Length(inputs);
        let tmp = N / 2 % 4;
        using(q = Qubit[2]){
            for(i in 0..N-1){
                CNOT(inputs[i], q[0]);
                for(j in i+1..N-1){
                    CCNOT(inputs[i], inputs[j], q[1]);        
				}
			} 
            (ControlledOnInt(tmp, X))(q, output);
            for(i in 0..N-1){
                CNOT(inputs[i], q[0]);
                for(j in i+1..N-1){
                    CCNOT(inputs[i], inputs[j], q[1]);        
				}
			} 
		}
        if(Length(inputs)==8){
            Controlled X(inputs, output);
            for(i in 0..N-1){
                X(inputs[i]);     
			}
            Controlled X(inputs, output);
            for(i in 0..N-1){
                X(inputs[i]);     
			}
		}
        if(Length(inputs)==10){
            for(i in 0..N-1){
                Controlled X(inputs[0..i-1]+inputs[i+1..N-1], output);
                for(j in 0..N-1){
                    X(inputs[j]);     
			    }
                Controlled X(inputs[0..i-1]+inputs[i+1..N-1], output);
                for(j in 0..N-1){
                    X(inputs[j]);     
			    }
			}  
		}
    }
}