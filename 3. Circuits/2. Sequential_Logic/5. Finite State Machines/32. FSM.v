module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter [1:0] A=2'd0, 
                    B=2'd1,
                    C=2'd2,
                    D=2'd3;
     
    reg [1:0] state,next_state;
    always@(posedge clk) begin
        if(!resetn)
            state<=A;
        else
            state<=next_state;
    end
    
    always@(*) begin
        
        next_state=state;
        g=3'b000;
        
        case(state)
            
            A:begin
                if(r[1])
                    next_state=B;
                else if(r[2])
                    next_state=C;
                else if(r[3])
                    next_state=D;
                else
                    next_state=A;
            end
            
             
            B:begin
                g[1]=1'b1;
                if(r[1])
                    next_state=B;
                else
                    next_state=A;
            end
            
            C:begin
                g[2]=1'b1;
                if(r[2])
                    next_state=C;
                else
                    next_state=A;
            end
            
            D:begin
                g[3]=1'b1;
                if(r[3])
                    next_state=D;
                else
                    next_state=A;
            end
            
            default:next_state=A;
            
        endcase
    end
 
endmodule

