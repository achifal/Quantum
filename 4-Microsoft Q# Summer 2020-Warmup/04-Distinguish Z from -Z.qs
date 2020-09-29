namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable flag = false;
        using(x=Qubit[2]){
            H(x[0]);
            CNOT(x[0], x[1]);
            Controlled unitary(x[0..0], x[1]);
            CNOT(x[0], x[1]);
            H(x[0]);
            set flag = M(x[0]) == Zero;
            ResetAll(x);
		}
        return flag ? 1 | 0;
    }
}