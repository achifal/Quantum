namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        mutable N = Length(qs);
        X(qs[N-1]);
        for(i in 0..N-2){
            CNOT(qs[N-1], qs[i]);
		}
        X(qs[N-1]);
        for(i in 0..N-2){
            Controlled H([qs[N-1]], qs[i]);      
		}
    }
}