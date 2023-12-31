﻿namespace Quantum.Grover_s_Algorithm {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays;
    

    operation HelloQ () : Unit {
        Message("Hello quantum world!");
    }

    operation ReflectAboutUniform(inputQubits : Qubit[]) : Unit {

        within {
            ApplyToEachA(H, inputQubits);
            ApplyToEachA(X, inputQubits);
        } apply {
            Controlled Z(Most(inputQubits), Tail(inputQubits));
        }
    }

    @EntryPoint()
    operation RunGroverSearch(register : Qubit[], phaseOracle : (Qubit[]) => Unit is Adj, iterations : Int) : Unit {

        // Prepare register into uniform superposition
        ApplyToEach(H, register);

        // Start Grover's loop
        for _ in 1 .. iterations {

            // Apply phase oracle for the task
            phaseOracle(register);

            // Apply Grover's diffusion operator
            ReflectAboutUniform(register);
        }
    }
}
