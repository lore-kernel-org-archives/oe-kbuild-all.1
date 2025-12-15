Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3229D1C84A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765760099; cv=none; b=KT/Ho5xDUqd0guNr8f/PZV14Jt+bmicVRWh5wCv04URBr6WBLP7I185aWKRfiYyGAPpeBhWavohg50TP3CnptgAsFCwuDQ8uLjATfKLg+SS9/y7tbeWE+BiZ31i5296IrtfskFEzofgq5uIubU64M9ZwFYQ78f1eH+t2UfwTbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765760099; c=relaxed/simple;
	bh=nH0orP5Nlq+bMbZaWMs88MS/SMokLB/5r/xO52M61Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZ0A/p88UKHI6RXXCynrh8ctf7RmgCEbF1UTLLnUg6orCWTmlKnugJTf1jYFu9ecO3PxLUu6cADLVy2XifKETYFLHR7X/N4bJVtMfudDy2l6aoc6c1fzS3Cgjfj3EUlEtALYZ0bF4qa0SpdnLjaNoqyLR9R82i9a03pOb5MNKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edyPg/aN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edyPg/aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765760097; x=1797296097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nH0orP5Nlq+bMbZaWMs88MS/SMokLB/5r/xO52M61Sk=;
  b=edyPg/aNUA3awkx6ubMQxkihecxDl1esHoxNoMhJv0MhaxrH+kNQSiqp
   Dhsnux1OFd9VS9oJ760s9NZH+aC9rpICNjHj0mCawsdYh86nTHQR+NVI+
   oMuph+fuIywePvWtTWho5K0Mxg8s8y9DIUgD/poyq1Gd7O/CPjsrxaDJ1
   Q8I2b1FRCE6YAvUg0Rrqa6Ua///yn1j5NZIgRVxeQlpi5pVEk2eyIPZZF
   DjZbztZ0xC465WdgmQVKJ4gtg+GGD7CY9smpMuoDPr+ShDFX/5J9mdLno
   iw7NQpwUpFhqgwFMFR74CqxGpUMl3D69+aBmlunPrzG43CBig332kpFkJ
   Q==;
X-CSE-ConnectionGUID: x+ivD4dpTzi4uq+u8x3GPw==
X-CSE-MsgGUID: EBAewi2gQjy56LCmfFd0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="90314613"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="90314613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:54:56 -0800
X-CSE-ConnectionGUID: PWGs/nZRSUeNtqTgnjaZhw==
X-CSE-MsgGUID: 46sRfNRnSHGrtkOWkGXDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="196863774"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2025 16:54:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwrV-000000009Xf-0SEz;
	Mon, 15 Dec 2025 00:54:53 +0000
Date: Mon, 15 Dec 2025 08:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pxa1908-mainline:pxa1908/master 12/13]
 drivers/net/wireless/marvell/mwifiex/sta_tx.c:44:21: warning: cast from
 pointer to integer of different size
Message-ID: <202512150827.6W6Gbk9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/pxa1908-mainline/linux pxa1908/master
head:   9e872f85d0ed53d474107764343c245869b95c45
commit: 1325efda2cf6f3a8867bfff2446c7b56f95262f6 [12/13] fixup! DONOTMERGE: net: mwifiex: fix timeouts with the SD8777 chip
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251215/202512150827.6W6Gbk9N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150827.6W6Gbk9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150827.6W6Gbk9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/marvell/mwifiex/sta_tx.c: In function 'mwifiex_process_sta_txpd':
>> drivers/net/wireless/marvell/mwifiex/sta_tx.c:44:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      44 |         pad = (4 - ((uint64_t) skb->data & 0x3)) % 4;
         |                     ^


vim +44 drivers/net/wireless/marvell/mwifiex/sta_tx.c

    14	
    15	/*
    16	 * This function fills the TxPD for tx packets.
    17	 *
    18	 * The Tx buffer received by this function should already have the
    19	 * header space allocated for TxPD.
    20	 *
    21	 * This function inserts the TxPD in between interface header and actual
    22	 * data and adjusts the buffer pointers accordingly.
    23	 *
    24	 * The following TxPD fields are set by this function, as required -
    25	 *      - BSS number
    26	 *      - Tx packet length and offset
    27	 *      - Priority
    28	 *      - Packet delay
    29	 *      - Priority specific Tx control
    30	 *      - Flags
    31	 */
    32	void mwifiex_process_sta_txpd(struct mwifiex_private *priv,
    33				      struct sk_buff *skb)
    34	{
    35		struct mwifiex_adapter *adapter = priv->adapter;
    36		struct txpd *local_tx_pd;
    37		struct mwifiex_txinfo *tx_info = MWIFIEX_SKB_TXCB(skb);
    38		unsigned int pad;
    39		u16 pkt_type, pkt_length, pkt_offset;
    40		int hroom = adapter->intf_hdr_len;
    41	
    42		pkt_type = mwifiex_is_skb_mgmt_frame(skb) ? PKT_TYPE_MGMT : 0;
    43	
  > 44		pad = (4 - ((uint64_t) skb->data & 0x3)) % 4;
    45	
    46		skb_push(skb, sizeof(*local_tx_pd) + pad);
    47	
    48		local_tx_pd = (struct txpd *) skb->data;
    49		memset(local_tx_pd, 0, sizeof(struct txpd));
    50		local_tx_pd->bss_num = priv->bss_num;
    51		local_tx_pd->bss_type = priv->bss_type;
    52		pkt_length = (u16)(skb->len - (sizeof(struct txpd) + pad));
    53		if (pkt_type == PKT_TYPE_MGMT)
    54			pkt_length -= MWIFIEX_MGMT_FRAME_HEADER_SIZE;
    55		local_tx_pd->tx_pkt_length = cpu_to_le16(pkt_length);
    56	
    57		local_tx_pd->priority = (u8) skb->priority;
    58		local_tx_pd->pkt_delay_2ms =
    59					mwifiex_wmm_compute_drv_pkt_delay(priv, skb);
    60	
    61		if (local_tx_pd->priority <
    62		    ARRAY_SIZE(priv->wmm.user_pri_pkt_tx_ctrl))
    63			/*
    64			 * Set the priority specific tx_control field, setting of 0 will
    65			 *   cause the default value to be used later in this function
    66			 */
    67			local_tx_pd->tx_control =
    68				cpu_to_le32(priv->wmm.user_pri_pkt_tx_ctrl[local_tx_pd->
    69									   priority]);
    70	
    71		if (adapter->pps_uapsd_mode) {
    72			if (mwifiex_check_last_packet_indication(priv)) {
    73				adapter->tx_lock_flag = true;
    74				local_tx_pd->flags =
    75					MWIFIEX_TxPD_POWER_MGMT_LAST_PACKET;
    76			}
    77		}
    78	
    79		if (tx_info->flags & MWIFIEX_BUF_FLAG_TDLS_PKT)
    80			local_tx_pd->flags |= MWIFIEX_TXPD_FLAGS_TDLS_PACKET;
    81	
    82		/* Offset of actual data */
    83		pkt_offset = sizeof(struct txpd) + pad;
    84		if (pkt_type == PKT_TYPE_MGMT) {
    85			/* Set the packet type and add header for management frame */
    86			local_tx_pd->tx_pkt_type = cpu_to_le16(pkt_type);
    87			pkt_offset += MWIFIEX_MGMT_FRAME_HEADER_SIZE;
    88		}
    89	
    90		local_tx_pd->tx_pkt_offset = cpu_to_le16(pkt_offset);
    91	
    92		/* make space for adapter->intf_hdr_len */
    93		skb_push(skb, hroom);
    94	
    95		if (!local_tx_pd->tx_control)
    96			/* TxCtrl set by user or default */
    97			local_tx_pd->tx_control = cpu_to_le32(priv->pkt_tx_ctrl);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
