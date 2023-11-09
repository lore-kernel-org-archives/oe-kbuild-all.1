Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE35668
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpB9qPme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699488215; x=1731024215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tCGjF5WaSzWqBubPlQn+hU1MMyX449YX6wP83ZieMJ0=;
  b=LpB9qPmea2DqtL4To+FsyDTWbB8Yk5ghEwyVBCL7xfDQZxe+roHyYy/N
   Qr8fe63Qkk+JltF2WObPTT61tZoDn1d7k8MU0IrE2ACwdVEO75qQ4PXyb
   hqhk5x2xA9kOd1ppAKRzK9tka1SF37iR8OUXxMjDZK3c167Iyp1Z+LiZQ
   i+MElRXDl8H3HJ+DbzupXWMbpuhedjaWEerLtZxZgvEdUqFGTNxO7Qzwk
   L6vk/0RSb+L5kUprJpySIG2CXtFYCEgWzUmi9OWi0Nho+GQx1hHOOBYsq
   l6W709jeb+kYYjdUQ1uYZaqGzQzGbySu7u+Kpy20ocE6HemkoDgngnq5F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393794147"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="393794147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 16:03:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886822471"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="886822471"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2023 16:03:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0sWB-0008K4-2R;
	Thu, 09 Nov 2023 00:03:31 +0000
Date: Thu, 9 Nov 2023 08:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] wifi: cfg80211: fix CQM for non-range use
Message-ID: <202311090752.hWcJWAHL-lkp@intel.com>
References: <20231106231715.3a506ac2dadb.Ie774b85b9d4ff934a1236e77096cb9c6c9fe6561@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106231715.3a506ac2dadb.Ie774b85b9d4ff934a1236e77096cb9c6c9fe6561@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master next-20231108]
[cannot apply to v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-cfg80211-fix-CQM-for-non-range-use/20231107-071337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20231106231715.3a506ac2dadb.Ie774b85b9d4ff934a1236e77096cb9c6c9fe6561%40changeid
patch subject: [RFC PATCH] wifi: cfg80211: fix CQM for non-range use
config: x86_64-buildonly-randconfig-006-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090752.hWcJWAHL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090752.hWcJWAHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311090752.hWcJWAHL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/wireless/nl80211.c: In function 'nl80211_set_cqm_rssi.isra':
>> net/wireless/nl80211.c:12892:17: warning: 'memcpy' specified bound 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
   12892 |                 memcpy(cqm_config->rssi_thresholds, thresholds,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12893 |                        flex_array_size(cqm_config, rssi_thresholds,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12894 |                                        n_thresholds));
         |                                        ~~~~~~~~~~~~~~


vim +/memcpy +12892 net/wireless/nl80211.c

4a4b8169501b18 Andrew Zaborowski 2017-02-10  12840  
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12841  static int nl80211_set_cqm_rssi(struct genl_info *info,
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12842  				const s32 *thresholds, int n_thresholds,
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12843  				u32 hysteresis)
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12844  {
4c476991062a0a Johannes Berg     2010-10-04  12845  	struct cfg80211_registered_device *rdev = info->user_ptr[0];
37c20b2effe987 Johannes Berg     2023-08-16  12846  	struct cfg80211_cqm_config *cqm_config = NULL, *old;
4c476991062a0a Johannes Berg     2010-10-04  12847  	struct net_device *dev = info->user_ptr[1];
1da5fcc86d7104 Johannes Berg     2013-08-06  12848  	struct wireless_dev *wdev = dev->ieee80211_ptr;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12849  	s32 prev = S32_MIN;
7d6904bf26b96e Johannes Berg     2023-10-05  12850  	int i, err;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12851  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12852  	/* Check all values negative and sorted */
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12853  	for (i = 0; i < n_thresholds; i++) {
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12854  		if (thresholds[i] > 0 || thresholds[i] <= prev)
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12855  			return -EINVAL;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12856  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12857  		prev = thresholds[i];
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12858  	}
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12859  
074ac8df9f93f2 Johannes Berg     2010-09-16  12860  	if (wdev->iftype != NL80211_IFTYPE_STATION &&
4c476991062a0a Johannes Berg     2010-10-04  12861  	    wdev->iftype != NL80211_IFTYPE_P2P_CLIENT)
4c476991062a0a Johannes Berg     2010-10-04  12862  		return -EOPNOTSUPP;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12863  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12864  	if (n_thresholds == 1 && thresholds[0] == 0) /* Disabling */
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12865  		n_thresholds = 0;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12866  
7d6904bf26b96e Johannes Berg     2023-10-05  12867  	old = wiphy_dereference(wdev->wiphy, wdev->cqm_config);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12868  
54e1e1c490f4db Johannes Berg     2023-11-06  12869  	/* if already disabled just succeed */
54e1e1c490f4db Johannes Berg     2023-11-06  12870  	if (!n_thresholds && !old)
54e1e1c490f4db Johannes Berg     2023-11-06  12871  		return 0;
54e1e1c490f4db Johannes Berg     2023-11-06  12872  
54e1e1c490f4db Johannes Berg     2023-11-06  12873  	if (n_thresholds > 1) {
54e1e1c490f4db Johannes Berg     2023-11-06  12874  		if (!wiphy_ext_feature_isset(&rdev->wiphy,
54e1e1c490f4db Johannes Berg     2023-11-06  12875  					     NL80211_EXT_FEATURE_CQM_RSSI_LIST) ||
54e1e1c490f4db Johannes Berg     2023-11-06  12876  		    !rdev->ops->set_cqm_rssi_range_config)
54e1e1c490f4db Johannes Berg     2023-11-06  12877  			return -EOPNOTSUPP;
54e1e1c490f4db Johannes Berg     2023-11-06  12878  	} else {
54e1e1c490f4db Johannes Berg     2023-11-06  12879  		if (!rdev->ops->set_cqm_rssi_config)
54e1e1c490f4db Johannes Berg     2023-11-06  12880  			return -EOPNOTSUPP;
54e1e1c490f4db Johannes Berg     2023-11-06  12881  	}
54e1e1c490f4db Johannes Berg     2023-11-06  12882  
37c20b2effe987 Johannes Berg     2023-08-16  12883  	if (n_thresholds) {
40f231e75a1d98 Len Baker         2021-09-19  12884  		cqm_config = kzalloc(struct_size(cqm_config, rssi_thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12885  						 n_thresholds),
40f231e75a1d98 Len Baker         2021-09-19  12886  				     GFP_KERNEL);
076fc8775dafe9 Johannes Berg     2023-08-29  12887  		if (!cqm_config)
076fc8775dafe9 Johannes Berg     2023-08-29  12888  			return -ENOMEM;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12889  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12890  		cqm_config->rssi_hyst = hysteresis;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12891  		cqm_config->n_rssi_thresholds = n_thresholds;
4a4b8169501b18 Andrew Zaborowski 2017-02-10 @12892  		memcpy(cqm_config->rssi_thresholds, thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12893  		       flex_array_size(cqm_config, rssi_thresholds,
40f231e75a1d98 Len Baker         2021-09-19  12894  				       n_thresholds));
54e1e1c490f4db Johannes Berg     2023-11-06  12895  		cqm_config->use_range_api = n_thresholds > 1 ||
54e1e1c490f4db Johannes Berg     2023-11-06  12896  					    !rdev->ops->set_cqm_rssi_config;
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12897  
37c20b2effe987 Johannes Berg     2023-08-16  12898  		rcu_assign_pointer(wdev->cqm_config, cqm_config);
54e1e1c490f4db Johannes Berg     2023-11-06  12899  
54e1e1c490f4db Johannes Berg     2023-11-06  12900  		if (cqm_config->use_range_api)
54e1e1c490f4db Johannes Berg     2023-11-06  12901  			err = cfg80211_cqm_rssi_update(rdev, dev, cqm_config);
54e1e1c490f4db Johannes Berg     2023-11-06  12902  		else
54e1e1c490f4db Johannes Berg     2023-11-06  12903  			err = rdev_set_cqm_rssi_config(rdev, dev,
54e1e1c490f4db Johannes Berg     2023-11-06  12904  						       thresholds[0],
54e1e1c490f4db Johannes Berg     2023-11-06  12905  						       hysteresis);
37c20b2effe987 Johannes Berg     2023-08-16  12906  	} else {
37c20b2effe987 Johannes Berg     2023-08-16  12907  		RCU_INIT_POINTER(wdev->cqm_config, NULL);
54e1e1c490f4db Johannes Berg     2023-11-06  12908  		/* if enabled as range also disable via range */
54e1e1c490f4db Johannes Berg     2023-11-06  12909  		if (old->use_range_api)
54e1e1c490f4db Johannes Berg     2023-11-06  12910  			err = rdev_set_cqm_rssi_range_config(rdev, dev, 0, 0);
54e1e1c490f4db Johannes Berg     2023-11-06  12911  		else
54e1e1c490f4db Johannes Berg     2023-11-06  12912  			err = rdev_set_cqm_rssi_config(rdev, dev, 0, 0);
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12913  	}
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12914  
37c20b2effe987 Johannes Berg     2023-08-16  12915  	if (err) {
37c20b2effe987 Johannes Berg     2023-08-16  12916  		rcu_assign_pointer(wdev->cqm_config, old);
37c20b2effe987 Johannes Berg     2023-08-16  12917  		kfree_rcu(cqm_config, rcu_head);
37c20b2effe987 Johannes Berg     2023-08-16  12918  	} else {
37c20b2effe987 Johannes Berg     2023-08-16  12919  		kfree_rcu(old, rcu_head);
37c20b2effe987 Johannes Berg     2023-08-16  12920  	}
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12921  
4a4b8169501b18 Andrew Zaborowski 2017-02-10  12922  	return err;
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12923  }
d6dc1a38635897 Juuso Oikarinen   2010-03-23  12924  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
