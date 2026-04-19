module top_module (
    input clk,
    input d,
    output q
);
    reg posedg,negedg;
    always@(posedge clk) begin
       posedg<=d;
    end
    
    always@(negedge clk) begin
       negedg<=d;
    end
    assign q=clk?posedg:negedg;
endmodule

