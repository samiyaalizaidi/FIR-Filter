`timescale 1ns / 1ps

module FIR_filter( 
    // TOP LEVEL MODULE 
    clock,     // clock @ 1MHz
    reset,     // reset signal
    data_sin,  // output sine wave values
    Data_Out   // filtered output
    );    
        
    parameter num_bits    = 8;
    parameter input_size  = 8;
    parameter output_size = (2*num_bits) + 1;
    
    input   clock,
            reset;
    
    output [input_size - 1:0] data_sin;
    
    wire [9:0] phase; // 10 bit phase register from the phase accumulator

    
    output [output_size - 1:0] Data_Out;
    
    phase_accumulator            accumulator_inst (clock, reset, phase);
    phase_to_amplitude_converter converter_inst   (reset, phase, data_sin);
    filter                       fir(clock, reset, data_sin, Data_Out);
endmodule
