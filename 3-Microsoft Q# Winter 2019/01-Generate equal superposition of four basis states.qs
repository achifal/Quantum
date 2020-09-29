﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits : Bool[][]) : Unit {
        using(q = Qubit[2]){
            ApplyToEach(H, q);
            for(i in 0..3){
                for(j in 0..Length(qs)-1){
                    if(bits[i][j]){
                        (ControlledOnInt(i ,X))(q, qs[j]);
					}        
				}     
			}
            for(i in 0..3){
                if(i % 2 == 1){
                    (ControlledOnBitString(bits[i], X))(qs, q[0]);        
				}     
                if(i / 2 == 1){
                    (ControlledOnBitString(bits[i], X))(qs, q[1]);          
				}
			}
		}
    }
}