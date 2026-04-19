
module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    parameter [1:0]  A=2'd0,B=2'd1,C=2'd2;
    
    reg [1:0] state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=A;
        else
            state<=next_state;
    end
    
    always@(*)begin
        case(state)
            
            A:begin
                if(x)
                    next_state=B;
                else
                    next_state=A;
            end
            
            B:begin
                if(x)
                    next_state=C;
                else
                    next_state=B;
            end
                
            C:begin
                if(x)
                    next_state=C;
                else
                    next_state=B;
            end
                
            default:next_state=A;
        endcase
    end
    
    assign z=(state==B);
    
endmodule

