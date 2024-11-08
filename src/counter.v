// file: counter.v
// 4-bit binary up/down counter with enable 

module counter(sclk, rst_n, en, ud, cnt);
  parameter n = 4;
  input sclk, rst_n, en, ud;
  output reg [n-1:0] cnt;

  always @(posedge sclk, negedge rst_n)
  begin
    if(~rst_n)
      cnt <= 0;
    else if (en)
      if (ud)
        cnt <= cnt + 1;
      else
        cnt <= cnt - 1;
  end
endmodule
