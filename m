Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9313957E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769281417; cv=none; b=OR/SFtPI60qCEmJL79j0fg41upY60Ax+b/LCr7K0sxH+cGR9vUwaOvIlZnVgn7oojWBL48elNxl/znoANu6vDJS1tz/Qenco+2FywJvC/FXvORJly7cGUv6oiHj0ntQs5utg0ZLH4oR8B8Eb2FQihhVAIATasPN4C3uR8U8RR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769281417; c=relaxed/simple;
	bh=JNwqTGn0au3N0+i/nAErDNazuxM0zN4/rRDvzMWUr6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jOaRfzeNaazGQhqwb2rYvEO4AIN3NmpQUpHArOHQdG2+gKMzqy9/PJ1cdciMOuyKeeeWvlNAknFmZcI8940R0UehcqRMAX2QlyyrZ3Sva7/RrRJSjCpRz00GPo4SEaeL4NMOq0wMqjE8eRkQEgFaThEVDJjXoPyOVW6ZRDtpn6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUiLQwwW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUiLQwwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769281415; x=1800817415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNwqTGn0au3N0+i/nAErDNazuxM0zN4/rRDvzMWUr6U=;
  b=fUiLQwwWMUVRryIDDxGwRQw2dCF3daPW5L/7KSmwaAZAptBfOp2ocY5k
   mJn02aSpk/9i6oV4Vbrxq8y2Kf5oELd290+8Zv4fSHBeP4IFvmyEypC8Y
   6STZC68ZBRCQRqG6yqZoJEACmKuZbaNbFuQ2qyCUt2D17x6hxjB86Qwsd
   UdFUWy2Ti75Y3CpTlXHUG9O65Vqmwkw7QFQA8l7ERUvGv+u2UjjCV9qX2
   Ei5Dklbh/abnt2Vn4LS0Ky9SbPqP7kgzCo0Ty/CsSW3u8WvwTJf7loI6g
   O1uuHYU9pB/BqBtbzltp0fPIsUFRRnNcSL5SWTC2bw9djf023dbs6XZek
   A==;
X-CSE-ConnectionGUID: G0jZ8lshR1uFQr9x8KSYtw==
X-CSE-MsgGUID: 6LbfoXWpRMqn+n2CfX/PCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="95966930"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="95966930"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 11:03:35 -0800
X-CSE-ConnectionGUID: u7SHQYZlTcCgx3cYmc4+mw==
X-CSE-MsgGUID: WoomGRnJTPqQ6bNrRU2VsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="206426667"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jan 2026 11:03:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjiuw-00000000VTM-0utV;
	Sat, 24 Jan 2026 19:03:30 +0000
Date: Sun, 25 Jan 2026 03:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Subject: [pxa1908-mainline:pxa1908/master 4/15]
 drivers/net/wireless/marvell/mwifiex/sta_tx.c:44:21: warning: cast from
 pointer to integer of different size
Message-ID: <202601250240.vAJMkkrK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/pxa1908-mainline/linux pxa1908/master
head:   74b88f5cc1e571d61ad7e914990a995def7b4d66
commit: f657cedf285762c598177aebda1fc9d7d6f0c04a [4/15] DONOTMERGE: net: mwifiex: fix timeouts with the SD8777 chip
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260125/202601250240.vAJMkkrK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250240.vAJMkkrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250240.vAJMkkrK-lkp@intel.com/

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
