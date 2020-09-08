namespace Solution {
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Math;
 
    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        return ((1, [0.5, 0.0]), [ControlledRotation((0, [1]), PauliY, 0), ControlledRotation((1, [0]), PauliX, 0),
        ControlledRotation((0, new Int[0]), PauliX, 1), ControlledRotation((1, [0]), PauliX, 0),
        ControlledRotation((0, new Int[0]), PauliX, 1)], ([-53.65203370993716,-36.84019421044606], -0.3532877900701873));
    }
}