module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] out;
    wire [15:0] sum1,sum2;
    wire cout;
    wire [31:0] sub1;
    
    assign sub1={32{sub}};
    assign out=b^sub1;
    
    add16 a1(.a(a[15:0]), .b(out[15:0]), .cin(sub), .sum(sum1), .cout(cout));
    add16 a2(.a(a[31:16]), .b(out[31:16]), .cin(cout), .sum(sum2));
    
    assign sum={sum2,sum1};
    
endmodule

