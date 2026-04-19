// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter A=0,
              B=1;
    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset)  
            present_state<=B;
        else
            present_state<=next_state;
        
    end
    
    always@(*) begin
 
        case (present_state)
                
                B: begin
                    if(in) 
                        next_state=B;
                    else
                        next_state=A;
                end
                
                A: begin
                    if(in)
                        next_state=A;
                    else
                        next_state=B;
                end
                
            endcase

            case (present_state)
                B:out=1'b1;
                A:out=1'b0;
                default:out=1'b0;
            endcase
        
    end
endmodule

