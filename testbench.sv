// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

`include"interface.sv"
`include"test.sv"

module test_bench();
  
  
//   reg hclk,hresetn,hselapb,hwrite;
//   reg [31:0]haddr,hwdata,prdata;
//   reg[1:0]htrans;
//   wire hresp,hready;
//   wire [31:0]hrdata;
//   wire psel,penable,pwrite;
//   wire [31:0]paddr;
//   wire [31:0]pwdata;
  reg hclk;
  reg_if  _if (hclk);
  
  AHB2APB_bridge tb( hclk,_if.hresetn,_if.hselapb,_if.hwrite,_if.haddr,_if.hwdata,_if.prdata,_if.htrans,_if.hresp,_if.hready,_if.hrdata,_if.psel,_if.penable,_if.pwrite,_if.paddr,_if.pwdata);
  always #10 hclk=~hclk;
//   initial begin
//      $dumpfile("dump.vcd");
//     $dumpvars;
    
//     {hclk,hresetn,hselapb,hwrite,haddr,hwdata}<=0;
    
//   end
  
//   initial begin 
//     #7 hselapb<=1'b1;
//      hwrite<=1'b1;
//      htrans<=2'b10;
//    #20  hresetn<=1'b1;
//      haddr<=8;
//      hwdata<=34;
//     #40 hwrite<=1'b0;
//     prdata<=30;
    
//   end
  
   initial begin 
   test t0;
  test t1;
   hclk =0;
    _if.hresetn =0;
  //  _if.hselapb =0;
    #10 _if.hresetn =1;
 #15   _if.htrans =2'b01;
     #5  _if.htrans =2'b10;
    t0 = new;
    t0.e0.vif = _if;
    t0.run();
  
    _if.hresetn =0;
   // _if.hselapb =0;
    #20 _if.hresetn=1;
   _if.htrans =2'b11; 
      
    #100 _if.hresetn =0;
end
  
  initial begin 
    $dumpvars;
    $dumpfile("dump.vcd");
    #350 $finish ;
end
  
endmodule

// `include"interface.sv"
// `include"test.sv"
// `define DATAWIDTH 32
// `define ADDRWIDTH 8
// `define IDLE     2'b00
// `define W_ENABLE  2'b01
// `define R_ENABLE  2'b10
// module tb;
//   reg PCLK;
//   always #10 PCLK = ~PCLK;
//   reg_if  _if (PCLK);
//   APB_Slave  UT(.PCLK(PCLK),
//                .PADDR(_if.PADDR),
//                 .PRESETn(_if.PRESETn),
//                .PSEL (_if.PSEL),
//                .PWRITE (_if.PWRITE),
//                .PWDATA (_if.PWDATA),
//                .PRDATA (_if.PRDATA),
//                 .PREADY (_if.PREADY),
//                 .penable(_if.penable));
//   initial begin 
//    test t0;
//   test t1;
//    PCLK =0;
//     _if.PRESETn =0;
//     _if.PSEL =0;
//     #10 _if.PRESETn =1;
//   #15   _if.penable =1; 
//     t0 = new;
//     t0.e0.vif = _if;
//     t0.run();
  
//     _if.PRESETn =0;
//     _if.PSEL =0;
//     #20 _if.PRESETn=1;
//     _if.penable =1; 
      
//     #50 _if.PRESETn =0;
// end
  
// initial begin 
//     $dumpvars;
//     $dumpfile("dump.vcd");
//     #200 $finish ;
// end
// endmodule