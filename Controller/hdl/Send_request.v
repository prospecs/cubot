// Send_Request.v
module Send_Request(
input wire send_btn, 
input wire send_pulse, // The standard clock
//output [4:0] LED,
output wire poll_signal // Result of input pin when direction is 0   
//inout  controller_signal     // The i/o port to send data through
);

reg [35:0] poll = 36'b111011101110111011101110111010001000;//36'b000100010001000100010001000101110111;
reg  direction = 1; // Direction of io, 1 = set output, 0 = read input
reg  prev_btn = 0;
//assign LED[0] = direction;
//assign LED[4:1] = poll[35:32];

always @(posedge send_pulse)
begin
    if(~send_btn&prev_btn)
        poll <= 36'b111011101110111011101110111010001000;// 36'b000100010001000100010001000101110111;
    else
        poll <= poll << 1;// Data to send out when direction is 1
    direction <= poll[35]|poll[34]|poll[33]|poll[32];
    prev_btn <= send_btn;
end

assign poll_signal = poll[35];
//assign controller_signal = direction ? poll[35] : 1'bz;
//assign poll_signal = controller_signal;

endmodule