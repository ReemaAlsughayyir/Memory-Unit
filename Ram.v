`timescale 1 ns / 1 ps

module Memory_Testbench;

// Inputs
reg [15:0] InData;
reg [8:0] Address;
reg MemWrite, MemRead, ClockSignal;

// Output
wire [15:0] OutData;

// Instantiate RAM
Ram uut (
    .OutData(OutData),
    .InData(InData),
    .Address(Address),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ClockSignal(ClockSignal)
);

// Clock generation
always #5 ClockSignal = ~ClockSignal;

// Test sequence
initial begin
    ClockSignal = 0;
    MemWrite = 0;
    MemRead = 0;
    Address = 0;
    InData = 0;

    #10;

    // Write 1
    Address = 1;
    InData = 16'hA5A5;
    MemWrite = 1;
    #10;
    MemWrite = 0;

    // Read 1
    MemRead = 1;
    #10;
    MemRead = 0;

    // Write 2
    Address = 2;
    InData = 16'h5A50;
    MemWrite = 1;
    #10;
    MemWrite = 0;

    // Read 2
    MemRead = 1;
    #10;
    MemRead = 0;

    #20;
    $finish;
end

endmodule
