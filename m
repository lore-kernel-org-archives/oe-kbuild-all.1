Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BF6156CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693321685; x=1724857685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BO1EXov5sqD9uUDRplSC4VX3VdKDGT4aoOFlEvLvLzk=;
  b=T3RjMp3svy6Nb30ZeLlFHUg5cFPdv0nHUuP8oyQDl+eBtAzAHCNSU64v
   l9ao6KIYnHa3oDszYZHVS3nn5bv/PGimU5i0Tjd14aur1XGqk30LbPHDc
   IJHt4u9wRKtCSuRw1UvnMsxXfm5G8s4SMuVLxFRJ4Ichbf+NVmvKplSkM
   bcDeNnqjyMXMxSXo8yBR2aWudNRYyn+9DuApb+7qUEuYwibnoLYr+Uuv0
   ITR/LFJImUan0gpzPV+kLOxZ2j6thrj56EvWYfrZzMJiFL0WZYUS523FA
   dMtv/CBk/3sbC/kKeIQNOwHZ9RQy9zghhPAvAWxidNAO2UMdcVwcXZf2S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461756210"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="461756210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 08:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862271074"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="862271074"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 08:03:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb0FY-0008pb-1c;
	Tue, 29 Aug 2023 15:03:28 +0000
Date: Tue, 29 Aug 2023 23:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 18/33]
 drivers/net/wireless/ath/ath11k/mac.c:5896:35: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202308292258.FxyKfz4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   c3a2e3fb72587efd909104792b284f69e1356b79
commit: bee2e4d5f0125728a96fcc2870acb3bd00e88cb9 [18/33] wifi: cfg80211: annotate iftype_data pointer with sparse
config: i386-randconfig-063-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292258.FxyKfz4C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292258.FxyKfz4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292258.FxyKfz4C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/mac.c:5896:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data * @@
   drivers/net/wireless/ath/ath11k/mac.c:5896:35: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/ath/ath11k/mac.c:5896:35: sparse:     got struct ieee80211_sband_iftype_data *
   drivers/net/wireless/ath/ath11k/mac.c:5905:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data * @@
   drivers/net/wireless/ath/ath11k/mac.c:5905:35: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/ath/ath11k/mac.c:5905:35: sparse:     got struct ieee80211_sband_iftype_data *
   drivers/net/wireless/ath/ath11k/mac.c:5915:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data @@     got struct ieee80211_sband_iftype_data * @@
   drivers/net/wireless/ath/ath11k/mac.c:5915:35: sparse:     expected struct ieee80211_sband_iftype_data const [noderef] __iftype_data *iftype_data
   drivers/net/wireless/ath/ath11k/mac.c:5915:35: sparse:     got struct ieee80211_sband_iftype_data *
>> drivers/net/wireless/ath/ath11k/mac.c:7949:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ieee80211_sta_he_cap const *he_cap @@     got struct ieee80211_sta_he_cap const [noderef] __iftype_data * @@
   drivers/net/wireless/ath/ath11k/mac.c:7949:22: sparse:     expected struct ieee80211_sta_he_cap const *he_cap
   drivers/net/wireless/ath/ath11k/mac.c:7949:22: sparse:     got struct ieee80211_sta_he_cap const [noderef] __iftype_data *

vim +5896 drivers/net/wireless/ath/ath11k/mac.c

9f056ed8ee01ad John Crispin           2019-11-25  5884  
9f056ed8ee01ad John Crispin           2019-11-25  5885  static void ath11k_mac_setup_he_cap(struct ath11k *ar,
9f056ed8ee01ad John Crispin           2019-11-25  5886  				    struct ath11k_pdev_cap *cap)
9f056ed8ee01ad John Crispin           2019-11-25  5887  {
3b4516838eaaba Colin Ian King         2020-01-11  5888  	struct ieee80211_supported_band *band;
3b4516838eaaba Colin Ian King         2020-01-11  5889  	int count;
9f056ed8ee01ad John Crispin           2019-11-25  5890  
9f056ed8ee01ad John Crispin           2019-11-25  5891  	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
9f056ed8ee01ad John Crispin           2019-11-25  5892  		count = ath11k_mac_copy_he_cap(ar, cap,
9f056ed8ee01ad John Crispin           2019-11-25  5893  					       ar->mac.iftype[NL80211_BAND_2GHZ],
9f056ed8ee01ad John Crispin           2019-11-25  5894  					       NL80211_BAND_2GHZ);
9f056ed8ee01ad John Crispin           2019-11-25  5895  		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
9f056ed8ee01ad John Crispin           2019-11-25 @5896  		band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
3b4516838eaaba Colin Ian King         2020-01-11  5897  		band->n_iftype_data = count;
9f056ed8ee01ad John Crispin           2019-11-25  5898  	}
9f056ed8ee01ad John Crispin           2019-11-25  5899  
9f056ed8ee01ad John Crispin           2019-11-25  5900  	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
9f056ed8ee01ad John Crispin           2019-11-25  5901  		count = ath11k_mac_copy_he_cap(ar, cap,
9f056ed8ee01ad John Crispin           2019-11-25  5902  					       ar->mac.iftype[NL80211_BAND_5GHZ],
9f056ed8ee01ad John Crispin           2019-11-25  5903  					       NL80211_BAND_5GHZ);
9f056ed8ee01ad John Crispin           2019-11-25  5904  		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
9f056ed8ee01ad John Crispin           2019-11-25  5905  		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
9f056ed8ee01ad John Crispin           2019-11-25  5906  		band->n_iftype_data = count;
9f056ed8ee01ad John Crispin           2019-11-25  5907  	}
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5908  
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5909  	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5910  	    ar->supports_6ghz) {
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5911  		count = ath11k_mac_copy_he_cap(ar, cap,
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5912  					       ar->mac.iftype[NL80211_BAND_6GHZ],
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5913  					       NL80211_BAND_6GHZ);
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5914  		band = &ar->mac.sbands[NL80211_BAND_6GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5915  		band->iftype_data = ar->mac.iftype[NL80211_BAND_6GHZ];
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5916  		band->n_iftype_data = count;
22eeadcdeab63e Pradeep Kumar Chitrapu 2020-06-09  5917  	}
3b4516838eaaba Colin Ian King         2020-01-11  5918  }
9f056ed8ee01ad John Crispin           2019-11-25  5919  

:::::: The code at line 5896 was first introduced by commit
:::::: 9f056ed8ee01ad6898db49707cdc70ce923be3d0 ath11k: add HE support

:::::: TO: John Crispin <john@phrozen.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
