module clock_divider_100(
input clk,
output reg clk100
);

reg [6:0] counter = 0; // count to 50 out of 100 and then invert

always @ (posedge clk)
begin
    counter <= counter + 1;
    if (counter == 0)
        clk100 <= 0;
    else if (counter == 50)
        clk100 <= 1;
    else
        clk100 <= clk100;
end
endmodule

