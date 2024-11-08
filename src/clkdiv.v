// file: clkdiv.v
// clock divider 
// test mode: sclk is only 8 times slower than clk

module clkdiv(clk, rst_n, test, sclk);
  parameter n = 26;
  input clk, rst_n, test;
  output sclk;

  reg [n-1:0] count; 
  wire sclk;

  always @(posedge clk, negedge rst_n)
  begin	  
    if (~rst_n)
      count <= 0;
    else
      count <= count + 1;
  end

  assign sclk = test == 0 ? count[n-1] : count[2];

endmodule
