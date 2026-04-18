module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    
    parameter [1:0] s1=2'b00,
                    s2=2'b01,
                    s3=2'b10,
                    s4=2'b11;
    
    reg[1:0] state;//next_state;
    always@(posedge clk) begin
        if(reset) begin
            state<=s1;
            start_shifting<=1'b0;
        end
        else begin
                
        case(state)
            
            s1:begin
                if(data)
                    state<=s2;
                else
                    state<=s1;
            end
            
            s2:begin
                if(data)
                    state<=s3;
                else
                    state<=s1;
            end
            
            s3:begin
                if(data)
                    state<=s3;
                else
                    state<=s4;
            end
            
            s4:begin
                if(data) begin
                    state<=s1;
                    start_shifting<=1'b1;
                end
                
                    
                else
                    state<=s1;
            end
        endcase
        end
    end
   
endmodule

