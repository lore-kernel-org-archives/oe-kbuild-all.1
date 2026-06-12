Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45C3932DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256179; cv=none; b=o09xfVWF/SHoS4DPlrjA/czTwTOf+lYgprBzH1VmHcEheMoWXbCyLA2gU+CYIK7WQr+v5wVn9d445Ma4N/RJiTngr+QJL53TAQsLYDLtbkBpKKBl5/TlYHH+ewtB5/QA1D/XI5mmZk2zWyKhqQycjFrOnYNnVvZ326vQ/uf6e8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256179; c=relaxed/simple;
	bh=fgxr96HVz7EEi/NvxyzvvidNmYUMAcTk0DMHzn00Keg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r10JhDO7AG3K4DAXcN7iYyNasPttM1MUGwoyv1whhpIko2XO8Lwn1foO7cKzsjwAUOrQToL34PBh1gmOmtIe9Cqyw0W4XP0K67nmF5Sgn0GIuxIgEktHOxAmZBKlOygeBQLMi8OITWkWt+RZy3HK5IQRvr/NaPht6ZamvOl0QmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlxvBk9c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlxvBk9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781256175; x=1812792175;
  h=date:from:to:cc:subject:message-id;
  bh=fgxr96HVz7EEi/NvxyzvvidNmYUMAcTk0DMHzn00Keg=;
  b=SlxvBk9cE27erwazqyBCU5aS0603TYnhUloCXVXJRxF8spEhS6VdiVT3
   lLp/Zni251fKGR69o7+xTsWTBnUIHTVaGwwju8mBpTZD5PNuouIXw7VpP
   6jAZr0oa6rIUs5llfIWTy88unr+V+3vJqcBAOCLTrPJgoDepmTy2VVF/a
   xc9qdrD8Eyl7QIcM9Kc45DtutqVAg21A36hzxj3ls68EIWY0WTq+b46LI
   gIBYuLmh75SZis4ZPOxvXc+i6adrz6FtDFe29gh1HnbuyTzf6CyC8VrAW
   j5FwbfFHxd269lehrnuIKyDn4IfqELVnzs43zK5ekqF/MT/wL3VvZCKu5
   Q==;
X-CSE-ConnectionGUID: svTyez2ERVi2HaSj7154Uw==
X-CSE-MsgGUID: V3C2Ez9oTk68DPfH7msxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107518655"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107518655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:22:50 -0700
X-CSE-ConnectionGUID: WsdMe1TfT3qLUKa6uqIi4A==
X-CSE-MsgGUID: WKP/kv1NTeyXesI4pWiVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="276974466"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 02:22:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXy6A-00000000OXz-0901;
	Fri, 12 Jun 2026 09:22:46 +0000
Date: Fri, 12 Jun 2026 17:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: florent pirou <florent.pirou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/emt 0/2]
 drivers/net/ethernet/intel/igc/igc_main.c:3235:17: warning: variable
 'timestamp' set but not used
Message-ID: <202606121726.PrL3YioV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: fee80bc50a336add002b8fb05a9adc9ba4fd6563 [0/2] igc: add CONFIG_IGC_TSN_TRACE conditional trace_printk usage
config: i386-buildonly-randconfig-003-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121726.PrL3YioV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121726.PrL3YioV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121726.PrL3YioV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_xdp_xmit_zc':
   drivers/net/ethernet/intel/igc/igc_main.c:3117:21: warning: variable 'cmd_type' set but not used [-Wunused-but-set-variable]
    3117 |                 u32 cmd_type, olinfo_status;
         |                     ^~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_clean_tx_irq':
>> drivers/net/ethernet/intel/igc/igc_main.c:3235:17: warning: variable 'timestamp' set but not used [-Wunused-but-set-variable]
    3235 |         ktime_t timestamp = 0;
         |                 ^~~~~~~~~


vim +/timestamp +3235 drivers/net/ethernet/intel/igc/igc_main.c

9acf59a752d4c6 Andre Guedes              2021-04-22  3218  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3219  /**
0507ef8a0372b8 Sasha Neftin              2018-10-11  3220   * igc_clean_tx_irq - Reclaim resources after transmit completes
0507ef8a0372b8 Sasha Neftin              2018-10-11  3221   * @q_vector: pointer to q_vector containing needed info
0507ef8a0372b8 Sasha Neftin              2018-10-11  3222   * @napi_budget: Used to determine if we are in netpoll
0507ef8a0372b8 Sasha Neftin              2018-10-11  3223   *
0507ef8a0372b8 Sasha Neftin              2018-10-11  3224   * returns true if ring is completely cleaned
0507ef8a0372b8 Sasha Neftin              2018-10-11  3225   */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3226  static bool igc_clean_tx_irq(struct igc_q_vector *q_vector, int napi_budget)
0507ef8a0372b8 Sasha Neftin              2018-10-11  3227  {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3228  	struct igc_adapter *adapter = q_vector->adapter;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3229  	unsigned int total_bytes = 0, total_packets = 0;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3230  	unsigned int budget = q_vector->tx.work_limit;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3231  	struct igc_ring *tx_ring = q_vector->tx.ring;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3232  	unsigned int i = tx_ring->next_to_clean;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3233  	struct igc_tx_buffer *tx_buffer;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3234  	union igc_adv_tx_desc *tx_desc;
18e9730cd1b461 Muhammad Husaini Zulkifli 2021-06-10 @3235  	ktime_t timestamp = 0;
9acf59a752d4c6 Andre Guedes              2021-04-22  3236  	u32 xsk_frames = 0;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3237  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3238  	if (test_bit(__IGC_DOWN, &adapter->state))
0507ef8a0372b8 Sasha Neftin              2018-10-11  3239  		return true;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3240  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3241  	tx_buffer = &tx_ring->tx_buffer_info[i];
0507ef8a0372b8 Sasha Neftin              2018-10-11  3242  	tx_desc = IGC_TX_DESC(tx_ring, i);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3243  	i -= tx_ring->count;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3244  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3245  	do {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3246  		union igc_adv_tx_desc *eop_desc = tx_buffer->next_to_watch;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3247  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3248  		/* if next_to_watch is not set then there is no work pending */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3249  		if (!eop_desc)
0507ef8a0372b8 Sasha Neftin              2018-10-11  3250  			break;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3251  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3252  		/* prevent any other reads prior to eop_desc */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3253  		smp_rmb();
0507ef8a0372b8 Sasha Neftin              2018-10-11  3254  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3255  		/* if DD is not set pending work has not been completed */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3256  		if (!(eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_DD)))
0507ef8a0372b8 Sasha Neftin              2018-10-11  3257  			break;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3258  
15fd021bc42702 Song Yoong Siang          2024-04-24  3259  		/* Hold the completions while there's a pending tx hardware
15fd021bc42702 Song Yoong Siang          2024-04-24  3260  		 * timestamp request from XDP Tx metadata.
15fd021bc42702 Song Yoong Siang          2024-04-24  3261  		 */
15fd021bc42702 Song Yoong Siang          2024-04-24  3262  		if (tx_buffer->type == IGC_TX_BUFFER_TYPE_XSK &&
15fd021bc42702 Song Yoong Siang          2024-04-24  3263  		    tx_buffer->xsk_pending_ts)
15fd021bc42702 Song Yoong Siang          2024-04-24  3264  			break;
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3265  		if (eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_TS_STAT) &&
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3266  		    tx_buffer->tx_flags & IGC_TX_FLAGS_DMA_TSTAMP) {
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3267  			u64 tstamp = le64_to_cpu(eop_desc->wb.dma_tstamp);
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3268  
18e9730cd1b461 Muhammad Husaini Zulkifli 2021-06-10  3269  			if (tx_ring->xsk_pool && adapter->tstamp_config.tx_type == HWTSTAMP_TX_ON)
18e9730cd1b461 Muhammad Husaini Zulkifli 2021-06-10  3270  				timestamp = igc_tx_dma_hw_tstamp(adapter, tstamp);
18e9730cd1b461 Muhammad Husaini Zulkifli 2021-06-10  3271  			else
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3272  				igc_ptp_tx_dma_tstamp(adapter, tx_buffer->skb, tstamp);
d225e82f6b384b Vinicius Costa Gomes      2021-05-04  3273  		}
15fd021bc42702 Song Yoong Siang          2024-04-24  3274  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3275  		/* clear next_to_watch to prevent false hangs */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3276  		tx_buffer->next_to_watch = NULL;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3277  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3278  		/* update the statistics for this packet */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3279  		total_bytes += tx_buffer->bytecount;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3280  		total_packets += tx_buffer->gso_segs;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3281  
859b4dfa4115d1 Andre Guedes              2021-04-22  3282  		switch (tx_buffer->type) {
9acf59a752d4c6 Andre Guedes              2021-04-22  3283  		case IGC_TX_BUFFER_TYPE_XSK:
fee80bc50a336a florent pirou             2022-08-26  3284  #if defined(CONFIG_IGC_TSN_TRACE)
a4f7d084a12236 Muhammad Husaini Zulkifli 2021-07-23  3285  		/* Only use for RTCP KPI Measurement on Q2 */
a4f7d084a12236 Muhammad Husaini Zulkifli 2021-07-23  3286  		if (tx_ring->queue_index == 2 && adapter->tstamp_config.tx_type == HWTSTAMP_TX_ON)
a4f7d084a12236 Muhammad Husaini Zulkifli 2021-07-23  3287  			trace_printk("TX HW TS %lld\n", timestamp);
a4f7d084a12236 Muhammad Husaini Zulkifli 2021-07-23  3288  #endif
9acf59a752d4c6 Andre Guedes              2021-04-22  3289  			xsk_frames++;
9acf59a752d4c6 Andre Guedes              2021-04-22  3290  			break;
859b4dfa4115d1 Andre Guedes              2021-04-22  3291  		case IGC_TX_BUFFER_TYPE_XDP:
73f1071c1d2952 Andre Guedes              2021-03-09  3292  			xdp_return_frame(tx_buffer->xdpf);
9acf59a752d4c6 Andre Guedes              2021-04-22  3293  			igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
859b4dfa4115d1 Andre Guedes              2021-04-22  3294  			break;
859b4dfa4115d1 Andre Guedes              2021-04-22  3295  		case IGC_TX_BUFFER_TYPE_SKB:
0507ef8a0372b8 Sasha Neftin              2018-10-11  3296  			napi_consume_skb(tx_buffer->skb, napi_budget);
9acf59a752d4c6 Andre Guedes              2021-04-22  3297  			igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
859b4dfa4115d1 Andre Guedes              2021-04-22  3298  			break;
859b4dfa4115d1 Andre Guedes              2021-04-22  3299  		default:
859b4dfa4115d1 Andre Guedes              2021-04-22  3300  			netdev_warn_once(tx_ring->netdev, "Unknown Tx buffer type\n");
859b4dfa4115d1 Andre Guedes              2021-04-22  3301  			break;
859b4dfa4115d1 Andre Guedes              2021-04-22  3302  		}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3303  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3304  		/* clear last DMA location and unmap remaining buffers */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3305  		while (tx_desc != eop_desc) {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3306  			tx_buffer++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3307  			tx_desc++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3308  			i++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3309  			if (unlikely(!i)) {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3310  				i -= tx_ring->count;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3311  				tx_buffer = tx_ring->tx_buffer_info;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3312  				tx_desc = IGC_TX_DESC(tx_ring, 0);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3313  			}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3314  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3315  			/* unmap any remaining paged data */
6123429516c7fc Andre Guedes              2021-04-22  3316  			if (dma_unmap_len(tx_buffer, len))
6123429516c7fc Andre Guedes              2021-04-22  3317  				igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3318  		}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3319  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3320  		/* move us one more past the eop_desc for start of next pkt */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3321  		tx_buffer++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3322  		tx_desc++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3323  		i++;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3324  		if (unlikely(!i)) {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3325  			i -= tx_ring->count;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3326  			tx_buffer = tx_ring->tx_buffer_info;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3327  			tx_desc = IGC_TX_DESC(tx_ring, 0);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3328  		}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3329  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3330  		/* issue prefetch for next Tx descriptor */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3331  		prefetch(tx_desc);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3332  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3333  		/* update budget accounting */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3334  		budget--;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3335  	} while (likely(budget));
0507ef8a0372b8 Sasha Neftin              2018-10-11  3336  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3337  	netdev_tx_completed_queue(txring_txq(tx_ring),
0507ef8a0372b8 Sasha Neftin              2018-10-11  3338  				  total_packets, total_bytes);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3339  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3340  	i += tx_ring->count;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3341  	tx_ring->next_to_clean = i;
a27e6e73e5501f Andre Guedes              2021-04-22  3342  
a27e6e73e5501f Andre Guedes              2021-04-22  3343  	igc_update_tx_stats(q_vector, total_packets, total_bytes);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3344  
9acf59a752d4c6 Andre Guedes              2021-04-22  3345  	if (tx_ring->xsk_pool) {
9acf59a752d4c6 Andre Guedes              2021-04-22  3346  		if (xsk_frames)
9acf59a752d4c6 Andre Guedes              2021-04-22  3347  			xsk_tx_completed(tx_ring->xsk_pool, xsk_frames);
9acf59a752d4c6 Andre Guedes              2021-04-22  3348  		if (xsk_uses_need_wakeup(tx_ring->xsk_pool))
9acf59a752d4c6 Andre Guedes              2021-04-22  3349  			xsk_set_tx_need_wakeup(tx_ring->xsk_pool);
9acf59a752d4c6 Andre Guedes              2021-04-22  3350  		igc_xdp_xmit_zc(tx_ring);
9acf59a752d4c6 Andre Guedes              2021-04-22  3351  	}
9acf59a752d4c6 Andre Guedes              2021-04-22  3352  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3353  	if (test_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags)) {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3354  		struct igc_hw *hw = &adapter->hw;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3355  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3356  		/* Detect a transmit hang in hardware, this serializes the
0507ef8a0372b8 Sasha Neftin              2018-10-11  3357  		 * check with the clearing of time_stamp and movement of i
0507ef8a0372b8 Sasha Neftin              2018-10-11  3358  		 */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3359  		clear_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3360  		if (tx_buffer->next_to_watch &&
0507ef8a0372b8 Sasha Neftin              2018-10-11  3361  		    time_after(jiffies, tx_buffer->time_stamp +
0507ef8a0372b8 Sasha Neftin              2018-10-11  3362  		    (adapter->tx_timeout_factor * HZ)) &&
9b275176270efd Sasha Neftin              2023-02-06  3363  		    !(rd32(IGC_STATUS) & IGC_STATUS_TXOFF) &&
175c241288c09f Muhammad Husaini Zulkifli 2023-06-03  3364  		    (rd32(IGC_TDH(tx_ring->reg_idx)) != readl(tx_ring->tail)) &&
175c241288c09f Muhammad Husaini Zulkifli 2023-06-03  3365  		    !tx_ring->oper_gate_closed) {
0507ef8a0372b8 Sasha Neftin              2018-10-11  3366  			/* detected Tx unit hang */
25f06eff7582ae Andre Guedes              2020-03-24  3367  			netdev_err(tx_ring->netdev,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3368  				   "Detected Tx Unit Hang\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3369  				   "  Tx Queue             <%d>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3370  				   "  TDH                  <%x>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3371  				   "  TDT                  <%x>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3372  				   "  next_to_use          <%x>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3373  				   "  next_to_clean        <%x>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3374  				   "buffer_info[next_to_clean]\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3375  				   "  time_stamp           <%lx>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3376  				   "  next_to_watch        <%p>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3377  				   "  jiffies              <%lx>\n"
0507ef8a0372b8 Sasha Neftin              2018-10-11  3378  				   "  desc.status          <%x>\n",
0507ef8a0372b8 Sasha Neftin              2018-10-11  3379  				   tx_ring->queue_index,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3380  				   rd32(IGC_TDH(tx_ring->reg_idx)),
0507ef8a0372b8 Sasha Neftin              2018-10-11  3381  				   readl(tx_ring->tail),
0507ef8a0372b8 Sasha Neftin              2018-10-11  3382  				   tx_ring->next_to_use,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3383  				   tx_ring->next_to_clean,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3384  				   tx_buffer->time_stamp,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3385  				   tx_buffer->next_to_watch,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3386  				   jiffies,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3387  				   tx_buffer->next_to_watch->wb.status);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3388  			netif_stop_subqueue(tx_ring->netdev,
0507ef8a0372b8 Sasha Neftin              2018-10-11  3389  					    tx_ring->queue_index);
0507ef8a0372b8 Sasha Neftin              2018-10-11  3390  
0507ef8a0372b8 Sasha Neftin              2018-10-11  3391  			/* we are about to reset, no point in enabling stuff */
0507ef8a0372b8 Sasha Neftin              2018-10-11  3392  			return true;
0507ef8a0372b8 Sasha Neftin              2018-10-11  3393  		}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3394  	}
0507ef8a0372b8 Sasha Neftin              2018-10-11  3395  

:::::: The code at line 3235 was first introduced by commit
:::::: 18e9730cd1b46152737fbfe82f5b861361eb7883 igc: Enable HW TX Timestamp for AF_XDP ZC

:::::: TO: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
