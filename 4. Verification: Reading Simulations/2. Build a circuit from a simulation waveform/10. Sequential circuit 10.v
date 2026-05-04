module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always@(posedge clk) begin
        if(a&&b)
            state<=1'b1;
        else if (!a&&!b)
            state<=1'b0;
    end
    
    always@(*) begin
        if(state==1'b0)
            q=a^b;
        else
            q=~(a^b);
    end
    
endmodule

