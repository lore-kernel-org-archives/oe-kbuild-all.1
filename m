Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2315AC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695252210; x=1726788210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldct3qAMuSktpsqO404Wk6t3pHKk4me47gLDA4zrA5U=;
  b=NiZGycFNPVZZ3tt+/NGvsgsimSi/fhBvXbjaj2/xjAhqrN0XFQJRHnPF
   TBmpNJg0nT+KmJqMlREdEsWk54M93tbm3291nIEXZzM1yAKRjo2NADIF+
   4KW7GOR5xwKrd2RFySiGIxPKRTvVCgrz8mhEOACuAj5nAj/Ckx2rLIfHY
   TR3S8Aqetvo/f3pLJ1rblYdbzEwHItkE52VP9pCeLmQxnsIWSomfsCeaS
   XfpvArwwSg0xieZrIEotMTDkV8wKjsW8DAQthNHfGioE98tvDfIZcmCP2
   lbTKOxd8ZghQFX35/GgO+YslJFVBhTvj2BgyQ1oJakUDU5w6mj3BfwUc/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370682734"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="370682734"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 16:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812364096"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="812364096"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 16:23:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj6XU-0009G4-2M;
	Wed, 20 Sep 2023 23:23:24 +0000
Date: Thu, 21 Sep 2023 07:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Saurabh Sengar <saurabh.singh@xilinx.com>,
	Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 777/1365]
 drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:37:31: warning: cast to
 pointer from integer of different size
Message-ID: <202309210707.HsUu3iEW-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309210707.HsUu3iEW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210707.HsUu3iEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210707.HsUu3iEW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:17:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
   drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/xilinx/xilinx_axienet.h:14:
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:37:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      37 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1362:45: note: in definition of macro 'dev_kfree_skb'
    1362 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function '__dma_rxq_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:172:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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
   drivers/net/ethernet/xilinx/xilinx_axienet.h:979:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     979 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writeb
   In file included from include/linux/netlink.h:7,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:148:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     148 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1362:45: note: in definition of macro 'dev_kfree_skb'
    1362 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_q_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:285:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     285 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:625:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     625 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors


vim +37 drivers/net/ethernet/xilinx/xilinx_axienet_dma.c

    18	
    19	/**
    20	 * axienet_bd_free - Release buffer descriptor rings for individual dma queue
    21	 * @ndev:	Pointer to the net_device structure
    22	 * @q:		Pointer to DMA queue structure
    23	 *
    24	 * This function is helper function to axienet_dma_bd_release.
    25	 */
    26	
    27	void __maybe_unused axienet_bd_free(struct net_device *ndev,
    28					    struct axienet_dma_q *q)
    29	{
    30		int i;
    31		struct axienet_local *lp = netdev_priv(ndev);
    32	
    33		for (i = 0; i < lp->rx_bd_num; i++) {
    34			if (q->rx_bd_v[i].phys)
    35				dma_unmap_single(ndev->dev.parent, q->rx_bd_v[i].phys,
    36						 lp->max_frm_size, DMA_FROM_DEVICE);
  > 37			dev_kfree_skb((struct sk_buff *)
    38				      (q->rx_bd_v[i].sw_id_offset));
    39		}
    40	
    41		if (q->rx_bd_v) {
    42			dma_free_coherent(ndev->dev.parent,
    43					  sizeof(*q->rx_bd_v) * lp->rx_bd_num,
    44					  q->rx_bd_v,
    45					  q->rx_bd_p);
    46		}
    47		if (q->tx_bd_v) {
    48			dma_free_coherent(ndev->dev.parent,
    49					  sizeof(*q->tx_bd_v) * lp->tx_bd_num,
    50					  q->tx_bd_v,
    51					  q->tx_bd_p);
    52		}
    53		if (q->tx_bufs) {
    54			dma_free_coherent(ndev->dev.parent,
    55					  XAE_MAX_PKT_LEN * lp->tx_bd_num,
    56					  q->tx_bufs,
    57					  q->tx_bufs_dma);
    58		}
    59	}
    60	
    61	/**
    62	 * __dma_txq_init - Setup buffer descriptor rings for individual Axi DMA-Tx
    63	 * @ndev:	Pointer to the net_device structure
    64	 * @q:		Pointer to DMA queue structure
    65	 *
    66	 * Return: 0, on success -ENOMEM, on failure
    67	 *
    68	 * This function is helper function to axienet_dma_q_init
    69	 */
    70	static int __dma_txq_init(struct net_device *ndev, struct axienet_dma_q *q)
    71	{
    72		int i;
    73		u32 cr;
    74		struct axienet_local *lp = netdev_priv(ndev);
    75	
    76		q->tx_bd_ci = 0;
    77		q->tx_bd_tail = 0;
    78	
    79		q->tx_bd_v = dma_alloc_coherent(ndev->dev.parent,
    80						sizeof(*q->tx_bd_v) * lp->tx_bd_num,
    81						&q->tx_bd_p, GFP_KERNEL);
    82		if (!q->tx_bd_v)
    83			goto out;
    84	
    85		for (i = 0; i < lp->tx_bd_num; i++) {
    86			q->tx_bd_v[i].next = q->tx_bd_p +
    87					     sizeof(*q->tx_bd_v) *
    88					     ((i + 1) % lp->tx_bd_num);
    89		}
    90	
    91		if (!q->eth_hasdre) {
    92			q->tx_bufs = dma_alloc_coherent(ndev->dev.parent,
    93							XAE_MAX_PKT_LEN * lp->tx_bd_num,
    94							&q->tx_bufs_dma,
    95							GFP_KERNEL);
    96			if (!q->tx_bufs)
    97				goto out;
    98	
    99			for (i = 0; i < lp->tx_bd_num; i++)
   100				q->tx_buf[i] = &q->tx_bufs[i * XAE_MAX_PKT_LEN];
   101		}
   102	
   103		/* Start updating the Tx channel control register */
   104		cr = axienet_dma_in32(q, XAXIDMA_TX_CR_OFFSET);
   105		/* Update the interrupt coalesce count */
   106		cr = (((cr & ~XAXIDMA_COALESCE_MASK)) |
   107		      ((lp->coalesce_count_tx) << XAXIDMA_COALESCE_SHIFT));
   108		/* Only set interrupt delay timer if not generating an interrupt on
   109		 * the first TX packet. Otherwise leave at 0 to disable delay interrupt.
   110		 */
   111		if (lp->coalesce_count_tx > 1)
   112			cr |= (axienet_usec_to_timer(lp, lp->coalesce_usec_tx)
   113			       << XAXIDMA_DELAY_SHIFT) | XAXIDMA_IRQ_DELAY_MASK;
   114		/* Enable coalesce, delay timer and error interrupts */
   115		cr |= XAXIDMA_IRQ_ALL_MASK;
   116		/* Write to the Tx channel control register */
   117		axienet_dma_out32(q, XAXIDMA_TX_CR_OFFSET, cr);
   118	
   119		/* Write to the RS (Run-stop) bit in the Tx channel control register.
   120		 * Tx channel is now ready to run. But only after we write to the
   121		 * tail pointer register that the Tx channel will start transmitting.
   122		 */
   123		axienet_dma_bdout(q, XAXIDMA_TX_CDESC_OFFSET, q->tx_bd_p);
   124		cr = axienet_dma_in32(q, XAXIDMA_TX_CR_OFFSET);
   125		axienet_dma_out32(q, XAXIDMA_TX_CR_OFFSET,
   126				  cr | XAXIDMA_CR_RUNSTOP_MASK);
   127		return 0;
   128	out:
   129		return -ENOMEM;
   130	}
   131	
   132	/**
   133	 * __dma_rxq_init - Setup buffer descriptor rings for individual Axi DMA-Rx
   134	 * @ndev:	Pointer to the net_device structure
   135	 * @q:		Pointer to DMA queue structure
   136	 *
   137	 * Return: 0, on success -ENOMEM, on failure
   138	 *
   139	 * This function is helper function to axienet_dma_q_init
   140	 */
   141	static int __dma_rxq_init(struct net_device *ndev,
   142				  struct axienet_dma_q *q)
   143	{
   144		int i;
   145		u32 cr;
   146		struct sk_buff *skb;
   147		struct axienet_local *lp = netdev_priv(ndev);
   148		/* Reset the indexes which are used for accessing the BDs */
   149		q->rx_bd_ci = 0;
   150	
   151		/* Allocate the Rx buffer descriptors. */
   152		q->rx_bd_v = dma_alloc_coherent(ndev->dev.parent,
   153						sizeof(*q->rx_bd_v) * lp->rx_bd_num,
   154						&q->rx_bd_p, GFP_KERNEL);
   155		if (!q->rx_bd_v)
   156			goto out;
   157	
   158		for (i = 0; i < lp->rx_bd_num; i++) {
   159			q->rx_bd_v[i].next = q->rx_bd_p +
   160					     sizeof(*q->rx_bd_v) *
   161					     ((i + 1) % lp->rx_bd_num);
   162	
   163			skb = netdev_alloc_skb(ndev, lp->max_frm_size);
   164			if (!skb)
   165				goto out;
   166	
   167			/* Ensure that the skb is completely updated
   168			 * prio to mapping the DMA
   169			 */
   170			wmb();
   171	
 > 172			q->rx_bd_v[i].sw_id_offset = (phys_addr_t)skb;
   173			q->rx_bd_v[i].phys = dma_map_single(ndev->dev.parent,
   174							    skb->data,
   175							    lp->max_frm_size,
   176							    DMA_FROM_DEVICE);
   177			if (unlikely(dma_mapping_error(ndev->dev.parent, q->rx_bd_v[i].phys))) {
   178				q->rx_bd_v[i].phys = 0;
   179				dev_err(&ndev->dev, "axidma map error\n");
   180				goto out;
   181			}
   182			q->rx_bd_v[i].cntrl = lp->max_frm_size;
   183		}
   184	
   185		/* Start updating the Rx channel control register */
   186		cr = axienet_dma_in32(q, XAXIDMA_RX_CR_OFFSET);
   187		/* Update the interrupt coalesce count */
   188		cr = ((cr & ~XAXIDMA_COALESCE_MASK) |
   189		      ((lp->coalesce_count_rx) << XAXIDMA_COALESCE_SHIFT));
   190		/* Only set interrupt delay timer if not generating an interrupt on
   191		 * the first RX packet. Otherwise leave at 0 to disable delay interrupt.
   192		 */
   193		if (lp->coalesce_count_rx > 1)
   194			cr |= (axienet_usec_to_timer(lp, lp->coalesce_usec_rx)
   195			       << XAXIDMA_DELAY_SHIFT) | XAXIDMA_IRQ_DELAY_MASK;
   196		/* Enable coalesce, delay timer and error interrupts */
   197		cr |= XAXIDMA_IRQ_ALL_MASK;
   198		/* Write to the Rx channel control register */
   199		axienet_dma_out32(q, XAXIDMA_RX_CR_OFFSET, cr);
   200	
   201		/* Populate the tail pointer and bring the Rx Axi DMA engine out of
   202		 * halted state. This will make the Rx side ready for reception.
   203		 */
   204		axienet_dma_bdout(q, XAXIDMA_RX_CDESC_OFFSET, q->rx_bd_p);
   205		cr = axienet_dma_in32(q, XAXIDMA_RX_CR_OFFSET);
   206		axienet_dma_out32(q, XAXIDMA_RX_CR_OFFSET,
   207				  cr | XAXIDMA_CR_RUNSTOP_MASK);
   208		axienet_dma_bdout(q, XAXIDMA_RX_TDESC_OFFSET, q->rx_bd_p +
   209				  (sizeof(*q->rx_bd_v) * (lp->rx_bd_num - 1)));
   210	
   211		return 0;
   212	out:
   213		return -ENOMEM;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
