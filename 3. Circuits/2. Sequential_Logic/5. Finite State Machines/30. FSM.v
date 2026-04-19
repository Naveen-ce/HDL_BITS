module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    
    parameter [2:0] A=3'd0,
                    B=3'd1,
                    C=3'd2,
                    D=3'd3,
                    E=3'd4,
                    F=3'd5;
    
    
    reg [2:0] state;
    
    always@(posedge clk) begin
        if(reset)
            state<=A;
        else begin
            case(state)
                
                A:begin
                    if(w)
                        state<=B;
                    else
                        state<=A;
                end
                
                B:begin
                    if(w)
                        state<=C;
                    else
                        state<=D;
                end
                
                C:begin
                    if(w)
                        state<=E;
                    else
                        state<=D;
                end
                
                D:begin
                    if(w)
                        state<=F;
                    else
                        state<=A;
                end
                
                E:begin
                    if(w)
                        state<=E;
                    else
                        state<=D;
                end
                
                F:begin
                    if(w)
                        state<=C;
                    else
                        state<=D;
                end
                
            endcase
        end
    end
    
    assign z=(state==E) || (state==F);
    
endmodule



