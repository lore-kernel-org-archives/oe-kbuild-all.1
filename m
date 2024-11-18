Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692391E0DBA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731954255; cv=none; b=pKcNhNpJKmgXgnrUnQOe3Nd3PV8VQeFht1PpT1e1NszPFF7iIr7+AGSkzlw+BLvHyCoCe8HP3bhi+pExCFMPY5GHEzTatcXKgLtxoPg0oHV2YtKjWXQSQyollY95iU0s2Ry0nKEXv82UP2BW3PRNrOTUfMrQ5nj4YIbCEhQ4cPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731954255; c=relaxed/simple;
	bh=/zxS6W+EKTEKmLxuuKRGpUeIs4JS8v/zokzoMdeIGuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSNm4x1OFC26Xaq0uSJkq+NsfWTdltahYkLLoGMmyHim+dMZxnGzVmRZDN1pG2kvxWcBVNtqrA9R05yA0OFy+t8ffbOy/k6N5yqn4N2qtjIo5voTR1G1ix+PCwMDX+eLQpOx2fgD0y7tLzfFAy2fe6acuYzgYvi2rb6LxMXBllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfRcj3a0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfRcj3a0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731954253; x=1763490253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zxS6W+EKTEKmLxuuKRGpUeIs4JS8v/zokzoMdeIGuo=;
  b=TfRcj3a0j5/pBN+yyE5sjo534IAk7uxgtuNBpHukeFpBy2IyGYW6EqnE
   m0kUNQNm8+ut2y/mJVQ6uzVM6cUiYHIfi7nv4c1YZX4tWC8FJnV8GBF4x
   nUAfK9FRPm6dep3KVnTwpm13nQmAvB6LF+MclOX3mjndsNuxjTRfQsPwP
   ng96YnBGEOQdDyGtss2ycNC9JyVyA/5Rn2KMThDYbyt9x5bL8tRP3TSk2
   cfdJUNYwC5tO7a5uYdQMgj/exUDEEgtB1ATWae/fXFg5THP+UwKO74LVH
   y1bgjL+eRlOon9Fee0QUZINgZXFffPRHSFE1iXijgZHyDvzTMvA5QaT2y
   Q==;
X-CSE-ConnectionGUID: QzPs/9c3Qo2/Qh0TondoTQ==
X-CSE-MsgGUID: F5+U8qfhQtmagdDfetzKEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49464290"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="49464290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 10:24:11 -0800
X-CSE-ConnectionGUID: pdlcSHpPR2+QOpeqxe+Qtg==
X-CSE-MsgGUID: qE9mExBiSyKfUL7syH038g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94350057"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2024 10:24:11 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD6Pv-0002aT-1I;
	Mon, 18 Nov 2024 18:24:07 +0000
Date: Tue, 19 Nov 2024 02:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 34/48]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7694:27: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202411190252.PFtAwf3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   bae8b9b1d3b8c3fc9e9e35e1b0656cc5bcdae6ec
commit: c78aebc7d23b137a589645bf07a8ce18be548edf [34/48] [brcmfmac] Add support for 6G bands and HE
config: riscv-randconfig-r113-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190252.PFtAwf3X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190252.PFtAwf3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190252.PFtAwf3X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7694:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data *data @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7694:27: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7694:27: sparse:     got struct ieee80211_sband_iftype_data *data

vim +7694 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  7582	
  7583	static void brcmf_update_he_cap(struct ieee80211_supported_band *band,
  7584					struct ieee80211_sband_iftype_data *data)
  7585	{
  7586		int idx = 1;
  7587		struct ieee80211_sta_he_cap *he_cap = &data->he_cap;
  7588		struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
  7589		struct ieee80211_he_mcs_nss_supp *he_mcs = &he_cap->he_mcs_nss_supp;
  7590		struct ieee80211_he_6ghz_capa *he_6ghz_capa = &data->he_6ghz_capa;
  7591	
  7592		if (!data) {
  7593			brcmf_err("failed to allocate sdata\n");
  7594			return;
  7595		}
  7596	
  7597		data->types_mask = BIT(NL80211_IFTYPE_STATION);
  7598		he_cap->has_he = true;
  7599	
  7600		/* HE MAC Capabilities Information */
  7601		he_cap_elem->mac_cap_info[0] = IEEE80211_HE_MAC_CAP0_HTC_HE |
  7602					       IEEE80211_HE_MAC_CAP0_TWT_REQ |
  7603					       IEEE80211_HE_MAC_CAP0_TWT_RES;
  7604	
  7605		he_cap_elem->mac_cap_info[1] =
  7606			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
  7607			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
  7608	
  7609		he_cap_elem->mac_cap_info[2] = IEEE80211_HE_MAC_CAP2_BSR |
  7610					       IEEE80211_HE_MAC_CAP2_BCAST_TWT;
  7611	
  7612		he_cap_elem->mac_cap_info[3] =
  7613			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
  7614			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_1 |
  7615			IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
  7616	
  7617		he_cap_elem->mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
  7618	
  7619		/* HE PHY Capabilities Information */
  7620		he_cap_elem->phy_cap_info[0] =
  7621			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
  7622			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
  7623			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
  7624		;
  7625	
  7626		he_cap_elem->phy_cap_info[1] =
  7627			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
  7628	
  7629		he_cap_elem->phy_cap_info[2] =
  7630			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
  7631			IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
  7632			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
  7633	
  7634		he_cap_elem->phy_cap_info[3] =
  7635			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
  7636			IEEE80211_HE_PHY_CAP3_DCM_MAX_TX_NSS_2 |
  7637			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
  7638			IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
  7639	
  7640		he_cap_elem->phy_cap_info[4] =
  7641			IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
  7642			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK |
  7643			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 |
  7644			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_8;
  7645	
  7646		he_cap_elem->phy_cap_info[5] =
  7647			IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
  7648			IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK |
  7649			IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_2;
  7650	
  7651		he_cap_elem->phy_cap_info[6] =
  7652			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
  7653			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
  7654			IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
  7655			IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
  7656			IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
  7657			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
  7658			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
  7659	
  7660		he_cap_elem->phy_cap_info[7] =
  7661			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
  7662			IEEE80211_HE_PHY_CAP7_MAX_NC_1;
  7663	
  7664		he_cap_elem->phy_cap_info[8] =
  7665			IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
  7666			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
  7667			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
  7668			IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
  7669	
  7670		he_cap_elem->phy_cap_info[9] =
  7671			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
  7672			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
  7673			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
  7674			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
  7675	
  7676		/* HE Supported MCS and NSS Set */
  7677		he_mcs->rx_mcs_80 = cpu_to_le16(0xfffa);
  7678		he_mcs->tx_mcs_80 = cpu_to_le16(0xfffa);
  7679		he_mcs->rx_mcs_160 = cpu_to_le16(0xfffa);
  7680		he_mcs->tx_mcs_160 = cpu_to_le16(0xfffa);
  7681		/* HE 6 GHz band capabilities */
  7682		if (band->band == NL80211_BAND_6GHZ) {
  7683			u16 capa = 0;
  7684	
  7685			capa = FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
  7686					  IEEE80211_HT_MPDU_DENSITY_8) |
  7687			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
  7688					  IEEE80211_VHT_MAX_AMPDU_1024K) |
  7689			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN,
  7690					  IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454);
  7691			he_6ghz_capa->capa = cpu_to_le16(capa);
  7692		}
  7693		band->n_iftype_data = idx;
> 7694		band->iftype_data = data;
  7695	}
  7696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
