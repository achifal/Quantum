namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Extensions.Convert;
    open Microsoft.Quantum.Canon;
 
    operation Solve (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        QFTLE(inputRegister);
        if(p%2 == 0){
            QFTLE(inputRegister);  
		}
        if(p%4 == 0 or p%4 == 3){
            QFTLE(inputRegister);
            QFTLE(inputRegister);
		}
    }
}