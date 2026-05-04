module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2 
    parameter [1:0] SEARCH=2'd0,BYTE1=2'd1,BYTE2=2'd2,BYTE3=2'd3;
    reg [1:0] state,next_state;
    reg [23:0]out;

    // State transition logic (combinational)
    always@(*) begin
        
        case(state)
            
            SEARCH:begin
                if(in[3]) 
                    next_state=BYTE1;
                else
                    next_state=SEARCH;
            end
            
            BYTE1:next_state=BYTE2;
                
            BYTE2:next_state=BYTE3;
               
            
            BYTE3:begin
                if(in[3])
                    next_state=BYTE1;
                else
                    next_state=SEARCH;
            end
            default:next_state=SEARCH;
        endcase
    end
                
    // State flip-flops (sequential)
    always@(posedge clk) begin
        if(reset)
            state<=0;
        else
            state<=next_state;
    end

    always@(posedge clk) begin
        case(state)
            SEARCH:begin 
                if(in[3])
                    out[23:16]<=in;
            end
            BYTE1:out[15:8]<=in;
            BYTE2:out[7:0]<=in;
            BYTE3:begin
                if(in[3])
                    out[23:16]<=in;
            end
                    
        endcase
    end
        
 
    // Output logic
    assign done=(state==BYTE3);


    // New: Datapath to store incoming bytes.
    assign out_bytes=out;

endmodule

