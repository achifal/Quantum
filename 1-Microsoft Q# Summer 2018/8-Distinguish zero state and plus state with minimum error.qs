namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            Ry(0.4734, q);
            return M(q) == Zero ? 0 | 1;
        }
    }
}