namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Solve (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        mutable flag = false;
        using(qs = Qubit[2]){
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            X(qs[0]);
            Controlled unitary(qs[0..0], (2.0 * PI(), qs[1]));
            CNOT(qs[0], qs[1]);
            H(qs[0]);
            set flag = M(qs[0]) == Zero;
            X(qs[1]);
            if(!flag){
                X(qs[0]);         
			}
		}
        return flag ? 1 | 0;
    }
}