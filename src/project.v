/*
 * Claudio Talarico
 * 4-bit up/down binary counter with enable
 */

`default_nettype none

module tt_um_claudiotalarico_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    
 // instantiate top level 
    tiny u1(.clk(clk),
            .rst_n(rst_n),
            .test(ui_in[0]),
            .ud(ui_in[1]),
            .en(ui_in[2]),
            .cnt(uo_out[3:0])
 );  
  
 // All output pins must be assigned. If not used, assign to 0.
 assign uo_out[7:4]  = 0; 
 assign uio_out = 0;
 assign uio_oe  = 0;

 // List all unused inputs to prevent warnings
    wire _unused = &{ena , uio_in , ui_in[3], ui_in[4], ui_in[5], ui_in[6], ui_in[7], 1'b0};

endmodule
