// dff: D flip-flop
// Parametrized N; default of 1

module dff 
(
d,  
clk, 
q);
parameter N = 1;
input clk;
input [N-1:0] d;
output [N-1:0] q;
reg [N-1:0] q;
always @ (posedge clk) 
q <= d;
endmodule

// dffr: D flip-flop with active high synchronous reset
// Parametrized N; default of 1
module dffr 
(
d, 
r, 
clk, 
q);
parameter N = 1;
input r;
input clk;
input [N-1:0] d;
output [N-1:0] q;
reg [N-1:0] q;
always @ (posedge clk) 
if ( r ) 
q <= {N{1'b0}};
else
q <= d;
endmodule


// dffre: D flip-flop with active high enable and reset
// Parametrized N; default of 1
module dffre
(
d,
en,
r,
clk,
q
);
parameter N = 1;
input en;
input r;
input clk;
input [N-1:0] d;
output [N-1:0] q;
reg [N-1:0] q;
always @ (posedge clk)
if ( r )
q <= {N{1'b0}};
else if (en)
q <= d;
else q <= q;
endmodule



