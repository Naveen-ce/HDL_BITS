module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin   
        
            state<=next_state;// This is a combinational always block
        // State transition logic
    end

    always @(posedge clk, posedge areset) begin   
        
        if(areset)
            next_state<=1;
        else begin
            case(state)
                B:begin
                    if(in)
                        next_state<=B;
                        else
                            next_state<=A;
                end
                
               A:begin
                   if(in)
                       next_state<=A;
                   else
                       next_state<=B;
               end
                
            endcase
        end
                       
                    
                
    end

    // Output logic
    assign out = (state == B);

endmodule

