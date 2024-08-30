interface reg_if (input bit hclk);
   logic hresetn;
  logic hselapb;
  logic hwrite;
  logic hresp;
  logic hready;
  logic [1:0]htrans;
  logic [31:0]haddr;
  logic [31:0]hwdata;
  logic [31:0]hrdata;
  logic [31:0]prdata;
  logic [31:0]pwdata;
  logic [31:0]paddr;
  logic penable;
  logic psel;
  logic pwrite;
  

endinterface
  