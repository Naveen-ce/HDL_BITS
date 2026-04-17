module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    reg [98:0] out_both_n;
    reg [99:1] out_any_n;
    reg [99:0] out_different_n;
    
    always@(*) begin
         integer i,j,k;
        
        for(i=0;i<99;i=i+1) begin
            
            out_both_n[i]=in[i]&in[i+1];
        end
        
        for(j=99;j>0;j=j-1) begin
            
            out_any_n[j]=in[j]|in[j-1];
            
        end
        
        for(k=0;k<99;k=k+1) begin
            
            out_different_n[k]=in[k]^in[k+1];
            
        end
        
        out_different_n[99]=in[99]^in[0];
        
    end
    
assign out_both=out_both_n;
assign out_any=out_any_n;
assign out_different=out_different_n;    
        
            
        

endmodule

