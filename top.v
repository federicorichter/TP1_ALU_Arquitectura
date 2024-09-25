module TopModule #(
    parameter DATA_WIDTH = 8,  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6   // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [((DATA_WIDTH > MODE_WIDTH ? DATA_WIDTH : MODE_WIDTH )) - 1:0] i_data_bus,  // DATA_WIDTH bits de datos + diferencia absoluta
    input wire i_refresh,
    input wire i_load_A,
    input wire i_load_B,
    input wire i_load_op,
    input wire i_clk,
    output wire signed [DATA_WIDTH-1:0] o_result
);

    wire signed [DATA_WIDTH-1:0] A_wire, B_wire;
    wire [MODE_WIDTH-1:0] mode_wire;
    wire signed [DATA_WIDTH-1:0] output_alu;
    reg signed [DATA_WIDTH-1:0] output_res;

    ControlUnit #(
        .DATA_WIDTH(DATA_WIDTH),
        .MODE_WIDTH(MODE_WIDTH)
    ) control_unit_inst (
        .i_data_bus(i_data_bus),
        .i_clk(i_clk),
        .i_load_A(i_load_A),
        .i_load_B(i_load_B),
        .i_load_op(i_load_op),
        .o_A(A_wire),
        .o_B(B_wire),
        .o_mode(mode_wire)
    );

    ALU #(
        .DATA_WIDTH(DATA_WIDTH),
        .MODE_WIDTH(MODE_WIDTH)
    ) alu_inst (
        .i_A(A_wire),
        .i_B(B_wire),
        .i_mode(mode_wire),
        .o_result(output_alu)
    );

    always @(posedge i_clk ) begin
        if(i_refresh) begin
            output_res <= output_alu;  // Asignar el resultado si i_refresh está en alto
        end
        
    end

    assign o_result = output_res;

endmodule
