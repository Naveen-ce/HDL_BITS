module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    reg p1;
    always@(clock) begin
        
        if(clock)
        p<=a;
      
        
    end
    
    always@(negedge clock)begin
        q<=a;
    end

endmodule

