namespace Solution {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Solve (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        if(p==5){
            QFTLE(inputRegister);  
		}
        if(p==3 or p==7){
            QFTLE(inputRegister);  
            QFTLE(inputRegister);  
            QFTLE(inputRegister);  
		}
        if(p==2 or p == 6 or p == 4 or p == 8){
			using(q = Qubit[2]){
                ApplyToEachCA(H, q);
                Controlled QFTLE([q[0]], inputRegister);
                Controlled QFTLE([q[1]], inputRegister);
                Controlled QFTLE([q[1]], inputRegister);
                Adjoint QFTLE(LittleEndian(q));
                R1(PI()/IntAsDouble(2 * p),q[0]);
                R1(PI()/IntAsDouble(p),q[1]);
                QFTLE(LittleEndian(q));
                Adjoint Controlled QFTLE([q[1]],inputRegister);
                Adjoint Controlled QFTLE([q[1]],inputRegister);
                Adjoint Controlled QFTLE([q[0]],inputRegister);
                ApplyToEachCA(H, q);
			}
		}
    }
}