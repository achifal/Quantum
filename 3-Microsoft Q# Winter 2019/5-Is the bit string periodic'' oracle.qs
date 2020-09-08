﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Extra (xExtra: Qubit[], qsExtra: Qubit[]): Unit{
        body (...) {
            for(p in 1..Length(qsExtra)){
                for(i in 0..Length(xExtra)-p-1){
                    CNOT(xExtra[p+i], xExtra[i]);     
			    }
                (ControlledOnInt(0, X))(xExtra[0..Length(xExtra)-p-1], qsExtra[p-1]);
                for(i in Length(xExtra)-p-1..-1..0){
                    CNOT(xExtra[p+i], xExtra[i]);     
			    }
		    }
	    }
        adjoint auto;
	}
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            using(qs = Qubit[Length(x)-1]){
                Extra(x, qs);
                (ControlledOnInt(0, X))(qs, y);
                X(y);
                Adjoint Extra(x, qs);
			}
        }
        adjoint self;
    }
}