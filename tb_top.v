`timescale 1ns / 1ps

module tb_top_alu;

localparam DATA_WIDTH = 8;
localparam MODE_WIDTH = 6;

reg signed  [DATA_WIDTH+1:0] i_data_bus;
reg i_refresh;
reg i_rst;
reg i_load_A;
reg i_load_B;
reg i_load_op;

wire signed  [DATA_WIDTH-1:0] o_A;
wire signed  [DATA_WIDTH-1:0] o_B;
wire signed  [DATA_WIDTH-1:0] o_result;

TopModule #(
    .DATA_WIDTH(DATA_WIDTH),
    .MODE_WIDTH(MODE_WIDTH)
) dut(
    .i_data_bus(i_data_bus),
    .i_refresh(i_refresh),
    .i_load_A(i_load_A),
    .i_load_B(i_load_B),
    .i_load_op(i_load_op),
    .o_A(o_A),
    .o_B(o_B),
    .o_result(o_result)
);

initial begin
   /* i_rst = 1;
    #10;
    i_rst = 0;
    i_refresh = 0;
    i_data_bus = 10'b0010000000; // cargamos a = -1
    #10;
    i_data_bus = 10'b0100000001; // cargamos b = 1
    #10;
    i_data_bus = 10'b1000100000;// selecccionamos operación de suma (a + b)
    #10;
    i_refresh = 1; //posedge refresh
    #10;
    i_refresh = 0;
    ////////////////////////////
    #10;
    i_data_bus = 10'b0000001001; //9
    #10;
    i_data_bus = 10'b0101001000; //72
    #10;
    i_data_bus = 10'b1011100010;// a-b
    #5;
    i_refresh = 1;
    #5;
    i_refresh = 0;
    //////////////////////////////
    #10;
    i_data_bus = 10'b0000000001; //1
    #10;
    i_data_bus = 10'b0100011001; //25
    #10;
    i_data_bus = 10'b1000100010;//1+1

    #20;*/
    i_load_A = 0;
    i_load_B = 0;
    i_load_op = 0;
    i_refresh = 0;
    i_data_bus = 8'b10000010; // cargamos a = -1
    i_load_A = 1;
    #10;
    i_load_A = 0;
    i_data_bus = 8'b00000001; // cargamos b = 1
    i_load_B = 1;
    #10;
    i_load_B = 0;
    i_data_bus = 8'b00100000;// selecccionamos operación de suma (a + b)
    i_load_op = 1;
    #10;
    i_load_op = 0;
    i_refresh = 1; //posedge refresh
    #10;
    i_refresh = 0;


    $finish;

end

endmodule
