module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
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
                        state<=A;
                    else
                        state<=B;
                end
                
                B:begin
                    if(w)
                        state<=D;
                    else
                        state<=C;
                end
                
                C:begin
                    if(w)
                        state<=D;
                    else
                        state<=E;
                end
                
                D:begin
                    if(w)
                        state<=A;
                    else
                        state<=F;
                end
                
                E:begin
                    if(w)
                        state<=D;
                    else
                        state<=E;
                end
                
                F:begin
                    if(w)
                        state<=D;
                    else
                        state<=C;
                end
                
            endcase
        end
    end
    
    assign z=(state==E) || (state==F);
    
endmodule

