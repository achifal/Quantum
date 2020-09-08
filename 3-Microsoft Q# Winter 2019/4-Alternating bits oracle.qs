namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            using(q = Qubit[2]){
                for(i in 0..Length(x)-1){
                    if(i%2==1){
                        X(x[i]);           
					}        
				}
                Controlled X(x[0..2...], q[0]);
                Controlled X(x[1..2...], q[1]);
                CCNOT(q[0], q[1], y);
                Controlled X(x[0..2...], q[0]);
                Controlled X(x[1..2...], q[1]);
                ApplyToEachA(X, x);
                Controlled X(x[0..2...], q[0]);
                Controlled X(x[1..2...], q[1]);
                CCNOT(q[0], q[1], y);
                Controlled X(x[0..2...], q[0]);
                Controlled X(x[1..2...], q[1]);
                for(i in 0..Length(x)-1){
                    if(i%2==0){
                        X(x[i]);           
					}        
				}
			}
        }
        adjoint auto;
    }
}