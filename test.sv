`include"environment.sv"

class test;
  env e0;
  mailbox drv_mbx;
  
  function new();
    drv_mbx = new();
    e0 = new();
  endfunction
  
  virtual task run();
    e0.d0.drv_mbx = drv_mbx;
    fork
      e0.run();
    join_none
    
    apply_stim();
  endtask
   
  virtual task apply_stim();
    reg_item item;
    $display("T =%0t [Test] Starting stimulus...", $time);
    item = new;
    
    item.haddr=32'h5cd;  
    item.hwrite =1;
    item.hwdata=16;
    $display(" test data addr =%0h wr=%0h wdata=%0h",item.haddr,item.hwrite,item.hwdata);
    drv_mbx.put(item);
 
    #45 item = new;

    item.haddr=32'hcd6;
    item.hwrite=0;
    $display(" test data addr =%0h wr=%0h",item.haddr,item.hwrite);  
  drv_mbx.put(item);
      
     #30 item = new;

    item.haddr=32'hcd6;
    item.hwrite=1;
    $display(" test data addr =%0h wr=%0h",item.haddr,item.hwrite);  
  drv_mbx.put(item);
    
     #25 item = new;

    item.haddr=32'hcd6;
    item.hwrite=0;
    $display(" test data addr =%0h wr=%0h",item.haddr,item.hwrite);  
  drv_mbx.put(item);
      
      
    
endtask
endclass