// Send_Request.v
module Send_Request(
input wire send_btn, 
input wire send_pulse, // The standard clock
inout T1R0,
output [1:0] LED,
output wire poll_signal, // Result of input pin when direction is 0   
inout  io_port     // The i/o port to send data through
);

reg [35:0] poll = 36'b000100010001000100010001000101110111;
reg [6:0] counter;
reg  direction = 1; // Direction of io, 1 = set output, 0 = read input
assign LED[0] = send_btn;

always @(posedge send_pulse)
begin
    if(~send_btn)
        poll <= 36'b000100010001000100010001000101110111;
    else
        poll <= poll << 1;// Data to send out when direction is 1
end

assign LED[1] = ~poll_signal;

assign io_port = direction ? poll[35] : 1'bz;
assign poll_signal = poll[35];

always @ (posedge clk)
begin
   b <= io_port;
   a <= data_in;
end



endmodule