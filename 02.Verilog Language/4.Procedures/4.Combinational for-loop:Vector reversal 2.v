
module top_module( 
    input [99:0] in,
    output [99:0] out
);

    always@(*) begin
        
        integer i;
        
        for(i=0;i<100;i=i+1) begin
            
            out={out[98:0],in[i]};
        end
        
    end
      
endmodule



