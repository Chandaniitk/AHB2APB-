 class reg_item;
   rand bit [31:0] haddr;
   rand bit [31:0] hwdata;
   bit [31:0] hrdata;
  rand bit       hwrite;
   
  
  function void print(string tag="");
    $display ("t=%0t [%s] addr =0x%0h wr=%0d wdata=0x%0h rdata=0x%0h",$time ,tag,haddr,hwrite,hwdata,hrdata);
    
  endfunction
endclass