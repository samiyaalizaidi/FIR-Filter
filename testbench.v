`timescale 1ns / 1ps

module testbench_fir();
    reg   clock,
          reset;
       
    wire  [7:0] data_sin;
    wire  [16:0] Data_Out;
    
    FIR_filter UUT(clock, reset, data_sin, Data_Out);
    
    initial begin
        clock = 1'b0;
        reset = 1'b1;
        
        #1000
        reset = 1'b0;      
    end
    
    always #500 clock = ~clock;
    
    always @(posedge clock) begin
        // output phase and data_sin values to the simulation logs
        $display("Time: %t, Data_sin: %d, Filtered_Output: %d", $time, data_sin, Data_Out);
    end
    
    // end the simulation after a certain period of time
    initial begin
        #100000; // end simulation after 10000 time units
        $finish;
    end
endmodule
