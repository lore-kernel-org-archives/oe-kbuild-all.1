Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10421FB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677050228; x=1708586228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZ0w/7EaFEJvz1gQYjMnPw53ESUM63Num/GpkPzdMCY=;
  b=E0PGX7Z+1gL46HUgTMzO654bFeKadd+nyFgOHfwgXkmJJQxdI46CQOR3
   Ach/bl6+0XY+IvX0OhtPRYsNDuKI6obnHj4QKuCm27zpw0aEoZzZ+n5XE
   LLKq8AJzxYY9YyztwUc6iGOtMYA4XjS4/N6QTmAl18VULrPcFXCzRrcvF
   8g/c0Ld3/ewZDoCIAP2OyulOsNMiBinw2IBLVoGoJkRzUsOR/B/SkuTMP
   +uy3JLOcOrSF96PDX7RQ4ZVuPiYb/2f4UZ7fyxz+BPIpkBd0pTeyCqeTB
   lzx3ifo1j3wjlJIVnSb087Xz/t2SfJ2TcuuETs8CJCQjSgdStcS+9OXUi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334219056"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="334219056"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 23:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="674003443"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="674003443"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 23:17:01 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUjN6-00006Z-22;
	Wed, 22 Feb 2023 07:17:00 +0000
Date: Wed, 22 Feb 2023 15:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhou Furong <furong.zhou@intel.com>
Subject: [intel-lts:5.10/yocto 16900/30000]
 drivers/net/ethernet/intel/igc/igc_main.c:2709:17: warning: variable
 'timestamp' set but not used
Message-ID: <202302221551.SOQIVGdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Muhammad,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   e8844106f6fc41e1c8d5dbadbd62ac3e54030903
commit: 765ce62a0644876bc2eb57fe84ab526f74129d6a [16900/30000] igc: Enable HW TX Timestamp for AF_XDP ZC
config: alpha-buildonly-randconfig-r005-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221551.SOQIVGdV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/765ce62a0644876bc2eb57fe84ab526f74129d6a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 765ce62a0644876bc2eb57fe84ab526f74129d6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/ethernet/intel/igc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221551.SOQIVGdV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_clean_tx_irq':
>> drivers/net/ethernet/intel/igc/igc_main.c:2709:17: warning: variable 'timestamp' set but not used [-Wunused-but-set-variable]
    2709 |         ktime_t timestamp = 0;
         |                 ^~~~~~~~~


vim +/timestamp +2709 drivers/net/ethernet/intel/igc/igc_main.c

  2692	
  2693	/**
  2694	 * igc_clean_tx_irq - Reclaim resources after transmit completes
  2695	 * @q_vector: pointer to q_vector containing needed info
  2696	 * @napi_budget: Used to determine if we are in netpoll
  2697	 *
  2698	 * returns true if ring is completely cleaned
  2699	 */
  2700	static bool igc_clean_tx_irq(struct igc_q_vector *q_vector, int napi_budget)
  2701	{
  2702		struct igc_adapter *adapter = q_vector->adapter;
  2703		unsigned int total_bytes = 0, total_packets = 0;
  2704		unsigned int budget = q_vector->tx.work_limit;
  2705		struct igc_ring *tx_ring = q_vector->tx.ring;
  2706		unsigned int i = tx_ring->next_to_clean;
  2707		struct igc_tx_buffer *tx_buffer;
  2708		union igc_adv_tx_desc *tx_desc;
> 2709		ktime_t timestamp = 0;
  2710		u32 xsk_frames = 0;
  2711	
  2712		if (test_bit(__IGC_DOWN, &adapter->state))
  2713			return true;
  2714	
  2715		tx_buffer = &tx_ring->tx_buffer_info[i];
  2716		tx_desc = IGC_TX_DESC(tx_ring, i);
  2717		i -= tx_ring->count;
  2718	
  2719		do {
  2720			union igc_adv_tx_desc *eop_desc = tx_buffer->next_to_watch;
  2721	
  2722			/* if next_to_watch is not set then there is no work pending */
  2723			if (!eop_desc)
  2724				break;
  2725	
  2726			/* prevent any other reads prior to eop_desc */
  2727			smp_rmb();
  2728	
  2729			/* if DD is not set pending work has not been completed */
  2730			if (!(eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_DD)))
  2731				break;
  2732	
  2733			if (eop_desc->wb.status & cpu_to_le32(IGC_TXD_STAT_TS_STAT) &&
  2734			    tx_buffer->tx_flags & IGC_TX_FLAGS_DMA_TSTAMP) {
  2735				u64 tstamp = le64_to_cpu(eop_desc->wb.dma_tstamp);
  2736	
  2737				if (tx_ring->xsk_pool && adapter->tstamp_config.tx_type == HWTSTAMP_TX_ON)
  2738					timestamp = igc_tx_dma_hw_tstamp(adapter, tstamp);
  2739				else
  2740					igc_ptp_tx_dma_tstamp(adapter, tx_buffer->skb, tstamp);
  2741			}
  2742	
  2743			/* clear next_to_watch to prevent false hangs */
  2744			tx_buffer->next_to_watch = NULL;
  2745	
  2746			/* update the statistics for this packet */
  2747			total_bytes += tx_buffer->bytecount;
  2748			total_packets += tx_buffer->gso_segs;
  2749	
  2750			switch (tx_buffer->type) {
  2751			case IGC_TX_BUFFER_TYPE_XSK:
  2752				xsk_frames++;
  2753				break;
  2754			case IGC_TX_BUFFER_TYPE_XDP:
  2755				xdp_return_frame(tx_buffer->xdpf);
  2756				igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  2757				break;
  2758			case IGC_TX_BUFFER_TYPE_SKB:
  2759				napi_consume_skb(tx_buffer->skb, napi_budget);
  2760				igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  2761				break;
  2762			default:
  2763				netdev_warn_once(tx_ring->netdev,
  2764						 "Unknown tx buffer type\n");
  2765				break;
  2766			}
  2767	
  2768			/* clear last DMA location and unmap remaining buffers */
  2769			while (tx_desc != eop_desc) {
  2770				tx_buffer++;
  2771				tx_desc++;
  2772				i++;
  2773				if (unlikely(!i)) {
  2774					i -= tx_ring->count;
  2775					tx_buffer = tx_ring->tx_buffer_info;
  2776					tx_desc = IGC_TX_DESC(tx_ring, 0);
  2777				}
  2778	
  2779				/* unmap any remaining paged data */
  2780				if (dma_unmap_len(tx_buffer, len))
  2781					igc_unmap_tx_buffer(tx_ring->dev, tx_buffer);
  2782			}
  2783	
  2784			/* move us one more past the eop_desc for start of next pkt */
  2785			tx_buffer++;
  2786			tx_desc++;
  2787			i++;
  2788			if (unlikely(!i)) {
  2789				i -= tx_ring->count;
  2790				tx_buffer = tx_ring->tx_buffer_info;
  2791				tx_desc = IGC_TX_DESC(tx_ring, 0);
  2792			}
  2793	
  2794			/* issue prefetch for next Tx descriptor */
  2795			prefetch(tx_desc);
  2796	
  2797			/* update budget accounting */
  2798			budget--;
  2799		} while (likely(budget));
  2800	
  2801		netdev_tx_completed_queue(txring_txq(tx_ring),
  2802					  total_packets, total_bytes);
  2803	
  2804		i += tx_ring->count;
  2805		tx_ring->next_to_clean = i;
  2806	
  2807		igc_update_tx_stats(q_vector, total_packets, total_bytes);
  2808	
  2809		if (tx_ring->xsk_pool) {
  2810			if (xsk_frames)
  2811				xsk_tx_completed(tx_ring->xsk_pool, xsk_frames);
  2812			if (xsk_uses_need_wakeup(tx_ring->xsk_pool))
  2813				xsk_set_tx_need_wakeup(tx_ring->xsk_pool);
  2814			igc_xdp_xmit_zc(tx_ring);
  2815		}
  2816	
  2817		if (test_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags)) {
  2818			struct igc_hw *hw = &adapter->hw;
  2819	
  2820			/* Detect a transmit hang in hardware, this serializes the
  2821			 * check with the clearing of time_stamp and movement of i
  2822			 */
  2823			clear_bit(IGC_RING_FLAG_TX_DETECT_HANG, &tx_ring->flags);
  2824			if (tx_buffer->next_to_watch &&
  2825			    time_after(jiffies, tx_buffer->time_stamp +
  2826			    (adapter->tx_timeout_factor * HZ)) &&
  2827			    !(rd32(IGC_STATUS) & IGC_STATUS_TXOFF)) {
  2828				/* detected Tx unit hang */
  2829				netdev_err(tx_ring->netdev,
  2830					   "Detected Tx Unit Hang\n"
  2831					   "  Tx Queue             <%d>\n"
  2832					   "  TDH                  <%x>\n"
  2833					   "  TDT                  <%x>\n"
  2834					   "  next_to_use          <%x>\n"
  2835					   "  next_to_clean        <%x>\n"
  2836					   "buffer_info[next_to_clean]\n"
  2837					   "  time_stamp           <%lx>\n"
  2838					   "  next_to_watch        <%p>\n"
  2839					   "  jiffies              <%lx>\n"
  2840					   "  desc.status          <%x>\n",
  2841					   tx_ring->queue_index,
  2842					   rd32(IGC_TDH(tx_ring->reg_idx)),
  2843					   readl(tx_ring->tail),
  2844					   tx_ring->next_to_use,
  2845					   tx_ring->next_to_clean,
  2846					   tx_buffer->time_stamp,
  2847					   tx_buffer->next_to_watch,
  2848					   jiffies,
  2849					   tx_buffer->next_to_watch->wb.status);
  2850				netif_stop_subqueue(tx_ring->netdev,
  2851						    tx_ring->queue_index);
  2852	
  2853				/* we are about to reset, no point in enabling stuff */
  2854				return true;
  2855			}
  2856		}
  2857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
