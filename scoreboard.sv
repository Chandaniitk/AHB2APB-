class scoreboard;
  mailbox scb_mbx;
  reg_item refq[256];
  task run();
    forever begin
      reg_item item;
      scb_mbx.get(item);
      item.print("Scoreboard");
     // $display("scoreboard addr =%0d wr=%0d",item.PADDR,item.PWRITE,item.PWDATA);
      
      if(item.hwrite) begin
        if (refq[item.haddr] ==null)
          refq[item.haddr] = new;
        refq[item.haddr] = item;
        $display ("T=%0t [Scoreboard] store addr=0x%0h wr=0x%0h data=0x%0h", $time,item.haddr,item.hwrite,item.hwdata);
      end
      
      if(!item.hwrite)begin
        if(refq[item.haddr] == null)
          if(item.hrdata != 'h1234)
          $display ("T=%0t [Scoreboard] ERROR! First time read, addr=0x%0h exp=1234 act=0x%0h", $time,item.haddr,item.hrdata);
        else
          $display ("T=%0t [Scoreboard] PASS! First time read, addr=0x%0h exp=1234 act=0x%0h", $time,item.haddr,item.hrdata);
        else
          if(item.hrdata != refq[item.haddr].hwdata)
            $display ("T=%0t [Scoreboard] ERROR! addr=0x%0h exp=0x%0h act=0x%0h", $time,item.haddr,refq[item.haddr].hrdata, item.hrdata);
        else
          $display ("T=%0t [Scoreboard] PASS! addr=0x%0h exp=0x%0h act=0x%0h", $time,item.haddr,refq[item.haddr].hwdata, item.hrdata);
        
      end
    end
  endtask
endclass
        
        