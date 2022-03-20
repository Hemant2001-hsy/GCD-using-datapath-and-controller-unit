module GCD_test;
reg[15:0]data_in;
reg clk,start;
wire done;

reg [15:0]A,B;
GCD_datapath DP(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);
GCD_controller CON(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk,done,start);

initial
begin
  clk=1'b0;
#3 start=1'b1;
#1000 $finish;
end

always #5 clk=~clk;
initial
  begin
  #12 data_in=143;
  #10 data_in=78;
end

initial
begin
$monitor($time,"$d %b",DP.Aout,done);
end
endmodule
