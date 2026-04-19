module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    wire [15:0][15:0] grid;
    wire [15:0][15:0] next_grid;
    
    assign grid=q;
    
    genvar r,c;
    
    generate
        
        for(r=0;r<16;r=r+1) begin :row
            for(c=0;c<16;c=c+1) begin :coloumn
                
                localparam r_up=(r+15)%16;
                localparam r_down=(r+1)%16;
                localparam c_lft=(c+15)%16;
                localparam c_rgt=(c+1)%16;
                
                
                wire [3:0] sum;
                
                assign sum=grid[r_up][c_lft] + grid[r_up][c] + grid[r_up][c_rgt] +
                    grid[r][c_lft]  + grid[r][c_rgt] +
                    grid[r_down][c_lft] + grid[r_down][c] + grid[r_down][c_rgt];
                
                assign next_grid[r][c]=(grid[r][c]==1'b1)?(sum==2||sum==3):(sum==3);
                 
            end
        end
    endgenerate
    
    always@(posedge clk) begin
        if(load)
            q<=data;
        else
            q<=next_grid;
    end          

endmodule

