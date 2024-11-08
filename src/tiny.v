// tiny.v
// top level

module tiny(rst_n, clk, ud, en, test, cnt);
  parameter n = 4;
  input rst_n, clk, ud, en, test;
  output [n-1:0] cnt;

  wire sclk;

  //instantiate clkdiv
  clkdiv u1(.clk(clk),.rst_n(rst_n),.test(test),.sclk(sclk));

  //instantiate counter
  counter u2(.sclk(sclk),.rst_n(rst_n),.en(en),.ud(ud),.cnt(cnt));

endmodule
