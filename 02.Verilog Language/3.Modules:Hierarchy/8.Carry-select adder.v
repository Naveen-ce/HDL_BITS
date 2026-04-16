module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1,sum2,sum3;//sum4;
    wire cout1;
    
    
    add16 a1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum1), .cout(cout1));
    add16 a2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum2));
    add16 a3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum3));
    
    assign sum=cout1?{sum3,sum1}:{sum2,sum1};
    
endmodule

