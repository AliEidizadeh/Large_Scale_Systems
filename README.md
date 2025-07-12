# Large Scale Systems
This repository contains large-scale systems projects focused on centralized and decentralized control design in MIMO systems.

## First LSS Project:

### – Weakly Coupled System
This project explores the design and comparison of centralized and decentralized control strategies for a weakly coupled large-scale system (LSS). The system being studied is a two-input, two-output (MIMO) system represented by a transfer function matrix. The system has weak interactions between its subsystems, which is a common characteristic in many real-world industrial processes.

The first part of the project focuses on the centralized control design. The open-loop system is defined using transfer functions and then converted into its minimal state-space representation. Using this state-space model, a Linear Quadratic Regulator (LQR) controller is designed. The Q and R matrices are chosen as identity matrices to penalize both the system states and control inputs equally. The LQR gain matrix is calculated, and the system is simulated over a 10-second period using MATLAB’s ode45 solver. The system starts from a non-zero initial condition, and the centralized controller successfully drives all the system states to zero. The control signals are smooth and remain within reasonable limits. A cost function is also computed to measure the performance of the control strategy, which integrates the energy of the states over time.

In the second part of the project, a decentralized control strategy is implemented. Instead of a single controller, each part of the system is controlled independently using local information. The overall system is broken into two smaller subsystems, and separate LQR controllers are designed for each. The decentralized gain matrix is constructed by combining these local controllers. The system is again simulated over the same time interval with the same initial conditions. The results show that the decentralized controller can also regulate the system states effectively, although the response is slightly slower compared to the centralized design. The control signals remain structured and practical for implementation. The cost function for the decentralized system is also calculated, and although it is higher than the centralized cost, the performance is still acceptable.

In conclusion, this project demonstrates that both centralized and decentralized LQR controllers can be used effectively for weakly coupled systems. The centralized controller provides better overall performance and lower cost, but the decentralized controller offers advantages in scalability and modularity, making it more suitable for large and complex systems. The results highlight important trade-offs between performance and practical implementation in control system design.

### – Coupled System

This project investigates the design and comparison of centralized and decentralized control strategies for a coupled large-scale system. The system under study is a multi-input multi-output system with interacting subsystems, which is a typical scenario in many engineering applications.

In the first part, a centralized control approach is developed. The system is initially modeled using transfer functions and then transformed into a minimal state-space representation. Based on this model, a Linear Quadratic Regulator (LQR) controller is designed with equal weighting on states and control inputs to balance performance and effort. The system dynamics are simulated over a significant time horizon starting from a non-zero initial condition. The centralized controller effectively drives the system states to stability, while control signals remain smooth and within practical limits. Additionally, a performance cost metric is calculated to quantify the control effectiveness.

The second part implements a decentralized control design, where the system is divided into smaller subsystems, each controlled independently using local state information. Separate LQR controllers are designed for each subsystem, and their gains are combined to form the decentralized control law. Simulations show that the decentralized controller successfully regulates the system states, although the convergence is slightly slower than the centralized case. The control signals remain structured for practical deployment, and the performance cost, while higher than the centralized design, stays within acceptable limits.

Overall, this project demonstrates that both centralized and decentralized LQR control strategies are viable for coupled large-scale systems. The centralized controller achieves better performance and lower cost, whereas the decentralized controller offers benefits in terms of scalability and modularity, which are critical for complex industrial systems. The work highlights the important balance between optimal performance and practical considerations in control system design.

## Second LSS Project:
