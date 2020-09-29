namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable res = 0;
        using(q = Qubit[2]){
            H(q[0]);
            CNOT(q[0], q[1]);
            X(q[0]);
            unitary(q[0]);
            CNOT(q[0], q[1]);
            H(q[0]);
            if(M(q[0])==One){
                set res = M(q[1])==One ? 3 | 2;   
			}
            else{
                set res = M(q[1])==One ? 0 | 1;         
			}
            ResetAll(q);
		}
        return res;
    }
}