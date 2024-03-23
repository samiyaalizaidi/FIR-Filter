`timescale 1ns / 1ps

module filter(
    clock,
    reset,
    Data_In,
    Data_Out
    );
    
    // PARAMETERS    
    parameter taps        = 32;
    parameter num_bits    = 8;
    parameter input_size  = 8;
    parameter output_size = (2*num_bits) + 1;
    
    // I/O Ports
    input clock,
          reset;
          
    input  [input_size - 1:0] Data_In;
    
    output [output_size - 1:0] Data_Out;
    
    // FILTER COEFFICIENTS
    // 31 + 1 = 32 taps 
    parameter h0  = 8'b0000_0011;
    parameter h1  = 8'b0000_0010;
    parameter h2  = 8'b0000_0001;
    parameter h3  = 8'b0000_0000;
    parameter h4  = 8'b0000_0000;
    parameter h5  = 8'b0000_0000;
    parameter h6  = 8'b0000_0000;
    parameter h7  = 8'b0000_0000;
    parameter h8  = 8'b0000_0000;
    parameter h9  = 8'b0000_0000;
    parameter h10 = 8'b0000_0100;
    parameter h11 = 8'b0000_1100;
    parameter h12 = 8'b0001_0101;
    parameter h13 = 8'b0001_1110;
    parameter h14 = 8'b0010_0101;
    parameter h15 = 8'b0010_1001;
    parameter h16 = 8'b00101001;
    parameter h17 = 8'b0010_0101;
    parameter h18 = 8'b0001_1110;
    parameter h19 = 8'b0001_0101;
    parameter h20 = 8'b0000_1100;
    parameter h21 = 8'b0000_0100;
    parameter h22 = 8'b0000_0000;
    parameter h23 = 8'b0000_0000;
    parameter h24 = 8'b0000_0000;
    parameter h25 = 8'b0000_0000;
    parameter h26 = 8'b0000_0000;
    parameter h27 = 8'b0000_0000;
    parameter h28 = 8'b0000_0000;
    parameter h29 = 8'b0000_0001;
    parameter h30 = 8'b0000_0010;
    parameter h31 = 8'b0000_0011;
    
    reg [output_size - 1:0] FIR [1:taps-1];
    
    assign Data_Out = h0  * Data_In +
                      h1  * FIR[1]  +
                      h2  * FIR[2]  +
                      h3  * FIR[3]  +
                      h4  * FIR[4]  +
                      h5  * FIR[5]  +
                      h6  * FIR[6]  +
                      h7  * FIR[7]  +
                      h8  * FIR[8]  +
                      h9  * FIR[9]  +
                      h10 * FIR[10] +
                      h11 * FIR[11] +
                      h12 * FIR[12] +
                      h13 * FIR[13] +
                      h14 * FIR[14] +
                      h15 * FIR[15] +
                      h16 * FIR[16] +
                      h17 * FIR[17] +
                      h18 * FIR[18] +
                      h19 * FIR[19] +
                      h20 * FIR[20] +
                      h21 * FIR[21] +
                      h22 * FIR[22] +
                      h23 * FIR[23] +
                      h24 * FIR[24] +
                      h25 * FIR[25] +
                      h26 * FIR[26] +
                      h27 * FIR[27] +
                      h28 * FIR[28] +
                      h29 * FIR[29] +
                      h30 * FIR[30] +
                      h31 * FIR[31];
                      
    integer i;
    always @ (posedge clock) begin
        if (reset) begin // initialize the filter
            for (i = 0; i <= taps; i = i + 1) FIR[i] <= 0; 
        end
        
        else begin
            // shift the signal
            FIR[1] <= Data_In;
            for (i = 2; i <= taps; i = i + 1) FIR [i] <= FIR[i - 1];
        end
    end                
  
endmodule
