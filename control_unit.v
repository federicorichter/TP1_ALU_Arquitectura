module ControlUnit #(
    parameter DATA_WIDTH = 8,  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6   // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [((DATA_WIDTH > MODE_WIDTH ? DATA_WIDTH: MODE_WIDTH )) - 1:0]  i_data_bus,  // DATA_WIDTH bits de datos + diferencia absoluta
    input wire i_load_A,
    input wire i_load_B,
    input wire i_load_op,
    input wire i_clk,
    output reg signed [DATA_WIDTH-1:0] o_A,
    output reg signed [DATA_WIDTH-1:0] o_B,
    output reg [MODE_WIDTH-1:0] o_mode
);

    always @(posedge i_clk) begin
        if(i_load_A) begin
            o_A <= i_data_bus[DATA_WIDTH - 1:0];
        end
        else if(i_load_B) begin
            o_B <= i_data_bus[DATA_WIDTH - 1:0];
        end
        else if(i_load_op) begin
            o_mode <= i_data_bus[MODE_WIDTH - 1:0];
        end
    end

endmodule
