module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    
    always@(posedge clk) begin
        if(!resetn)
            q<=8'b0;
    else begin
        if(byteena[1]&&byteena[0])
            q<={d[15:8],d[7:0]};
    
        else if(byteena[1])
            q<={d[15:8],q[7:0]};
        
        else if(byteena[0])
            q<={q[15:8],d[7:0]};
        
    end
    end
    

endmodule

