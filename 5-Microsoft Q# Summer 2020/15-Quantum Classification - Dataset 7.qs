﻿namespace Solution {
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Math;
 
    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        return ((1, [0.69, 0.31]), [ControlledRotation((0, new Int[0]), PauliX, 0),
        ControlledRotation((1, new Int[0]), PauliX, 0),
        ControlledRotation((0, [1]), PauliY, 1),
        ControlledRotation((1, [0]), PauliY, 0),
        ControlledRotation((0, [1]), PauliY, 2),
        ControlledRotation((0, [1]), PauliY, 0),
        ControlledRotation((0, new Int[0]), PauliX, 0),
        ControlledRotation((1, new Int[0]), PauliX, 0)], ([735086.6415926536,300.0,20.0], 0.3850941));
    }
}