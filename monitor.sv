class monitor;
  virtual reg_if vif;
  mailbox scb_mbx;
  task run();
    $display("T=%0t [Monitor] starting...",$time);
    forever begin
      @(posedge vif.hclk);
      if(vif.hselapb) begin
        reg_item item = new;
        $display(" monitor addr =%0h wr=%0h",vif.haddr,vif.hwrite,vif.hwdata);
        item.haddr = vif.haddr;
        item.hwrite = vif.hwrite;
        item.hwdata = vif.hwdata;
        if(!vif.hwrite)begin
          @(posedge vif.hclk);
          item.hrdata = vif.hrdata;
        end
        item.print("Monitor");
        scb_mbx.put(item);
      end
    end
  endtask
endclass
     