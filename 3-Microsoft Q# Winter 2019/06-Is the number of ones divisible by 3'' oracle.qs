﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation plusMod3(x: Qubit[], qs: Qubit[]): Unit{
        body(...){
            for(item in x){
                (ControlledOnBitString([true, false], X))([item, qs[1]], qs[0]);  
                (ControlledOnBitString([true, false], X))([item, qs[0]], qs[1]);  
		    }
		}
        adjoint auto;
	}
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            using(qs = Qubit[2]){
                WithA(plusMod3(x, _), (ControlledOnInt(0, X))(_, y), qs);         
			}
        }
        adjoint auto;
    }
}