module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;
    
    tff uut(.clk(clk), .reset(reset), .t(t), .q(q));
    
    always #5 clk=~clk;
    
    initial begin
        
        clk=0; reset=1; t=0;
        #15 reset=0;
        #15 t=1;
        
        
    end
        
endmodule

