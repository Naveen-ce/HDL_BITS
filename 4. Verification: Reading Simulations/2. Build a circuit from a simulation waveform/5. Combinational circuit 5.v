module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    
    reg [3:0]q1;
    always@(*) begin
        case(c)
            
            4'h0:q1=b;
            4'h1:q1=e;
            4'h2:q1=a;
            4'h3:q1=d;
            4'h4:q1=4'hf;
            4'h5:q1=4'hf;
            4'h6:q1=4'hf;
            4'h7:q1=4'hf;
            4'h8:q1=4'hf;
            4'h9:q1=4'hf;
            4'ha:q1=4'hf;
            4'hb:q1=4'hf;
            4'hc:q1=4'hf;
            4'hd:q1=4'hf;
            4'he:q1=4'hf;
            4'hf:q1=4'hf;
            
            
            
        endcase
    end
    
    assign q=q1;

endmodule

