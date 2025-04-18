Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B16233145
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956596; cv=none; b=r7dteeBMWuohmBI9gBgbFtN2qJXwbX9lY6QkaqqOMfQXHn+oNKVDHJYCDtZ+W5+E0D3HEDpZRI1ImEn4qE/8Go/y52BIB4PxY3g1J38QV8UQh7TR3sUJS9NkVksDfnZzrtxjS0kDrx1iST0vZiktyQLJ/tW1qqcyvYUr51Zqv9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956596; c=relaxed/simple;
	bh=HvRnzlUGCE2VSxfG/xJJSlv2jBF2vF058knzZMtNMHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at5BAetZfBQL9wo0uNT8AsYK952ASfSHAcGcyxd77YlAhdrzzuRjqg1XzNFURRBdpGZDJJKdDy+8/fjfTuMFeTw20NPnucU3PK0AADuXF6lH2kuNzdYL+2MsQn6y3hqJd42YL5Bhda5yZbEk5SB71C9UM6vU6+bPUpBfqYQTZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8QSwSY5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8QSwSY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744956594; x=1776492594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvRnzlUGCE2VSxfG/xJJSlv2jBF2vF058knzZMtNMHM=;
  b=U8QSwSY5wR9neao0HW0eelgdfZdICSDLqrCbzGV1Spt+li8tQ2IYKSba
   3vP/xpQhrUT4dz0Fy8BPFgSeO3+0ZWuYsh2XCML4KKeDHqHvH1egf/Z70
   I5q+s8AAiRmrlZNM7gw0R6p2cRZJEPp2Ml0TOoQa/P6+SZZ8N85oqkigg
   ZmJdomMFni1Vg+kGjmB5G35J/NdjuT0cFa38hhrgKR5ttDBEo8R2OPMZk
   75uR/0Ml2+m8plQ7N5aK5UMqh9qrAeg9gA3vXNdWapVaDyed7qrjpnTDo
   adZ5/+L8/5FPH3cpTwNGOyUqDsdx3J5BKtqMqupyEWRX8hymPu22vRQlQ
   g==;
X-CSE-ConnectionGUID: 7NuYMKAlTK2FQtu/cmEJ2Q==
X-CSE-MsgGUID: i4ndS8OoQ2yZ23YuUDdOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57946300"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="57946300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 23:09:52 -0700
X-CSE-ConnectionGUID: N70wquwpRoiJA7miXL2EgQ==
X-CSE-MsgGUID: B82UQqIaT/6DSobJjCG3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="131018926"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2025 23:09:52 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5ev7-0002Yx-04;
	Fri, 18 Apr 2025 06:09:49 +0000
Date: Fri, 18 Apr 2025 14:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH ath-next v5 2/6] wifi: ath12k: correctly fetch arsta for
 MLO
Message-ID: <202504181412.uGSvIIlb-lkp@intel.com>
References: <20250417045709.770219-3-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417045709.770219-3-quic_sarishar@quicinc.com>

Hi Sarika,

kernel test robot noticed the following build errors:

[auto build test ERROR on b80c52642c1159c2596776b39b06eb1c2e36baff]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-ath12k-enable-wiphy-flag-for-MLO-station-statistics-support/20250417-130053
base:   b80c52642c1159c2596776b39b06eb1c2e36baff
patch link:    https://lore.kernel.org/r/20250417045709.770219-3-quic_sarishar%40quicinc.com
patch subject: [PATCH ath-next v5 2/6] wifi: ath12k: correctly fetch arsta for MLO
config: arm-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504181412.uGSvIIlb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181412.uGSvIIlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181412.uGSvIIlb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_op_sta_statistics':
>> drivers/net/wireless/ath/ath12k/mac.c:10506:21: error: 'struct station_info' has no member named 'link_id'
     int link_id = sinfo->link_id;
                        ^~
   drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_hw_register':
   drivers/net/wireless/ath/ath12k/mac.c:11472:18: error: 'WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS' undeclared (first use in this function); did you mean 'WIPHY_FLAG_SUPPORTS_NSTR_NONPRIMARY'?
     wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     WIPHY_FLAG_SUPPORTS_NSTR_NONPRIMARY
   drivers/net/wireless/ath/ath12k/mac.c:11472:18: note: each undeclared identifier is reported only once for each function it appears in


vim +10506 drivers/net/wireless/ath/ath12k/mac.c

 10497	
 10498	static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 10499						 struct ieee80211_vif *vif,
 10500						 struct ieee80211_sta *sta,
 10501						 struct station_info *sinfo)
 10502	{
 10503		struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
 10504		struct ath12k_fw_stats_req_params params = {};
 10505		struct ath12k_link_sta *arsta;
 10506		int link_id = sinfo->link_id;
 10507		struct ath12k *ar;
 10508		s8 signal;
 10509		bool db2dbm;
 10510	
 10511		lockdep_assert_wiphy(hw->wiphy);
 10512	
 10513		if (link_id < 0)
 10514			arsta = &ahsta->deflink;
 10515		else
 10516			arsta = wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
 10517	
 10518		if (!arsta)
 10519			return;
 10520	
 10521		ar = ath12k_get_ar_by_vif(hw, vif, arsta->link_id);
 10522		if (!ar)
 10523			return;
 10524	
 10525		db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
 10526				  ar->ab->wmi_ab.svc_map);
 10527	
 10528		sinfo->rx_duration = arsta->rx_duration;
 10529		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
 10530	
 10531		sinfo->tx_duration = arsta->tx_duration;
 10532		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
 10533	
 10534		if (arsta->txrate.legacy || arsta->txrate.nss) {
 10535			if (arsta->txrate.legacy) {
 10536				sinfo->txrate.legacy = arsta->txrate.legacy;
 10537			} else {
 10538				sinfo->txrate.mcs = arsta->txrate.mcs;
 10539				sinfo->txrate.nss = arsta->txrate.nss;
 10540				sinfo->txrate.bw = arsta->txrate.bw;
 10541				sinfo->txrate.he_gi = arsta->txrate.he_gi;
 10542				sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
 10543				sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
 10544				sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
 10545				sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
 10546			}
 10547			sinfo->txrate.flags = arsta->txrate.flags;
 10548			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 10549		}
 10550	
 10551		/* TODO: Use real NF instead of default one. */
 10552		signal = arsta->rssi_comb;
 10553	
 10554		params.pdev_id = ar->pdev->pdev_id;
 10555		params.vdev_id = 0;
 10556		params.stats_id = WMI_REQUEST_VDEV_STAT;
 10557	
 10558		if (!signal &&
 10559		    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
 10560		    !(ath12k_mac_get_fw_stats(ar, &params)))
 10561			signal = arsta->rssi_beacon;
 10562	
 10563		if (signal) {
 10564			sinfo->signal = db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;
 10565			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 10566		}
 10567	
 10568		sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
 10569	
 10570		if (!db2dbm)
 10571			sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
 10572	
 10573		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 10574	}
 10575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
