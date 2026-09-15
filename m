Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AE388E6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481933; cv=none; b=snE8/+Zg+mN32XRwNc3UTal5SIWNHpAU0V5fZBzDVdZ11B5Q9iivl75IiBsyItxkmHepszSBuPxkKXYatNhtqw+jxUmrvFmHXDgNSQzKcwQD959mhLJIjQ5hXN2Gxq1+idzuFqsRCkM7TfqdbJESW0IYUJjps72OFwPzASm1fHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481933; c=relaxed/simple;
	bh=PRpJo/N4Ig6mmeliMaYZ65Ov7ZHxsIW94o5RvPZQ6Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKJBVeZ+kZQcKvToN9uc7Tgtdfw0cRqLItikCd8kG2Mr4oxN6H4nBRZVxfi9Q17jdLV+gqGZmA2NX8LKpwnnxgMH5u2ykJJPjTCDm5DhvZ3MiMkhjdMBD4KlugQHlY//KLb8PUIuX8URNLn7gcRoekbXxN+upaMFUdIR7Re/thY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5QrUbiT; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5QrUbiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481932; x=1821017932;
  h=date:from:to:cc:subject:message-id;
  bh=PRpJo/N4Ig6mmeliMaYZ65Ov7ZHxsIW94o5RvPZQ6Nk=;
  b=K5QrUbiTOFcMH22AwVzosqTHp00PAyeR6M0dYc+3pitwHY7zgO34ayrQ
   1GqF12tjRhEFGToj2p/2OSS/WAgAZtl6ruYjB6HBTohpUbOlourIB1Ir/
   lDeOkzngt1BXo4AYebCHOdZZ6OOSNF+pP3k/kbCGtyZ9zHzPmSz8R2Gis
   tDzHtrPU0EmaujG8H5kz0PEKzaNSaNK0apbs93ec3SAbiIGSLrSwbSR4o
   ZUh++Lv4ixcgAgz75ohL1YhOQvMLovVQXkN5w4Gn6LuQCMPBnPB660sOJ
   rkyZoRsVwkJmrqPGEw3JZ/WFv/L0ZICSzi45d42mKjqOpLy3Rtt4fcbIg
   A==;
X-CSE-ConnectionGUID: BxyAorO3SAu4gk+EBaLOsQ==
X-CSE-MsgGUID: 15nmzUYkQ3aDt4NKQwdKRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="355084"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="355084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:18:52 -0700
X-CSE-ConnectionGUID: jwz/cWZxQ5aZ3nb7DNOTTQ==
X-CSE-MsgGUID: J82DO4RpT6itZ6MI9AY9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273562732"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2026 07:18:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Tzj-000000004dd-3gwd;
	Tue, 15 Sep 2026 14:18:47 +0000
Date: Tue, 15 Sep 2026 22:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 33/46]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7755:27: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202609152237.mYBtMasc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   423344419b5ba83783b44e2531fe2b32de9e4f42
commit: 0c10263acfe5f842f214a45de3a4f667d9113013 [33/46] [brcmfmac] Add support for 6G bands and HE
config: x86_64-randconfig-123-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152237.mYBtMasc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152237.mYBtMasc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152237.mYBtMasc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7755:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data *data @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7755:27: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7755:27: sparse:     got struct ieee80211_sband_iftype_data *data

vim +7755 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  7643	
  7644	static void brcmf_update_he_cap(struct ieee80211_supported_band *band,
  7645					struct ieee80211_sband_iftype_data *data)
  7646	{
  7647		int idx = 1;
  7648		struct ieee80211_sta_he_cap *he_cap = &data->he_cap;
  7649		struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
  7650		struct ieee80211_he_mcs_nss_supp *he_mcs = &he_cap->he_mcs_nss_supp;
  7651		struct ieee80211_he_6ghz_capa *he_6ghz_capa = &data->he_6ghz_capa;
  7652	
  7653		if (!data) {
  7654			brcmf_err("failed to allocate sdata\n");
  7655			return;
  7656		}
  7657	
  7658		data->types_mask = BIT(NL80211_IFTYPE_STATION);
  7659		he_cap->has_he = true;
  7660	
  7661		/* HE MAC Capabilities Information */
  7662		he_cap_elem->mac_cap_info[0] = IEEE80211_HE_MAC_CAP0_HTC_HE |
  7663					       IEEE80211_HE_MAC_CAP0_TWT_REQ |
  7664					       IEEE80211_HE_MAC_CAP0_TWT_RES;
  7665	
  7666		he_cap_elem->mac_cap_info[1] =
  7667			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
  7668			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
  7669	
  7670		he_cap_elem->mac_cap_info[2] = IEEE80211_HE_MAC_CAP2_BSR |
  7671					       IEEE80211_HE_MAC_CAP2_BCAST_TWT;
  7672	
  7673		he_cap_elem->mac_cap_info[3] =
  7674			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
  7675			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_1 |
  7676			IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
  7677	
  7678		he_cap_elem->mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
  7679	
  7680		/* HE PHY Capabilities Information */
  7681		he_cap_elem->phy_cap_info[0] =
  7682			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
  7683			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
  7684			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
  7685		;
  7686	
  7687		he_cap_elem->phy_cap_info[1] =
  7688			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
  7689	
  7690		he_cap_elem->phy_cap_info[2] =
  7691			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
  7692			IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
  7693			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
  7694	
  7695		he_cap_elem->phy_cap_info[3] =
  7696			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
  7697			IEEE80211_HE_PHY_CAP3_DCM_MAX_TX_NSS_2 |
  7698			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
  7699			IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
  7700	
  7701		he_cap_elem->phy_cap_info[4] =
  7702			IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
  7703			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK |
  7704			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 |
  7705			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_8;
  7706	
  7707		he_cap_elem->phy_cap_info[5] =
  7708			IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
  7709			IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK |
  7710			IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_2;
  7711	
  7712		he_cap_elem->phy_cap_info[6] =
  7713			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
  7714			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
  7715			IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
  7716			IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
  7717			IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
  7718			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
  7719			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
  7720	
  7721		he_cap_elem->phy_cap_info[7] =
  7722			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
  7723			IEEE80211_HE_PHY_CAP7_MAX_NC_1;
  7724	
  7725		he_cap_elem->phy_cap_info[8] =
  7726			IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
  7727			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
  7728			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
  7729			IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
  7730	
  7731		he_cap_elem->phy_cap_info[9] =
  7732			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
  7733			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
  7734			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
  7735			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
  7736	
  7737		/* HE Supported MCS and NSS Set */
  7738		he_mcs->rx_mcs_80 = cpu_to_le16(0xfffa);
  7739		he_mcs->tx_mcs_80 = cpu_to_le16(0xfffa);
  7740		he_mcs->rx_mcs_160 = cpu_to_le16(0xfffa);
  7741		he_mcs->tx_mcs_160 = cpu_to_le16(0xfffa);
  7742		/* HE 6 GHz band capabilities */
  7743		if (band->band == NL80211_BAND_6GHZ) {
  7744			u16 capa = 0;
  7745	
  7746			capa = FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
  7747					  IEEE80211_HT_MPDU_DENSITY_8) |
  7748			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
  7749					  IEEE80211_VHT_MAX_AMPDU_1024K) |
  7750			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN,
  7751					  IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454);
  7752			he_6ghz_capa->capa = cpu_to_le16(capa);
  7753		}
  7754		band->n_iftype_data = idx;
> 7755		band->iftype_data = data;
  7756	}
  7757	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
