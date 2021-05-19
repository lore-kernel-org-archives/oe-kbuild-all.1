Content-Type: multipart/mixed; boundary="===============4810053726282923718=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-5.10.y 3189/5262] drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes in function 'dwc2_hcd_dump_state'
Date: Thu, 20 May 2021 03:48:08 +0800
Message-ID: <202105200357.eXI65Gfu-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4810053726282923718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.10.y
head:   689e89aee55c565fe90fcdf8a7e53f2f976c5946
commit: 5f2f616343b1d62d26f24316fbfc107ecf0983a9 [3189/5262] linux/compiler=
-clang.h: define HAVE_BUILTIN_BSWAP*
config: mips-randconfig-r015-20210519 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8e93d1=
0633d751a3e9169bf9fa68326925ffa097)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3D5f2f616343b1d62d26f24316fbfc107ecf0983a9
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout 5f2f616343b1d62d26f24316fbfc107ecf0983a9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes i=
n function 'dwc2_hcd_dump_state' [-Wframe-larger-than=3D]
   void dwc2_hcd_dump_state(struct dwc2_hsotg *hsotg)
        ^
   1 warning generated.


vim +/dwc2_hcd_dump_state +3835 drivers/usb/dwc2/hcd.c

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
0  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
1  /*
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
2   * NOTE: This function will be removed once the peripheral controller co=
de
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
3   * is integrated and the driver is stable
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
4   */
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11 @383=
5  void dwc2_hcd_dump_state(struct dwc2_hsotg *hsotg)
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
6  {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
7  #ifdef DEBUG
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
8  	struct dwc2_host_chan *chan;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  383=
9  	struct dwc2_hcd_urb *urb;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
0  	struct dwc2_qtd *qtd;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
1  	int num_channels;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
2  	u32 np_tx_status;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
3  	u32 p_tx_status;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
4  	int i;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
5  =

bea8e86c51cf9c drivers/usb/dwc2/hcd.c     John Youn         2016-11-03  384=
6  	num_channels =3D hsotg->params.host_channels;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
7  	dev_dbg(hsotg->dev, "\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
8  	dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  384=
9  		"************************************************************\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
0  	dev_dbg(hsotg->dev, "HCD State:\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
1  	dev_dbg(hsotg->dev, "  Num channels: %d\n", num_channels);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
2  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
3  	for (i =3D 0; i < num_channels; i++) {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
4  		chan =3D hsotg->hc_ptr_array[i];
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
5  		dev_dbg(hsotg->dev, "  Channel %d:\n", i);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
6  		dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
7  			"    dev_addr: %d, ep_num: %d, ep_is_in: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
8  			chan->dev_addr, chan->ep_num, chan->ep_is_in);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  385=
9  		dev_dbg(hsotg->dev, "    speed: %d\n", chan->speed);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
0  		dev_dbg(hsotg->dev, "    ep_type: %d\n", chan->ep_type);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
1  		dev_dbg(hsotg->dev, "    max_packet: %d\n", chan->max_packet);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
2  		dev_dbg(hsotg->dev, "    data_pid_start: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
3  			chan->data_pid_start);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
4  		dev_dbg(hsotg->dev, "    multi_count: %d\n", chan->multi_count);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
5  		dev_dbg(hsotg->dev, "    xfer_started: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
6  			chan->xfer_started);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
7  		dev_dbg(hsotg->dev, "    xfer_buf: %p\n", chan->xfer_buf);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
8  		dev_dbg(hsotg->dev, "    xfer_dma: %08lx\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  386=
9  			(unsigned long)chan->xfer_dma);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
0  		dev_dbg(hsotg->dev, "    xfer_len: %d\n", chan->xfer_len);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
1  		dev_dbg(hsotg->dev, "    xfer_count: %d\n", chan->xfer_count);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
2  		dev_dbg(hsotg->dev, "    halt_on_queue: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
3  			chan->halt_on_queue);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
4  		dev_dbg(hsotg->dev, "    halt_pending: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
5  			chan->halt_pending);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
6  		dev_dbg(hsotg->dev, "    halt_status: %d\n", chan->halt_status);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
7  		dev_dbg(hsotg->dev, "    do_split: %d\n", chan->do_split);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
8  		dev_dbg(hsotg->dev, "    complete_split: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  387=
9  			chan->complete_split);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
0  		dev_dbg(hsotg->dev, "    hub_addr: %d\n", chan->hub_addr);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
1  		dev_dbg(hsotg->dev, "    hub_port: %d\n", chan->hub_port);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
2  		dev_dbg(hsotg->dev, "    xact_pos: %d\n", chan->xact_pos);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
3  		dev_dbg(hsotg->dev, "    requests: %d\n", chan->requests);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
4  		dev_dbg(hsotg->dev, "    qh: %p\n", chan->qh);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
5  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
6  		if (chan->xfer_started) {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
7  			u32 hfnum, hcchar, hctsiz, hcint, hcintmsk;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  388=
8  =

f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  388=
9  			hfnum =3D dwc2_readl(hsotg, HFNUM);
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  389=
0  			hcchar =3D dwc2_readl(hsotg, HCCHAR(i));
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  389=
1  			hctsiz =3D dwc2_readl(hsotg, HCTSIZ(i));
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  389=
2  			hcint =3D dwc2_readl(hsotg, HCINT(i));
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  389=
3  			hcintmsk =3D dwc2_readl(hsotg, HCINTMSK(i));
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
4  			dev_dbg(hsotg->dev, "    hfnum: 0x%08x\n", hfnum);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
5  			dev_dbg(hsotg->dev, "    hcchar: 0x%08x\n", hcchar);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
6  			dev_dbg(hsotg->dev, "    hctsiz: 0x%08x\n", hctsiz);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
7  			dev_dbg(hsotg->dev, "    hcint: 0x%08x\n", hcint);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
8  			dev_dbg(hsotg->dev, "    hcintmsk: 0x%08x\n", hcintmsk);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  389=
9  		}
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
0  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
1  		if (!(chan->xfer_started && chan->qh))
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
2  			continue;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
3  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
4  		list_for_each_entry(qtd, &chan->qh->qtd_list, qtd_list_entry) {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
5  			if (!qtd->in_process)
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
6  				break;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
7  			urb =3D qtd->urb;
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
8  			dev_dbg(hsotg->dev, "    URB Info:\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  390=
9  			dev_dbg(hsotg->dev, "      qtd: %p, urb: %p\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
0  				qtd, urb);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
1  			if (urb) {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
2  				dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
3  					"      Dev: %d, EP: %d %s\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
4  					dwc2_hcd_get_dev_addr(&urb->pipe_info),
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
5  					dwc2_hcd_get_ep_num(&urb->pipe_info),
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
6  					dwc2_hcd_is_pipe_in(&urb->pipe_info) ?
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
7  					"IN" : "OUT");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  391=
8  				dev_dbg(hsotg->dev,
babd183915e91a drivers/usb/dwc2/hcd.c     Douglas Anderson  2019-05-31  391=
9  					"      Max packet size: %d (%d mult)\n",
babd183915e91a drivers/usb/dwc2/hcd.c     Douglas Anderson  2019-05-31  392=
0  					dwc2_hcd_get_maxp(&urb->pipe_info),
babd183915e91a drivers/usb/dwc2/hcd.c     Douglas Anderson  2019-05-31  392=
1  					dwc2_hcd_get_maxp_mult(&urb->pipe_info));
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  392=
2  				dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  392=
3  					"      transfer_buffer: %p\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  392=
4  					urb->buf);
157dfaac1f2922 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-14  392=
5  				dev_dbg(hsotg->dev,
157dfaac1f2922 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-14  392=
6  					"      transfer_dma: %08lx\n",
157dfaac1f2922 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-14  392=
7  					(unsigned long)urb->dma);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  392=
8  				dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  392=
9  					"      transfer_buffer_length: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
0  					urb->length);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
1  				dev_dbg(hsotg->dev, "      actual_length: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
2  					urb->actual_length);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
3  			}
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
4  		}
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
5  	}
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
6  =

7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
7  	dev_dbg(hsotg->dev, "  non_periodic_channels: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
8  		hsotg->non_periodic_channels);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  393=
9  	dev_dbg(hsotg->dev, "  periodic_channels: %d\n",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  394=
0  		hsotg->periodic_channels);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  394=
1  	dev_dbg(hsotg->dev, "  periodic_usecs: %d\n", hsotg->periodic_usecs);
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  394=
2  	np_tx_status =3D dwc2_readl(hsotg, GNPTXSTS);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  394=
3  	dev_dbg(hsotg->dev, "  NP Tx Req Queue Space Avail: %d\n",
d6ec53e04bf790 drivers/staging/dwc2/hcd.c Matthijs Kooijman 2013-08-30  394=
4  		(np_tx_status & TXSTS_QSPCAVAIL_MASK) >> TXSTS_QSPCAVAIL_SHIFT);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  394=
5  	dev_dbg(hsotg->dev, "  NP Tx FIFO Space Avail: %d\n",
d6ec53e04bf790 drivers/staging/dwc2/hcd.c Matthijs Kooijman 2013-08-30  394=
6  		(np_tx_status & TXSTS_FSPCAVAIL_MASK) >> TXSTS_FSPCAVAIL_SHIFT);
f25c42b8d604fb drivers/usb/dwc2/hcd.c     Gevorg Sahakyan   2018-07-26  394=
7  	p_tx_status =3D dwc2_readl(hsotg, HPTXSTS);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  394=
8  	dev_dbg(hsotg->dev, "  P Tx Req Queue Space Avail: %d\n",
d6ec53e04bf790 drivers/staging/dwc2/hcd.c Matthijs Kooijman 2013-08-30  394=
9  		(p_tx_status & TXSTS_QSPCAVAIL_MASK) >> TXSTS_QSPCAVAIL_SHIFT);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
0  	dev_dbg(hsotg->dev, "  P Tx FIFO Space Avail: %d\n",
d6ec53e04bf790 drivers/staging/dwc2/hcd.c Matthijs Kooijman 2013-08-30  395=
1  		(p_tx_status & TXSTS_FSPCAVAIL_MASK) >> TXSTS_FSPCAVAIL_SHIFT);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
2  	dwc2_dump_global_registers(hsotg);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
3  	dwc2_dump_host_registers(hsotg);
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
4  	dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
5  		"************************************************************\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
6  	dev_dbg(hsotg->dev, "\n");
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
7  #endif
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
8  }
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman    2013-03-11  395=
9  =


:::::: The code at line 3835 was first introduced by commit
:::::: 7359d482eb4d3967cc8be354405ae6be6eaf732c staging: HCD files for the =
DWC2 driver

:::::: TO: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4810053726282923718==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4810053726282923718==--

