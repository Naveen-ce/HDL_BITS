module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    reg [15:0] out_n;
    
    always@(*) begin
        case(sel)
            
            4'd0:out_n=a;
            4'd1:out_n=b;
            4'd2:out_n=c;
            4'd3:out_n=d;
            4'd4:out_n=e;
            4'd5:out_n=f;
            4'd6:out_n=g;
            4'd7:out_n=h;
            4'd8:out_n=i;
            
            default:out_n='1;
        endcase
    end
    
  assign out=out_n;
    
endmodule

