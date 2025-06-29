module fullAdder(s,cout,a,b,cin);
    input a,b,cin;
    output s,cout;
    wire s1,c1,c2;
    xor G1(s1,a,b),G2(s,s1,cin),G3(cout,c1,c2);
    and F1(c1,a,b), F2(c2,s1,cin);
endmodule


module adder4(S,cout,A,B,cin);
    input [3:0] A,B;
    input cin;
    output [3:0] S;
    output cout;
    wire  c1,c2,c3;
    fullAdder FA0(S[0],c1,A[0],B[0],cin);
    fullAdder FA1(S[1],c2,A[1],B[1],c1);
    fullAdder FA2(S[2],c3,A[2],B[2],c2);
    fullAdder FA3(S[3],cout,A[3],B[3],c3);
endmodule


module adder16(X,Y,Z,Carry,Parity,Overflow,Zero,Sign);
    input [15:0] X,Y;
    output [15:0] Z;
    output Carry, Parity, Overflow, Zero, Sign;
    wire c[3:1];
    
    adder4 S0(Z[3:0],c[1],X[3:0],Y[3:0],1'b0);
    adder4 S1(Z[7:4],c[2],X[7:4],Y[7:4],c[1]);
    adder4 S2(Z[11:8],c[3],X[11:8],Y[11:8],c[2]);
    adder4 S3(Z[15:12],Carry,X[15:12],Y[15:12],c[3]);
    assign Sign=Z[15];
    assign Zero=~&Z;
    assign Parity=~^Z;
    assign Overflow=(X[15] & Y[15] & ~Z[15]) | (~X[15] & ~Y[15] & Z[15]);


endmodule
    
