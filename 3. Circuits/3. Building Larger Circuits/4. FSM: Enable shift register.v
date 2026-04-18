module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter [2:0] s1=3'd0,
    s2=3'd1,
    s3=3'd2,
    s4=3'd3,
    DONE=3'd4;
    
    reg[2:0] state;
    always@(posedge clk) begin
        if(reset)
            state<=s1;
        else begin
            case(state)
                s1:state<=s2;
                s2:state<=s3;
                s3:state<=s4;
                s4:state<=DONE;
                DONE:state<=DONE;
                default:state<=s1;
            endcase
        end
    end
    assign shift_ena=(state!=DONE);
endmodule

