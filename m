Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F221A8406
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734785257; cv=none; b=hJAZnt/DAXf5FCKioslfuCYKZSSveRIIQHDeHneU+oPKSXZxYahB7KhPZI4JwNGM62vX9Nz3zU/N2sn3mNK7DnNQIUv4E+cscL+PBo1EYcLZyWf2sDwp9Fob3yyyTWjsvO8rau7mHbyZv/DQHWHR286hfuvq0k/On24ftjmweuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734785257; c=relaxed/simple;
	bh=TiAFVNfdci14Vx0s4GBhkJR9MuMUyEhCd2dzWUXpwvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fKYEpkxZoL6DLWTQBzMEwrCceVMP/fXRoWgZUMP4v6SPniIT31Raw/knRXFE+HpSR4ryNctCdYPDJrVRaw3IIl8IcQ/lAtdJBTO/elJB1oWQD2jTNO4vwPgn5JBf1IhKbDzvUUXWg/J5GnmRbcTp5CPuGcNr6GHpeEI4HaEAdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYM1/Qlo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYM1/Qlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734785256; x=1766321256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TiAFVNfdci14Vx0s4GBhkJR9MuMUyEhCd2dzWUXpwvc=;
  b=cYM1/QlopKvR2Tswi+JQPx08mz9ItoeGBj8bQ0nBW41f8qyAyygwrXEn
   Xi1FIVhxddFk55V3WZXmrp50MmBYp9702Muea3MeQ112T4igVspDPaXQw
   jgcMxnfEo4jjcSUiF6r24icNmxVB/JtOPOvPUiNMHZzR/pk7NsQaxFNDZ
   GneUH8U5vphcbe5drNcscvK2CaTRIg700nXgw8E/NNrhhIHYGPdcw+gZH
   Ry1UBdHO50jFWJlwjq3YJITOEu9xnfvu6xsCmzeE9SozpaWhOipUWQmms
   oQYxiqMXuulM0kGrUhBIelVuwrSorxtQvIrV7ENREIJeUH1opyIENZ55g
   w==;
X-CSE-ConnectionGUID: 72Nf7uUVTc+sl9cPp9Ypmw==
X-CSE-MsgGUID: iwhl4uZzS5mkBiqpZW5PzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46739414"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="46739414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 04:47:35 -0800
X-CSE-ConnectionGUID: FFNXIMFmTYmmmAqwsofK0w==
X-CSE-MsgGUID: qOcB/kgBR7KxSsJ/YFFNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="103741154"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2024 04:47:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOytH-0002B1-0i;
	Sat, 21 Dec 2024 12:47:31 +0000
Date: Sat, 21 Dec 2024 20:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.6/linux 3665/13909]
 drivers/net/ethernet/intel/igc/igc_main.c:3090:17: warning: variable
 'timestamp' set but not used
Message-ID: <202412212037.LWucS4fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   a4ec5f44dc60164d4e5f12f91b65052ab30accc5
commit: 44e41df3b6dfdbe64750fdc9a31cf82ec6f6f0ad [3665/13909] igc: Enable HW TX Timestamp for AF_XDP ZC
config: xtensa-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212037.LWucS4fv-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212037.LWucS4fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212037.LWucS4fv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_clean_tx_irq':
>> drivers/net/ethernet/intel/igc/igc_main.c:3090:17: warning: variable 'timestamp' set but not used [-Wunused-but-set-variable]
    3090 |         ktime_t timestamp = 0;
         |                 ^~~~~~~~~


vim +/timestamp +3090 drivers/net/ethernet/intel/igc/igc_main.c

  3073	
  3074	/**
  3075	 * igc_clean_tx_irq - Reclaim resources after transmit completes
  3076	 * @q_vector: pointer to q_vector containing needed info
  3077	 * @napi_budget: Used to determine if we are in netpoll
  3078	 *
  3079	 * returns true if ring is completely cleaned
  3080	 */
  3081	static bool igc_clean_tx_irq(struct igc_q_vector *q_vector, int napi_budget)
  3082	{
  3083		struct igc_adapter *adapter = q_vector->adapter;
  3084		unsigned int total_bytes = 0, total_packets = 0;
  3085		unsigned int budget = q_vector->tx.work_limit;
  3086		struct igc_ring *tx_ring = q_vector->tx.ring;
  3087		unsigned int i = tx_ring->next_to_clean;
  3088		struct igc_tx_buffer *tx_buffer;
  3089		union igc_adv_tx_desc *tx_desc;
> 3090		ktime_t timestamp = 0;
  3091		u32 xsk_frames = 0;
  3092	
  3093		if (test_bit(__IGC_DOWN, &adapter->state))
  3094			return true;
  3095	
  3096		tx_buffer = &tx_ring->tx_buffer_info[i];
  3097		tx_desc = IGC_TX_DESC(tx_ring, i);
  3098		i -= tx_ring->count;
  3099	
  3100		do {
  3101			union igc_adv_tx_desc *eop_desc = tx_buffer->next_to_watch;
  3102	
  3103			/* if next_to_watch is not set then there is no work pending */
  3104			if (!eop_desc)
  3105				break;
  3106	
  3107			/* prevent any other reads prior to eop_desc */
  3108			smp_rmb();
  3109	
  3110			/* if DD is not set pending work has not been completed */
  3111			if (!(eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_DD)))
  3112				break;
  3113	
  3114			if (eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_TS_STAT) &&
  3115			    tx_buffer->tx_flags & IGC_TX_FLAGS_DMA_TSTAMP) {
  3116				u64 tstamp = le64_to_cpu(eop_desc->wb.dma_tstamp);
  3117	
  3118				if (tx_ring->xsk_pool && adapter->tstamp_config.tx_type == HWTSTAMP_TX_ON)
  3119					timestamp = igc_tx_dma_hw_tstamp(adapter, tstamp);
  3120				else
  3121					igc_ptp_tx_dma_tstamp(adapter, tx_buffer->skb, tstamp);
  3122			}
  3123	
  3124			/* clear next_to_watch to prevent false hangs */
  3125			tx_buffer->next_to_watch = NULL;
  3126	
  3127			/* update the statistics for this packet */
  3128			total_bytes += tx_buffer->bytecount;
  3129			total_packets += tx_buffer->gso_segs;
  3130	
  3131			switch (tx_buffer->type) {
  3132			case IGC_TX_BUFFER_TYPE_XSK:
  3133				xsk_frames++;
  3134				break;
  3135			case IGC_TX_BUFFER_TYPE_XDP:
  3136				xdp_return_frame(tx_buffer->xdpf);
  3137				igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  3138				break;
  3139			case IGC_TX_BUFFER_TYPE_SKB:
  3140				napi_consume_skb(tx_buffer->skb, napi_budget);
  3141				igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  3142				break;
  3143			default:
  3144				netdev_warn_once(tx_ring->netdev, "Unknown Tx buffer type\n");
  3145				break;
  3146			}
  3147	
  3148			/* clear last DMA location and unmap remaining buffers */
  3149			while (tx_desc != eop_desc) {
  3150				tx_buffer++;
  3151				tx_desc++;
  3152				i++;
  3153				if (unlikely(!i)) {
  3154					i -= tx_ring->count;
  3155					tx_buffer = tx_ring->tx_buffer_info;
  3156					tx_desc = IGC_TX_DESC(tx_ring, 0);
  3157				}
  3158	
  3159				/* unmap any remaining paged data */
  3160				if (dma_unmap_len(tx_buffer, len))
  3161					igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  3162			}
  3163	
  3164			/* move us one more past the eop_desc for start of next pkt */
  3165			tx_buffer++;
  3166			tx_desc++;
  3167			i++;
  3168			if (unlikely(!i)) {
  3169				i -= tx_ring->count;
  3170				tx_buffer = tx_ring->tx_buffer_info;
  3171				tx_desc = IGC_TX_DESC(tx_ring, 0);
  3172			}
  3173	
  3174			/* issue prefetch for next Tx descriptor */
  3175			prefetch(tx_desc);
  3176	
  3177			/* update budget accounting */
  3178			budget--;
  3179		} while (likely(budget));
  3180	
  3181		netdev_tx_completed_queue(txring_txq(tx_ring),
  3182					  total_packets, total_bytes);
  3183	
  3184		i += tx_ring->count;
  3185		tx_ring->next_to_clean = i;
  3186	
  3187		igc_update_tx_stats(q_vector, total_packets, total_bytes);
  3188	
  3189		if (tx_ring->xsk_pool) {
  3190			if (xsk_frames)
  3191				xsk_tx_completed(tx_ring->xsk_pool, xsk_frames);
  3192			if (xsk_uses_need_wakeup(tx_ring->xsk_pool))
  3193				xsk_set_tx_need_wakeup(tx_ring->xsk_pool);
  3194			igc_xdp_xmit_zc(tx_ring);
  3195		}
  3196	
  3197		if (test_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags)) {
  3198			struct igc_hw *hw = &adapter->hw;
  3199	
  3200			/* Detect a transmit hang in hardware, this serializes the
  3201			 * check with the clearing of time_stamp and movement of i
  3202			 */
  3203			clear_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags);
  3204			if (tx_buffer->next_to_watch &&
  3205			    time_after(jiffies, tx_buffer->time_stamp +
  3206			    (adapter->tx_timeout_factor * HZ)) &&
  3207			    !(rd32(IGC_STATUS) & IGC_STATUS_TXOFF) &&
  3208			    (rd32(IGC_TDH(tx_ring->reg_idx)) != readl(tx_ring->tail)) &&
  3209			    !tx_ring->oper_gate_closed) {
  3210				/* detected Tx unit hang */
  3211				netdev_err(tx_ring->netdev,
  3212					   "Detected Tx Unit Hang\n"
  3213					   "  Tx Queue             <%d>\n"
  3214					   "  TDH                  <%x>\n"
  3215					   "  TDT                  <%x>\n"
  3216					   "  next_to_use          <%x>\n"
  3217					   "  next_to_clean        <%x>\n"
  3218					   "buffer_info[next_to_clean]\n"
  3219					   "  time_stamp           <%lx>\n"
  3220					   "  next_to_watch        <%p>\n"
  3221					   "  jiffies              <%lx>\n"
  3222					   "  desc.status          <%x>\n",
  3223					   tx_ring->queue_index,
  3224					   rd32(IGC_TDH(tx_ring->reg_idx)),
  3225					   readl(tx_ring->tail),
  3226					   tx_ring->next_to_use,
  3227					   tx_ring->next_to_clean,
  3228					   tx_buffer->time_stamp,
  3229					   tx_buffer->next_to_watch,
  3230					   jiffies,
  3231					   tx_buffer->next_to_watch->wb.status);
  3232				netif_stop_subqueue(tx_ring->netdev,
  3233						    tx_ring->queue_index);
  3234	
  3235				/* we are about to reset, no point in enabling stuff */
  3236				return true;
  3237			}
  3238		}
  3239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
