Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE3D32E121
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782345; cv=none; b=CCwR+1P0vQAtwg/FLEUL37cNGhM8aTV0WMiySd9UOCYZWp0M68G3hPYvR4AMvLqGAskR4bKnMrFc1FiB+8sQGb2IsfexJqA6/YR5/YUVuPxZFO7vsz3MBz3mBKt7X7MiNAdicoGJQQ3EEqVjkS4Vln9ywAKxLHnPoe9vy6ZeUiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782345; c=relaxed/simple;
	bh=IM2nZ7zQ4298gW9D7AD3haHijxfacVLBAehseZj+zAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IIszNjDVnhW7/f1o2T8gs4KhH/t++s9Be/YTbFommpfO2Kngc8hPBdlUxVOxWMrJcDZSuO9sUgL6OYzsO9mKDCm6gSQZEWMYVWCIu/5pVUXfNeyKGQLffweAknJtKPB9rapIcqs8lDlswa9Q3xDvRnPpL6PCTrdrQ+oJVGKYoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fF07WNOs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fF07WNOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773782344; x=1805318344;
  h=date:from:to:cc:subject:message-id;
  bh=IM2nZ7zQ4298gW9D7AD3haHijxfacVLBAehseZj+zAI=;
  b=fF07WNOs3awbFjrMYUHLtPbggF8L3js2o+Bgay2cHXdvj21K5bUGvzmg
   ZwK4Wn27Oi3MzhkSxgVWCq7KtkUa61v/bKdt43ak66SUNHtqbC1L6L34T
   o3YoPIwnP3K6Vlt6laW2jreSif3GdMJSPVHXws9/Ccf26Q7cjLMqmJ9o6
   qctSI5QEZnch0IsPUSb3b4Qv4ub7hZd3Q97MZgggd0VvQZx6N+I1iLdzY
   G72+FNY0fEBTeEpOYLEFXyaZkZKi+6zs8JYZNDPYF4IWSgw/mCYdmPn/1
   lmUPiMKQHaC/x4hKI8SHwIVtW6DocENBfugU+FoqCVCuwU6btWsjP04bE
   w==;
X-CSE-ConnectionGUID: FunIrrLMQRinWPa3gWg7Jw==
X-CSE-MsgGUID: xGgilB42Smu6p8XfCG6mpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74529306"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74529306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:19:04 -0700
X-CSE-ConnectionGUID: 8FOcLOAQSL6/1Koc76Gz8w==
X-CSE-MsgGUID: Dr8jU56xRcKblg3zA62bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226538124"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 14:19:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2boZ-000000004WH-0Rdc;
	Tue, 17 Mar 2026 21:18:59 +0000
Date: Tue, 17 Mar 2026 22:18:04 +0100
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 16/57]
 drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:13: warning: the
 comparison will always evaluate as 'true' for the address of 'cluster_id'
 will never be NULL
Message-ID: <202603172200.lfgarRbI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   58d5be8674f5cfc433f052fc97babb86d56bea7b
commit: e1650f3f7a57295eb773434169d90fc5a87db97a [16/57] wifi: mac80211_hwsim: split NAN handling into separate file
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260317/202603172200.lfgarRbI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172200.lfgarRbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172200.lfgarRbI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/virtual/mac80211_hwsim_nan.c: In function 'mac80211_hwsim_nan_start':
>> drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:13: warning: the comparison will always evaluate as 'true' for the address of 'cluster_id' will never be NULL [-Waddress]
      97 |         if (conf->cluster_id && !is_zero_ether_addr(conf->cluster_id) &&
         |             ^~~~
   In file included from include/net/mac80211.h:22,
                    from drivers/net/wireless/virtual/mac80211_hwsim_i.h:13,
                    from drivers/net/wireless/virtual/mac80211_hwsim_nan.c:7:
   include/net/cfg80211.h:4118:12: note: 'cluster_id' declared here
    4118 |         u8 cluster_id[ETH_ALEN] __aligned(2);
         |            ^~~~~~~~~~


vim +97 drivers/net/wireless/virtual/mac80211_hwsim_nan.c

    68	
    69	int mac80211_hwsim_nan_start(struct ieee80211_hw *hw,
    70				     struct ieee80211_vif *vif,
    71				     struct cfg80211_nan_conf *conf)
    72	{
    73		struct mac80211_hwsim_data *data = hw->priv;
    74		u64 tsf = mac80211_hwsim_get_tsf(hw, NULL);
    75		u32 dw_int = 512 * 1000;
    76		u64 until_dw = dw_int - do_div(tsf, dw_int);
    77		struct wireless_dev *wdev = ieee80211_vif_to_wdev(vif);
    78	
    79		if (vif->type != NL80211_IFTYPE_NAN)
    80			return -EINVAL;
    81	
    82		if (data->nan.device_vif)
    83			return -EALREADY;
    84	
    85		/* set this before starting the timer, as preemption might occur */
    86		data->nan.device_vif = vif;
    87		data->nan.bands = conf->bands;
    88		data->nan.curr_dw_band = NL80211_BAND_2GHZ;
    89	
    90		wiphy_debug(hw->wiphy, "nan_started, next_dw=%llu\n",
    91			    until_dw);
    92	
    93		hrtimer_start(&data->nan.timer,
    94			      ns_to_ktime(until_dw * NSEC_PER_USEC),
    95			      HRTIMER_MODE_REL_SOFT);
    96	
  > 97		if (conf->cluster_id && !is_zero_ether_addr(conf->cluster_id) &&
    98		    is_zero_ether_addr(hwsim_nan_cluster_id)) {
    99			memcpy(hwsim_nan_cluster_id, conf->cluster_id, ETH_ALEN);
   100		} else if (is_zero_ether_addr(hwsim_nan_cluster_id)) {
   101			hwsim_nan_cluster_id[0] = 0x50;
   102			hwsim_nan_cluster_id[1] = 0x6f;
   103			hwsim_nan_cluster_id[2] = 0x9a;
   104			hwsim_nan_cluster_id[3] = 0x01;
   105			hwsim_nan_cluster_id[4] = get_random_u8();
   106			hwsim_nan_cluster_id[5] = get_random_u8();
   107		}
   108	
   109		data->nan.notify_dw = conf->enable_dw_notification;
   110	
   111		cfg80211_nan_cluster_joined(wdev, hwsim_nan_cluster_id, true,
   112					    GFP_KERNEL);
   113	
   114		return 0;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
