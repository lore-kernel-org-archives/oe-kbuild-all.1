Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C11386B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407099; cv=none; b=FgFvtPK7HrYChg2J/+5ktZzVWzw9ukhNPBhp6I/wDHdFDcnxlpJhAwbEVDuLO83OhSEZhHAl1inQbe4A20GwjvXbLJeFYlUiIc3iJFSj8CYCCJNBderjLbeXLEokElu2eSGQB73otjAcxqm9c/I1rEs2br4u+7R65rWTbZr/Sfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407099; c=relaxed/simple;
	bh=rsCLu4rW5Z1RkMzURNrAah2ZLKCGv5Y36v1ERlxT1hI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adYCrhpmnkAoALqg3oU4Dyzc7+UA6FJw87n0g2qJOX+Fx7J+qIG0qxPVLZsqCnpNOHEBFAWwlCZG57Hywe/u3rZu+Piy6KD1/iNndkUhPqf/FlSw1ODrEe/hHsGB1ePz5N8LESmhOF2iJ09aM3dBrCn6oi4y9rDbPXA8W6EQ+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgh6r5bb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgh6r5bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740407097; x=1771943097;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rsCLu4rW5Z1RkMzURNrAah2ZLKCGv5Y36v1ERlxT1hI=;
  b=mgh6r5bbzJnSF2J1Xhersl6V9BeMwHkKWYcoEfxu05alL8un2gRHaFFN
   lIrlNKZRCDrtL5yCiSkAN6hmYfmNg1gZyo5+Vo8WCZILOLJH0IRGaWHKm
   aU7xaaWzH5rKDx4X5R54QHfFH1TxJN17E0s0uzVeeJnzEId47wDI6dDyR
   qxxUh0GdO7ICJxB4Tuz258Ze0vEmwGY7bWZuWH9S3nZEZj9awyF44l0zR
   ABEduoLQ2F3jHdlwv0NO6P3qaa6mNOCWCIPspRZgueq25ToBaVZXhXMHs
   xheAF/dwvIyxAX6WhLA/zhiYAm0PTtFJBYPQ2GkNWZDH1gu37m9/9D/R0
   g==;
X-CSE-ConnectionGUID: R3Kx97BBQ3W24b4x64puJg==
X-CSE-MsgGUID: rcDkKICjQ/q3XfW1wJGCzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44816175"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44816175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:24:47 -0800
X-CSE-ConnectionGUID: uEfRSWsvRcCBjFEhXmdEpA==
X-CSE-MsgGUID: 2tjYQ6fdRaKBVqKhBFpv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153273718"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2025 06:24:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZO0-0008Sa-0Q
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 14:24:44 +0000
Date: Mon, 24 Feb 2025 22:24:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/net/wireless/rsi/rsi_91x_hal.c:117:29:
 warning: variable 'bss' set but not used
Message-ID: <202502242207.VOPkkSqD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: ceb2e4eab9948a8ed14fd5b439ccb66dec4931e0 [1/1] rsi: separate function for data packet descriptor
config: powerpc-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502242207.VOPkkSqD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242207.VOPkkSqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242207.VOPkkSqD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bug.h:4:0,
                    from include/linux/mmdebug.h:4,
                    from include/linux/gfp.h:4,
                    from include/linux/firmware.h:6,
                    from drivers/net/wireless/rsi/rsi_91x_hal.c:17:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:75:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   include/linux/dma-mapping.h:307:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   include/linux/dma-mapping.h:307:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:84:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   include/linux/dma-mapping.h:307:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c: In function 'rsi_prepare_mgmt_desc':
   drivers/net/wireless/rsi/rsi_91x_hal.c:36:24: warning: variable 'vif' set but not used [-Wunused-but-set-variable]
     struct ieee80211_vif *vif = NULL;
                           ^~~
   drivers/net/wireless/rsi/rsi_91x_hal.c: In function 'rsi_prepare_data_desc':
>> drivers/net/wireless/rsi/rsi_91x_hal.c:117:29: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     struct ieee80211_bss_conf *bss;
                                ^~~
   drivers/net/wireless/rsi/rsi_91x_hal.c: In function 'auto_fw_upgrade':
   drivers/net/wireless/rsi/rsi_91x_hal.c:560:11: warning: variable 'temp_flash_content' set but not used [-Wunused-but-set-variable]
     u8 cmd, *temp_flash_content;
              ^~~~~~~~~~~~~~~~~~


vim +/bss +117 drivers/net/wireless/rsi/rsi_91x_hal.c

6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   29  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   30  static int rsi_prepare_mgmt_desc(struct rsi_common *common, struct sk_buff *skb)
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   31  {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   32  	struct rsi_hw *adapter = common->priv;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   33  	struct ieee80211_hdr *wh = NULL;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   34  	struct ieee80211_tx_info *info;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   35  	struct ieee80211_conf *conf = &adapter->hw->conf;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  @36  	struct ieee80211_vif *vif = NULL;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   37  	struct rsi_mgmt_desc *mgmt_desc;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   38  	struct skb_info *tx_params;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   39  	struct ieee80211_bss_conf *bss = NULL;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   40  	struct xtended_desc *xtend_desc = NULL;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   41  	u8 header_size;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   42  	u32 dword_align_bytes = 0;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   43  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   44  	info = IEEE80211_SKB_CB(skb);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   45  	tx_params = (struct skb_info *)info->driver_data;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   46  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   47  	/* Update header size */
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   48  	header_size = FRAME_DESC_SZ + sizeof(struct xtended_desc);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   49  	if (header_size > skb_headroom(skb)) {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   50  		rsi_dbg(ERR_ZONE,
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   51  			"%s: Failed to add extended descriptor\n",
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   52  			__func__);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   53  		return -ENOSPC;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   54  	}
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   55  	skb_push(skb, header_size);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   56  	dword_align_bytes = ((unsigned long)skb->data & 0x3f);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   57  	if (dword_align_bytes > skb_headroom(skb)) {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   58  		rsi_dbg(ERR_ZONE,
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   59  			"%s: Failed to add dword align\n", __func__);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   60  		return -ENOSPC;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   61  	}
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   62  	skb_push(skb, dword_align_bytes);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   63  	header_size += dword_align_bytes;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   64  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   65  	tx_params->internal_hdr_size = header_size;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   66  	memset(&skb->data[0], 0, header_size);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   67  	bss = &info->control.vif->bss_conf;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   68  	wh = (struct ieee80211_hdr *)&skb->data[header_size];
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   69  	vif = adapter->vifs[0];
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   70  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   71  	mgmt_desc = (struct rsi_mgmt_desc *)skb->data;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   72  	xtend_desc = (struct xtended_desc *)&skb->data[FRAME_DESC_SZ];
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   73  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   74  	if (skb->len > MAX_MGMT_PKT_SIZE) {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   75  		rsi_dbg(INFO_ZONE, "%s: Dropping mgmt pkt > 512\n", __func__);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   76  		return -EINVAL;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   77  	}
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   78  	rsi_set_len_qno(&mgmt_desc->len_qno, (skb->len - FRAME_DESC_SZ),
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   79  			RSI_WIFI_MGMT_Q);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   80  	mgmt_desc->frame_type = TX_DOT11_MGMT;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   81  	mgmt_desc->header_len = MIN_802_11_HDR_LEN;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   82  	mgmt_desc->xtend_desc_size = header_size - FRAME_DESC_SZ;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   83  	mgmt_desc->frame_info |= cpu_to_le16(RATE_INFO_ENABLE);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   84  	if (is_broadcast_ether_addr(wh->addr1))
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   85  		mgmt_desc->frame_info |= cpu_to_le16(RSI_BROADCAST_PKT);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   86  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   87  	mgmt_desc->seq_ctrl =
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   88  		cpu_to_le16(IEEE80211_SEQ_TO_SN(le16_to_cpu(wh->seq_ctrl)));
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   89  	if (common->band == NL80211_BAND_2GHZ)
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   90  		mgmt_desc->rate_info = RSI_RATE_1;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   91  	else
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   92  		mgmt_desc->rate_info = RSI_RATE_6;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   93  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   94  	if (conf_is_ht40(conf))
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   95  		mgmt_desc->bbp_info = cpu_to_le16(FULL40M_ENABLE);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   96  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   97  	if (ieee80211_is_probe_req(wh->frame_control)) {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   98  		if (!bss->assoc) {
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06   99  			rsi_dbg(INFO_ZONE,
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  100  				"%s: blocking mgmt queue\n", __func__);
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  101  			mgmt_desc->misc_flags = RSI_DESC_REQUIRE_CFM_TO_HOST;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  102  			xtend_desc->confirm_frame_type = PROBEREQ_CONFIRM;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  103  			common->mgmt_q_block = true;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  104  			rsi_dbg(INFO_ZONE, "Mgmt queue blocked\n");
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  105  		}
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  106  	}
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  107  
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  108  	return 0;
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  109  }
6507de6df9007b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepudi 2017-07-06  110  
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  111  /* This function prepares descriptor for given data packet */
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  112  static int rsi_prepare_data_desc(struct rsi_common *common, struct sk_buff *skb)
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  113  {
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  114  	struct ieee80211_hdr *wh = NULL;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  115  	struct ieee80211_tx_info *info;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  116  	struct skb_info *tx_params;
ab2ef1d68f62d9 drivers/net/wireless/rsi/rsi_91x_pkt.c Markus Elfring          2016-03-18 @117  	struct ieee80211_bss_conf *bss;
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  118  	struct rsi_data_desc *data_desc;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  119  	struct xtended_desc *xtend_desc;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  120  	u8 ieee80211_size = MIN_802_11_HDR_LEN;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  121  	u8 header_size;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  122  	u8 vap_id = 0;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  123  	u8 dword_align_bytes;
ab2ef1d68f62d9 drivers/net/wireless/rsi/rsi_91x_pkt.c Markus Elfring          2016-03-18  124  	u16 seq_num;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  125  
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  126  	info = IEEE80211_SKB_CB(skb);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  127  	bss = &info->control.vif->bss_conf;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  128  	tx_params = (struct skb_info *)info->driver_data;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  129  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  130  	header_size = FRAME_DESC_SZ + sizeof(struct xtended_desc);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  131  	if (header_size > skb_headroom(skb)) {
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  132  		rsi_dbg(ERR_ZONE, "%s: Unable to send pkt\n", __func__);
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  133  		return -ENOSPC;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  134  	}
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  135  	skb_push(skb, header_size);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  136  	dword_align_bytes = ((unsigned long)skb->data & 0x3f);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  137  	if (header_size > skb_headroom(skb)) {
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  138  		rsi_dbg(ERR_ZONE, "%s: Not enough headroom\n", __func__);
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  139  		return -ENOSPC;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  140  	}
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  141  	skb_push(skb, dword_align_bytes);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  142  	header_size += dword_align_bytes;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  143  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  144  	tx_params->internal_hdr_size = header_size;
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  145  	data_desc = (struct rsi_data_desc *)skb->data;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  146  	memset(data_desc, 0, header_size);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  147  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  148  	xtend_desc = (struct xtended_desc *)&skb->data[FRAME_DESC_SZ];
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  149  	wh = (struct ieee80211_hdr *)&skb->data[header_size];
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  150  	seq_num = (le16_to_cpu(wh->seq_ctrl) >> 4);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  151  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  152  	data_desc->xtend_desc_size = header_size - FRAME_DESC_SZ;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  153  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  154  	if (ieee80211_is_data_qos(wh->frame_control)) {
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  155  		ieee80211_size += 2;
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  156  		data_desc->mac_flags |= cpu_to_le16(RSI_QOS_ENABLE);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  157  	}
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  158  
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  159  	if ((!(info->flags & IEEE80211_TX_INTFL_DONT_ENCRYPT)) &&
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  160  	    (common->secinfo.security_enable)) {
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  161  		if (rsi_is_cipher_wep(common))
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  162  			ieee80211_size += 4;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  163  		else
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  164  			ieee80211_size += 8;
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  165  		data_desc->mac_flags |= cpu_to_le16(RSI_ENCRYPT_PKT);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  166  	}
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  167  	rsi_set_len_qno(&data_desc->len_qno, (skb->len - FRAME_DESC_SZ),
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  168  			RSI_WIFI_DATA_Q);
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  169  	data_desc->header_len = ieee80211_size;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  170  
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  171  	if (common->min_rate != RSI_RATE_AUTO) {
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  172  		/* Send fixed rate */
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  173  		data_desc->frame_info = cpu_to_le16(RATE_INFO_ENABLE);
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  174  		data_desc->rate_info = cpu_to_le16(common->min_rate);
e8c58e7a5a106c drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  175  
e8c58e7a5a106c drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  176  		if (conf_is_ht40(&common->priv->hw->conf))
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  177  			data_desc->bbp_info = cpu_to_le16(FULL40M_ENABLE);
e8c58e7a5a106c drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  178  
2bfa6969d9b332 drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  179  		if (common->vif_info[0].sgi) {
2bfa6969d9b332 drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  180  			if (common->min_rate & 0x100) /* Only MCS rates */
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  181  				data_desc->rate_info |=
2bfa6969d9b332 drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  182  					cpu_to_le16(ENABLE_SHORTGI_RATE);
2bfa6969d9b332 drivers/net/wireless/rsi/rsi_91x_pkt.c Jahnavi Meher           2014-06-16  183  		}
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  184  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  185  	}
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  186  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  187  	if (skb->protocol == cpu_to_be16(ETH_P_PAE)) {
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  188  		rsi_dbg(INFO_ZONE, "*** Tx EAPOL ***\n");
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  189  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  190  		data_desc->frame_info = cpu_to_le16(RATE_INFO_ENABLE);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  191  		if (common->band == NL80211_BAND_5GHZ)
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  192  			data_desc->rate_info = cpu_to_le16(RSI_RATE_6);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  193  		else
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  194  			data_desc->rate_info = cpu_to_le16(RSI_RATE_1);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  195  		data_desc->mac_flags |= cpu_to_le16(RSI_REKEY_PURPOSE);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  196  		data_desc->misc_flags |= RSI_FETCH_RETRY_CNT_FRM_HST;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  197  #define EAPOL_RETRY_CNT 15
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  198  		xtend_desc->retry_cnt = EAPOL_RETRY_CNT;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  199  	}
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  200  
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  201  	data_desc->mac_flags = cpu_to_le16(seq_num & 0xfff);
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  202  	data_desc->qid_tid = ((skb->priority & 0xf) |
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  203  			      ((tx_params->tid & 0xf) << 4));
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  204  	data_desc->sta_id = tx_params->sta_id;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima           2014-03-16  205  
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  206  	if ((is_broadcast_ether_addr(wh->addr1)) ||
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  207  	    (is_multicast_ether_addr(wh->addr1))) {
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  208  		data_desc->frame_info = cpu_to_le16(RATE_INFO_ENABLE);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  209  		data_desc->frame_info |= cpu_to_le16(RSI_BROADCAST_PKT);
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  210  		data_desc->sta_id = vap_id;
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  211  	}
0eb42586cf876e drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  212  
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  213  	return 0;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  214  }
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala         2017-07-06  215  

:::::: The code at line 117 was first introduced by commit
:::::: ab2ef1d68f62d9e2ec6e494668f288fc000fe886 rsi: Delete unnecessary variable initialisation

:::::: TO: Markus Elfring <elfring@users.sourceforge.net>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
