Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3C268FD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744953953; cv=none; b=ZEQ+WZxfL1pJPDRtd2NHvxuX2V1X/5qEF3AswZg8VN2UUPJuILNcZodu23ioFhW7BLSyRPpYmgskDd4zxAhmEHgR9ohaYBnAraMIxwEOpuQO+N2Y2HidtVnB/uzrhKaGZsOqMHqK++OrJcQZy5T92wVpWMDNlB/CELFJtzuC938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744953953; c=relaxed/simple;
	bh=YmAdMH+jGV/6WdOakL9T9No9WdSR0CshftKXLVQ5SOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdrNbFveXSp0/miQhewGk1SS5f/6qcPIaaCoogKEl3Aw7fkX39GtHKQsV3u8t/WLllJQlTa8qfMkt8Q1pk8XpAT85Cd4B9GV0EzCwFMvI0RECvt2OHtuBYHMt61E2Cby7gNfYHrxBIiTHkXXwoW5yo6Kj+zgkNGLi5d+NlLc/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzdV8tD0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzdV8tD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744953952; x=1776489952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YmAdMH+jGV/6WdOakL9T9No9WdSR0CshftKXLVQ5SOQ=;
  b=dzdV8tD09TCdgK70yvcO+c45DBmT71a9TSXIILvSYNJ8xAY8tkRQPsCn
   sP/KscAo1C05rWrBWICAzsj07xQ5CZpcTY/M6383imqEhIVhKFOavSeXW
   cQVjK4yZ77M7u/DyHO9nmuYG/gEunjalYFzt0rHNZB9l6VTJRlu3L8wxI
   sEUsKyTJPoMpm0Go3Jl738I19s7HveA6D8GtV69r+4VooYJzG7iBY541I
   ayD1esM+sQXpeuS9XzHzRTO0ouE5s8QEqSVBx/dkKVHf61U3cThCDGGvk
   9vAKadnWzGjM8FN7Mcm2TNaAJNG/P4uVlYeEp5AkwLhuEJA5OdRKKiWtx
   g==;
X-CSE-ConnectionGUID: NOiKBOI5QqaflTItODIyyA==
X-CSE-MsgGUID: abJC8w5tQQ+f6Sms3VvlpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46698711"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="46698711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 22:25:48 -0700
X-CSE-ConnectionGUID: ez1ePDGcSEu0YBUPOHrk4g==
X-CSE-MsgGUID: W3bRbPNHRA6EVaPOg57pOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="131566219"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 22:25:46 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5eES-0002XL-2N;
	Fri, 18 Apr 2025 05:25:44 +0000
Date: Fri, 18 Apr 2025 13:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH ath-next v5 1/6] wifi: ath12k: enable wiphy flag for MLO
 station statistics support
Message-ID: <202504181305.OWdonKFO-lkp@intel.com>
References: <20250417045709.770219-2-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417045709.770219-2-quic_sarishar@quicinc.com>

Hi Sarika,

kernel test robot noticed the following build errors:

[auto build test ERROR on b80c52642c1159c2596776b39b06eb1c2e36baff]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-ath12k-enable-wiphy-flag-for-MLO-station-statistics-support/20250417-130053
base:   b80c52642c1159c2596776b39b06eb1c2e36baff
patch link:    https://lore.kernel.org/r/20250417045709.770219-2-quic_sarishar%40quicinc.com
patch subject: [PATCH ath-next v5 1/6] wifi: ath12k: enable wiphy flag for MLO station statistics support
config: arm-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504181305.OWdonKFO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181305.OWdonKFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181305.OWdonKFO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_hw_register':
>> drivers/net/wireless/ath/ath12k/mac.c:11464:18: error: 'WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS' undeclared (first use in this function); did you mean 'WIPHY_FLAG_SUPPORTS_NSTR_NONPRIMARY'?
     wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     WIPHY_FLAG_SUPPORTS_NSTR_NONPRIMARY
   drivers/net/wireless/ath/ath12k/mac.c:11464:18: note: each undeclared identifier is reported only once for each function it appears in


vim +11464 drivers/net/wireless/ath/ath12k/mac.c

 11315	
 11316	static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 11317	{
 11318		struct ieee80211_hw *hw = ah->hw;
 11319		struct wiphy *wiphy = hw->wiphy;
 11320		struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
 11321		struct ath12k_base *ab = ar->ab;
 11322		struct ath12k_pdev *pdev;
 11323		struct ath12k_pdev_cap *cap;
 11324		static const u32 cipher_suites[] = {
 11325			WLAN_CIPHER_SUITE_TKIP,
 11326			WLAN_CIPHER_SUITE_CCMP,
 11327			WLAN_CIPHER_SUITE_AES_CMAC,
 11328			WLAN_CIPHER_SUITE_BIP_CMAC_256,
 11329			WLAN_CIPHER_SUITE_BIP_GMAC_128,
 11330			WLAN_CIPHER_SUITE_BIP_GMAC_256,
 11331			WLAN_CIPHER_SUITE_GCMP,
 11332			WLAN_CIPHER_SUITE_GCMP_256,
 11333			WLAN_CIPHER_SUITE_CCMP_256,
 11334		};
 11335		int ret, i, j;
 11336		u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
 11337		bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
 11338		u8 *mac_addr = NULL;
 11339		u8 mbssid_max_interfaces = 0;
 11340	
 11341		wiphy->max_ap_assoc_sta = 0;
 11342	
 11343		for_each_ar(ah, ar, i) {
 11344			u32 ht_cap_info = 0;
 11345	
 11346			pdev = ar->pdev;
 11347			if (ar->ab->pdevs_macaddr_valid) {
 11348				ether_addr_copy(ar->mac_addr, pdev->mac_addr);
 11349			} else {
 11350				ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);
 11351				ar->mac_addr[4] += ar->pdev_idx;
 11352			}
 11353	
 11354			ret = ath12k_mac_setup_register(ar, &ht_cap_info, hw->wiphy->bands);
 11355			if (ret)
 11356				goto err_cleanup_unregister;
 11357	
 11358			/* 6 GHz does not support HT Cap, hence do not consider it */
 11359			if (!ar->supports_6ghz)
 11360				ht_cap &= ht_cap_info;
 11361	
 11362			wiphy->max_ap_assoc_sta += ar->max_num_stations;
 11363	
 11364			/* Advertise the max antenna support of all radios, driver can handle
 11365			 * per pdev specific antenna setting based on pdev cap when antenna
 11366			 * changes are made
 11367			 */
 11368			cap = &pdev->cap;
 11369	
 11370			antennas_rx = max_t(u32, antennas_rx, cap->rx_chain_mask);
 11371			antennas_tx = max_t(u32, antennas_tx, cap->tx_chain_mask);
 11372	
 11373			if (ar->supports_6ghz)
 11374				is_6ghz = true;
 11375	
 11376			if (test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags))
 11377				is_raw_mode = true;
 11378	
 11379			if (!ar->ab->hw_params->supports_monitor)
 11380				is_monitor_disable = true;
 11381	
 11382			if (i == 0)
 11383				mac_addr = ar->mac_addr;
 11384			else
 11385				mac_addr = ab->mac_addr;
 11386	
 11387			mbssid_max_interfaces += TARGET_NUM_VDEVS;
 11388		}
 11389	
 11390		wiphy->available_antennas_rx = antennas_rx;
 11391		wiphy->available_antennas_tx = antennas_tx;
 11392	
 11393		SET_IEEE80211_PERM_ADDR(hw, mac_addr);
 11394		SET_IEEE80211_DEV(hw, ab->dev);
 11395	
 11396		ret = ath12k_mac_setup_iface_combinations(ah);
 11397		if (ret) {
 11398			ath12k_err(ab, "failed to setup interface combinations: %d\n", ret);
 11399			goto err_complete_cleanup_unregister;
 11400		}
 11401	
 11402		wiphy->interface_modes = ath12k_mac_get_ifmodes(ah);
 11403	
 11404		if (ah->num_radio == 1 &&
 11405		    wiphy->bands[NL80211_BAND_2GHZ] &&
 11406		    wiphy->bands[NL80211_BAND_5GHZ] &&
 11407		    wiphy->bands[NL80211_BAND_6GHZ])
 11408			ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 11409	
 11410		ieee80211_hw_set(hw, SIGNAL_DBM);
 11411		ieee80211_hw_set(hw, SUPPORTS_PS);
 11412		ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 11413		ieee80211_hw_set(hw, MFP_CAPABLE);
 11414		ieee80211_hw_set(hw, REPORTS_TX_ACK_STATUS);
 11415		ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 11416		ieee80211_hw_set(hw, AP_LINK_PS);
 11417		ieee80211_hw_set(hw, SPECTRUM_MGMT);
 11418		ieee80211_hw_set(hw, CONNECTION_MONITOR);
 11419		ieee80211_hw_set(hw, SUPPORTS_PER_STA_GTK);
 11420		ieee80211_hw_set(hw, CHANCTX_STA_CSA);
 11421		ieee80211_hw_set(hw, QUEUE_CONTROL);
 11422		ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 11423		ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 11424		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 11425	
 11426		if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
 11427			ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 11428			ieee80211_hw_set(hw, TX_AMPDU_SETUP_IN_HW);
 11429			ieee80211_hw_set(hw, SUPPORTS_REORDERING_BUFFER);
 11430			ieee80211_hw_set(hw, SUPPORTS_AMSDU_IN_AMPDU);
 11431			ieee80211_hw_set(hw, USES_RSS);
 11432		}
 11433	
 11434		wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
 11435		wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
 11436	
 11437		/* TODO: Check if HT capability advertised from firmware is different
 11438		 * for each band for a dual band capable radio. It will be tricky to
 11439		 * handle it when the ht capability different for each band.
 11440		 */
 11441		if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
 11442		    (is_6ghz && ab->hw_params->supports_dynamic_smps_6ghz))
 11443			wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
 11444	
 11445		wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
 11446		wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
 11447	
 11448		hw->max_listen_interval = ATH12K_MAX_HW_LISTEN_INTERVAL;
 11449	
 11450		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 11451		wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 11452		wiphy->max_remain_on_channel_duration = 5000;
 11453	
 11454		wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
 11455		wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
 11456					   NL80211_FEATURE_AP_SCAN;
 11457	
 11458		/* MLO is not yet supported so disable Wireless Extensions for now
 11459		 * to make sure ath12k users don't use it. This flag can be removed
 11460		 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.
 11461		 */
 11462		wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
 11463	
 11464		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS;
 11465	
 11466		/* Copy over MLO related capabilities received from
 11467		 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
 11468		 */
 11469		if (ab->ag->mlo_capable) {
 11470			ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
 11471			ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
 11472			wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 11473	
 11474			ieee80211_hw_set(hw, MLO_MCAST_MULTI_LINK_TX);
 11475		}
 11476	
 11477		hw->queues = ATH12K_HW_MAX_QUEUES;
 11478		wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
 11479		hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
 11480		hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
 11481	
 11482		hw->vif_data_size = sizeof(struct ath12k_vif);
 11483		hw->sta_data_size = sizeof(struct ath12k_sta);
 11484		hw->extra_tx_headroom = ab->hw_params->iova_mask;
 11485	
 11486		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 11487		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 11488	
 11489		wiphy->cipher_suites = cipher_suites;
 11490		wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
 11491	
 11492		wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
 11493		wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
 11494	
 11495		wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 11496		wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
 11497	
 11498		if (is_6ghz) {
 11499			wiphy_ext_feature_set(wiphy,
 11500					      NL80211_EXT_FEATURE_FILS_DISCOVERY);
 11501			wiphy_ext_feature_set(wiphy,
 11502					      NL80211_EXT_FEATURE_UNSOL_BCAST_PROBE_RESP);
 11503		}
 11504	
 11505		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
 11506	
 11507		ath12k_reg_init(hw);
 11508	
 11509		if (!is_raw_mode) {
 11510			hw->netdev_features = NETIF_F_HW_CSUM;
 11511			ieee80211_hw_set(hw, SW_CRYPTO_CONTROL);
 11512			ieee80211_hw_set(hw, SUPPORT_FAST_XMIT);
 11513		}
 11514	
 11515		if (test_bit(WMI_TLV_SERVICE_NLO, ar->wmi->wmi_ab->svc_map)) {
 11516			wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
 11517			wiphy->max_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
 11518			wiphy->max_sched_scan_ie_len = WMI_PNO_MAX_IE_LENGTH;
 11519			wiphy->max_sched_scan_plans = WMI_PNO_MAX_SCHED_SCAN_PLANS;
 11520			wiphy->max_sched_scan_plan_interval =
 11521						WMI_PNO_MAX_SCHED_SCAN_PLAN_INT;
 11522			wiphy->max_sched_scan_plan_iterations =
 11523						WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS;
 11524			wiphy->features |= NL80211_FEATURE_ND_RANDOM_MAC_ADDR;
 11525		}
 11526	
 11527		ret = ath12k_wow_init(ar);
 11528		if (ret) {
 11529			ath12k_warn(ar->ab, "failed to init wow: %d\n", ret);
 11530			goto err_cleanup_if_combs;
 11531		}
 11532	
 11533		ret = ieee80211_register_hw(hw);
 11534		if (ret) {
 11535			ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
 11536			goto err_cleanup_if_combs;
 11537		}
 11538	
 11539		if (is_monitor_disable)
 11540			/* There's a race between calling ieee80211_register_hw()
 11541			 * and here where the monitor mode is enabled for a little
 11542			 * while. But that time is so short and in practise it make
 11543			 * a difference in real life.
 11544			 */
 11545			wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
 11546	
 11547		for_each_ar(ah, ar, i) {
 11548			/* Apply the regd received during initialization */
 11549			ret = ath12k_regd_update(ar, true);
 11550			if (ret) {
 11551				ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
 11552				goto err_unregister_hw;
 11553			}
 11554	
 11555			ath12k_fw_stats_init(ar);
 11556			ath12k_debugfs_register(ar);
 11557		}
 11558	
 11559		return 0;
 11560	
 11561	err_unregister_hw:
 11562		for_each_ar(ah, ar, i)
 11563			ath12k_debugfs_unregister(ar);
 11564	
 11565		ieee80211_unregister_hw(hw);
 11566	
 11567	err_cleanup_if_combs:
 11568		ath12k_mac_cleanup_iface_combinations(ah);
 11569	
 11570	err_complete_cleanup_unregister:
 11571		i = ah->num_radio;
 11572	
 11573	err_cleanup_unregister:
 11574		for (j = 0; j < i; j++) {
 11575			ar = ath12k_ah_to_ar(ah, j);
 11576			ath12k_mac_cleanup_unregister(ar);
 11577		}
 11578	
 11579		SET_IEEE80211_DEV(hw, NULL);
 11580	
 11581		return ret;
 11582	}
 11583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
