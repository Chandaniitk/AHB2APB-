class driver;
  virtual reg_if vif;
  event drv_done;
  mailbox drv_mbx;
  
  task run();
    $display("T=%0t [Driver] starting...",$time);
    @(posedge vif.hclk);
    
    forever begin
      reg_item item;
      $display("T=%0t [Driver] waiting for item...",$time);
      drv_mbx.get(item);
      item.print("Driver");
      $display("driver haddr =%0h hwrite=%0h",item.haddr,item.hwrite,item.hwdata);
      vif.hselapb <=1;
      vif.haddr <= item.haddr;
      vif.hwrite <= item.hwrite;
      vif.hwdata <= item.hwdata;
  
      @(posedge vif.hclk);
      while(!vif.hready) begin
        $display("T=%0t [Driver] wait untill ready is high",$time);
        @(posedge vif.hclk);
      end
     // vif.hselapb <=0;
      ->drv_done;

    end
  endtask
endclass
      