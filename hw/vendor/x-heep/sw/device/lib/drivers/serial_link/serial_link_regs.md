<table class="regdef" id="Reg_ctrl">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CTRL @ 0x0</div>
   <div><p>Global clock, isolation and reset control configuration</p></div>
   <div>Reset default = 0x302, mask 0x303</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=6>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:20.0%">axi_out_isolate</td>
<td class="fname" colspan=1 style="font-size:21.428571428571427%">axi_in_isolate</td>
<td class="unused" colspan=6>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:42.857142857142854%">reset_n</td>
<td class="fname" colspan=1 style="font-size:42.857142857142854%">clk_ena</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x0</td><td class="regfn">clk_ena</td><td class="regde"><p>Clock gate enable for network, link, physical layer. (active-high)</p></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">reset_n</td><td class="regde"><p>SW controlled synchronous reset. (active-low)</p></td><tr><td class="regbits">7:2</td><td></td><td></td><td></td><td>Reserved</td></tr><tr><td class="regbits">8</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">axi_in_isolate</td><td class="regde"><p>Isolate AXI slave in port. (active-high)</p></td><tr><td class="regbits">9</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">axi_out_isolate</td><td class="regde"><p>Isolate AXI master out port. (active-high)</p></td></table>
<br>
<table class="regdef" id="Reg_isolated">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.ISOLATED @ 0x4</div>
   <div><p>Isolation status of AXI ports</p></div>
   <div>Reset default = 0x3, mask 0x3</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=14>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:42.857142857142854%">axi_out</td>
<td class="fname" colspan=1 style="font-size:50.0%">axi_in</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">ro</td><td class="regrv">0x1</td><td class="regfn">axi_in</td><td class="regde"><p>slave in isolation status</p></td><tr><td class="regbits">1</td><td class="regperm">ro</td><td class="regrv">0x1</td><td class="regfn">axi_out</td><td class="regde"><p>master out isolation status</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_0 @ 0x8</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_0</td><td class="regde"><p>Clock division factor of TX clock</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_1 @ 0xc</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_1</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_1</td><td class="regde"><p>For TX_PHY_CLK_DIV1</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_2">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_2 @ 0x10</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_2</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_2</td><td class="regde"><p>For TX_PHY_CLK_DIV2</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_3">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_3 @ 0x14</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_3</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_3</td><td class="regde"><p>For TX_PHY_CLK_DIV3</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_4">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_4 @ 0x18</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_4</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_4</td><td class="regde"><p>For TX_PHY_CLK_DIV4</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_5">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_5 @ 0x1c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_5</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_5</td><td class="regde"><p>For TX_PHY_CLK_DIV5</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_6">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_6 @ 0x20</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_6</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_6</td><td class="regde"><p>For TX_PHY_CLK_DIV6</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_7">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_7 @ 0x24</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_7</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_7</td><td class="regde"><p>For TX_PHY_CLK_DIV7</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_8">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_8 @ 0x28</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_8</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_8</td><td class="regde"><p>For TX_PHY_CLK_DIV8</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_9">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_9 @ 0x2c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_9</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_9</td><td class="regde"><p>For TX_PHY_CLK_DIV9</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_10">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_10 @ 0x30</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_10</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_10</td><td class="regde"><p>For TX_PHY_CLK_DIV10</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_11">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_11 @ 0x34</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_11</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_11</td><td class="regde"><p>For TX_PHY_CLK_DIV11</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_12">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_12 @ 0x38</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_12</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_12</td><td class="regde"><p>For TX_PHY_CLK_DIV12</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_13">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_13 @ 0x3c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_13</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_13</td><td class="regde"><p>For TX_PHY_CLK_DIV13</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_14">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_14 @ 0x40</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_14</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_14</td><td class="regde"><p>For TX_PHY_CLK_DIV14</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_15">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_15 @ 0x44</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_15</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_15</td><td class="regde"><p>For TX_PHY_CLK_DIV15</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_16">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_16 @ 0x48</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_16</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_16</td><td class="regde"><p>For TX_PHY_CLK_DIV16</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_17">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_17 @ 0x4c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_17</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_17</td><td class="regde"><p>For TX_PHY_CLK_DIV17</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_18">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_18 @ 0x50</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_18</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_18</td><td class="regde"><p>For TX_PHY_CLK_DIV18</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_19">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_19 @ 0x54</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_19</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_19</td><td class="regde"><p>For TX_PHY_CLK_DIV19</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_20">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_20 @ 0x58</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_20</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_20</td><td class="regde"><p>For TX_PHY_CLK_DIV20</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_21">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_21 @ 0x5c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_21</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_21</td><td class="regde"><p>For TX_PHY_CLK_DIV21</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_22">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_22 @ 0x60</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_22</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_22</td><td class="regde"><p>For TX_PHY_CLK_DIV22</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_23">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_23 @ 0x64</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_23</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_23</td><td class="regde"><p>For TX_PHY_CLK_DIV23</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_24">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_24 @ 0x68</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_24</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_24</td><td class="regde"><p>For TX_PHY_CLK_DIV24</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_25">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_25 @ 0x6c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_25</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_25</td><td class="regde"><p>For TX_PHY_CLK_DIV25</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_26">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_26 @ 0x70</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_26</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_26</td><td class="regde"><p>For TX_PHY_CLK_DIV26</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_27">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_27 @ 0x74</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_27</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_27</td><td class="regde"><p>For TX_PHY_CLK_DIV27</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_28">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_28 @ 0x78</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_28</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_28</td><td class="regde"><p>For TX_PHY_CLK_DIV28</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_29">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_29 @ 0x7c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_29</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_29</td><td class="regde"><p>For TX_PHY_CLK_DIV29</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_30">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_30 @ 0x80</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_30</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_30</td><td class="regde"><p>For TX_PHY_CLK_DIV30</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_31">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_31 @ 0x84</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_31</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_31</td><td class="regde"><p>For TX_PHY_CLK_DIV31</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_32">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_32 @ 0x88</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_32</td><td class="regde"><p>For TX_PHY_CLK_DIV32</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_33">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_33 @ 0x8c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_33</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_33</td><td class="regde"><p>For TX_PHY_CLK_DIV33</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_34">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_34 @ 0x90</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_34</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_34</td><td class="regde"><p>For TX_PHY_CLK_DIV34</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_35">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_35 @ 0x94</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_35</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_35</td><td class="regde"><p>For TX_PHY_CLK_DIV35</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_36">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_36 @ 0x98</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_36</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_36</td><td class="regde"><p>For TX_PHY_CLK_DIV36</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_div_37">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_DIV_37 @ 0x9c</div>
   <div><p>Holds clock divider factor for forwarded clock of the TX Phys</p></div>
   <div>Reset default = 0x8, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_divs_37</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x8</td><td class="regfn">clk_divs_37</td><td class="regde"><p>For TX_PHY_CLK_DIV37</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_0 @ 0xa0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_0</td><td class="regde"><p>Positive Edge of divided, shifted clock</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_1 @ 0xa4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_1</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_1</td><td class="regde"><p>For TX_PHY_CLK_START1</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_2">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_2 @ 0xa8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_2</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_2</td><td class="regde"><p>For TX_PHY_CLK_START2</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_3">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_3 @ 0xac</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_3</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_3</td><td class="regde"><p>For TX_PHY_CLK_START3</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_4">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_4 @ 0xb0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_4</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_4</td><td class="regde"><p>For TX_PHY_CLK_START4</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_5">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_5 @ 0xb4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_5</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_5</td><td class="regde"><p>For TX_PHY_CLK_START5</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_6">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_6 @ 0xb8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_6</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_6</td><td class="regde"><p>For TX_PHY_CLK_START6</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_7">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_7 @ 0xbc</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_7</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_7</td><td class="regde"><p>For TX_PHY_CLK_START7</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_8">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_8 @ 0xc0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_8</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_8</td><td class="regde"><p>For TX_PHY_CLK_START8</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_9">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_9 @ 0xc4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_9</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_9</td><td class="regde"><p>For TX_PHY_CLK_START9</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_10">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_10 @ 0xc8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_10</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_10</td><td class="regde"><p>For TX_PHY_CLK_START10</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_11">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_11 @ 0xcc</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_11</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_11</td><td class="regde"><p>For TX_PHY_CLK_START11</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_12">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_12 @ 0xd0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_12</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_12</td><td class="regde"><p>For TX_PHY_CLK_START12</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_13">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_13 @ 0xd4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_13</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_13</td><td class="regde"><p>For TX_PHY_CLK_START13</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_14">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_14 @ 0xd8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_14</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_14</td><td class="regde"><p>For TX_PHY_CLK_START14</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_15">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_15 @ 0xdc</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_15</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_15</td><td class="regde"><p>For TX_PHY_CLK_START15</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_16">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_16 @ 0xe0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_16</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_16</td><td class="regde"><p>For TX_PHY_CLK_START16</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_17">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_17 @ 0xe4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_17</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_17</td><td class="regde"><p>For TX_PHY_CLK_START17</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_18">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_18 @ 0xe8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_18</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_18</td><td class="regde"><p>For TX_PHY_CLK_START18</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_19">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_19 @ 0xec</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_19</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_19</td><td class="regde"><p>For TX_PHY_CLK_START19</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_20">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_20 @ 0xf0</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_20</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_20</td><td class="regde"><p>For TX_PHY_CLK_START20</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_21">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_21 @ 0xf4</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_21</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_21</td><td class="regde"><p>For TX_PHY_CLK_START21</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_22">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_22 @ 0xf8</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_22</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_22</td><td class="regde"><p>For TX_PHY_CLK_START22</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_23">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_23 @ 0xfc</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_23</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_23</td><td class="regde"><p>For TX_PHY_CLK_START23</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_24">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_24 @ 0x100</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_24</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_24</td><td class="regde"><p>For TX_PHY_CLK_START24</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_25">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_25 @ 0x104</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_25</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_25</td><td class="regde"><p>For TX_PHY_CLK_START25</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_26">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_26 @ 0x108</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_26</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_26</td><td class="regde"><p>For TX_PHY_CLK_START26</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_27">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_27 @ 0x10c</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_27</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_27</td><td class="regde"><p>For TX_PHY_CLK_START27</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_28">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_28 @ 0x110</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_28</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_28</td><td class="regde"><p>For TX_PHY_CLK_START28</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_29">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_29 @ 0x114</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_29</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_29</td><td class="regde"><p>For TX_PHY_CLK_START29</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_30">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_30 @ 0x118</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_30</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_30</td><td class="regde"><p>For TX_PHY_CLK_START30</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_31">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_31 @ 0x11c</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_31</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_31</td><td class="regde"><p>For TX_PHY_CLK_START31</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_32">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_32 @ 0x120</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_32</td><td class="regde"><p>For TX_PHY_CLK_START32</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_33">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_33 @ 0x124</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_33</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_33</td><td class="regde"><p>For TX_PHY_CLK_START33</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_34">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_34 @ 0x128</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_34</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_34</td><td class="regde"><p>For TX_PHY_CLK_START34</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_35">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_35 @ 0x12c</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_35</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_35</td><td class="regde"><p>For TX_PHY_CLK_START35</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_36">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_36 @ 0x130</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_36</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_36</td><td class="regde"><p>For TX_PHY_CLK_START36</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_start_37">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_START_37 @ 0x134</div>
   <div><p>Controls duty cycle and phase of rising edge in TX Phys</p></div>
   <div>Reset default = 0x2, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_start_37</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">clk_shift_start_37</td><td class="regde"><p>For TX_PHY_CLK_START37</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_0 @ 0x138</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_0</td><td class="regde"><p>Negative Edge of divided, shifted clock</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_1 @ 0x13c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_1</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_1</td><td class="regde"><p>For TX_PHY_CLK_END1</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_2">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_2 @ 0x140</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_2</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_2</td><td class="regde"><p>For TX_PHY_CLK_END2</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_3">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_3 @ 0x144</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_3</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_3</td><td class="regde"><p>For TX_PHY_CLK_END3</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_4">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_4 @ 0x148</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_4</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_4</td><td class="regde"><p>For TX_PHY_CLK_END4</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_5">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_5 @ 0x14c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_5</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_5</td><td class="regde"><p>For TX_PHY_CLK_END5</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_6">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_6 @ 0x150</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_6</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_6</td><td class="regde"><p>For TX_PHY_CLK_END6</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_7">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_7 @ 0x154</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_7</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_7</td><td class="regde"><p>For TX_PHY_CLK_END7</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_8">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_8 @ 0x158</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_8</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_8</td><td class="regde"><p>For TX_PHY_CLK_END8</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_9">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_9 @ 0x15c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_9</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_9</td><td class="regde"><p>For TX_PHY_CLK_END9</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_10">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_10 @ 0x160</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_10</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_10</td><td class="regde"><p>For TX_PHY_CLK_END10</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_11">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_11 @ 0x164</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_11</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_11</td><td class="regde"><p>For TX_PHY_CLK_END11</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_12">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_12 @ 0x168</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_12</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_12</td><td class="regde"><p>For TX_PHY_CLK_END12</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_13">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_13 @ 0x16c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_13</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_13</td><td class="regde"><p>For TX_PHY_CLK_END13</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_14">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_14 @ 0x170</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_14</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_14</td><td class="regde"><p>For TX_PHY_CLK_END14</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_15">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_15 @ 0x174</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_15</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_15</td><td class="regde"><p>For TX_PHY_CLK_END15</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_16">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_16 @ 0x178</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_16</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_16</td><td class="regde"><p>For TX_PHY_CLK_END16</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_17">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_17 @ 0x17c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_17</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_17</td><td class="regde"><p>For TX_PHY_CLK_END17</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_18">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_18 @ 0x180</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_18</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_18</td><td class="regde"><p>For TX_PHY_CLK_END18</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_19">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_19 @ 0x184</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_19</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_19</td><td class="regde"><p>For TX_PHY_CLK_END19</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_20">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_20 @ 0x188</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_20</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_20</td><td class="regde"><p>For TX_PHY_CLK_END20</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_21">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_21 @ 0x18c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_21</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_21</td><td class="regde"><p>For TX_PHY_CLK_END21</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_22">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_22 @ 0x190</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_22</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_22</td><td class="regde"><p>For TX_PHY_CLK_END22</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_23">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_23 @ 0x194</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_23</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_23</td><td class="regde"><p>For TX_PHY_CLK_END23</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_24">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_24 @ 0x198</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_24</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_24</td><td class="regde"><p>For TX_PHY_CLK_END24</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_25">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_25 @ 0x19c</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_25</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_25</td><td class="regde"><p>For TX_PHY_CLK_END25</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_26">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_26 @ 0x1a0</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_26</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_26</td><td class="regde"><p>For TX_PHY_CLK_END26</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_27">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_27 @ 0x1a4</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_27</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_27</td><td class="regde"><p>For TX_PHY_CLK_END27</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_28">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_28 @ 0x1a8</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_28</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_28</td><td class="regde"><p>For TX_PHY_CLK_END28</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_29">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_29 @ 0x1ac</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_29</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_29</td><td class="regde"><p>For TX_PHY_CLK_END29</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_30">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_30 @ 0x1b0</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_30</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_30</td><td class="regde"><p>For TX_PHY_CLK_END30</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_31">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_31 @ 0x1b4</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_31</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_31</td><td class="regde"><p>For TX_PHY_CLK_END31</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_32">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_32 @ 0x1b8</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_32</td><td class="regde"><p>For TX_PHY_CLK_END32</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_33">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_33 @ 0x1bc</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_33</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_33</td><td class="regde"><p>For TX_PHY_CLK_END33</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_34">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_34 @ 0x1c0</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_34</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_34</td><td class="regde"><p>For TX_PHY_CLK_END34</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_35">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_35 @ 0x1c4</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_35</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_35</td><td class="regde"><p>For TX_PHY_CLK_END35</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_36">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_36 @ 0x1c8</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_36</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_36</td><td class="regde"><p>For TX_PHY_CLK_END36</p></td></table>
<br>
<table class="regdef" id="Reg_tx_phy_clk_end_37">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.TX_PHY_CLK_END_37 @ 0x1cc</div>
   <div><p>Controls duty cycle and phase of falling edge in TX Phys</p></div>
   <div>Reset default = 0x6, mask 0x7ff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=11>clk_shift_end_37</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">10:0</td><td class="regperm">rw</td><td class="regrv">0x6</td><td class="regfn">clk_shift_end_37</td><td class="regde"><p>For TX_PHY_CLK_END37</p></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_en">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_EN @ 0x1d0</div>
   <div><p>Enables Raw mode</p></div>
   <div>Reset default = 0x0, mask 0x1</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=15>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:27.272727272727273%">RAW_MODE_EN</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_EN</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_in_ch_sel">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_IN_CH_SEL @ 0x1d4</div>
   <div><p>Receive channel select in RAW mode</p></div>
   <div>Reset default = 0x0, mask 0x3f</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=10>&nbsp;</td>
<td class="fname" colspan=6>RAW_MODE_IN_CH_SEL</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">5:0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_IN_CH_SEL</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_in_data_valid_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_IN_DATA_VALID_0 @ 0x1d8</div>
   <div><p>Mask for valid data in RX FIFOs during RAW mode.</p></div>
   <div>Reset default = 0x0, mask 0xffffffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_31</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_30</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_29</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_28</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_27</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_26</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_25</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_24</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_23</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_22</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_21</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_20</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_19</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_18</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_17</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_16</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_15</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_14</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_13</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_12</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_11</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_10</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_9</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_8</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_7</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_6</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_5</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_4</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_3</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_2</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_1</td>
<td class="fname" colspan=1 style="font-size:12.5%">RAW_MODE_IN_DATA_VALID_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_0</td><td class="regde"></td><tr><td class="regbits">1</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_1</td><td class="regde"></td><tr><td class="regbits">2</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_2</td><td class="regde"></td><tr><td class="regbits">3</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_3</td><td class="regde"></td><tr><td class="regbits">4</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_4</td><td class="regde"></td><tr><td class="regbits">5</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_5</td><td class="regde"></td><tr><td class="regbits">6</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_6</td><td class="regde"></td><tr><td class="regbits">7</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_7</td><td class="regde"></td><tr><td class="regbits">8</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_8</td><td class="regde"></td><tr><td class="regbits">9</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_9</td><td class="regde"></td><tr><td class="regbits">10</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_10</td><td class="regde"></td><tr><td class="regbits">11</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_11</td><td class="regde"></td><tr><td class="regbits">12</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_12</td><td class="regde"></td><tr><td class="regbits">13</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_13</td><td class="regde"></td><tr><td class="regbits">14</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_14</td><td class="regde"></td><tr><td class="regbits">15</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_15</td><td class="regde"></td><tr><td class="regbits">16</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_16</td><td class="regde"></td><tr><td class="regbits">17</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_17</td><td class="regde"></td><tr><td class="regbits">18</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_18</td><td class="regde"></td><tr><td class="regbits">19</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_19</td><td class="regde"></td><tr><td class="regbits">20</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_20</td><td class="regde"></td><tr><td class="regbits">21</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_21</td><td class="regde"></td><tr><td class="regbits">22</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_22</td><td class="regde"></td><tr><td class="regbits">23</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_23</td><td class="regde"></td><tr><td class="regbits">24</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_24</td><td class="regde"></td><tr><td class="regbits">25</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_25</td><td class="regde"></td><tr><td class="regbits">26</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_26</td><td class="regde"></td><tr><td class="regbits">27</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_27</td><td class="regde"></td><tr><td class="regbits">28</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_28</td><td class="regde"></td><tr><td class="regbits">29</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_29</td><td class="regde"></td><tr><td class="regbits">30</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_30</td><td class="regde"></td><tr><td class="regbits">31</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_31</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_in_data_valid_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_IN_DATA_VALID_1 @ 0x1dc</div>
   <div><p>Mask for valid data in RX FIFOs during RAW mode.</p></div>
   <div>Reset default = 0x0, mask 0x3f</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=10>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_37</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_36</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_35</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_34</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_33</td>
<td class="fname" colspan=1 style="font-size:12.0%">RAW_MODE_IN_DATA_VALID_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_32</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td><tr><td class="regbits">1</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_33</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td><tr><td class="regbits">2</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_34</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td><tr><td class="regbits">3</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_35</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td><tr><td class="regbits">4</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_36</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td><tr><td class="regbits">5</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA_VALID_37</td><td class="regde"><p>For RAW_MODE_IN_DATA_VALID1</p></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_in_data">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_IN_DATA @ 0x1e0</div>
   <div><p>Data received by the selected channel in RAW mode</p></div>
   <div>Reset default = 0x0, mask 0xffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=16>RAW_MODE_IN_DATA</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">15:0</td><td class="regperm">ro</td><td class="regrv">x</td><td class="regfn">RAW_MODE_IN_DATA</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_out_ch_mask_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_OUT_CH_MASK_0 @ 0x1e4</div>
   <div><p>Selects channels to send out data in RAW mode, '1 corresponds to broadcasting</p></div>
   <div>Reset default = 0x0, mask 0xffffffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_31</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_30</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_29</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_28</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_27</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_26</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_25</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_24</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_23</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_22</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_21</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_20</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_19</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_18</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_17</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_16</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_15</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_14</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_13</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_12</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_11</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_10</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_9</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_8</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_7</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_6</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_5</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_4</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_3</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_2</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_1</td>
<td class="fname" colspan=1 style="font-size:13.636363636363637%">RAW_MODE_OUT_CH_MASK_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_0</td><td class="regde"></td><tr><td class="regbits">1</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_1</td><td class="regde"></td><tr><td class="regbits">2</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_2</td><td class="regde"></td><tr><td class="regbits">3</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_3</td><td class="regde"></td><tr><td class="regbits">4</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_4</td><td class="regde"></td><tr><td class="regbits">5</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_5</td><td class="regde"></td><tr><td class="regbits">6</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_6</td><td class="regde"></td><tr><td class="regbits">7</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_7</td><td class="regde"></td><tr><td class="regbits">8</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_8</td><td class="regde"></td><tr><td class="regbits">9</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_9</td><td class="regde"></td><tr><td class="regbits">10</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_10</td><td class="regde"></td><tr><td class="regbits">11</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_11</td><td class="regde"></td><tr><td class="regbits">12</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_12</td><td class="regde"></td><tr><td class="regbits">13</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_13</td><td class="regde"></td><tr><td class="regbits">14</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_14</td><td class="regde"></td><tr><td class="regbits">15</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_15</td><td class="regde"></td><tr><td class="regbits">16</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_16</td><td class="regde"></td><tr><td class="regbits">17</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_17</td><td class="regde"></td><tr><td class="regbits">18</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_18</td><td class="regde"></td><tr><td class="regbits">19</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_19</td><td class="regde"></td><tr><td class="regbits">20</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_20</td><td class="regde"></td><tr><td class="regbits">21</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_21</td><td class="regde"></td><tr><td class="regbits">22</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_22</td><td class="regde"></td><tr><td class="regbits">23</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_23</td><td class="regde"></td><tr><td class="regbits">24</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_24</td><td class="regde"></td><tr><td class="regbits">25</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_25</td><td class="regde"></td><tr><td class="regbits">26</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_26</td><td class="regde"></td><tr><td class="regbits">27</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_27</td><td class="regde"></td><tr><td class="regbits">28</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_28</td><td class="regde"></td><tr><td class="regbits">29</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_29</td><td class="regde"></td><tr><td class="regbits">30</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_30</td><td class="regde"></td><tr><td class="regbits">31</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_31</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_out_ch_mask_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_OUT_CH_MASK_1 @ 0x1e8</div>
   <div><p>Selects channels to send out data in RAW mode, '1 corresponds to broadcasting</p></div>
   <div>Reset default = 0x0, mask 0x3f</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=10>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_37</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_36</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_35</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_34</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_33</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">RAW_MODE_OUT_CH_MASK_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_32</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td><tr><td class="regbits">1</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_33</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td><tr><td class="regbits">2</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_34</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td><tr><td class="regbits">3</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_35</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td><tr><td class="regbits">4</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_36</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td><tr><td class="regbits">5</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_CH_MASK_37</td><td class="regde"><p>For RAW_MODE_OUT_CH_MASK1</p></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_out_data_fifo">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_OUT_DATA_FIFO @ 0x1ec</div>
   <div><p>Data that will be pushed to the RAW mode output FIFO</p></div>
   <div>Reset default = 0x0, mask 0xffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=16>RAW_MODE_OUT_DATA_FIFO</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">15:0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_DATA_FIFO</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_out_data_fifo_ctrl">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_OUT_DATA_FIFO_CTRL @ 0x1f0</div>
   <div><p>Status and control register for the RAW mode data out FIFO</p></div>
   <div>Reset default = 0x0, mask 0x80000701</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="fname" colspan=1 style="font-size:42.857142857142854%">is_full</td>
<td class="unused" colspan=15>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=5>&nbsp;</td>
<td class="fname" colspan=3 style="font-size:90.0%">fill_state</td>
<td class="unused" colspan=7>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:60.0%">clear</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">x</td><td class="regfn">clear</td><td class="regde"><p>Clears the raw mode TX FIFO.</p></td><tr><td class="regbits">7:1</td><td></td><td></td><td></td><td>Reserved</td></tr><tr><td class="regbits">10:8</td><td class="regperm">ro</td><td class="regrv">0x0</td><td class="regfn">fill_state</td><td class="regde"><p>The number of elements currently stored in the RAW mode TX FIFO that are ready to be sent.</p></td><tr><td class="regbits">30:11</td><td></td><td></td><td></td><td>Reserved</td></tr><tr><td class="regbits">31</td><td class="regperm">ro</td><td class="regrv">0x0</td><td class="regfn">is_full</td><td class="regde"><p>If '1' the FIFO is full and does not accept any more items. Any additional write to the data fill register will be ignored until there is sufficient space again.</p></td></table>
<br>
<table class="regdef" id="Reg_raw_mode_out_en">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.RAW_MODE_OUT_EN @ 0x1f4</div>
   <div><p>Enable transmission of data currently hold in the output FIFO</p></div>
   <div>Reset default = 0x0, mask 0x1</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=15>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:20.0%">RAW_MODE_OUT_EN</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x0</td><td class="regfn">RAW_MODE_OUT_EN</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_flow_control_fifo_clear">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.FLOW_CONTROL_FIFO_CLEAR @ 0x1f8</div>
   <div><p>Clears the flow control Fifo</p></div>
   <div>Reset default = 0x0, mask 0x1</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=15>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:13.043478260869565%">FLOW_CONTROL_FIFO_CLEAR</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">0x0</td><td class="regfn">FLOW_CONTROL_FIFO_CLEAR</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_tx_cfg">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_TX_CFG @ 0x1fc</div>
   <div><p>Configuration settings for the TX side in the channel allocator</p></div>
   <div>Reset default = 0x203, mask 0xff03</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=8>auto_flush_count</td>
<td class="unused" colspan=6>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:23.076923076923077%">auto_flush_en</td>
<td class="fname" colspan=1 style="font-size:33.333333333333336%">bypass_en</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">bypass_en</td><td class="regde"><p>Enable bypassing the TX channel allocator</p></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">auto_flush_en</td><td class="regde"><p>Enable the auto-flush feature of the TX side in the channel allocator</p></td><tr><td class="regbits">7:2</td><td></td><td></td><td></td><td>Reserved</td></tr><tr><td class="regbits">15:8</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">auto_flush_count</td><td class="regde"><p>The number of cycles to wait before auto flushing (sending) packets in the channel allocator</p></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_tx_ch_en_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_TX_CH_EN_0 @ 0x200</div>
   <div><p>Channel enable mask for the TX side.</p></div>
   <div>Reset default = 0xffffffff, mask 0xffffffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_31</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_30</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_29</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_28</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_27</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_26</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_25</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_24</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_23</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_22</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_21</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_20</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_19</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_18</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_17</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_16</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_15</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_14</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_13</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_12</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_11</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_10</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_9</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_8</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_7</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_6</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_5</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_4</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_3</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_2</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_1</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_TX_CH_EN_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_0</td><td class="regde"></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_1</td><td class="regde"></td><tr><td class="regbits">2</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_2</td><td class="regde"></td><tr><td class="regbits">3</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_3</td><td class="regde"></td><tr><td class="regbits">4</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_4</td><td class="regde"></td><tr><td class="regbits">5</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_5</td><td class="regde"></td><tr><td class="regbits">6</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_6</td><td class="regde"></td><tr><td class="regbits">7</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_7</td><td class="regde"></td><tr><td class="regbits">8</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_8</td><td class="regde"></td><tr><td class="regbits">9</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_9</td><td class="regde"></td><tr><td class="regbits">10</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_10</td><td class="regde"></td><tr><td class="regbits">11</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_11</td><td class="regde"></td><tr><td class="regbits">12</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_12</td><td class="regde"></td><tr><td class="regbits">13</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_13</td><td class="regde"></td><tr><td class="regbits">14</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_14</td><td class="regde"></td><tr><td class="regbits">15</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_15</td><td class="regde"></td><tr><td class="regbits">16</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_16</td><td class="regde"></td><tr><td class="regbits">17</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_17</td><td class="regde"></td><tr><td class="regbits">18</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_18</td><td class="regde"></td><tr><td class="regbits">19</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_19</td><td class="regde"></td><tr><td class="regbits">20</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_20</td><td class="regde"></td><tr><td class="regbits">21</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_21</td><td class="regde"></td><tr><td class="regbits">22</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_22</td><td class="regde"></td><tr><td class="regbits">23</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_23</td><td class="regde"></td><tr><td class="regbits">24</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_24</td><td class="regde"></td><tr><td class="regbits">25</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_25</td><td class="regde"></td><tr><td class="regbits">26</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_26</td><td class="regde"></td><tr><td class="regbits">27</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_27</td><td class="regde"></td><tr><td class="regbits">28</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_28</td><td class="regde"></td><tr><td class="regbits">29</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_29</td><td class="regde"></td><tr><td class="regbits">30</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_30</td><td class="regde"></td><tr><td class="regbits">31</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_31</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_tx_ch_en_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_TX_CH_EN_1 @ 0x204</div>
   <div><p>Channel enable mask for the TX side.</p></div>
   <div>Reset default = 0x3f, mask 0x3f</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=10>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_37</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_36</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_35</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_34</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_33</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_TX_CH_EN_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_32</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_33</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td><tr><td class="regbits">2</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_34</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td><tr><td class="regbits">3</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_35</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td><tr><td class="regbits">4</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_36</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td><tr><td class="regbits">5</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_TX_CH_EN_37</td><td class="regde"><p>For CHANNEL_ALLOC_TX_CH_EN1</p></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_tx_ctrl">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_TX_CTRL @ 0x208</div>
   <div><p>Soft clear or force flush the TX side of the channel allocator</p></div>
   <div>Reset default = 0x0, mask 0x3</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=14>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:60.0%">flush</td>
<td class="fname" colspan=1 style="font-size:60.0%">clear</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">x</td><td class="regfn">clear</td><td class="regde"><p>Software clear the TX side of the channel allocator</p></td><tr><td class="regbits">1</td><td class="regperm">wo</td><td class="regrv">x</td><td class="regfn">flush</td><td class="regde"><p>Flush (transmit remaining data) in the TX side of the channel allocator.</p></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_rx_cfg">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_RX_CFG @ 0x20c</div>
   <div><p>Configuration settings for the RX side in the channel allocator</p></div>
   <div>Reset default = 0x10203, mask 0x1ff03</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=15>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:42.857142857142854%">sync_en</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=8>auto_flush_count</td>
<td class="unused" colspan=6>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:23.076923076923077%">auto_flush_en</td>
<td class="fname" colspan=1 style="font-size:33.333333333333336%">bypass_en</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">bypass_en</td><td class="regde"><p>Enable bypassing the RX channel allocator</p></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">auto_flush_en</td><td class="regde"><p>Enable the auto-flush feature of the RX side in the channel allocator</p></td><tr><td class="regbits">7:2</td><td></td><td></td><td></td><td>Reserved</td></tr><tr><td class="regbits">15:8</td><td class="regperm">rw</td><td class="regrv">0x2</td><td class="regfn">auto_flush_count</td><td class="regde"><p>The number of cycles to wait before synchronizing on partial packets on the RX side</p></td><tr><td class="regbits">16</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">sync_en</td><td class="regde"><p>Enable (1) or disable (0) the synchronization barrier between the channels (needs to be disabled in raw mode).</p></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_rx_ctrl">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_RX_CTRL @ 0x210</div>
   <div><p>Soft clear the RX side of the channel allocator</p></div>
   <div>Reset default = 0x0, mask 0x1</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=15>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:60.0%">clear</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">wo</td><td class="regrv">x</td><td class="regfn">clear</td><td class="regde"><p>Software clear the TX side of the channel allocator</p></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_rx_ch_en_0">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_RX_CH_EN_0 @ 0x214</div>
   <div><p>Channel enable mask for the RX side.</p></div>
   <div>Reset default = 0xffffffff, mask 0xffffffff</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_31</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_30</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_29</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_28</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_27</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_26</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_25</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_24</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_23</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_22</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_21</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_20</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_19</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_18</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_17</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_16</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_15</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_14</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_13</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_12</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_11</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_10</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_9</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_8</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_7</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_6</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_5</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_4</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_3</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_2</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_1</td>
<td class="fname" colspan=1 style="font-size:12.5%">CHANNEL_ALLOC_RX_CH_EN_0</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_0</td><td class="regde"></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_1</td><td class="regde"></td><tr><td class="regbits">2</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_2</td><td class="regde"></td><tr><td class="regbits">3</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_3</td><td class="regde"></td><tr><td class="regbits">4</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_4</td><td class="regde"></td><tr><td class="regbits">5</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_5</td><td class="regde"></td><tr><td class="regbits">6</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_6</td><td class="regde"></td><tr><td class="regbits">7</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_7</td><td class="regde"></td><tr><td class="regbits">8</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_8</td><td class="regde"></td><tr><td class="regbits">9</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_9</td><td class="regde"></td><tr><td class="regbits">10</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_10</td><td class="regde"></td><tr><td class="regbits">11</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_11</td><td class="regde"></td><tr><td class="regbits">12</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_12</td><td class="regde"></td><tr><td class="regbits">13</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_13</td><td class="regde"></td><tr><td class="regbits">14</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_14</td><td class="regde"></td><tr><td class="regbits">15</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_15</td><td class="regde"></td><tr><td class="regbits">16</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_16</td><td class="regde"></td><tr><td class="regbits">17</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_17</td><td class="regde"></td><tr><td class="regbits">18</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_18</td><td class="regde"></td><tr><td class="regbits">19</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_19</td><td class="regde"></td><tr><td class="regbits">20</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_20</td><td class="regde"></td><tr><td class="regbits">21</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_21</td><td class="regde"></td><tr><td class="regbits">22</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_22</td><td class="regde"></td><tr><td class="regbits">23</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_23</td><td class="regde"></td><tr><td class="regbits">24</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_24</td><td class="regde"></td><tr><td class="regbits">25</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_25</td><td class="regde"></td><tr><td class="regbits">26</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_26</td><td class="regde"></td><tr><td class="regbits">27</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_27</td><td class="regde"></td><tr><td class="regbits">28</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_28</td><td class="regde"></td><tr><td class="regbits">29</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_29</td><td class="regde"></td><tr><td class="regbits">30</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_30</td><td class="regde"></td><tr><td class="regbits">31</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_31</td><td class="regde"></td></table>
<br>
<table class="regdef" id="Reg_channel_alloc_rx_ch_en_1">
 <tr>
  <th class="regdef" colspan=5>
   <div>serial_link.CHANNEL_ALLOC_RX_CH_EN_1 @ 0x218</div>
   <div><p>Channel enable mask for the RX side.</p></div>
   <div>Reset default = 0x3f, mask 0x3f</div>
  </th>
 </tr>
<tr><td colspan=5><table class="regpic"><tr><td class="bitnum">31</td><td class="bitnum">30</td><td class="bitnum">29</td><td class="bitnum">28</td><td class="bitnum">27</td><td class="bitnum">26</td><td class="bitnum">25</td><td class="bitnum">24</td><td class="bitnum">23</td><td class="bitnum">22</td><td class="bitnum">21</td><td class="bitnum">20</td><td class="bitnum">19</td><td class="bitnum">18</td><td class="bitnum">17</td><td class="bitnum">16</td></tr><tr><td class="unused" colspan=16>&nbsp;</td>
</tr>
<tr><td class="bitnum">15</td><td class="bitnum">14</td><td class="bitnum">13</td><td class="bitnum">12</td><td class="bitnum">11</td><td class="bitnum">10</td><td class="bitnum">9</td><td class="bitnum">8</td><td class="bitnum">7</td><td class="bitnum">6</td><td class="bitnum">5</td><td class="bitnum">4</td><td class="bitnum">3</td><td class="bitnum">2</td><td class="bitnum">1</td><td class="bitnum">0</td></tr><tr><td class="unused" colspan=10>&nbsp;</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_37</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_36</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_35</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_34</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_33</td>
<td class="fname" colspan=1 style="font-size:12.0%">CHANNEL_ALLOC_RX_CH_EN_32</td>
</tr></table></td></tr>
<tr><th width=5%>Bits</th><th width=5%>Type</th><th width=5%>Reset</th><th>Name</th><th>Description</th></tr><tr><td class="regbits">0</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_32</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td><tr><td class="regbits">1</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_33</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td><tr><td class="regbits">2</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_34</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td><tr><td class="regbits">3</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_35</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td><tr><td class="regbits">4</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_36</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td><tr><td class="regbits">5</td><td class="regperm">rw</td><td class="regrv">0x1</td><td class="regfn">CHANNEL_ALLOC_RX_CH_EN_37</td><td class="regde"><p>For CHANNEL_ALLOC_RX_CH_EN1</p></td></table>
<br>
