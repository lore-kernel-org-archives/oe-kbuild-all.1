Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99E3D90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695280702; x=1726816702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aupaszkx+25EZH7fo8CqkCZFh6gPIeFpUmG7K/Rjnjc=;
  b=XqEAYhYk/fGuz0OJffJJM2H3A1Kk38Y/nijcaf9g2+qw0SVXqj+kdjB3
   hYsApQkO64C452WNurk88AttIn+fAyeoHWCio7xh8FEOhsudm/yyOZ6yC
   pGnl6iulQHEbETXAQlH0VGFOwAoIsvH+72ftDcPa2RHMOErIQCX2rB+kx
   RpJunQGDfhpHFLhB9CkZcI3Ci4UUno1os/GJLeXfd3DTdtz7aWsOnvmcc
   LgJEuLjOEvrqhDQvTXpcPvBAGN0XyE0Fms3PJ83saevSWxoaKmSJzBlNB
   9ENAgKbQQXSMrN8JfvtGMJd5c5mT0mUhBMnMxc9lzDdTQV3W6nPj3y1O+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383184663"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="383184663"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 00:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740519232"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="740519232"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Sep 2023 00:18:13 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjDww-0009gz-1M;
	Thu, 21 Sep 2023 07:18:10 +0000
Date: Thu, 21 Sep 2023 15:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Saurabh Sengar <saurabh.singh@xilinx.com>,
	Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 777/1365]
 drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit
 declaration of function 'writeq'; did you mean 'writeb'?
Message-ID: <202309211554.I43hH7hZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 34226470e8807581654cee237e6e9a89a2c6d0b7 [777/1365] net: axienet: added multichannel DMA support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309211554.I43hH7hZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211554.I43hH7hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211554.I43hH7hZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:49:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_tx_hwtstamp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:555:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     555 |                 skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
         |                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:617:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     617 |                 skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
         |                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:620:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     620 |         skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:621:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     621 |         dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
         |                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_start_xmit_done':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:722:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     722 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_skb_tstsmp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:926:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     926 |                                 cur_p->ptp_tx_skb = (phys_addr_t)skb_get(skb);
         |                                                     ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_queue_xmit':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1030:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1030 |             (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
         |               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1082:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1082 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1083:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1083 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_recv':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1177:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1177 |                 skb = (struct sk_buff *)(cur_p->sw_id_offset);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1267:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1267 |                 cur_p->sw_id_offset = (phys_addr_t)new_skb;
         |                                       ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:17:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/xilinx/xilinx_axienet.h:14:
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_bd_free':
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:37:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      37 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1362:45: note: in definition of macro 'dev_kfree_skb'
    1362 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function '__dma_rxq_init':
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:172:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     172 |                 q->rx_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                              ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_dma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:412:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     412 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:24:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   In file included from include/linux/netlink.h:7,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_bd_free':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:148:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     148 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1362:45: note: in definition of macro 'dev_kfree_skb'
    1362 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_q_init':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:285:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     285 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:625:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     625 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors


vim +979 drivers/net/ethernet/xilinx/xilinx_axienet.h

   965	
   966	/**
   967	 * axienet_dma_bdout - Memory mapped Axi DMA register Buffer Descriptor write.
   968	 * @q:		Pointer to DMA queue structure
   969	 * @reg:	Address offset from the base address of the Axi DMA core
   970	 * @value:	Value to be written into the Axi DMA register
   971	 *
   972	 * This function writes the desired value into the corresponding Axi DMA
   973	 * register.
   974	 */
   975	static inline void axienet_dma_bdout(struct axienet_dma_q *q,
   976					     off_t reg, dma_addr_t value)
   977	{
   978	#if defined(CONFIG_PHYS_ADDR_T_64BIT)
 > 979		writeq(value, (q->dma_regs + reg));
   980	#else
   981		writel(value, (q->dma_regs + reg));
   982	#endif
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
