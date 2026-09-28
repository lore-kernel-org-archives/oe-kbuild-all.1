Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC5547059
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628292; cv=none; b=ixoSR5cnzX7r/tnBdRrHJOxgHskXLfFPvaFTQriSkGzLCJD3Ornp4Zc8iLo+SKc/FZYP8jn6+0oXJJjKMuZqvuroAEC+byjxGuO6/LxK7OP71lOuY7yPDSgcQMaHYt1C5NBEv0/I9DZQ+28UtyIyBM12Iv7WbCuwP1HCMGzMcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628292; c=relaxed/simple;
	bh=bgdJ6imuh8vcQJkV6ggCKZmMcL1Xq/UA1N4wFZQLQIw=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVZ5Fbx3kkoeKOZtecr6wGjGm85pXjIrsx1KS5Y3EZf5nUfH4doHXJSB0ndfReQmr3DKdwC/pqtK+bkWh2Ue5eLvw3w4LxfA9qfYhfmBa1a48W4UChAUWTsVen46LSsFAWj+WTPCEYHmQW0ho9CFAyfg8B71X0z3w0aqo5FH5mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6OqF/EE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6OqF/EE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790628292; x=1822164292;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=bgdJ6imuh8vcQJkV6ggCKZmMcL1Xq/UA1N4wFZQLQIw=;
  b=T6OqF/EEVb6OWwv0/46goNyxjwM+6UHyeb2QvET9yGrW92fF4zujIvNv
   lA90dsdsQW5ZskxZ0gjZVtNvIEYJZzzfn9Dzruustm6MdLttYlfjkMg0Y
   kwRMdDCLWfk9XYakvmRUGHcVgIEj2dtbywvVAFCfbYAR1shy3exwdn8Lt
   /3RXCsi5ndtALEBZaQZ2g8KpSoy622Qrg+5QWne+7pR4sUW+0gd9HOuvy
   +BJkh+j1vqHHTgrr+QZvYLK2qKe6+eRxw2o1WY5QobgQI437BCv9/UiYP
   P5bZ76QrmYZ7Zhbicp1bn4hlJ6VUcgtpKcpq3w/k1VSI78YTS2YXc3kK1
   A==;
X-CSE-ConnectionGUID: FxmDA8OsRCaknI4wWjmGrQ==
X-CSE-MsgGUID: Ybo5ShQjSLaTl+R3+85q2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="108827960"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="108827960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 13:44:51 -0700
X-CSE-ConnectionGUID: aqtQ0B/vT4+nBFIGOLL2KQ==
X-CSE-MsgGUID: YrQq+j42R7m/HReOPigYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="279876986"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2026 13:44:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBIDP-00000000OUd-29SA
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Sep 2026 20:44:47 +0000
Date: Tue, 29 Sep 2026 04:44:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: net: fec: reject oversized fragments before bounce-buffer memcpy
Message-ID: <202609290434.p1gACTRw-lkp@intel.com>
References: <202609290434.p1gACTRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609290434.p1gACTRw-lkp@intel.com>

Hi Aldo,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Aldo-Ariel-Panzardo/net-fec-reject-oversized-fragments-before-bounce-buffer-memcpy/20260923-173738
base:   
patch link:    https://lore.kernel.org/r/202609290434.p1gACTRw-lkp%40intel.com
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260929/202609290434.p1gACTRw-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290434.p1gACTRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290434.p1gACTRw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_txq_submit_skb':
>> drivers/net/ethernet/freescale/fec_main.c:640:25: error: label 'release' used but not defined
     640 |                         goto release;
         |                         ^~~~


vim +/release +640 drivers/net/ethernet/freescale/fec_main.c

   597	
   598	static int fec_enet_txq_submit_skb(struct fec_enet_priv_tx_q *txq,
   599					   struct sk_buff *skb, struct net_device *ndev)
   600	{
   601		struct fec_enet_private *fep = netdev_priv(ndev);
   602		int nr_frags = skb_shinfo(skb)->nr_frags;
   603		struct bufdesc *bdp, *last_bdp;
   604		void *bufaddr;
   605		dma_addr_t addr;
   606		unsigned short status;
   607		unsigned short buflen;
   608		unsigned int estatus = 0;
   609		unsigned int index;
   610		int entries_free;
   611	
   612		entries_free = fec_enet_get_free_txdesc_num(txq);
   613		if (entries_free < MAX_SKB_FRAGS + 1) {
   614			dev_kfree_skb_any(skb);
   615			if (net_ratelimit())
   616				netdev_err(ndev, "NOT enough BD for SG!\n");
   617			return NETDEV_TX_OK;
   618		}
   619	
   620		/* Protocol checksum off-load for TCP and UDP. */
   621		if (fec_enet_clear_csum(skb, ndev)) {
   622			dev_kfree_skb_any(skb);
   623			return NETDEV_TX_OK;
   624		}
   625	
   626		/* Fill in a Tx ring entry */
   627		bdp = txq->bd.cur;
   628		last_bdp = bdp;
   629		status = fec16_to_cpu(bdp->cbd_sc);
   630		status &= ~BD_ENET_TX_STATS;
   631	
   632		/* Set buffer length and buffer pointer */
   633		bufaddr = skb->data;
   634		buflen = skb_headlen(skb);
   635	
   636		index = fec_enet_get_bd_index(bdp, &txq->bd);
   637		if (((unsigned long) bufaddr) & fep->tx_align ||
   638			fep->quirks & FEC_QUIRK_SWAP_FRAME) {
   639			if (buflen > FEC_ENET_TX_FRSIZE)
 > 640				goto release;
   641			memcpy(txq->tx_bounce[index], skb->data, buflen);
   642			bufaddr = txq->tx_bounce[index];
   643	
   644			if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
   645				swap_buffer(bufaddr, buflen);
   646		}
   647	
   648		/* Push the data cache so the CPM does not get stale memory data. */
   649		addr = dma_map_single(&fep->pdev->dev, bufaddr, buflen, DMA_TO_DEVICE);
   650		if (dma_mapping_error(&fep->pdev->dev, addr)) {
   651			dev_kfree_skb_any(skb);
   652			if (net_ratelimit())
   653				netdev_err(ndev, "Tx DMA memory map failed\n");
   654			return NETDEV_TX_OK;
   655		}
   656	
   657		if (nr_frags) {
   658			last_bdp = fec_enet_txq_submit_frag_skb(txq, skb, ndev);
   659			if (IS_ERR(last_bdp)) {
   660				dma_unmap_single(&fep->pdev->dev, addr,
   661						 buflen, DMA_TO_DEVICE);
   662				dev_kfree_skb_any(skb);
   663				return NETDEV_TX_OK;
   664			}
   665		} else {
   666			status |= (BD_ENET_TX_INTR | BD_ENET_TX_LAST);
   667			if (fep->bufdesc_ex) {
   668				estatus = BD_ENET_TX_INT;
   669				if (unlikely(skb_shinfo(skb)->tx_flags &
   670					SKBTX_HW_TSTAMP && fep->hwts_tx_en))
   671					estatus |= BD_ENET_TX_TS;
   672			}
   673		}
   674		bdp->cbd_bufaddr = cpu_to_fec32(addr);
   675		bdp->cbd_datlen = cpu_to_fec16(buflen);
   676	
   677		if (fep->bufdesc_ex) {
   678	
   679			struct bufdesc_ex *ebdp = (struct bufdesc_ex *)bdp;
   680	
   681			if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
   682				fep->hwts_tx_en))
   683				skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
   684	
   685			if (fep->quirks & FEC_QUIRK_HAS_AVB)
   686				estatus |= FEC_TX_BD_FTYPE(txq->bd.qid);
   687	
   688			if (skb->ip_summed == CHECKSUM_PARTIAL)
   689				estatus |= BD_ENET_TX_PINS | BD_ENET_TX_IINS;
   690	
   691			ebdp->cbd_bdu = 0;
   692			ebdp->cbd_esc = cpu_to_fec32(estatus);
   693		}
   694	
   695		index = fec_enet_get_bd_index(last_bdp, &txq->bd);
   696		/* Save skb pointer */
   697		txq->tx_buf[index].buf_p = skb;
   698	
   699		/* Make sure the updates to rest of the descriptor are performed before
   700		 * transferring ownership.
   701		 */
   702		wmb();
   703	
   704		/* Send it on its way.  Tell FEC it's ready, interrupt when done,
   705		 * it's the last BD of the frame, and to put the CRC on the end.
   706		 */
   707		status |= (BD_ENET_TX_READY | BD_ENET_TX_TC);
   708		bdp->cbd_sc = cpu_to_fec16(status);
   709	
   710		/* If this was the last BD in the ring, start at the beginning again. */
   711		bdp = fec_enet_get_nextdesc(last_bdp, &txq->bd);
   712	
   713		skb_tx_timestamp(skb);
   714	
   715		/* Make sure the update to bdp is performed before txq->bd.cur. */
   716		wmb();
   717		txq->bd.cur = bdp;
   718	
   719		/* Trigger transmission start */
   720		fec_txq_trigger_xmit(fep, txq);
   721	
   722		return 0;
   723	}
   724	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
