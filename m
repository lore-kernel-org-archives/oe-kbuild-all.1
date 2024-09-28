Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386F200DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727529038; cv=none; b=ugqAmAueyYKEdBxK9tOIffk+I2mh7oUuZH1X+7Zkqm8dtglJmvIhRynTHH4vAzUhRQ3s7TtEUga48I9dOZcI/yvuUzmf5x/9j0wdzwBizlN0t/hg0EqDxTn9rdfJOdRyDu9FwBXjrH7lwlltfhrluhqbKYvSRnc7v/T4vyFtr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727529038; c=relaxed/simple;
	bh=6nGr2QPUIf7sx8iT6sjAC5P9r3Bg8kxshvMWsWHdpk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RI5dALeFYVCuojTnLtHciMsrOevUjpgejaMjw2fhfpVbdhJi6MpGt2upFZo9dHWhPF779SR0oXA+mq3itIxmtsAFQevWSbjZ2oPQN9xSBXk3+Oaa1nCw1yBvEOjMjotHav89/vYk4Cb8zg0A+d5boQv3cLmGw8X+QDWkPkq4Chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrkSw84f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrkSw84f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727529036; x=1759065036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nGr2QPUIf7sx8iT6sjAC5P9r3Bg8kxshvMWsWHdpk8=;
  b=GrkSw84foqh/KpDlj+olxwmCxzbZUhvOZms32Sj316RDFgB0X83wzeOS
   Vd8FEW/b/gj4ajWIE9T/hoHMEQSXV0WSPN+irSloSaLdIdOsYV3EbGyRb
   twRuOdDu1H5Yv4g5Rxz0A2ldyc4kACCtK86BqwcdAkJ5Xbt+IdwUlGwGG
   AD+OO+AiRCEgiQCgkARe2tt1npu8nLwpDrP/towJZe5dIlkUPV8xXzUFs
   4PGKN6RedZdDpgJGQsHAPU9UlEVuA79B6Vu6vPzecL80UNC9neCTRuZot
   tyyrcS4V5J6r6HmQL0+P4PYmtxjk/2oUZOag8R7iGOJ98DA33SCS8yroQ
   A==;
X-CSE-ConnectionGUID: U4/Jh3eTTw29KgxvbAp5cA==
X-CSE-MsgGUID: deH1a2UySYKFhCk9BBpeXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26841010"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26841010"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 06:10:21 -0700
X-CSE-ConnectionGUID: XKa0AnWFRCCgmBvKDSzZgw==
X-CSE-MsgGUID: VQ/M+QhaQQWfNWo/fDglUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="110300007"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2024 06:10:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suXDB-000NHV-1B;
	Sat, 28 Sep 2024 13:10:13 +0000
Date: Sat, 28 Sep 2024 21:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 150/1001]
 drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:478:43: warning: cast
 to pointer from integer of different size
Message-ID: <202409282155.iVy73IzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 613e39d370ef73bc8bffb2c5bfc7e07f8b153d24 [150/1001] staging: net: xilinx: add Xilinx TSN driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409282155.iVy73IzF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282155.iVy73IzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282155.iVy73IzF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_start_xmit_done_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:478:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     478 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_queue_xmit_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:601:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     601 |             (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
         |               ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:640:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     640 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:641:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     641 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_recv':
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:701:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     701 |                 skb = (struct sk_buff *)(cur_p->sw_id_offset);
         |                       ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:786:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     786 |                 cur_p->sw_id_offset = (phys_addr_t)new_skb;
         |                                       ^
--
   In file included from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:17:
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_rx_bd_free_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:160:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     160 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1381:45: note: in definition of macro 'dev_kfree_skb'
    1381 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_rx_q_init_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:294:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     294 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c: In function 'axienet_mcdma_err_handler_tsn':
   drivers/staging/xilinx-tsn/xilinx_axienet_mcdma_tsn.c:686:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     686 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
--
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'tadma_xmit_done':
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:136:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     136 |                         dev_kfree_skb_irq((struct sk_buff *)
         |                                           ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'axienet_tadma_xmit':
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:517:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     517 |                 lp->tx_bd[sid][lp->tx_bd_head[sid]].tx_skb = (phys_addr_t)skb;
         |                                                              ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:550:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     550 |                                                         (phys_addr_t)skb;
         |                                                         ^


vim +478 drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c

   442	
   443	/**
   444	 * axienet_start_xmit_done_tsn - Invoked once a transmit is completed by the
   445	 * Axi DMA Tx channel.
   446	 * @ndev:	Pointer to the net_device structure
   447	 * @q:		Pointer to DMA queue structure
   448	 *
   449	 * This function is invoked from the Axi DMA Tx isr to notify the completion
   450	 * of transmit operation. It clears fields in the corresponding Tx BDs and
   451	 * unmaps the corresponding buffer so that CPU can regain ownership of the
   452	 * buffer. It finally invokes "netif_wake_queue" to restart transmission if
   453	 * required.
   454	 */
   455	void axienet_start_xmit_done_tsn(struct net_device *ndev,
   456					 struct axienet_dma_q *q)
   457	{
   458		u32 size = 0;
   459		u32 packets = 0;
   460		struct axienet_local *lp = netdev_priv(ndev);
   461		struct aximcdma_bd *cur_p;
   462		unsigned int status = 0;
   463	
   464		cur_p = &q->txq_bd_v[q->tx_bd_ci];
   465		status = cur_p->sband_stats;
   466		while (status & XAXIDMA_BD_STS_COMPLETE_MASK) {
   467			if (cur_p->tx_desc_mapping == DESC_DMA_MAP_PAGE)
   468				dma_unmap_page(ndev->dev.parent, cur_p->phys,
   469					       cur_p->cntrl &
   470					       XAXIDMA_BD_CTRL_LENGTH_MASK,
   471					       DMA_TO_DEVICE);
   472			else
   473				dma_unmap_single(ndev->dev.parent, cur_p->phys,
   474						 cur_p->cntrl &
   475						 XAXIDMA_BD_CTRL_LENGTH_MASK,
   476						 DMA_TO_DEVICE);
   477			if (cur_p->tx_skb)
 > 478				dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
   479			/*cur_p->phys = 0;*/
   480			cur_p->app0 = 0;
   481			cur_p->app1 = 0;
   482			cur_p->app2 = 0;
   483			cur_p->app4 = 0;
   484			cur_p->status = 0;
   485			cur_p->tx_skb = 0;
   486			cur_p->sband_stats = 0;
   487	
   488			size += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
   489			packets++;
   490	
   491			if (++q->tx_bd_ci >= lp->tx_bd_num)
   492				q->tx_bd_ci = 0;
   493			cur_p = &q->txq_bd_v[q->tx_bd_ci];
   494			status = cur_p->sband_stats;
   495		}
   496	
   497		ndev->stats.tx_packets += packets;
   498		ndev->stats.tx_bytes += size;
   499		q->tx_packets += packets;
   500		q->tx_bytes += size;
   501	
   502		/* Matches barrier in axienet_start_xmit */
   503		smp_mb();
   504	
   505		/* Fixme: With the existing multiqueue implementation
   506		 * in the driver it is difficult to get the exact queue info.
   507		 * We should wake only the particular queue
   508		 * instead of waking all ndev queues.
   509		 */
   510		netif_tx_wake_all_queues(ndev);
   511	}
   512	
   513	/**
   514	 * axienet_check_tx_bd_space - Checks if a BD/group of BDs are currently busy
   515	 * @q:		Pointer to DMA queue structure
   516	 * @num_frag:	The number of BDs to check for
   517	 *
   518	 * Return: 0, on success
   519	 *	    NETDEV_TX_BUSY, if any of the descriptors are not free
   520	 *
   521	 * This function is invoked before BDs are allocated and transmission starts.
   522	 * This function returns 0 if a BD or group of BDs can be allocated for
   523	 * transmission. If the BD or any of the BDs are not free the function
   524	 * returns a busy status. This is invoked from axienet_start_xmit.
   525	 */
   526	static inline int axienet_check_tx_bd_space(struct axienet_dma_q *q,
   527						    int num_frag)
   528	{
   529		struct axienet_local *lp = q->lp;
   530		struct aximcdma_bd *cur_p;
   531	
   532		if (CIRC_SPACE(q->tx_bd_tail, q->tx_bd_ci, lp->tx_bd_num) < (num_frag + 1))
   533			return NETDEV_TX_BUSY;
   534	
   535		cur_p = &q->txq_bd_v[(q->tx_bd_tail + num_frag) % lp->tx_bd_num];
   536		if (cur_p->sband_stats & XMCDMA_BD_STS_ALL_MASK)
   537			return NETDEV_TX_BUSY;
   538		return 0;
   539	}
   540	
   541	int axienet_queue_xmit_tsn(struct sk_buff *skb,
   542				   struct net_device *ndev, u16 map)
   543	{
   544		u32 ii;
   545		u32 num_frag;
   546		u32 csum_start_off;
   547		u32 csum_index_off;
   548		dma_addr_t tail_p;
   549		struct axienet_local *lp = netdev_priv(ndev);
   550		struct aximcdma_bd *cur_p;
   551		unsigned long flags;
   552		struct axienet_dma_q *q;
   553	
   554		num_frag = skb_shinfo(skb)->nr_frags;
   555	
   556		q = lp->dq[map];
   557	
   558		cur_p = &q->txq_bd_v[q->tx_bd_tail];
   559		spin_lock_irqsave(&q->tx_lock, flags);
   560		if (axienet_check_tx_bd_space(q, num_frag)) {
   561			if (netif_queue_stopped(ndev)) {
   562				spin_unlock_irqrestore(&q->tx_lock, flags);
   563				return NETDEV_TX_BUSY;
   564			}
   565	
   566			netif_stop_queue(ndev);
   567	
   568			/* Matches barrier in axienet_start_xmit_done_tsn */
   569			smp_mb();
   570	
   571			/* Space might have just been freed - check again */
   572			if (axienet_check_tx_bd_space(q, num_frag)) {
   573				spin_unlock_irqrestore(&q->tx_lock, flags);
   574				return NETDEV_TX_BUSY;
   575			}
   576	
   577			netif_wake_queue(ndev);
   578		}
   579	
   580		if (skb->ip_summed == CHECKSUM_PARTIAL && !lp->eth_hasnobuf &&
   581		    lp->axienet_config->mactype == XAXIENET_1G) {
   582			if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
   583				/* Tx Full Checksum Offload Enabled */
   584				cur_p->app0 |= 2;
   585			} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
   586				csum_start_off = skb_transport_offset(skb);
   587				csum_index_off = csum_start_off + skb->csum_offset;
   588				/* Tx Partial Checksum Offload Enabled */
   589				cur_p->app0 |= 1;
   590				cur_p->app1 = (csum_start_off << 16) | csum_index_off;
   591			}
   592		} else if (skb->ip_summed == CHECKSUM_UNNECESSARY &&
   593			   !lp->eth_hasnobuf &&
   594			   (lp->axienet_config->mactype == XAXIENET_1G)) {
   595			cur_p->app0 |= 2; /* Tx Full Checksum Offload Enabled */
   596		}
   597	
   598		cur_p->cntrl = (skb_headlen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK);
   599	
   600		if (!q->eth_hasdre &&
 > 601		    (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
   602			skb_copy_and_csum_dev(skb, q->tx_buf[q->tx_bd_tail]);
   603	
   604			cur_p->phys = q->tx_bufs_dma +
   605				      (q->tx_buf[q->tx_bd_tail] - q->tx_bufs);
   606	
   607			cur_p->cntrl = skb_pagelen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK;
   608			goto out;
   609		} else {
   610			cur_p->phys = dma_map_single(ndev->dev.parent, skb->data,
   611						     skb_headlen(skb), DMA_TO_DEVICE);
   612			if (unlikely(dma_mapping_error(ndev->dev.parent, cur_p->phys))) {
   613				cur_p->phys = 0;
   614				spin_unlock_irqrestore(&q->tx_lock, flags);
   615				dev_err(&ndev->dev, "TX buffer map failed\n");
   616				return NETDEV_TX_BUSY;
   617			}
   618		}
   619		cur_p->tx_desc_mapping = DESC_DMA_MAP_SINGLE;
   620	
   621		for (ii = 0; ii < num_frag; ii++) {
   622			u32 len;
   623			skb_frag_t *frag;
   624	
   625			if (++q->tx_bd_tail >= lp->tx_bd_num)
   626				q->tx_bd_tail = 0;
   627	
   628			cur_p = &q->txq_bd_v[q->tx_bd_tail];
   629			frag = &skb_shinfo(skb)->frags[ii];
   630			len = skb_frag_size(frag);
   631			cur_p->phys = skb_frag_dma_map(ndev->dev.parent, frag, 0, len,
   632						       DMA_TO_DEVICE);
   633			cur_p->cntrl = len;
   634			cur_p->tx_desc_mapping = DESC_DMA_MAP_PAGE;
   635		}
   636	
   637	out:
   638		cur_p->cntrl |= XMCDMA_BD_CTRL_TXEOF_MASK;
   639		tail_p = q->tx_bd_p + sizeof(*q->txq_bd_v) * q->tx_bd_tail;
   640		cur_p->tx_skb = (phys_addr_t)skb;
   641		cur_p->tx_skb = (phys_addr_t)skb;
   642	
   643		tail_p = q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
   644		/* Ensure BD write before starting transfer */
   645		wmb();
   646	
   647		/* Start the transfer */
   648		axienet_dma_bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id),
   649				  tail_p);
   650		if (++q->tx_bd_tail >= lp->tx_bd_num)
   651			q->tx_bd_tail = 0;
   652	
   653		spin_unlock_irqrestore(&q->tx_lock, flags);
   654	
   655		return NETDEV_TX_OK;
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
