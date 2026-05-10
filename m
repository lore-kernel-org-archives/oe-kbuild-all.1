Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884939A808
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778423367; cv=none; b=b8qehVopYqdQ09lo2T+gdKLFcTHMhWQehJTYLv/acljtlX38f/5s1EMEOpO1JulnaDTiK9i99dusZjpSee2DIWOzd+p+cgqAmAP+iJBDL7mc1mYYyNj5NwyVWci6CJ/pszxTC/j3PW4CZeRjCx+ZnSoIagt5qb9yl5dmP1SYfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778423367; c=relaxed/simple;
	bh=vvvYukOE1oxeHM7fMnj35MpcGGJH42nSfJgBGkrtH24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m4J9LepciPrwrCzIGqfbECMP97PhDfaQOtMhWOJngRD+oBttRlTbeYVHhmfVVv8p5DFYOF0pRJoIuKnqKr6VaerJ3OXxgAqeJl8pFxlHWaLwE58+iF3q+vAXPBJS3Fg7sdYYnU3Q+2lSHVLroDRsOBL+Z19Q9m6MHHioVd9T8QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYhZ37vF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYhZ37vF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778423364; x=1809959364;
  h=date:from:to:cc:subject:message-id;
  bh=vvvYukOE1oxeHM7fMnj35MpcGGJH42nSfJgBGkrtH24=;
  b=QYhZ37vFUfwxAb4wHV9Mt5aqncqxkstO05x151ANZwu8Gii5JDDLFJ6a
   tevZvao9tt7JRgjVYohChDhvzwvmrbWfKu0ik18HCrCCBD6pCgXd3RN4p
   OEJJtd3d3zjw6szf7qZJOrAa4jaJxcvvSkUhuir2DmHFGqqYq1tUAy9II
   3FKpk6pDsPZITG4o9xI20rz/VO/ztiuJHFbLUieNHmLi7wuqZPHJw02u+
   /HsJRco2zXf7YE8tcHchrUitPwGNKVX8WrnuU2XOHIbsxFnUZYO9Pi/Wi
   +jLZWm64sK+o3mkySDC9t1tC5U4YL05ROb+GJiAfwoUakA7LlewsNEkuE
   A==;
X-CSE-ConnectionGUID: p8aotijYRBKklwHiRixIUQ==
X-CSE-MsgGUID: PxdZ8B9aRHKyryDj6MTQLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79315370"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79315370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 07:29:23 -0700
X-CSE-ConnectionGUID: 1EQiwlTkRNeiteGgl8SnIw==
X-CSE-MsgGUID: sCik3h0vQBOJrPjvqTVXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="230837533"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2026 07:29:22 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM59j-000000002Iz-2DQb;
	Sun, 10 May 2026 14:29:19 +0000
Date: Sun, 10 May 2026 22:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 33/45]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7752:27: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202605102234.yNbH4Qw6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   78cd847ab20728e707899cbb43a3eccce2686dfd
commit: ad6ef7b643345870e050a4e83c235cc8d19a6692 [33/45] [brcmfmac] Add support for 6G bands and HE
config: sparc-randconfig-r123-20260509 (https://download.01.org/0day-ci/archive/20260510/202605102234.yNbH4Qw6-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102234.yNbH4Qw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102234.yNbH4Qw6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7752:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data *data @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7752:27: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7752:27: sparse:     got struct ieee80211_sband_iftype_data *data

vim +7752 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  7640	
  7641	static void brcmf_update_he_cap(struct ieee80211_supported_band *band,
  7642					struct ieee80211_sband_iftype_data *data)
  7643	{
  7644		int idx = 1;
  7645		struct ieee80211_sta_he_cap *he_cap = &data->he_cap;
  7646		struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
  7647		struct ieee80211_he_mcs_nss_supp *he_mcs = &he_cap->he_mcs_nss_supp;
  7648		struct ieee80211_he_6ghz_capa *he_6ghz_capa = &data->he_6ghz_capa;
  7649	
  7650		if (!data) {
  7651			brcmf_err("failed to allocate sdata\n");
  7652			return;
  7653		}
  7654	
  7655		data->types_mask = BIT(NL80211_IFTYPE_STATION);
  7656		he_cap->has_he = true;
  7657	
  7658		/* HE MAC Capabilities Information */
  7659		he_cap_elem->mac_cap_info[0] = IEEE80211_HE_MAC_CAP0_HTC_HE |
  7660					       IEEE80211_HE_MAC_CAP0_TWT_REQ |
  7661					       IEEE80211_HE_MAC_CAP0_TWT_RES;
  7662	
  7663		he_cap_elem->mac_cap_info[1] =
  7664			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
  7665			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
  7666	
  7667		he_cap_elem->mac_cap_info[2] = IEEE80211_HE_MAC_CAP2_BSR |
  7668					       IEEE80211_HE_MAC_CAP2_BCAST_TWT;
  7669	
  7670		he_cap_elem->mac_cap_info[3] =
  7671			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
  7672			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_1 |
  7673			IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
  7674	
  7675		he_cap_elem->mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
  7676	
  7677		/* HE PHY Capabilities Information */
  7678		he_cap_elem->phy_cap_info[0] =
  7679			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
  7680			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
  7681			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
  7682		;
  7683	
  7684		he_cap_elem->phy_cap_info[1] =
  7685			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
  7686	
  7687		he_cap_elem->phy_cap_info[2] =
  7688			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
  7689			IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
  7690			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
  7691	
  7692		he_cap_elem->phy_cap_info[3] =
  7693			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
  7694			IEEE80211_HE_PHY_CAP3_DCM_MAX_TX_NSS_2 |
  7695			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
  7696			IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
  7697	
  7698		he_cap_elem->phy_cap_info[4] =
  7699			IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
  7700			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK |
  7701			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 |
  7702			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_8;
  7703	
  7704		he_cap_elem->phy_cap_info[5] =
  7705			IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
  7706			IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK |
  7707			IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_2;
  7708	
  7709		he_cap_elem->phy_cap_info[6] =
  7710			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
  7711			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
  7712			IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
  7713			IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
  7714			IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
  7715			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
  7716			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
  7717	
  7718		he_cap_elem->phy_cap_info[7] =
  7719			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
  7720			IEEE80211_HE_PHY_CAP7_MAX_NC_1;
  7721	
  7722		he_cap_elem->phy_cap_info[8] =
  7723			IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
  7724			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
  7725			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
  7726			IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
  7727	
  7728		he_cap_elem->phy_cap_info[9] =
  7729			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
  7730			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
  7731			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
  7732			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
  7733	
  7734		/* HE Supported MCS and NSS Set */
  7735		he_mcs->rx_mcs_80 = cpu_to_le16(0xfffa);
  7736		he_mcs->tx_mcs_80 = cpu_to_le16(0xfffa);
  7737		he_mcs->rx_mcs_160 = cpu_to_le16(0xfffa);
  7738		he_mcs->tx_mcs_160 = cpu_to_le16(0xfffa);
  7739		/* HE 6 GHz band capabilities */
  7740		if (band->band == NL80211_BAND_6GHZ) {
  7741			u16 capa = 0;
  7742	
  7743			capa = FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
  7744					  IEEE80211_HT_MPDU_DENSITY_8) |
  7745			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
  7746					  IEEE80211_VHT_MAX_AMPDU_1024K) |
  7747			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN,
  7748					  IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454);
  7749			he_6ghz_capa->capa = cpu_to_le16(capa);
  7750		}
  7751		band->n_iftype_data = idx;
> 7752		band->iftype_data = data;
  7753	}
  7754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
