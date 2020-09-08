namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
 
    operation Solve (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable flag = false;
        using(q = Qubit()){
            mutable an = theta;
            for(i in 0..30){
                set an = theta;
                if(not (an > PI()/3.0)){
                    repeat{
                        unitary(q);
                        set an += theta;
		            }
                    until(an > PI()/3.0);
		        }
                else{
                    unitary(q);        
				}
                if(M(q) == One){
                    X(q);
                    set flag = true;           
				} 
		    }
            Reset(q);
	    }
        return flag ? 1 | 0;
    }
}