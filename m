Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0E15820C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743326594; cv=none; b=UHcdW3gZzWYQpZHWThK8uYA3/Wz3lHBUhgyTabQhWAbgvilEcnnxLVS9R/Mlsp3mM5mo46YSNmw8Y1En+WkdeKtBxwdQ+kAYJx9/wel8S/uUUGVMl+CJ9T0QuJdVrc8pZ0E/0L8DmhMlOFxnpjIWHWpTA2kVFpbrOB2oEO3B9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743326594; c=relaxed/simple;
	bh=iswPNupqYXAl58o/JRJnAW7CO41cthSEvu7z4TmHC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEwTPR9sgN8HYiyDQU6KhRLpDAo/Ye4y7+mfsWrTQAN1CgX2XJMJE2rYFZ4MnRMaxkq8zK8w58RG5WzgbwfeFMHHsbMXetJFvXiJcZ8twkTYglbn4c2521A1Gnn+K4JL5uPsnj5g772yViw1+tJZMSPf+EQWvsONwssVQ9z2pYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWNYdtXY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWNYdtXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743326591; x=1774862591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iswPNupqYXAl58o/JRJnAW7CO41cthSEvu7z4TmHC7Y=;
  b=lWNYdtXYce43HAioBEE4w8auTIIIDoLFkHdVGgcAk8mF6vH1ET2jVYwx
   4tQPCjtWlZBRDXGPB4OrCmVQctyAClPqJvmMJsJh9ckENZMUGlEBif2h6
   Qdbrx9gNef+eXIVy1M5QsaZnCAx1js2k5BwWiXw1pg6TwT00+rEEihDdu
   ZFVyp2mLTcSY6u++bHemGSyJ6tdXEMwF5gNB0zl6ofX5fCmOpq9BLpkjD
   COUqrNXutzN7fv3evjKm6x5YKKRhtEiWlet1cI3ArD8332kxGfw0H9xLC
   oNnGao4JVHaEJb3O3eFbevEMJXmXk6LSu50cxw/mTrpwBj2JTSBghlbEO
   w==;
X-CSE-ConnectionGUID: D8H1V3CZQ6OdTHN4bW7l0A==
X-CSE-MsgGUID: a0E33JmZRRqorjF1MTAWKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="62169878"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="62169878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 02:23:11 -0700
X-CSE-ConnectionGUID: /n6jmlW6SciiJ6EP3mSAVA==
X-CSE-MsgGUID: UdbpxAQvRFGaPTQPJNCQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="131056401"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2025 02:23:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyosl-0008cQ-1R;
	Sun, 30 Mar 2025 09:23:07 +0000
Date: Sun, 30 Mar 2025 17:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1536/1536]
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:987:20: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202503301705.3fAiYws1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: c3088bd9bdf90fcfc8a69046692d75c2b04563ba [1536/1536] ath9k_htc: Discard undersized packets
config: x86_64-randconfig-122-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301705.3fAiYws1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301705.3fAiYws1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301705.3fAiYws1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:987:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] rs_datalen @@     got unsigned short [usertype] @@
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:987:20: sparse:     expected restricted __be16 [usertype] rs_datalen
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:987:20: sparse:     got unsigned short [usertype]
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:988:13: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:1001:13: sparse: sparse: restricted __be16 degrades to integer
   In file included from drivers/net/wireless/ath/ath9k/htc.h:23,
                    from drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:17:
   In function '__skb_queue_before',
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1886:2,
       inlined from 'ath9k_htc_tx_cleanup_queue' at drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:741:4:
   include/linux/skbuff.h:1852:9: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds]
    1852 |         __skb_insert(newsk, next->prev, next, list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c: In function 'ath9k_htc_tx_cleanup_queue':
   drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:733:29: note: object 'queue' of size 80
     733 |         struct sk_buff_head queue;
         |                             ^~~~~

vim +987 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c

   962	
   963	static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
   964				     struct ath9k_htc_rxbuf *rxbuf,
   965				     struct ieee80211_rx_status *rx_status)
   966	
   967	{
   968		struct ieee80211_hdr *hdr;
   969		struct ieee80211_hw *hw = priv->hw;
   970		struct sk_buff *skb = rxbuf->skb;
   971		struct ath_common *common = ath9k_hw_common(priv->ah);
   972		struct ath_hw *ah = common->ah;
   973		struct ath_htc_rx_status *rxstatus;
   974		struct ath_rx_status rx_stats;
   975		bool decrypt_error = false;
   976		__be16 rs_datalen;
   977		bool is_phyerr;
   978	
   979		if (skb->len < HTC_RX_FRAME_HEADER_SIZE) {
   980			ath_err(common, "Corrupted RX frame, dropping (len: %d)\n",
   981				skb->len);
   982			goto rx_next;
   983		}
   984	
   985		rxstatus = (struct ath_htc_rx_status *)skb->data;
   986	
 > 987		rs_datalen = be16_to_cpu(rxstatus->rs_datalen);
   988		if (unlikely(rs_datalen -
   989		    (skb->len - HTC_RX_FRAME_HEADER_SIZE) != 0)) {
   990			ath_err(common,
   991				"Corrupted RX data len, dropping (dlen: %d, skblen: %d)\n",
   992				rs_datalen, skb->len);
   993			goto rx_next;
   994		}
   995	
   996		is_phyerr = rxstatus->rs_status & ATH9K_RXERR_PHY;
   997		/*
   998		 * Discard zero-length packets and packets smaller than an ACK
   999		 * which are not PHY_ERROR (short radar pulses have a length of 3)
  1000		 */
  1001		if (unlikely(!rs_datalen || (rs_datalen < 10 && !is_phyerr))) {
  1002			ath_warn(common,
  1003				 "Short RX data len, dropping (dlen: %d)\n",
  1004				 rs_datalen);
  1005			goto rx_next;
  1006		}
  1007	
  1008		/* Get the RX status information */
  1009	
  1010		memset(rx_status, 0, sizeof(struct ieee80211_rx_status));
  1011	
  1012		/* Copy everything from ath_htc_rx_status (HTC_RX_FRAME_HEADER).
  1013		 * After this, we can drop this part of skb. */
  1014		rx_status_htc_to_ath(&rx_stats, rxstatus);
  1015		ath9k_htc_err_stat_rx(priv, &rx_stats);
  1016		rx_status->mactime = be64_to_cpu(rxstatus->rs_tstamp);
  1017		skb_pull(skb, HTC_RX_FRAME_HEADER_SIZE);
  1018	
  1019		/*
  1020		 * everything but the rate is checked here, the rate check is done
  1021		 * separately to avoid doing two lookups for a rate for each frame.
  1022		 */
  1023		hdr = (struct ieee80211_hdr *)skb->data;
  1024	
  1025		/*
  1026		 * Process PHY errors and return so that the packet
  1027		 * can be dropped.
  1028		 */
  1029		if (unlikely(is_phyerr)) {
  1030			/* TODO: Not using DFS processing now. */
  1031			if (ath_cmn_process_fft(&priv->spec_priv, hdr,
  1032					    &rx_stats, rx_status->mactime)) {
  1033				/* TODO: Code to collect spectral scan statistics */
  1034			}
  1035			goto rx_next;
  1036		}
  1037	
  1038		if (!ath9k_cmn_rx_accept(common, hdr, rx_status, &rx_stats,
  1039				&decrypt_error, priv->rxfilter))
  1040			goto rx_next;
  1041	
  1042		ath9k_cmn_rx_skb_postprocess(common, skb, &rx_stats,
  1043					     rx_status, decrypt_error);
  1044	
  1045		if (ath9k_cmn_process_rate(common, hw, &rx_stats, rx_status))
  1046			goto rx_next;
  1047	
  1048		rx_stats.is_mybeacon = ath_is_mybeacon(common, hdr);
  1049		ath9k_cmn_process_rssi(common, hw, &rx_stats, rx_status);
  1050	
  1051		rx_status->band = ah->curchan->chan->band;
  1052		rx_status->freq = ah->curchan->chan->center_freq;
  1053		rx_status->antenna = rx_stats.rs_antenna;
  1054		rx_status->flag |= RX_FLAG_MACTIME_END;
  1055	
  1056		return true;
  1057	rx_next:
  1058		return false;
  1059	}
  1060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
