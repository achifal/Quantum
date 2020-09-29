﻿namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable flag1 = false;
        mutable flag2 = false;
        mutable flag3 = false;
        using(qs = Qubit[4]){
            X(qs[0]);
            X(qs[3]);
            unitary(qs[0..1]);
            unitary(qs[2..3]);
            set flag1 = M(qs[0]) == One;
            set flag2 = M(qs[1]) == One;
            if(flag1 and flag2){
                X(qs[0]);
                X(qs[1]);
                X(qs[3]);     
			}
            elif(!flag1 and flag2){
                X(qs[1]);
                X(qs[2]);
			}
            else{
                set flag3 = M(qs[2]) == Zero;
                if(flag3){
                    X(qs[0]);
                    X(qs[3]);       
				}
                else{
                    X(qs[0]);        
                    X(qs[2]);        
                    X(qs[3]);        
				}
			}
		}
        if(flag1 and flag2){
                return 1;     
			}
            elif(!flag1 and flag2){
                return 3;
			}
            else{
                if(flag3){
                    return 0;        
				}
			}
        return 2;
    }
}