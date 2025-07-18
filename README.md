# SystemVerilog 3x3 Unsigned Multiplier (FSM + Datapath)

This project implements a 3x3 unsigned binary multiplier using a Finite State Machine (FSM) and datapath architecture, developed in **SystemVerilog** and simulated using **Active-HDL**.

The design separates the control logic (FSM) from the datapath (registers, ALU, and comparators) and is wrapped in a unified top-level module for simulation.

## 🧩 Project Overview

- **Design Type:** Unsigned 3x3 Binary Multiplier  
- **Architecture:** FSM-Controlled Datapath  
- **Simulation Tool:** Active-HDL  
- **Language:** System-Verilog  
- **Workspace:** `3x3_Mult.aws` (Active-HDL project)

## 🗂️ Included Files

- `3x3_Mult.aws` – Active-HDL workspace containing all modules  
- `Flowchart.png` – Hand-drawn design flowchart illustrating the multiplier logic  

## 📐 Modules

- `MULT_PKG.sv` – Parameter definitions and state configurations  
- `MULT_FSM.sv` – Finite State Machine for control signal generation  
- `MULT_DATAPATH.sv` – Arithmetic unit, registers, and comparator logic  
- `UNS_3X3_MULT.sv` – Top-level module connecting FSM and datapath  

## 🧠 How It Works

1. **FSM** controls the sequence of multiplication steps based on state transitions and comparator output.
2. **Datapath** handles data movement through registers, performs arithmetic operations, and stores the result.
3. The multiplier runs until all bits of the multiplier are processed, and the final result is loaded into the output register.

## 🖼️ Flowchart

The `Flowchart.png` file provides a visual overview of the control flow and logic used in the multiplier design. It helps understand how the FSM and datapath interact across different states.

## 🛠️ Tools Used

- **Active-HDL** – Simulation and design verification  
- **Verilog** – Hardware description language

## 📜 License

This project is licensed under the [MIT License](./LICENSE).

## 👤 Author

**Musanna Tarique**

