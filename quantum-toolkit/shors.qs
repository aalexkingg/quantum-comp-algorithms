namespace Quantum.quantum_toolkit {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    // ------------- Random Number Generator ----------------------

    // TODO: Add comments

    operation RandomNumberInRange(max : Int) : Int {

        mutable output = 0;
        repeat {

            mutable bits = new Result[0];
            for idxBit in 1..BitSizeI(max) {

                set bits += [GenerateRandomBit()];
            }

            set output = ResultArrayAsInt(bits);
        } until (output <= max);

        return output;
    }

    
    operation GenerateRandomBit() : Result {

        use q = Qubit();        // Allocate qubit
        H(q);                   // Put the qubit to superposition - 50% of being a 1 or 0
        return M(q);      // Measure qubit value
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {

        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        return RandomNumberInRange(max);
    }

    // --------------------- Entanglement ------------------------

    operation entanglement() : String {
        
        return "Testing";
    }

    operation SetQubitState(desired : Result, q1 : Qubit) : Unit {

        if desired != M(q1) {

            X(q1);
        }
    }

}
