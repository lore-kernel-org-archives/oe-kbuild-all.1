Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53692405C4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897354; cv=none; b=XhdQ/j3MN21VKDhgWqBHGowcDhJjdivzk6fj7oDPnX9j7Sw3GI8DuWo/PpzQEQZ9Uogs8Utht1Lti782wT8n/qlCJikRKNE9ZyDm2jVUlkBqdBPIFfzqmii6jBtfjLUzeXki9KLfLqWPTDhjSjn+fh6K7WZIygIC3897+Mfla4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897354; c=relaxed/simple;
	bh=q55exQ4wO5pUU2Op0MHAwUXZr45zUzMx2fd6Fxk99R0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iJkiMq16Uj7UD+IXTyEd0YrnPHSFVGVTcQnQ5u9GncQ0pt1745eSBxknpA2SRsrft6ulTCehZ7zRZeRA1zZR5ZmeaaOwb8dViQ/PD/BNA0pfLjhGR8ZEYAJdK0iqjZnXjtK1zcgzrCIxEBHSz41c3oaMCqnoHdPpFtwRBLc7zNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsIphZ8T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsIphZ8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778897352; x=1810433352;
  h=date:from:to:cc:subject:message-id;
  bh=q55exQ4wO5pUU2Op0MHAwUXZr45zUzMx2fd6Fxk99R0=;
  b=WsIphZ8TKxlRWhF7HhKrHX9GnqXjDMGlJnCokT8BOyZNitKhW52NG3r1
   6vs6oXTvsvThFC5jC5U2pO9dOuE9jm4wKWu9GKU6k1CEmBYhmysctao0l
   timLvP8t7V7LgI9x7eHBMEaAgDRLjaW+4iTXTyf30d7OlYdwZan60pYUc
   ppc5IGV9NqdOaMAtj5beCMombz0nCJD6Gwt57CZ5DnFiXvLlDl/D94v+R
   BlJgxEh2jMyP83kbzwy9fwm/Rv+O0l3TIAQR3qaS+TABetDuyKTHOPp4G
   daVFQV5Msx67nwVHh8Q2v+PA5t8qyczbHGDQ4yIjdCf8aM24qDKRNreog
   Q==;
X-CSE-ConnectionGUID: dp+aTU0oRz6T9FapWxhmIw==
X-CSE-MsgGUID: P5pEue3LSLeCa0Vuv27A2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97283244"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97283244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:09:10 -0700
X-CSE-ConnectionGUID: ZyrRryc+TRCS3L0ma7122w==
X-CSE-MsgGUID: VXmaBpyPRxCpNRU3KxW58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="240687790"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 19:09:08 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO4Sg-000000000Mb-1O3C;
	Sat, 16 May 2026 02:09:06 +0000
Date: Sat, 16 May 2026 10:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 net/wireless/nl80211.c:12933:3: warning: 'memcpy' specified bound
 18446744073709551615 exceeds maximum object size 9223372036854775807
Message-ID: <202605160901.3bjBgaPI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b5816a1652ad494d4af974f0000657b686bd683c
commit: d673099085ddf1c28a6c0c1a245480919b5fe9e5 [1/1] wifi: cfg80211: fix CQM for non-range use
config: arm64-randconfig-003-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160901.3bjBgaPI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160901.3bjBgaPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160901.3bjBgaPI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'nl80211_set_cqm_rssi',
       inlined from 'nl80211_set_cqm' at net/wireless/nl80211.c:12994:10:
>> net/wireless/nl80211.c:12933:3: warning: 'memcpy' specified bound 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
   12933 |   memcpy(cqm_config->rssi_thresholds, thresholds,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12934 |          flex_array_size(cqm_config, rssi_thresholds,
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12935 |            n_thresholds));
         |            ~~~~~~~~~~~~~~


vim +/memcpy +12933 net/wireless/nl80211.c

4a4b8169501b18 Andrew Zaborowski 2017-02-10  12877  
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12878  static int nl80211_set_cqm_rssi(struct genl_info *info,
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12879  				const s32 *thresholds, int n_thresholds,
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12880  				u32 hysteresis)
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12881  {
4c476991062a0a Johannes Berg     2010-10-04  12882  	struct cfg80211_registered_device *rdev = info->user_ptr[0];
37c20b2effe987 Johannes Berg     2023-08-16  12883  	struct cfg80211_cqm_config *cqm_config = NULL, *old;
4c476991062a0a Johannes Berg     2010-10-04  12884  	struct net_device *dev = info->user_ptr[1];
1da5fcc86d7104 Johannes Berg     2013-08-06  12885  	struct wireless_dev *wdev = dev->ieee80211_ptr;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12886  	int i, err;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12887  	s32 prev = S32_MIN;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12888  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12889  	/* Check all values negative and sorted */
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12890  	for (i = 0; i < n_thresholds; i++) {
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12891  		if (thresholds[i] > 0 || thresholds[i] <= prev)
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12892  			return -EINVAL;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12893  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12894  		prev = thresholds[i];
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12895  	}
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12896  
074ac8df9f93f2 Johannes Berg     2010-09-16  12897  	if (wdev->iftype != NL80211_IFTYPE_STATION &&
4c476991062a0a Johannes Berg     2010-10-04  12898  	    wdev->iftype != NL80211_IFTYPE_P2P_CLIENT)
4c476991062a0a Johannes Berg     2010-10-04  12899  		return -EOPNOTSUPP;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12900  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12901  	if (n_thresholds == 1 && thresholds[0] == 0) /* Disabling */
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12902  		n_thresholds = 0;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12903  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12904  	wdev_lock(wdev);
37c20b2effe987 Johannes Berg     2023-08-16  12905  	old = rcu_dereference_protected(wdev->cqm_config,
37c20b2effe987 Johannes Berg     2023-08-16  12906  					lockdep_is_held(&wdev->mtx));
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12907  
d673099085ddf1 Johannes Berg     2023-12-16  12908  	/* if already disabled just succeed */
d673099085ddf1 Johannes Berg     2023-12-16  12909  	if (!n_thresholds && !old)
d673099085ddf1 Johannes Berg     2023-12-16  12910  		return 0;
d673099085ddf1 Johannes Berg     2023-12-16  12911  
d673099085ddf1 Johannes Berg     2023-12-16  12912  	if (n_thresholds > 1) {
d673099085ddf1 Johannes Berg     2023-12-16  12913  		if (!wiphy_ext_feature_isset(&rdev->wiphy,
d673099085ddf1 Johannes Berg     2023-12-16  12914  					     NL80211_EXT_FEATURE_CQM_RSSI_LIST) ||
d673099085ddf1 Johannes Berg     2023-12-16  12915  		    !rdev->ops->set_cqm_rssi_range_config)
d673099085ddf1 Johannes Berg     2023-12-16  12916  			return -EOPNOTSUPP;
d673099085ddf1 Johannes Berg     2023-12-16  12917  	} else {
d673099085ddf1 Johannes Berg     2023-12-16  12918  		if (!rdev->ops->set_cqm_rssi_config)
d673099085ddf1 Johannes Berg     2023-12-16  12919  			return -EOPNOTSUPP;
d673099085ddf1 Johannes Berg     2023-12-16  12920  	}
d673099085ddf1 Johannes Berg     2023-12-16  12921  
37c20b2effe987 Johannes Berg     2023-08-16  12922  	if (n_thresholds) {
40f231e75a1d98 Len Baker         2021-09-19  12923  		cqm_config = kzalloc(struct_size(cqm_config, rssi_thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12924  						 n_thresholds),
40f231e75a1d98 Len Baker         2021-09-19  12925  				     GFP_KERNEL);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12926  		if (!cqm_config) {
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12927  			err = -ENOMEM;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12928  			goto unlock;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12929  		}
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12930  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12931  		cqm_config->rssi_hyst = hysteresis;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12932  		cqm_config->n_rssi_thresholds = n_thresholds;
4a4b8169501b18 Andrew Zaborowski 2017-02-10 @12933  		memcpy(cqm_config->rssi_thresholds, thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12934  		       flex_array_size(cqm_config, rssi_thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12935  				       n_thresholds));
d673099085ddf1 Johannes Berg     2023-12-16  12936  		cqm_config->use_range_api = n_thresholds > 1 ||
d673099085ddf1 Johannes Berg     2023-12-16  12937  					    !rdev->ops->set_cqm_rssi_config;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12938  
37c20b2effe987 Johannes Berg     2023-08-16  12939  		rcu_assign_pointer(wdev->cqm_config, cqm_config);
d673099085ddf1 Johannes Berg     2023-12-16  12940  
d673099085ddf1 Johannes Berg     2023-12-16  12941  		if (cqm_config->use_range_api)
d673099085ddf1 Johannes Berg     2023-12-16  12942  			err = cfg80211_cqm_rssi_update(rdev, dev, cqm_config);
d673099085ddf1 Johannes Berg     2023-12-16  12943  		else
d673099085ddf1 Johannes Berg     2023-12-16  12944  			err = rdev_set_cqm_rssi_config(rdev, dev,
d673099085ddf1 Johannes Berg     2023-12-16  12945  						       thresholds[0],
d673099085ddf1 Johannes Berg     2023-12-16  12946  						       hysteresis);
37c20b2effe987 Johannes Berg     2023-08-16  12947  	} else {
37c20b2effe987 Johannes Berg     2023-08-16  12948  		RCU_INIT_POINTER(wdev->cqm_config, NULL);
d673099085ddf1 Johannes Berg     2023-12-16  12949  		/* if enabled as range also disable via range */
d673099085ddf1 Johannes Berg     2023-12-16  12950  		if (old->use_range_api)
d673099085ddf1 Johannes Berg     2023-12-16  12951  			err = rdev_set_cqm_rssi_range_config(rdev, dev, 0, 0);
d673099085ddf1 Johannes Berg     2023-12-16  12952  		else
d673099085ddf1 Johannes Berg     2023-12-16  12953  			err = rdev_set_cqm_rssi_config(rdev, dev, 0, 0);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12954  	}
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12955  
37c20b2effe987 Johannes Berg     2023-08-16  12956  	if (err) {
37c20b2effe987 Johannes Berg     2023-08-16  12957  		rcu_assign_pointer(wdev->cqm_config, old);
37c20b2effe987 Johannes Berg     2023-08-16  12958  		kfree_rcu(cqm_config, rcu_head);
37c20b2effe987 Johannes Berg     2023-08-16  12959  	} else {
37c20b2effe987 Johannes Berg     2023-08-16  12960  		kfree_rcu(old, rcu_head);
37c20b2effe987 Johannes Berg     2023-08-16  12961  	}
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12962  unlock:
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12963  	wdev_unlock(wdev);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12964  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12965  	return err;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12966  }
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12967  
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12968  static int nl80211_set_cqm(struct sk_buff *skb, struct genl_info *info)
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12969  {
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12970  	struct nlattr *attrs[NL80211_ATTR_CQM_MAX + 1];
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12971  	struct nlattr *cqm;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12972  	int err;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12973  
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12974  	cqm = info->attrs[NL80211_ATTR_CQM];
1da5fcc86d7104 Johannes Berg     2013-08-06  12975  	if (!cqm)
1da5fcc86d7104 Johannes Berg     2013-08-06  12976  		return -EINVAL;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12977  
8cb081746c031f Johannes Berg     2019-04-26  12978  	err = nla_parse_nested_deprecated(attrs, NL80211_ATTR_CQM_MAX, cqm,
8cb081746c031f Johannes Berg     2019-04-26  12979  					  nl80211_attr_cqm_policy,
8cb081746c031f Johannes Berg     2019-04-26  12980  					  info->extack);
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12981  	if (err)
1da5fcc86d7104 Johannes Berg     2013-08-06  12982  		return err;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12983  
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12984  	if (attrs[NL80211_ATTR_CQM_RSSI_THOLD] &&
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12985  	    attrs[NL80211_ATTR_CQM_RSSI_HYST]) {
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12986  		const s32 *thresholds =
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12987  			nla_data(attrs[NL80211_ATTR_CQM_RSSI_THOLD]);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12988  		int len = nla_len(attrs[NL80211_ATTR_CQM_RSSI_THOLD]);
1da5fcc86d7104 Johannes Berg     2013-08-06  12989  		u32 hysteresis = nla_get_u32(attrs[NL80211_ATTR_CQM_RSSI_HYST]);
1da5fcc86d7104 Johannes Berg     2013-08-06  12990  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12991  		if (len % 4)
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12992  			return -EINVAL;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12993  
4a4b8169501b18 Andrew Zaborowski 2017-02-10 @12994  		return nl80211_set_cqm_rssi(info, thresholds, len / 4,
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12995  					    hysteresis);
1da5fcc86d7104 Johannes Berg     2013-08-06  12996  	}
1da5fcc86d7104 Johannes Berg     2013-08-06  12997  
1da5fcc86d7104 Johannes Berg     2013-08-06  12998  	if (attrs[NL80211_ATTR_CQM_TXE_RATE] &&
84f10708f73254 Thomas Pedersen   2012-07-12  12999  	    attrs[NL80211_ATTR_CQM_TXE_PKTS] &&
84f10708f73254 Thomas Pedersen   2012-07-12  13000  	    attrs[NL80211_ATTR_CQM_TXE_INTVL]) {
1da5fcc86d7104 Johannes Berg     2013-08-06  13001  		u32 rate = nla_get_u32(attrs[NL80211_ATTR_CQM_TXE_RATE]);
1da5fcc86d7104 Johannes Berg     2013-08-06  13002  		u32 pkts = nla_get_u32(attrs[NL80211_ATTR_CQM_TXE_PKTS]);
1da5fcc86d7104 Johannes Berg     2013-08-06  13003  		u32 intvl = nla_get_u32(attrs[NL80211_ATTR_CQM_TXE_INTVL]);
d6dc1a38635897 Juuso Oikarinen   2010-03-23  13004  
1da5fcc86d7104 Johannes Berg     2013-08-06  13005  		return nl80211_set_cqm_txe(info, rate, pkts, intvl);
1da5fcc86d7104 Johannes Berg     2013-08-06  13006  	}
1da5fcc86d7104 Johannes Berg     2013-08-06  13007  
1da5fcc86d7104 Johannes Berg     2013-08-06  13008  	return -EINVAL;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  13009  }
d6dc1a38635897 Juuso Oikarinen   2010-03-23  13010  

:::::: The code at line 12933 was first introduced by commit
:::::: 4a4b8169501b18c3450ac735a7e277b24886a651 cfg80211: Accept multiple RSSI thresholds for CQM

:::::: TO: Andrew Zaborowski <andrew.zaborowski@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
