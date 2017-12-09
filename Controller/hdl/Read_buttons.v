//`timescale <time_units> / <precision>

module Read_buttons(
input wire clk, // The standard clock
input wire readline, // Serial data in
output reg [9:0] prev_readline,
output reset,
input wire trigger,
output [7:0] buttons//,
//output 
);

reg [8:0] state;
reg [40:0] button_read;
reg reading = 1'b0;
reg [7:0] counter = 8'b00000000;
reg [7:0] limit = 8'b10100100;
reg q0, q1;

always@(posedge clk)
begin

    prev_readline[9:0] <= {prev_readline[8:0],readline};
    q0 <= readline;
    q1 <= q0;
    if(state == 9'b011001000)
        button_read[40:0] <= {button_read[39:0],readline};
    else
        button_read <= button_read;
    
    if(reset)
        state <= 9'b000000000;
    else if(state >= 9'b110001111)
        state <= state;
    else
        state <= state+1;

end

assign reset = (prev_readline && ~readline);

assign buttons = button_read[7:0];


endmodule