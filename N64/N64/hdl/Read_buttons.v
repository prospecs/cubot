//`timescale <time_units> / <precision>

module Read_buttons(
input wire clk, // The standard clock
input wire readline, // Serial data in
input wire trigger,
output [15:0] buttons
);

reg [15:0] button_read;
reg reading = 1'b0;
reg [7:0] counter = 8'b00000000;
reg [7:0] limit = 8'b10000000;
reg prev_trigger = 1'b0;
reg q0, q1;

always@(posedge clk)
begin

    q0 <= readline;
    q1 <= q0;

    if(reading)
        button_read <= {button_read[15:0],q1};
    else
        button_read <= button_read;

    if(counter < limit)
        reading <= 1'b1;
    else
        reading <= 1'b0;

    if(~trigger&&prev_trigger)
        counter <= 8'b00000000;
    else
        counter <= counter + 1;
end

assign buttons = button_read;


endmodule