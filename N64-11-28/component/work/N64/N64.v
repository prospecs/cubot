//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Nov 28 17:39:48 2017
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// N64
module N64(
    // Inputs
    PB_in,
    // Outputs
    FAB_CLK,
    LED,
    clk100,
    poll_signal
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        PB_in;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       FAB_CLK;
output [1:0] LED;
output       clk100;
output       poll_signal;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         clk100_net_0;
wire         debouncer_0_PB_out;
wire         FAB_CLK_net_0;
wire   [1:0] LED_net_0;
wire         PB_in;
wire         poll_signal_net_0;
wire         poll_signal_net_1;
wire   [1:0] LED_net_1;
wire         clk100_net_1;
wire         FAB_CLK_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign poll_signal_net_1 = poll_signal_net_0;
assign poll_signal       = poll_signal_net_1;
assign LED_net_1         = LED_net_0;
assign LED[1:0]          = LED_net_1;
assign clk100_net_1      = clk100_net_0;
assign clk100            = clk100_net_1;
assign FAB_CLK_net_1     = FAB_CLK_net_0;
assign FAB_CLK           = FAB_CLK_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------clock_divider_100
clock_divider_100 clock_divider_100_0(
        // Inputs
        .clk    ( FAB_CLK_net_0 ),
        // Outputs
        .clk100 ( clk100_net_0 ) 
        );

//--------debouncer
debouncer debouncer_0(
        // Inputs
        .clk    ( FAB_CLK_net_0 ),
        .PB_in  ( PB_in ),
        // Outputs
        .PB_out ( debouncer_0_PB_out ) 
        );

//--------N64_MSS
N64_MSS N64_MSS_0(
        // Outputs
        .FAB_CLK ( FAB_CLK_net_0 ) 
        );

//--------Send_Request
Send_Request Send_Request_0(
        // Inputs
        .send_btn    ( debouncer_0_PB_out ),
        .send_pulse  ( clk100_net_0 ),
        // Outputs
        .poll_signal ( poll_signal_net_0 ),
        .LED         ( LED_net_0 ) 
        );


endmodule
