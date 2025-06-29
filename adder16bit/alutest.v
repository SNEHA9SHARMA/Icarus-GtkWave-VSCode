`timescale 1ns/1ns
`include "alu.v"
module alutest;
    reg [15:0] X,Y;
    wire [15:0] F;
    wire C,P,O,Z,S;
    adder16 DUT(X,Y,F,C,P,O,Z,S);
    initial 
        begin
            $dumpfile("alutest.vcd");
            $dumpvars(0,alutest);
            $monitor($time,"X=%h,Y=%h,F=%h,C=%b,P=%b,O=%b,Z=%b,S=%b",X,Y,F,C,P,O,Z,S);
            #5 X=16'h8fff; Y=16'h8000;
            #5 X=16'hfffe;Y=16'h0002;
            #5 X=16'hAAAA;Y=16'h5555;
            #5 $finish;
        end
    endmodule