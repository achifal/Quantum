﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
 
    operation Solve (qs : Qubit[]) : Unit {
        for(i in Length(qs)-1..-1..0){
            for(j in 0..i-1){
                (ControlledOnInt(PowI(2, Length(qs)-1-i), H))(qs[Length(qs)-1..-1..i], qs[j]);         
			} 
		}
    }
}