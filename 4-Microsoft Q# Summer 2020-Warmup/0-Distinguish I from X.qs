namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using(q = Qubit()){
			Adjoint unitary(q);
            mutable flag = (M(q) == One);
            if(flag == true){
                X(q);     
			}
            return flag ? 1 | 0;
		}
    }
}