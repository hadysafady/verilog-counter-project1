# 🔢 Verilog 4-bit Counter with Testbench

A beginner-friendly Verilog project demonstrating a simple 4-bit counter, fully verified with a self-checking testbench and uploaded as a version-controlled Vivado project.

---

## Project Purpose  
To learn and practice:
- Writing Verilog modules (4-bit counter)
- Creating a testbench with:
  - Monitor
  - Reference model (expected counter)
  - Scoreboard comparison
  - Coverage collection
- Using `$display` and `$fatal` for test feedback
- Simulating in Vivado and analyzing waveforms
- Managing project with Git & GitHub

---

## Files
- `Task1.v` – The Verilog RTL code for the 4-bit counter.
- `TB_task1.v` – The testbench file with assertions, monitors, and coverage tracking.
- Vivado project files.

---

## Simulation & Output
Run the behavioral simulation in Vivado. The console will show:
- `Coverage Report` – statistics for `EN` and `rst` scenarios
- Any mismatches between actual and expected output with time-stamped `$display` messages

---

## Requirements
- Vivado 2019.1 or later
- Git (for project versioning)
