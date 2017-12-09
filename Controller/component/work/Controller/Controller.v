//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec 09 15:10:28 2017
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Controller
module Controller(
    // Inputs
    UART_0_RXD,
    readline,
    // Outputs
    UART_0_TXD,
    buttons,
    clk100,
    poll_signal,
    prev_readline,
    reset
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        UART_0_RXD;
input        readline;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       UART_0_TXD;
output [7:0] buttons;
output       clk100;
output       poll_signal;
output [9:0] prev_readline;
output       reset;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0] buttons_2;
wire         clk100_net_0;
wire         clock_divider_100_1_clk100;
wire         clock_divider_100_2_clk100;
wire         Controller_MSS_0_FAB_CLK;
wire         poll_signal_net_0;
wire   [9:0] prev_readline_1;
wire         readline;
wire         reset_1;
wire         UART_0_RXD;
wire         UART_0_TXD_0;
wire         UART_0_TXD_0_net_0;
wire         clk100_net_1;
wire         poll_signal_net_1;
wire   [7:0] buttons_2_net_0;
wire         reset_1_net_0;
wire   [9:0] prev_readline_1_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_0_TXD_0_net_0    = UART_0_TXD_0;
assign UART_0_TXD            = UART_0_TXD_0_net_0;
assign clk100_net_1          = clk100_net_0;
assign clk100                = clk100_net_1;
assign poll_signal_net_1     = poll_signal_net_0;
assign poll_signal           = poll_signal_net_1;
assign buttons_2_net_0       = buttons_2;
assign buttons[7:0]          = buttons_2_net_0;
assign reset_1_net_0         = reset_1;
assign reset                 = reset_1_net_0;
assign prev_readline_1_net_0 = prev_readline_1;
assign prev_readline[9:0]    = prev_readline_1_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------clock_divider_100
clock_divider_100 clock_divider_100_0(
        // Inputs
        .clk    ( Controller_MSS_0_FAB_CLK ),
        // Outputs
        .clk100 ( clk100_net_0 ) 
        );

//--------clock_divider_100
clock_divider_100 clock_divider_100_1(
        // Inputs
        .clk    ( clk100_net_0 ),
        // Outputs
        .clk100 ( clock_divider_100_1_clk100 ) 
        );

//--------clock_divider_100
clock_divider_100 clock_divider_100_2(
        // Inputs
        .clk    ( clock_divider_100_1_clk100 ),
        // Outputs
        .clk100 ( clock_divider_100_2_clk100 ) 
        );

//--------Controller_MSS
Controller_MSS Controller_MSS_0(
        // Inputs
        .UART_0_RXD ( UART_0_RXD ),
        // Outputs
        .FAB_CLK    ( Controller_MSS_0_FAB_CLK ),
        .UART_0_TXD ( UART_0_TXD_0 ) 
        );

//--------Read_buttons
Read_buttons Read_buttons_0(
        // Inputs
        .clk           ( Controller_MSS_0_FAB_CLK ),
        .readline      ( readline ),
        .trigger       ( clock_divider_100_2_clk100 ),
        // Outputs
        .prev_readline ( prev_readline_1 ),
        .reset         ( reset_1 ),
        .buttons       ( buttons_2 ) 
        );

//--------Send_Request
Send_Request Send_Request_0(
        // Inputs
        .send_btn    ( clock_divider_100_2_clk100 ),
        .send_pulse  ( clk100_net_0 ),
        // Outputs
        .poll_signal ( poll_signal_net_0 ) 
        );


endmodule
