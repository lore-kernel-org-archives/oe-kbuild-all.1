Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5718F2DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592217; cv=none; b=tpek2kW1nD7gezWneQ0fOT8dBuQoYnIk29uN50VfhohEAd8JKRzyQoCPcRmWF8W2lBI18x14/9vSLEKfhUuok1gZuk2cYjB0DOOwza+r4KkCcqUHQPwFTZVfFmIdXSW7Q6rt1kjV114mjukzth7xy7TquVG6AIwAp5KEvSRPexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592217; c=relaxed/simple;
	bh=klpGnf10hZycVQyVwzSM7haxxpMwgvd9X0sWpA1HiMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOgELukYZod9Q83mhxRf4qyaVPPQC4U6maBmXc5+qM2fDICUFTaTY1Cx3v6/Z/nDZN1I21tLpzx7RR7nqSFVEMaq3RriiLlh/ql4+D/rEIKzpy6xieukpObwgdMEsKtsT7GSb7rQkLCMhcw0ZzikltVb1MdnLOYqAHyaYTXLcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHr5hP4r; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHr5hP4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736592215; x=1768128215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klpGnf10hZycVQyVwzSM7haxxpMwgvd9X0sWpA1HiMI=;
  b=GHr5hP4rJM2PtiRmVcW5cWxE84hk2Lq/JduWZcesu8dlPToB51Pc5snS
   h8Fhsokx9Ezl65dbuQ1iWFizqqGx25F1xyZTy2iwFipTuBY7PlF2SqLCo
   qdQwWXzZPB081ftMzmQw6OcBFjnysGk5B+ZMvZzfK+G1tJICGt28WRMNG
   6BHA5+qaPPzy2h5h5MonE6nzjaB/uCMprsJKEJIj/53MuhYm7QzPQJu92
   X/hfNxcYOTX44Ebpsn2+zoKO4VWL5wncHIiAYtLauucCILzr6PSuH/r5P
   ghrCDbQS/WEvclERDHaiz4GP4BQiq+9v6twoa+Or2yT6ytbEY8HU+XM6C
   A==;
X-CSE-ConnectionGUID: r+oBHvxPQymOk8wc1PHFQQ==
X-CSE-MsgGUID: CFzicV0wQxmS63/k3Gfkeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36770193"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36770193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:43:35 -0800
X-CSE-ConnectionGUID: 3m39M+SuS9uewCvrbMIbWA==
X-CSE-MsgGUID: /IQMg27dQJ6jMrTjypSvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104148248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 02:43:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYxm-000KVH-2O;
	Sat, 11 Jan 2025 10:43:30 +0000
Date: Sat, 11 Jan 2025 18:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 111/504]
 drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:479:43: warning: cast
 to pointer from integer of different size
Message-ID: <202501111827.NGsNvOd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 79569a88d904a3efdb6a5f054e40344b688ed82e [111/504] staging: net: xilinx: add Xilinx TSN driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111827.NGsNvOd2-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111827.NGsNvOd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111827.NGsNvOd2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_start_xmit_done_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:479:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: In function 'axienet_queue_xmit_tsn':
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c:602:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
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
   include/linux/skbuff.h:1417:45: note: in definition of macro 'dev_kfree_skb'
    1417 | #define dev_kfree_skb(a)        consume_skb(a)
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
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:503:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     503 |                 lp->tx_bd[sid][lp->tx_bd_head[sid]].tx_skb = (phys_addr_t)skb;
         |                                                              ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:536:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     536 |                                                         (phys_addr_t)skb;
         |                                                         ^


vim +479 drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c

   443	
   444	/**
   445	 * axienet_start_xmit_done_tsn - Invoked once a transmit is completed by the
   446	 * Axi DMA Tx channel.
   447	 * @ndev:	Pointer to the net_device structure
   448	 * @q:		Pointer to DMA queue structure
   449	 *
   450	 * This function is invoked from the Axi DMA Tx isr to notify the completion
   451	 * of transmit operation. It clears fields in the corresponding Tx BDs and
   452	 * unmaps the corresponding buffer so that CPU can regain ownership of the
   453	 * buffer. It finally invokes "netif_wake_queue" to restart transmission if
   454	 * required.
   455	 */
   456	void axienet_start_xmit_done_tsn(struct net_device *ndev,
   457					 struct axienet_dma_q *q)
   458	{
   459		u32 size = 0;
   460		u32 packets = 0;
   461		struct axienet_local *lp = netdev_priv(ndev);
   462		struct aximcdma_bd *cur_p;
   463		unsigned int status = 0;
   464	
   465		cur_p = &q->txq_bd_v[q->tx_bd_ci];
   466		status = cur_p->sband_stats;
   467		while (status & XAXIDMA_BD_STS_COMPLETE_MASK) {
   468			if (cur_p->tx_desc_mapping == DESC_DMA_MAP_PAGE)
   469				dma_unmap_page(ndev->dev.parent, cur_p->phys,
   470					       cur_p->cntrl &
   471					       XAXIDMA_BD_CTRL_LENGTH_MASK,
   472					       DMA_TO_DEVICE);
   473			else
   474				dma_unmap_single(ndev->dev.parent, cur_p->phys,
   475						 cur_p->cntrl &
   476						 XAXIDMA_BD_CTRL_LENGTH_MASK,
   477						 DMA_TO_DEVICE);
   478			if (cur_p->tx_skb)
 > 479				dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
   480			/*cur_p->phys = 0;*/
   481			cur_p->app0 = 0;
   482			cur_p->app1 = 0;
   483			cur_p->app2 = 0;
   484			cur_p->app4 = 0;
   485			cur_p->status = 0;
   486			cur_p->tx_skb = 0;
   487			cur_p->sband_stats = 0;
   488	
   489			size += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
   490			packets++;
   491	
   492			if (++q->tx_bd_ci >= lp->tx_bd_num)
   493				q->tx_bd_ci = 0;
   494			cur_p = &q->txq_bd_v[q->tx_bd_ci];
   495			status = cur_p->sband_stats;
   496		}
   497	
   498		ndev->stats.tx_packets += packets;
   499		ndev->stats.tx_bytes += size;
   500		q->tx_packets += packets;
   501		q->tx_bytes += size;
   502	
   503		/* Matches barrier in axienet_start_xmit */
   504		smp_mb();
   505	
   506		/* Fixme: With the existing multiqueue implementation
   507		 * in the driver it is difficult to get the exact queue info.
   508		 * We should wake only the particular queue
   509		 * instead of waking all ndev queues.
   510		 */
   511		netif_tx_wake_all_queues(ndev);
   512	}
   513	
   514	/**
   515	 * axienet_check_tx_bd_space - Checks if a BD/group of BDs are currently busy
   516	 * @q:		Pointer to DMA queue structure
   517	 * @num_frag:	The number of BDs to check for
   518	 *
   519	 * Return: 0, on success
   520	 *	    NETDEV_TX_BUSY, if any of the descriptors are not free
   521	 *
   522	 * This function is invoked before BDs are allocated and transmission starts.
   523	 * This function returns 0 if a BD or group of BDs can be allocated for
   524	 * transmission. If the BD or any of the BDs are not free the function
   525	 * returns a busy status. This is invoked from axienet_start_xmit.
   526	 */
   527	static inline int axienet_check_tx_bd_space(struct axienet_dma_q *q,
   528						    int num_frag)
   529	{
   530		struct axienet_local *lp = q->lp;
   531		struct aximcdma_bd *cur_p;
   532	
   533		if (CIRC_SPACE(q->tx_bd_tail, q->tx_bd_ci, lp->tx_bd_num) < (num_frag + 1))
   534			return NETDEV_TX_BUSY;
   535	
   536		cur_p = &q->txq_bd_v[(q->tx_bd_tail + num_frag) % lp->tx_bd_num];
   537		if (cur_p->sband_stats & XMCDMA_BD_STS_ALL_MASK)
   538			return NETDEV_TX_BUSY;
   539		return 0;
   540	}
   541	
   542	int axienet_queue_xmit_tsn(struct sk_buff *skb,
   543				   struct net_device *ndev, u16 map)
   544	{
   545		u32 ii;
   546		u32 num_frag;
   547		u32 csum_start_off;
   548		u32 csum_index_off;
   549		dma_addr_t tail_p;
   550		struct axienet_local *lp = netdev_priv(ndev);
   551		struct aximcdma_bd *cur_p;
   552		unsigned long flags;
   553		struct axienet_dma_q *q;
   554	
   555		num_frag = skb_shinfo(skb)->nr_frags;
   556	
   557		q = lp->dq[map];
   558	
   559		cur_p = &q->txq_bd_v[q->tx_bd_tail];
   560		spin_lock_irqsave(&q->tx_lock, flags);
   561		if (axienet_check_tx_bd_space(q, num_frag)) {
   562			if (netif_queue_stopped(ndev)) {
   563				spin_unlock_irqrestore(&q->tx_lock, flags);
   564				return NETDEV_TX_BUSY;
   565			}
   566	
   567			netif_stop_queue(ndev);
   568	
   569			/* Matches barrier in axienet_start_xmit_done_tsn */
   570			smp_mb();
   571	
   572			/* Space might have just been freed - check again */
   573			if (axienet_check_tx_bd_space(q, num_frag)) {
   574				spin_unlock_irqrestore(&q->tx_lock, flags);
   575				return NETDEV_TX_BUSY;
   576			}
   577	
   578			netif_wake_queue(ndev);
   579		}
   580	
   581		if (skb->ip_summed == CHECKSUM_PARTIAL && !lp->eth_hasnobuf &&
   582		    lp->axienet_config->mactype == XAXIENET_1G) {
   583			if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
   584				/* Tx Full Checksum Offload Enabled */
   585				cur_p->app0 |= 2;
   586			} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
   587				csum_start_off = skb_transport_offset(skb);
   588				csum_index_off = csum_start_off + skb->csum_offset;
   589				/* Tx Partial Checksum Offload Enabled */
   590				cur_p->app0 |= 1;
   591				cur_p->app1 = (csum_start_off << 16) | csum_index_off;
   592			}
   593		} else if (skb->ip_summed == CHECKSUM_UNNECESSARY &&
   594			   !lp->eth_hasnobuf &&
   595			   (lp->axienet_config->mactype == XAXIENET_1G)) {
   596			cur_p->app0 |= 2; /* Tx Full Checksum Offload Enabled */
   597		}
   598	
   599		cur_p->cntrl = (skb_headlen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK);
   600	
   601		if (!q->eth_hasdre &&
 > 602		    (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
   603			skb_copy_and_csum_dev(skb, q->tx_buf[q->tx_bd_tail]);
   604	
   605			cur_p->phys = q->tx_bufs_dma +
   606				      (q->tx_buf[q->tx_bd_tail] - q->tx_bufs);
   607	
   608			cur_p->cntrl = skb_pagelen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK;
   609			goto out;
   610		} else {
   611			cur_p->phys = dma_map_single(ndev->dev.parent, skb->data,
   612						     skb_headlen(skb), DMA_TO_DEVICE);
   613			if (unlikely(dma_mapping_error(ndev->dev.parent, cur_p->phys))) {
   614				cur_p->phys = 0;
   615				spin_unlock_irqrestore(&q->tx_lock, flags);
   616				dev_err(&ndev->dev, "TX buffer map failed\n");
   617				return NETDEV_TX_BUSY;
   618			}
   619		}
   620		cur_p->tx_desc_mapping = DESC_DMA_MAP_SINGLE;
   621	
   622		for (ii = 0; ii < num_frag; ii++) {
   623			u32 len;
   624			skb_frag_t *frag;
   625	
   626			if (++q->tx_bd_tail >= lp->tx_bd_num)
   627				q->tx_bd_tail = 0;
   628	
   629			cur_p = &q->txq_bd_v[q->tx_bd_tail];
   630			frag = &skb_shinfo(skb)->frags[ii];
   631			len = skb_frag_size(frag);
   632			cur_p->phys = skb_frag_dma_map(ndev->dev.parent, frag, 0, len,
   633						       DMA_TO_DEVICE);
   634			cur_p->cntrl = len;
   635			cur_p->tx_desc_mapping = DESC_DMA_MAP_PAGE;
   636		}
   637	
   638	out:
   639		cur_p->cntrl |= XMCDMA_BD_CTRL_TXEOF_MASK;
   640		tail_p = q->tx_bd_p + sizeof(*q->txq_bd_v) * q->tx_bd_tail;
   641		cur_p->tx_skb = (phys_addr_t)skb;
   642		cur_p->tx_skb = (phys_addr_t)skb;
   643	
   644		tail_p = q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
   645		/* Ensure BD write before starting transfer */
   646		wmb();
   647	
   648		/* Start the transfer */
   649		axienet_dma_bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id),
   650				  tail_p);
   651		if (++q->tx_bd_tail >= lp->tx_bd_num)
   652			q->tx_bd_tail = 0;
   653	
   654		spin_unlock_irqrestore(&q->tx_lock, flags);
   655	
   656		return NETDEV_TX_OK;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
