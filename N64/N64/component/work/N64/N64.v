//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Dec 04 17:38:03 2017
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// N64
module N64(
    // Inputs
    readline,
    // Outputs
    LED,
    buttons,
    clk100,
    clk1000000,
    poll_signal,
    // Inouts
    GPIO_0_BI
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         readline;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [4:0]  LED;
output [15:0] buttons;
output        clk100;
output        clk1000000;
output        poll_signal;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         GPIO_0_BI;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [15:0] buttons_0;
wire          clk100_net_0;
wire          clk1000000_net_0;
wire          clk1000000_0;
wire          GPIO_0_BI;
wire   [4:0]  LED_net_0;
wire          N64_MSS_0_FAB_CLK;
wire          poll_signal_net_0;
wire          readline;
wire          poll_signal_net_1;
wire   [4:0]  LED_net_1;
wire          clk1000000_net_1;
wire          clk100_net_1;
wire   [15:0] buttons_0_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign poll_signal_net_1 = poll_signal_net_0;
assign poll_signal       = poll_signal_net_1;
assign LED_net_1         = LED_net_0;
assign LED[4:0]          = LED_net_1;
assign clk1000000_net_1  = clk1000000_net_0;
assign clk1000000        = clk1000000_net_1;
assign clk100_net_1      = clk100_net_0;
assign clk100            = clk100_net_1;
assign buttons_0_net_0   = buttons_0;
assign buttons[15:0]     = buttons_0_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------clock_divider_100
clock_divider_100 clock_divider_100_0(
        // Inputs
        .clk    ( N64_MSS_0_FAB_CLK ),
        // Outputs
        .clk100 ( clk100_net_0 ) 
        );

//--------clock_divider_100
clock_divider_100 clock_divider_100_1(
        // Inputs
        .clk    ( clk100_net_0 ),
        // Outputs
        .clk100 ( clk1000000_0 ) 
        );

//--------clock_divider_100
clock_divider_100 clock_divider_100_2(
        // Inputs
        .clk    ( clk1000000_0 ),
        // Outputs
        .clk100 ( clk1000000_net_0 ) 
        );

//--------N64_MSS
N64_MSS N64_MSS_0(
        // Outputs
        .FAB_CLK   ( N64_MSS_0_FAB_CLK ),
        // Inouts
        .GPIO_0_BI ( GPIO_0_BI ) 
        );

//--------Read_buttons
Read_buttons Read_buttons_0(
        // Inputs
        .clk      ( N64_MSS_0_FAB_CLK ),
        .readline ( readline ),
        .trigger  ( clk1000000_net_0 ),
        // Outputs
        .buttons  ( buttons_0 ) 
        );

//--------Send_Request
Send_Request Send_Request_0(
        // Inputs
        .send_btn    ( clk1000000_net_0 ),
        .send_pulse  ( clk100_net_0 ),
        // Outputs
        .poll_signal ( poll_signal_net_0 ),
        .LED         ( LED_net_0 ) 
        );


endmodule
