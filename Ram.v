module Ram(OutData, InData, Address, MemWrite, MemRead, ClockSignal);

output reg [15:0] OutData;
input [15:0] InData;
input [8:0] Address;
input MemWrite, MemRead, ClockSignal;

integer i;
reg [15:0] location [511:0];

// Initialize memory
initial begin
    for (i = 0; i <= 511; i = i + 1) begin
        location[i] = i;
    end
end

// Read operation
always @(Address or MemRead) begin
    if (MemRead == 1 && MemWrite == 0)
        OutData <= location[Address];
    else if (MemRead == 0)
        OutData <= 16'hxxxx;
end

// Write operation
always @(posedge ClockSignal) begin
    if (MemWrite == 1 && MemRead == 0)
        location[Address] <= InData;
end

endmodule
