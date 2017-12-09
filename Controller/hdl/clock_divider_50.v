module clock_divider_50(
input clk,
output reg clk50
);

reg [6:0] counter = 0; // count to 50 out of 100 and then invert

always @ (posedge clk)
begin
    counter <= counter + 1;
    if (counter == 0)
        clk50 <= 0;
    else if (counter == 25)
        clk50 <= 1;
    else
        clk50 <= clk50;
end
endmodule

