namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            CNOT(qs[0],qs[1]);
            H(qs[0]);
            if(M(qs[0]) == Zero)
            {
                return M(qs[1]) == Zero ? 3 | 2;        
			}
            else
            {
                return M(qs[1]) == Zero ? 1 | 0;     
			}
        }
    }
}