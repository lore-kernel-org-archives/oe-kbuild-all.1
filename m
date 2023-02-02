Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F73AD3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675380838; x=1706916838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d26hBVtU/puXW4vhKRbSiS5Id/YxAV+HSJoS8nA0EkM=;
  b=PvE7Ndxt2yoHAbAzwcCXLjliEvcjmsE3yjqK/FxGbVF4rqzZtqAletZh
   pQLjB0ADcweoBAazTbdi5eYWnvZktN9KFY6/ahgQmhbp0uNIbWTF6VTUt
   nMYZ0QyRNemqiHAvMn4wmlNTpAS8u4NVeacyZ7VkrTYcf2lxqzDSbd8UZ
   Bus0cxKX8n4qfrrcr93cjyzG25MXcw1l72GE/NfiDKOb22sic29hlcEXz
   NiEHWl6s8Hpl1AOR56nK2b2s2arA5T7NEesLcc5aakkShDODdVTrl6Z6M
   VhLp/rIelMYB/YpTgHZcQ8EczmfvQL5KguqgxTUQWM+u5q/MiHDk3WltS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308942472"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308942472"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 15:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774084631"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="774084631"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 15:33:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNj5X-0006x2-0b;
	Thu, 02 Feb 2023 23:33:55 +0000
Date: Fri, 3 Feb 2023 07:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [pinchartl-media:muxed/2023.1/base 640/929]
 drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit
 declaration of function 'writeq'; did you mean 'writeb'?
Message-ID: <202302030754.ntU7jOPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/base
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: 5bf347126b8fdeac0625d9a4b344a631f3aaf4d6 [640/929] staging: net: xilinx: add Xilinx TSN driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302030754.ntU7jOPr-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/base
        git checkout 5bf347126b8fdeac0625d9a4b344a631f3aaf4d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:27:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c: In function 'tsn_ep_probe':
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:555:57: warning: passing argument 2 of 'of_get_mac_address' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     555 |         ret = of_get_mac_address(pdev->dev.of_node, ndev->dev_addr);
         |                                                     ~~~~^~~~~~~~~~
   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:24:
   include/linux/of_net.h:16:59: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'const unsigned char *'
      16 | extern int of_get_mac_address(struct device_node *np, u8 *mac);
         |                                                       ~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_ep_ex.c:27:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   cc1: some warnings being treated as errors
--
   In file included from drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:49:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_start_xmit_done_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:479:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_queue_xmit_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:602:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     602 |             (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
         |               ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:641:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     641 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:642:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     642 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_recv':
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:702:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     702 |                 skb = (struct sk_buff *)(cur_p->sw_id_offset);
         |                       ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:787:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     787 |                 cur_p->sw_id_offset = (phys_addr_t)new_skb;
         |                                       ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:23:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   In file included from include/linux/netlink.h:7,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:17:
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_rx_bd_free_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:160:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     160 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1362:45: note: in definition of macro 'dev_kfree_skb'
    1362 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_rx_q_init_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:294:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     294 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_err_handler_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:686:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     686 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_switchdev.c:12:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   during RTL pass: mach
   drivers/staging/xilinx-tsn/xilinx_tsn_switchdev.c: In function 'xlnx_switchdev_event_work':
   drivers/staging/xilinx-tsn/xilinx_tsn_switchdev.c:206:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
     206 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:24:
   drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h: In function 'axienet_dma_bdout':
>> drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
    1185 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'tadma_xmit_done':
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:136:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     136 |                         dev_kfree_skb_irq((struct sk_buff *)
         |                                           ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'axienet_tadma_xmit':
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:517:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     517 |                 lp->tx_bd[sid][lp->tx_bd_head[sid]].tx_skb = (phys_addr_t)skb;
         |                                                              ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:550:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     550 |                                                         (phys_addr_t)skb;
         |                                                         ^
   cc1: some warnings being treated as errors


vim +1185 drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h

  1171	
  1172	/**
  1173	 * axienet_dma_bdout - Memory mapped Axi DMA register Buffer Descriptor write.
  1174	 * @q:		Pointer to DMA queue structure
  1175	 * @reg:	Address offset from the base address of the Axi DMA core
  1176	 * @value:	Value to be written into the Axi DMA register
  1177	 *
  1178	 * This function writes the desired value into the corresponding Axi DMA
  1179	 * register.
  1180	 */
  1181	static inline void axienet_dma_bdout(struct axienet_dma_q *q,
  1182					     off_t reg, dma_addr_t value)
  1183	{
  1184	#if defined(CONFIG_PHYS_ADDR_T_64BIT)
> 1185		writeq(value, (q->dma_regs + reg));
  1186	#else
  1187		writel(value, (q->dma_regs + reg));
  1188	#endif
  1189	}
  1190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
