Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7525BF13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531236; cv=none; b=fgrmdGeoe/0oFZ8WubUEIsa6mtCPi371LphsGzbyivicpg/7LXdW5NnCBIoAvACGIbZPs1pTSLPyKBMGPiQs6jBnqhrovPX1vyPY6Ac2NQsEDpnXsYy1thi4fEtJVs1dOpdFliR7o0lv61kZDpMjAWOF6TbhGpFzoXe9HHZFSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531236; c=relaxed/simple;
	bh=q/mpY55LYhOrSZdROqLGJzI9wmZEA3eTN6b1pocVLYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bYb37f+/AXB+a9zGiQ+YGo91TMprbmmRhCKjg1kv2OAklkYIfrfNA+p8Qsys5lzCg/+jmj5u18pIfaQEVcdHExwfLCwhUHvNhsfiWFv/ip3iq8kt+K73xWogsQoE2C6sFsQEKAHdfcj56YbyjSnaEbMmalkThCdR3l0M2fNOqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mhrt+A1p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mhrt+A1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777531235; x=1809067235;
  h=date:from:to:cc:subject:message-id;
  bh=q/mpY55LYhOrSZdROqLGJzI9wmZEA3eTN6b1pocVLYE=;
  b=Mhrt+A1pyWcNfdMSNubN248M2Vs6nNotTa6B6Yfunc3HWC5zojqpohsG
   /A+Ru8zNM+9FFj5FztkgY7gWPhrbmo0vDOYUINN+BlXvFhvjYeVDrvEAx
   RlYBuOYKGkvML+xxsoevNqpDyH13A1tQTOv80I9cn0fWw6CS8jcsq5gfj
   xP17sOm4VZRn7jzyejZIsvoiQ7oZuwfW1/JMT7nh6SvN8BgVMGr2bZnoM
   c3ByLx/lNThzckBVasFkI73afTYHU9HU8SDnAqc6u+O3p+tB2JBoBtnk6
   WftYFcR2I3XBwhJrqETIcB/l/px96l30B8tIq7r1c+kwVud/EFX3MCFyh
   Q==;
X-CSE-ConnectionGUID: JCkCYW9jT/y9UQrQ/lEzvQ==
X-CSE-MsgGUID: INr65L7mSJCd5QS8dawPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78394353"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78394353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:40:35 -0700
X-CSE-ConnectionGUID: 70eKXWu+TgSTA8J7uVWiBw==
X-CSE-MsgGUID: sAoNw2/aQUSrvTjMPqsn9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="258075602"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2026 23:40:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIL4Y-000000004lN-3rZJ;
	Thu, 30 Apr 2026 06:40:30 +0000
Date: Thu, 30 Apr 2026 08:40:01 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:13:
 warning: the comparison will always evaluate as 'true' for the address of
 'cluster_id' will never be NULL
Message-ID: <202604300846.TBqGFPmG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Miri-Korenblit/wifi-mac80211-track-the-id-of-the-NAN-cluster-we-joined/20260430-070259
head:   e0435b199cd58dfc68f8fdfe1fe2bcec997c731c
commit: be631fda189889f9d902d39905c931f3a8364bf3 wifi: mac80211_hwsim: split NAN handling into separate file
date:   8 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260430/202604300846.TBqGFPmG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300846.TBqGFPmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300846.TBqGFPmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/virtual/mac80211_hwsim_nan.c: In function 'mac80211_hwsim_nan_start':
>> drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:13: warning: the comparison will always evaluate as 'true' for the address of 'cluster_id' will never be NULL [-Waddress]
      97 |         if (conf->cluster_id && !is_zero_ether_addr(conf->cluster_id) &&
         |             ^~~~
   In file included from include/net/mac80211.h:22,
                    from drivers/net/wireless/virtual/mac80211_hwsim_i.h:13,
                    from drivers/net/wireless/virtual/mac80211_hwsim_nan.c:7:
   include/net/cfg80211.h:4121:12: note: 'cluster_id' declared here
    4121 |         u8 cluster_id[ETH_ALEN] __aligned(2);
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
