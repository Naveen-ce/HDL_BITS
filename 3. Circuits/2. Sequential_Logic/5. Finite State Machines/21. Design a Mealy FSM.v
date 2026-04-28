module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter [1:0] s1=2'd0,s2=2'd1,s3=2'd2;
    reg [1:0] state,next_state;
    
    always@(posedge clk or negedge aresetn) begin
        if(!aresetn)
            state<=s1;
        else 
            state<=next_state;
    end
            
     always@(*) begin
         z=1'b0;
            case(state)
                
                s1:begin
                    if(x)
                        next_state=s2;
                    else
                        next_state=s1;
                end
                
                s2:begin
                    if(x)
                        next_state=s2;
                    else
                        next_state=s3;
                end
                
                s3:begin
                    if(x) begin
                        z=1'b1;
                        next_state=s2;
                    end
                    else
                        next_state=s1;
                end
                
                default:next_state=s1;
                
            endcase
    end
    
endmodule

