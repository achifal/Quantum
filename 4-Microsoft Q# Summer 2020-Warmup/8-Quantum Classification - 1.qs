﻿namespace Solution {
    open Microsoft.Quantum.MachineLearning;
 
    operation Solve () : (ControlledRotation[], (Double[], Double)) {
        return ([
        ControlledRotation((0, new Int[0]), PauliX, 0)
    ], ([3.1415926], -0.01064999));
    }
}