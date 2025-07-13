# Large Scale Systems
This repository contains large-scale systems projects focused on centralized and decentralized control design in MIMO systems.
=========
# First LSS Project
Design of Centralized and Decentralized Controllers for Large-Scale Systems

This project focuses on the modeling, analysis, and control of two types of large-scale multi-input multi-output (MIMO) systems:

🔹 Weakly Coupled System

🔹 Coupled System

For both systems, we compare centralized and decentralized control strategies using Linear Quadratic Regulator (LQR) methods. The simulations are performed in MATLAB, and results are analyzed in terms of performance, control effort, and system stability.

## 🔹Weakly Coupled System
This part investigates a large-scale system with minimal interaction between its subsystems.
### Centralized Control
🔸The system is modeled as a 2×2 transfer function matrix and converted to a minimal state-space representation.

🔸A centralized LQR controller is designed using identity matrices for Q and R.

🔸Simulation (using ode45) shows:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All states converge to zero from a non-zero initial condition.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Control inputs are smooth and bounded.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A cost function measuring total state energy is computed.
   
### Decentralized Control
🔸The system is divided into two subsystems, each with its own local LQR controller.

🔸A block-diagonal controller gain matrix is formed.

🔸Simulation shows:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Effective regulation of system states, slightly slower than centralized control.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Structured and practical control inputs.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cost is higher than centralized but still acceptable.
   
### Summary
🔸Centralized control offers better performance.

🔸Decentralized control provides scalability and ease of implementation in distributed architectures.

## 🔹Coupled System
This part focuses on a system with significant interaction between subsystems — a more complex and realistic scenario.
### Centralized Control
🔸The MIMO system is modeled and converted to state-space form.

🔸An LQR controller is designed with equal weighting on state and input penalties.

🔸Simulation shows:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fast convergence of system states.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Smooth control signals.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Computed cost function reflects high control performance.
   
### Decentralized Control
🔸Subsystems are independently controlled using local LQR designs.

🔸Gain matrices are combined in a block-diagonal form.

🔸Simulation shows:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Acceptable convergence, slightly slower than centralized control.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Structured and bounded control inputs.
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cost is higher than centralized but within limits.
   
### Summary
🔸Centralized design yields better optimal performance.

🔸Decentralized design is advantageous for modular and distributed control applications.
=========
# Second LSS Project
Optimization of Decentralized Control Weighting Using Genetic Algorithms

This project focuses on optimizing the weighting matrix R in decentralized Linear Quadratic Regulator (LQR) controllers for a large-scale weakly coupled system. The main goal is to improve decentralized control performance by tuning the input weighting matrix using Genetic Algorithms (GA).

## Project Overview
The system consists of two interconnected subsystems. Decentralized controllers are designed separately for each subsystem.

The project optimizes the diagonal values of the controller’s input weighting matrix using GA. Two optimization goals are considered:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;🔸Minimizing the difference between the performance costs of centralized and decentralized controllers.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;🔸Minimizing the decentralized controller’s own performance cost directly.

To evaluate the fitness of each candidate solution, the system is simulated over 20 seconds starting from given initial conditions. The cost is calculated based on the energy of the system states throughout the simulation.

## Methodology
🔸Genetic Algorithms search for the best weighting values within a defined range.

🔸For each candidate weighting, decentralized controllers are designed and tested through simulation.

🔸The performance cost is computed from the simulation results and used to guide the optimization.

## Results and Simulation
🔸Optimized decentralized controllers successfully stabilize the system.

🔸Simulated state responses and control inputs demonstrate improved control performance after optimization.

🔸The approach effectively balances control effort and system stability.

## Conclusion
This project shows that Genetic Algorithms are a powerful tool for tuning decentralized controllers in large-scale systems. Optimizing controller parameters enhances performance while maintaining the advantages of decentralized control.
