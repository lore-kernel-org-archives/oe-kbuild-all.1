Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D235138E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696108973; x=1727644973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OM/XyiqAR8qBSlOW2QbL8AdFTf1waUvSkbunXpOPTQ=;
  b=DuWlhTgT35wR7peiP/dqbXhIsZWK92EP2IyAaXm+AQCPiGz/K3QKzNDK
   3WBnE9DgM3o0n4hQBHPmG4Z5upZX6bZqyigKnFEQh1ZptoF3kss/Tw1GU
   n9AVu1TG8wh/iX1GwjQjMGIXDs563xl1WqzM3Q7t9w4K86igY+8OQOhQe
   qZ7YrK97Wl153o3Kjz7bOe2WbG2CS2BI7PUmNeJ2q9351i1iXOqz+rH2b
   YL2TjUj2jFiD5PbLJcj7PFrG6c/bEOcmAD64yMaJ/U+6wm4Vi7cZO0kS5
   Z2SwR6p/Bm0x2Rg/cQHu4AZpBz/9hwFuljHOpExlX6IT6Ovc1OwMorPK6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="386342389"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="386342389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 14:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="866091423"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="866091423"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2023 14:22:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmhQG-0004U5-1m;
	Sat, 30 Sep 2023 21:22:48 +0000
Date: Sun, 1 Oct 2023 05:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 637/1370]
 drivers/staging/xilinx-tsn/xilinx_axienet_tsn.h:1185:9: error: implicit
 declaration of function 'writeq'; did you mean 'writeb'?
Message-ID: <202310010547.cB8VG2YE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 03252b346d787210f709c33dc420d2e1bcb0f10a [637/1370] staging: net: xilinx: add Xilinx TSN driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310010547.cB8VG2YE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010547.cB8VG2YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010547.cB8VG2YE-lkp@intel.com/

Note: the xilinx-xlnx/xlnx_rebase_v6.1_LTS HEAD a19da02cf5b44420ec6afb1eef348c21d9e8cda2 builds fine.
      It only hurts bisectability.

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
   drivers/staging/xilinx-tsn/xilinx_tsn_switchdev.c:206:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     206 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
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
https://github.com/intel/lkp-tests/wiki
