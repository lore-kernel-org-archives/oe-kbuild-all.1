Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD265CA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766681889; cv=none; b=LWhC3uatRtwfw4FTYdTfOzsJE3RnOhkn1KEAQBNzhNXteX24lftQtX6ydoNnI5RkyNX6OGFA7qUAH5SMNj1jSOZE3DQSaucbjDlOaLdqIChugLrzhieDXCQBD8+tn+aPzSM+1AOQsYjPazoV5Lmx9CJVgGJASbLb1sKwy/+ObC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766681889; c=relaxed/simple;
	bh=laRNdj1ZImsaQUVbfKprVtrOu0I6UjZiMA56srSZix0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c0CvjarSTakHZyaGSJfcgcmecs46UGc3DJNuA/PmT2B/QCb6+UdiBRODRwMB95gifI6UZVTDNp53UDEBAFBlBSWGbXvKT6pzi28DVmtBdQMa48isOB4XEhQkk6pdMB9q+D/D0tAKI30BnyB+/ik3MkvStoxn4lkWbdip+hEBA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp0GXicg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp0GXicg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766681886; x=1798217886;
  h=date:from:to:cc:subject:message-id;
  bh=laRNdj1ZImsaQUVbfKprVtrOu0I6UjZiMA56srSZix0=;
  b=Cp0GXicgwOIpZ7tPVrXNsd1M7JseBqdHUIRNKn5dwX5Rs1Rtr5vuadIi
   GPIEg9wf2g8zC7SMtELq0xWqPCiXsI6/z65qMP6WCAZeBXRCqUOz8Fe2O
   xGJcZYGV9YrorEhpSPYjIUtB6kIMU/5P8kjNUysndfmwm7lFa7Iu46XsK
   79uHAFanPJokUoSbzSaaQ3ch7AmpyOOtaNQ5lcvJGexxPT8ZtldEp9MDs
   nnleM9TTmS0cafJQTLP9xN+UBAlPtTrwyUdiue28hHTiM2dZ3qzXAfjZi
   m8aXV4soTcRx2ONKXCwXXyJ59Nbcso4hzPl86M6vueDYxUu9zPATbYw+d
   w==;
X-CSE-ConnectionGUID: warAqhOtTWirpCbVxv5w9A==
X-CSE-MsgGUID: ArIqqFmgQxyVKHumC3s6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68525182"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68525182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 08:58:05 -0800
X-CSE-ConnectionGUID: IsSBC3QHS1uGMoQiPQGjhw==
X-CSE-MsgGUID: ut75MG+dS5SvGJ7334hT2A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2025 08:58:03 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYof3-000000004IZ-0lyE;
	Thu, 25 Dec 2025 16:58:01 +0000
Date: Fri, 26 Dec 2025 00:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] net/wireless/nl80211.c:12933:17:
 warning: 'memcpy' specified bound 18446744073709551615 exceeds maximum object
 size 9223372036854775807
Message-ID: <202512260022.AlkesDtX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: ac421033218a2998c95539a46fbedb6657790b28 [13/13] wifi: cfg80211: fix CQM for non-range use
config: arm64-randconfig-003-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260022.AlkesDtX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260022.AlkesDtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260022.AlkesDtX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/wireless/nl80211.c: In function 'nl80211_set_cqm_rssi.isra':
>> net/wireless/nl80211.c:12933:17: warning: 'memcpy' specified bound 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
   12933 |                 memcpy(cqm_config->rssi_thresholds, thresholds,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12934 |                        flex_array_size(cqm_config, rssi_thresholds,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12935 |                                        n_thresholds));
         |                                        ~~~~~~~~~~~~~~


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
ac421033218a29 Johannes Berg     2024-03-20  12908  	/* if already disabled just succeed */
ac421033218a29 Johannes Berg     2024-03-20  12909  	if (!n_thresholds && !old)
ac421033218a29 Johannes Berg     2024-03-20  12910  		return 0;
ac421033218a29 Johannes Berg     2024-03-20  12911  
ac421033218a29 Johannes Berg     2024-03-20  12912  	if (n_thresholds > 1) {
ac421033218a29 Johannes Berg     2024-03-20  12913  		if (!wiphy_ext_feature_isset(&rdev->wiphy,
ac421033218a29 Johannes Berg     2024-03-20  12914  					     NL80211_EXT_FEATURE_CQM_RSSI_LIST) ||
ac421033218a29 Johannes Berg     2024-03-20  12915  		    !rdev->ops->set_cqm_rssi_range_config)
ac421033218a29 Johannes Berg     2024-03-20  12916  			return -EOPNOTSUPP;
ac421033218a29 Johannes Berg     2024-03-20  12917  	} else {
ac421033218a29 Johannes Berg     2024-03-20  12918  		if (!rdev->ops->set_cqm_rssi_config)
ac421033218a29 Johannes Berg     2024-03-20  12919  			return -EOPNOTSUPP;
ac421033218a29 Johannes Berg     2024-03-20  12920  	}
ac421033218a29 Johannes Berg     2024-03-20  12921  
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
ac421033218a29 Johannes Berg     2024-03-20  12936  		cqm_config->use_range_api = n_thresholds > 1 ||
ac421033218a29 Johannes Berg     2024-03-20  12937  					    !rdev->ops->set_cqm_rssi_config;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12938  
37c20b2effe987 Johannes Berg     2023-08-16  12939  		rcu_assign_pointer(wdev->cqm_config, cqm_config);
ac421033218a29 Johannes Berg     2024-03-20  12940  
ac421033218a29 Johannes Berg     2024-03-20  12941  		if (cqm_config->use_range_api)
ac421033218a29 Johannes Berg     2024-03-20  12942  			err = cfg80211_cqm_rssi_update(rdev, dev, cqm_config);
ac421033218a29 Johannes Berg     2024-03-20  12943  		else
ac421033218a29 Johannes Berg     2024-03-20  12944  			err = rdev_set_cqm_rssi_config(rdev, dev,
ac421033218a29 Johannes Berg     2024-03-20  12945  						       thresholds[0],
ac421033218a29 Johannes Berg     2024-03-20  12946  						       hysteresis);
37c20b2effe987 Johannes Berg     2023-08-16  12947  	} else {
37c20b2effe987 Johannes Berg     2023-08-16  12948  		RCU_INIT_POINTER(wdev->cqm_config, NULL);
ac421033218a29 Johannes Berg     2024-03-20  12949  		/* if enabled as range also disable via range */
ac421033218a29 Johannes Berg     2024-03-20  12950  		if (old->use_range_api)
ac421033218a29 Johannes Berg     2024-03-20  12951  			err = rdev_set_cqm_rssi_range_config(rdev, dev, 0, 0);
ac421033218a29 Johannes Berg     2024-03-20  12952  		else
ac421033218a29 Johannes Berg     2024-03-20  12953  			err = rdev_set_cqm_rssi_config(rdev, dev, 0, 0);
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

:::::: The code at line 12933 was first introduced by commit
:::::: 4a4b8169501b18c3450ac735a7e277b24886a651 cfg80211: Accept multiple RSSI thresholds for CQM

:::::: TO: Andrew Zaborowski <andrew.zaborowski@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
