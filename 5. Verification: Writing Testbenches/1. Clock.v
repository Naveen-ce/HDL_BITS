module top_module ( );
    reg clk;
    dut dt(.clk(clk));
    
    always #5 clk=~clk;
    
    initial begin
        
        clk=0;
        
    end
   
endmodule

