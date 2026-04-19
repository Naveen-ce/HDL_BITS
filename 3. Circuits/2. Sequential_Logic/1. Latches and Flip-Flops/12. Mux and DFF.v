module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire out1,out2;
    
    assign out1=E?w:Q;
    assign out2=L?R:out1;
    
    always@(posedge clk) begin
        
        Q<=out2;
        
    end

endmodule

