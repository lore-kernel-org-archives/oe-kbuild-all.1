Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101E3C1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690153825; x=1721689825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSvi+pnkGBhjcdvF7JlT1gAqeiUsWfeDsn9S/WWbDq8=;
  b=bSCJAdbT+weF1dsU7Vf0jltq1h28fgqdk4liWPBtqJFw8VlIGy2GRMiy
   OQyD03pgUHpqMjuMi5jHLbyccxWn6pLuXhAQOFrliFs5FJ144sWmQlpkL
   dQboDy5q6PveKaPF1nKt9Gv906nNW4DvzmsflnNno1NGQ2BXid8xT/pB3
   GZBXtQYRQuBkp1p7mxzsa89yEHbNpPiC1tA98AEheW4+NOuQbBIiLkMel
   8YRT9b5vzyEUx9pgyJX4P0eQsDSsmMW1GIcuGFxw5+PlQXr1dqE+DpOcJ
   Paxe53bz6OEGob9evk3sxsD0bW++G8i63R9nqanaWe+INZhDjdn3HgL/U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431110355"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="431110355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 16:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="755100694"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755100694"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Jul 2023 16:10:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNiDU-0009KV-2Z;
	Sun, 23 Jul 2023 23:10:20 +0000
Date: Mon, 24 Jul 2023 07:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 484/507]
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2419:24: error:
 incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'struct netdev_queue *'
Message-ID: <202307240751.w7qWuOQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   2151fafc303ca2ee1be74a5197a5e3afa227f26c
commit: 88c1e322c5f8a4cc4712279704e3c2a0f937d0bf [484/507] net: annotate accesses to queue->trans_start
config: hexagon-randconfig-r045-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240751.w7qWuOQI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240751.w7qWuOQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240751.w7qWuOQI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2419:24: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'struct netdev_queue *' [-Wint-conversion]
    2419 |         txq_trans_cond_update(nq->trans_start);
         |                               ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:4485:63: note: passing argument to parameter 'txq' here
    4485 | static inline void txq_trans_cond_update(struct netdev_queue *txq)
         |                                                               ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4734:24: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'struct netdev_queue *' [-Wint-conversion]
    4734 |         txq_trans_cond_update(nq->trans_start);
         |                               ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:4485:63: note: passing argument to parameter 'txq' here
    4485 | static inline void txq_trans_cond_update(struct netdev_queue *txq)
         |                                                               ^
   2 errors generated.


vim +2419 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  2407	
  2408	static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
  2409	{
  2410		struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
  2411		struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
  2412		struct xsk_buff_pool *pool = tx_q->xsk_pool;
  2413		unsigned int entry = tx_q->cur_tx;
  2414		struct dma_desc *tx_desc = NULL;
  2415		struct xdp_desc xdp_desc;
  2416		bool work_done = true;
  2417	
  2418		/* Avoids TX time-out as we are sharing with slow path */
> 2419		txq_trans_cond_update(nq->trans_start);
  2420	
  2421		budget = min(budget, stmmac_tx_avail(priv, queue));
  2422	
  2423		while (budget-- > 0) {
  2424			dma_addr_t dma_addr;
  2425			bool set_ic;
  2426	
  2427			/* We are sharing with slow path and stop XSK TX desc submission when
  2428			 * available TX ring is less than threshold.
  2429			 */
  2430			if (unlikely(stmmac_tx_avail(priv, queue) < STMMAC_TX_XSK_AVAIL) ||
  2431			    !netif_carrier_ok(priv->dev)) {
  2432				work_done = false;
  2433				break;
  2434			}
  2435	
  2436			if (!xsk_tx_peek_desc(pool, &xdp_desc))
  2437				break;
  2438	
  2439			if (likely(priv->extend_desc))
  2440				tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
  2441			else if (tx_q->tbs & STMMAC_TBS_AVAIL)
  2442				tx_desc = &tx_q->dma_entx[entry].basic;
  2443			else
  2444				tx_desc = tx_q->dma_tx + entry;
  2445	
  2446			dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
  2447			xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
  2448	
  2449			tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XSK_TX;
  2450	
  2451			/* To return XDP buffer to XSK pool, we simple call
  2452			 * xsk_tx_completed(), so we don't need to fill up
  2453			 * 'buf' and 'xdpf'.
  2454			 */
  2455			tx_q->tx_skbuff_dma[entry].buf = 0;
  2456			tx_q->xdpf[entry] = NULL;
  2457	
  2458			tx_q->tx_skbuff_dma[entry].map_as_page = false;
  2459			tx_q->tx_skbuff_dma[entry].len = xdp_desc.len;
  2460			tx_q->tx_skbuff_dma[entry].last_segment = true;
  2461			tx_q->tx_skbuff_dma[entry].is_jumbo = false;
  2462	
  2463			stmmac_set_desc_addr(priv, tx_desc, dma_addr);
  2464	
  2465			tx_q->tx_count_frames++;
  2466	
  2467			if (!priv->tx_coal_frames[queue])
  2468				set_ic = false;
  2469			else if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
  2470				set_ic = true;
  2471			else
  2472				set_ic = false;
  2473	
  2474			if (set_ic) {
  2475				tx_q->tx_count_frames = 0;
  2476				stmmac_set_tx_ic(priv, tx_desc);
  2477				priv->xstats.tx_set_ic_bit++;
  2478			}
  2479	
  2480			stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
  2481					       true, priv->mode, true, true,
  2482					       xdp_desc.len);
  2483	
  2484			stmmac_enable_dma_transmission(priv, priv->ioaddr);
  2485	
  2486			tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx, priv->dma_tx_size);
  2487			entry = tx_q->cur_tx;
  2488		}
  2489	
  2490		if (tx_desc) {
  2491			stmmac_flush_tx_descriptors(priv, queue);
  2492			xsk_tx_release(pool);
  2493		}
  2494	
  2495		/* Return true if all of the 3 conditions are met
  2496		 *  a) TX Budget is still available
  2497		 *  b) work_done = true when XSK TX desc peek is empty (no more
  2498		 *     pending XSK TX for transmission)
  2499		 */
  2500		return !!budget && work_done;
  2501	}
  2502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
