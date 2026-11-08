Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104639;
	b=f8DQ3RTAW1ZdGSSsJjzTm2IpSyAO4qBJENug5BGRnK9CG3aRdcHR+JVrLXIQWeUnRgRn
	 ShyCWFTjO6Zm3Fzj9bcaT4qtl0RTr7ds1hjxLdWax8z2JI1sIlShJbFLz7+LZdirTqc8W
	 MRWXjZgujwXenyOQ2aQmLsgkJpkqMhhdMQQcK+f1dPO7rDPKc/FwuIzgqHofJqUXlFw0z
	 k3wkIRv2/8TIVmC0z3/B5jREv0+cNGEw+y/XJi+27JRpYisV8NCFTM4ubzmH1Nh6JkSA1
	 Ryf8jtsBRPBZQVdPwyTk4nni0EtdRzUhKZsMdviemu7+ebv8LCPWWsHR7DiO0joTG8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104639;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=L3kZXHEND1dKGiG1g1S04TfEIlnHJk4O8LZLZdLGs1o=;
	b=rzQsZR2TqQfsaMtSYzri9J7EXMBODRF6TPq+BwQ+HjijVQpOxSZe2u36xDrsnrQfnxi+
	 MlFntY4LHtSDgzvjeKvQ8SCxgO//fK/4XcKHk7AFjVflmm99IOg6Mpni5hPoAA3sK7uIJ
	 0Fvo03SjmXCjaMJOjg61bZCv/PHIHWd9melgIM7qBur2T1+wT4mrXv5fCvsIxy4MIiB7P
	 +Tks12qveE4M6fhAZSTonowQxVnGdA1KsVUpc3tM+4jWKKPXCpvw8n2BcFgnh3F+Dyx2a
	 NOh3Gebw0peELd0QBcW51s0C5WGPrr86Ty3Wf9+SbKUaQeWXDsJTEtIWfpDWMeKnirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWtJP+Lv;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3242606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 02:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3242606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWtJP+Lv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794104637; x=1825640637;
  h=date:from:to:cc:subject:message-id;
  bh=CQ60z8QCAtUk6a0DEUM0j5yPGARUQhSkhINZrcQlkeE=;
  b=LWtJP+Lvu/p2u3gOtHGi4/84dF1Ve3PZZtCFRKwcRoAGpnJVb/qU6x5i
   XYYcydWfcwboKeHjBp35NHge6YdHYMn88aINQWkfqrZDmvpZixr90HldO
   TB7Ps7dbok5MMCN3bGYdnE4yUmSAz9iBXAiRuwPuq5e7JZcqDa3snQWxN
   7FDd+IVv2wHMPLK5koP5zHMDK/OdHxxx8YUrODgYwkQIGJFqjmFtMf9EQ
   ToGZgQlhiKYjNJuEiGtEob4Uc858q+lwNCoIod9I4QiitLJ+4thlQKjJT
   4Orw2IjBmOLKku3fvbwT0uTShDq0AIDq7HcDWRwaLHHhPxsMIby35dsBI
   g==;
X-CSE-ConnectionGUID: gH5whMv4Q86JGfF+b7S3jw==
X-CSE-MsgGUID: LDhN4dpAT6qd+0wXSvVGGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2901729"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2901729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 18:23:57 -0800
X-CSE-ConnectionGUID: JNweToquTB6otXbrPyVRZQ==
X-CSE-MsgGUID: Y3Sc//k3RQGmkwnTDQ7Y9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7448230"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 18:23:55 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPsZU-00000000AxL-3oZR;
	Sun, 08 Nov 2026 02:23:52 +0000
Date: Sun, 08 Nov 2026 03:23:01 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 33/46]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7776:27: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202611080303.F1hskA0d-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   1ec4ed7d219b763623bcdb0858f273dd2135782d
commit: a5febed217cee3613ee7a35d9b65bda57796eea3 [33/46] [brcmfmac] Add support for 6G bands and HE
config: hexagon-randconfig-r2307-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080303.F1hskA0d-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080303.F1hskA0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080303.F1hskA0d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7776:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data *data @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7776:27: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7776:27: sparse:     got struct ieee80211_sband_iftype_data *data

vim +7776 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  7664	
  7665	static void brcmf_update_he_cap(struct ieee80211_supported_band *band,
  7666					struct ieee80211_sband_iftype_data *data)
  7667	{
  7668		int idx = 1;
  7669		struct ieee80211_sta_he_cap *he_cap = &data->he_cap;
  7670		struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
  7671		struct ieee80211_he_mcs_nss_supp *he_mcs = &he_cap->he_mcs_nss_supp;
  7672		struct ieee80211_he_6ghz_capa *he_6ghz_capa = &data->he_6ghz_capa;
  7673	
  7674		if (!data) {
  7675			brcmf_err("failed to allocate sdata\n");
  7676			return;
  7677		}
  7678	
  7679		data->types_mask = BIT(NL80211_IFTYPE_STATION);
  7680		he_cap->has_he = true;
  7681	
  7682		/* HE MAC Capabilities Information */
  7683		he_cap_elem->mac_cap_info[0] = IEEE80211_HE_MAC_CAP0_HTC_HE |
  7684					       IEEE80211_HE_MAC_CAP0_TWT_REQ |
  7685					       IEEE80211_HE_MAC_CAP0_TWT_RES;
  7686	
  7687		he_cap_elem->mac_cap_info[1] =
  7688			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_8US |
  7689			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
  7690	
  7691		he_cap_elem->mac_cap_info[2] = IEEE80211_HE_MAC_CAP2_BSR |
  7692					       IEEE80211_HE_MAC_CAP2_BCAST_TWT;
  7693	
  7694		he_cap_elem->mac_cap_info[3] =
  7695			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
  7696			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_1 |
  7697			IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
  7698	
  7699		he_cap_elem->mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
  7700	
  7701		/* HE PHY Capabilities Information */
  7702		he_cap_elem->phy_cap_info[0] =
  7703			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
  7704			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
  7705			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
  7706		;
  7707	
  7708		he_cap_elem->phy_cap_info[1] =
  7709			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
  7710	
  7711		he_cap_elem->phy_cap_info[2] =
  7712			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
  7713			IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
  7714			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
  7715	
  7716		he_cap_elem->phy_cap_info[3] =
  7717			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
  7718			IEEE80211_HE_PHY_CAP3_DCM_MAX_TX_NSS_2 |
  7719			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
  7720			IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
  7721	
  7722		he_cap_elem->phy_cap_info[4] =
  7723			IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
  7724			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK |
  7725			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4 |
  7726			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_8;
  7727	
  7728		he_cap_elem->phy_cap_info[5] =
  7729			IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
  7730			IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK |
  7731			IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_2;
  7732	
  7733		he_cap_elem->phy_cap_info[6] =
  7734			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
  7735			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
  7736			IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
  7737			IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
  7738			IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
  7739			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
  7740			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
  7741	
  7742		he_cap_elem->phy_cap_info[7] =
  7743			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
  7744			IEEE80211_HE_PHY_CAP7_MAX_NC_1;
  7745	
  7746		he_cap_elem->phy_cap_info[8] =
  7747			IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
  7748			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
  7749			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
  7750			IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
  7751	
  7752		he_cap_elem->phy_cap_info[9] =
  7753			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
  7754			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
  7755			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
  7756			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
  7757	
  7758		/* HE Supported MCS and NSS Set */
  7759		he_mcs->rx_mcs_80 = cpu_to_le16(0xfffa);
  7760		he_mcs->tx_mcs_80 = cpu_to_le16(0xfffa);
  7761		he_mcs->rx_mcs_160 = cpu_to_le16(0xfffa);
  7762		he_mcs->tx_mcs_160 = cpu_to_le16(0xfffa);
  7763		/* HE 6 GHz band capabilities */
  7764		if (band->band == NL80211_BAND_6GHZ) {
  7765			u16 capa = 0;
  7766	
  7767			capa = FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
  7768					  IEEE80211_HT_MPDU_DENSITY_8) |
  7769			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
  7770					  IEEE80211_VHT_MAX_AMPDU_1024K) |
  7771			       FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN,
  7772					  IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454);
  7773			he_6ghz_capa->capa = cpu_to_le16(capa);
  7774		}
  7775		band->n_iftype_data = idx;
> 7776		band->iftype_data = data;
  7777	}
  7778	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
