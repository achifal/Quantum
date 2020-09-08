namespace Solution {
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Math;
 
    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        return ((4, [0.75]), [ControlledRotation((0, new Int[0]), PauliI, 0)], ([0.0], 0.0));
    }
}