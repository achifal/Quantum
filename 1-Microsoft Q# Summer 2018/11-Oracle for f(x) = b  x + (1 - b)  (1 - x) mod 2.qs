namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            mutable isZero = false;
            for(i in 0..Length(x)-1)
            {
                set isZero = b[i] == 0;
                if(isZero)
                {
                    X(x[i]);
				}
                CNOT(x[i], y);
                if(isZero){
					X(x[i]);   
				}
			}
        }
    }
}