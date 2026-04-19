module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0,B=1;
    reg [1:0] state;
    wire [1:0] next_state;
    
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=2'b01;
        else
            state<=next_state;
    end
    
    assign next_state[A]=(state[A]&~x);
    assign next_state[B]=(state[A]&x) | (state[B]&x) | (state[B]&~x);
    
    assign z=(state[A]&x) | (state[B]&~x);

endmodule

