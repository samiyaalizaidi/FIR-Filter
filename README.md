# Low Pass Filter Using Verilog HDL

Designing a system that acts as a low-pass filter in Verilog.

## Tools Used
- Filter Design & Analysis Tool (``FDATool``) in ``MATLAB 2023a``.
- ``Xilinx Vivado v2020.1`` for designing and synthesizing the system.

## Architecture

### Designing the Low-Pass Filter 
To obtain the filter coefficients, MATLAB's FDATool was used. Along with this, I applied some other preprocessing steps before using these values;
  1. Replace all negative values with zeros.
  2. Scale all numbers by a factor of ``255``. This number was chosen because all coefficients had to be represented in 8 bits according to the specifications
  3. Round all numbers to the nearest integer.

     
### Convolution Module

## Input Signals & Results

---

**Contributors**
All of the code in this repository was written by Samiya Ali Zaidi.
