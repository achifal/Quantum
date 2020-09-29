﻿namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        body
        {
            mutable k = 0;
            for(i in 0..Length(qs)-1){
                if(bits0[i] != bits1[i])
                {
                    set k = i;
				}
			}
            H(qs[k]);
            for(i in 0..Length(qs)-1)
            {
				if(i!=k)
                {
                    if(bits0[i]!=bits1[i])
                    {
                        CNOT(qs[k], qs[i]);
                        if(bits0[i] != bits0[k])
                        {
                            X(qs[i]);
						}
					}
                    else
                    {
                        if(bits0[i]==true)
                        {
                            X(qs[i]);              
						}
					}
				}     
			}
        }
    }
}