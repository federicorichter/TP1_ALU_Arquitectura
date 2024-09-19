module ControlUnit #(
    parameter DATA_WIDTH = 8,  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6   // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [(DATA_WIDTH + (DATA_WIDTH > MODE_WIDTH ? DATA_WIDTH - MODE_WIDTH : MODE_WIDTH - DATA_WIDTH)):0] i_data_bus,  // DATA_WIDTH bits de datos + diferencia absoluta
    output reg signed [DATA_WIDTH-1:0] o_A,
    output reg signed [DATA_WIDTH-1:0] o_B,
    output reg [MODE_WIDTH-1:0] o_mode
);

    localparam CONTROL_WIDTH = (DATA_WIDTH > MODE_WIDTH) ? (DATA_WIDTH - MODE_WIDTH) : (MODE_WIDTH - DATA_WIDTH);  // Calcula la diferencia absoluta

    reg [CONTROL_WIDTH:0] control_bits;

    always @(*) begin
        // Separar los bits de control y los datos
        control_bits = i_data_bus[(DATA_WIDTH + CONTROL_WIDTH):(DATA_WIDTH)];
        case (control_bits)
            3'b000: o_A = i_data_bus[(DATA_WIDTH-1):0];  // Cargar A
            3'b001: o_B = i_data_bus[(DATA_WIDTH-1):0];  // Cargar B
            3'b010: o_mode = i_data_bus[MODE_WIDTH-1:0];  // Cargar modo de operación
            default: begin
                o_A = {DATA_WIDTH{1'b0}};
                o_B = {DATA_WIDTH{1'b0}};
                o_mode = {MODE_WIDTH{1'b0}};
            end
        endcase
    end

endmodule


module ALU #(
    parameter DATA_WIDTH = 8  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6  // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [DATA_WIDTH-1:0] i_A,
    input wire signed [DATA_WIDTH-1:0] i_B,
    input wire [MODE_WIDTH-1:0] i_mode,
    output wire signed [2*DATA_WIDTH-1:0] o_result
);

    reg signed [2*DATA_WIDTH-1:0] result_reg;

    assign o_result = result_reg;

    always @(*) begin
        case (i_mode)
            6'b100000: result_reg = i_A + i_B;  // Suma
            6'b100010: result_reg = i_A - i_B;  // Resta
            6'b100100: result_reg = i_A & i_B;  // AND
            6'b100101: result_reg = i_A | i_B;  // OR
            6'b100110: result_reg = i_A ^ i_B;  // XOR
            6'b000011: result_reg = i_A >>> 1;  // SRA (Desplazamiento aritmético a la derecha)
            6'b000010: result_reg = i_A >> 1;   // SRL (Desplazamiento lógico a la derecha)
            6'b100111: result_reg = ~(i_A | i_B); // NOR
            default: result_reg = {DATA_WIDTH{1'b0}};  // Resultado por defecto
        endcase
    end

endmodule

module TopModule #(
    parameter DATA_WIDTH = 8,  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6   // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [(DATA_WIDTH + (DATA_WIDTH > MODE_WIDTH ? DATA_WIDTH - MODE_WIDTH : MODE_WIDTH - DATA_WIDTH)):0] i_data_bus,  // DATA_WIDTH bits de datos + diferencia absoluta
    output wire signed [DATA_WIDTH-1:0] o_A,
    output wire signed [DATA_WIDTH-1:0] o_B,
    output wire signed [DATA_WIDTH-1:0] o_result
);

    wire signed [DATA_WIDTH-1:0] A_wire, B_wire;
    wire [MODE_WIDTH-1:0] mode_wire;

    ControlUnit #(
        .DATA_WIDTH(DATA_WIDTH),
        .MODE_WIDTH(MODE_WIDTH)
    ) control_unit_inst (
        .i_data_bus(i_data_bus),
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
        .o_result(o_result)
    );

    assign o_A = A_wire;
    assign o_B = B_wire;

endmodule