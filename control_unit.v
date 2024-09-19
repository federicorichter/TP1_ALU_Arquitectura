module ControlUnit #(
    parameter DATA_WIDTH = 8,  // Cantidad de bits parametrizable, por defecto 8
    parameter MODE_WIDTH = 6   // Cantidad de bits de modo parametrizable, por defecto 6
)(
    input wire signed [((DATA_WIDTH > MODE_WIDTH ? DATA_WIDTH: MODE_WIDTH )) - 1:0]  i_data_bus,  // DATA_WIDTH bits de datos + diferencia absoluta
    input wire i_load_A,
    input wire i_load_B,
    input wire i_load_op,
    output reg signed [DATA_WIDTH-1:0] o_A,
    output reg signed [DATA_WIDTH-1:0] o_B,
    output reg [MODE_WIDTH-1:0] o_mode
);

    //localparam CONTROL_WIDTH = 2;  // Calcula la diferencia absoluta

    //reg [CONTROL_WIDTH:0] control_bits;
/*
    always @(posedge i_load) begin
        // Separar los bits de control y los datos
        control_bits = i_data_bus[(DATA_WIDTH + CONTROL_WIDTH) - 1:(DATA_WIDTH)];
        case (control_bits)
            2'b00: o_A = i_data_bus[(DATA_WIDTH-1):0];  // Cargar A
            2'b01: o_B = i_data_bus[(DATA_WIDTH-1):0];  // Cargar B
            2'b10: o_mode = i_data_bus[MODE_WIDTH-1:0];  // Cargar modo de operación
            default: begin
                o_A = {DATA_WIDTH{1'b0}};
                o_B = {DATA_WIDTH{1'b0}};
                o_mode = {MODE_WIDTH{1'b0}};
            end
        endcase
    end
*/

    always @(posedge i_load_A or posedge i_load_B or posedge i_load_op ) begin
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
