module top_module (
    input clk,
    input x,
    output z
); 
  wire q1,q2,q3;
  wire d1,d2,d3;
    
  assign d1=x^q1;
  assign d2=(x&(~q2));
  assign d3=(x|(~q3));  
    
    d_ff d4(.clk(clk), .d(d1), .q(q1));
    d_ff d5(.clk(clk), .d(d2), .q(q2));
    d_ff d6(.clk(clk), .d(d3), .q(q3));
    
    assign z=~(q1|q2|q3);
    
endmodule

module d_ff(input clk,d,
            output q);
    
    always@(posedge clk) begin
        q<=1'b0;
        
        q<=d;
        
    end
    
endmodule
        
            

