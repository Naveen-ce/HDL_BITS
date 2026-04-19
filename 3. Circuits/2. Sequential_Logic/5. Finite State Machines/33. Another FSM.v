module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    parameter [3:0] A=4'd0,
                    A1=4'd1,
                    B=4'd2,
                    C=4'd3,
                    D=4'd4,
                    CH1=4'd5,
                    CH2=4'd6,
                    PERM1=4'd7,
                    PERM2=4'd8;
    
    reg [3:0] state,next_state;
    
    always@(posedge clk) begin
        if(!resetn)
            state<=A;
        else
            state<=next_state;
    end
    
    always@(*) begin
       
            case(state)
                
                A:next_state=A1;
                A1:next_state=B;
                   
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
                        next_state=D;
                end
                
                D:begin
                    if(x)
                        next_state=CH1;
                    else
                        next_state=B;
                end
                
                CH1: begin
                    if(y) 
                         next_state=PERM1;
                    else
                         next_state=CH2;
                end
                
                CH2:begin
                    if(y)
                        next_state=PERM1;
                    else
                        next_state=PERM2;
                end
                
                PERM1:next_state=PERM1;
                PERM2:next_state=PERM2;
                
                default:next_state=A;
              
            endcase
    end
    
    assign f=(state==A1);
    assign g=(state==CH1) || (state==CH2) || (state==PERM1);
endmodule
                    
                
                
                
                
                    
                        
                
                
                    
                    



