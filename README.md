# Large Scale Systems
This repository contains large-scale systems projects focused on centralized and decentralized control design in MIMO systems.

# First LSS Project
Design of Centralized and Decentralized Controllers for Large-Scale Systems

This project focuses on the modeling, analysis, and control of two types of large-scale multi-input multi-output (MIMO) systems:
🔹 Weakly Coupled System
🔹 Coupled System
For both systems, we compare centralized and decentralized control strategies using Linear Quadratic Regulator (LQR) methods. The simulations are performed in MATLAB, and results are analyzed in terms of performance, control effort, and system stability.

## 🔹Weakly Coupled System
This part investigates a large-scale system with minimal interaction between its subsystems.
### Centralized Control
-The system is modeled as a 2×2 transfer function matrix and converted to a minimal state-space representation.

-A centralized LQR controller is designed using identity matrices for Q and R.

-Simulation (using ode45) shows:

   All states converge to zero from a non-zero initial condition.
   Control inputs are smooth and bounded.
   A cost function measuring total state energy is computed.
### Decentralized Control
-The system is divided into two subsystems, each with its own local LQR controller.

-A block-diagonal controller gain matrix is formed.

-Simulation shows:

   Effective regulation of system states, slightly slower than centralized control.
   Structured and practical control inputs.
   Cost is higher than centralized but still acceptable.
### Summary
-Centralized control offers better performance.

-Decentralized control provides scalability and ease of implementation in distributed architectures.

## 🔹Coupled System
This part focuses on a system with significant interaction between subsystems — a more complex and realistic scenario.
### Centralized Control
-The MIMO system is modeled and converted to state-space form.
-An LQR controller is designed with equal weighting on state and input penalties.
-Simulation shows:
   Fast convergence of system states.
   Smooth control signals.
   Computed cost function reflects high control performance.
### Decentralized Control
-Subsystems are independently controlled using local LQR designs.
-Gain matrices are combined in a block-diagonal form.
-Simulation shows:
   Acceptable convergence, slightly slower than centralized control.
   Structured and bounded control inputs.
   Cost is higher than centralized but within limits.
### Summary
-Centralized design yields better optimal performance.
-Decentralized design is advantageous for modular and distributed control applications.
