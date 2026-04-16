module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] carry;
    
    bcd_fadd fa1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(carry[0]));
    
    genvar i;
    
    generate
        
        for(i=1;i<100;i=i+1) begin : bcd_adder
            
            bcd_fadd fa2(.a(a[i*4+:4]), .b(b[i*4+:4]), .cin(carry[i-1]), .sum(sum[i*4+:4]), .cout(carry[i]));
            
        end
        
    endgenerate
    
    assign cout=carry[99];  
   
endmodule

