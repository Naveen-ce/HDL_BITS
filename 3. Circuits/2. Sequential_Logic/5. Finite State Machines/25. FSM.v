module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4;
    reg [2:0] state,next_state;
    always@(posedge clk) begin
        if(reset)
            state<=A;
        else
            state<=next_state;
    end
    
    always@(*) begin
        case(state)
            A:begin
                if(x)
                    next_state=B;
                else
                    next_state=A;
            end
            
            B:begin
                if(x)
                    next_state=E;
                else
                    next_state=B;
            end
            
            C:begin
                if(x)
                    next_state=B;
                else
                    next_state=C;
            end
            
            D:begin
                if(x)
                    next_state=C;
                else
                    next_state=B;
            end
            
            E:begin
                if(x)
                    next_state=E;
                else
                    next_state=D;
            end
            
            default:next_state=A;
            
        endcase
    end
    
    assign z=(state==D) || (state==E);
        
                   

endmodule

