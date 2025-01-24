Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BC381A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737684154; cv=none; b=nqCccf0gcupUClwMPChEYCUhKlXNjqC0sJyrxzkcVqTA6hGrKvb1xsPu5VE1K/YXPLENAQWsjZM4NKkPEQI0E0D6sxcrKUHENWEnBgxmXfvLLHrPzlbxn02vQM9dojPel5CMtVQSL005ffzeE4/0yvAP1W26vjd8Aaa2xLRMZOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737684154; c=relaxed/simple;
	bh=n/xV3a5Y7Y4UKh+2qDWbImjONU/9nn+7GrrWq0SfFfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/A2afPi0DL4I1ppsOzCYeW0B39FfKdvm+s1oDefPKSJmkvXwLRXTbE82w1a9z21o46cgXSf4RqMT49OiuzWJsN4lj8u3u6ZNpvxL+7jqDm8iYoWgR9O/54C1uR2EHOdiHuOuaIfZLzlb9ZsS5fVOxunwKnl2ZIR/zqyiewIvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJGQyW01; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJGQyW01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737684153; x=1769220153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/xV3a5Y7Y4UKh+2qDWbImjONU/9nn+7GrrWq0SfFfA=;
  b=aJGQyW01i04IDgtWU2UgKfbxTSuBYwYQX4AHXvs4XQWv3324PcD4B+WT
   eIea7NAasAS/OwKSbQCOobyGxijI4svO4cQmYnQ8kFFQ1kAxBI68YC6W6
   L7geaMmr4EY2ulXQ4r5B1nmDuwY7+1i9y/+Wc9INKq4cOaG4nMxZZ1LMZ
   x6vVCG3R6MrsRsGYnNm0+YNXnt5JW0RIkoznJWE9HCvDyShonEtQ6gKB4
   OvMM/IE7XcyBFSduR9EOEqBpziS0AwG3g/+/+ET0+1Rl/ySoMf03hBNOa
   GJc68mp7qgw74WdNTkvEBAfXGOJnY7jX7w+3ALQWW3ihkwS1bGH6KTWBt
   Q==;
X-CSE-ConnectionGUID: xtAam93oStyaDOtlStr94A==
X-CSE-MsgGUID: v4FXtMAsQJKhZiDk66kDlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38314073"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38314073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:02:28 -0800
X-CSE-ConnectionGUID: 1/UhXEM9TKWFeRWAIcJhCA==
X-CSE-MsgGUID: lmjgd+VzQaSdrNYfGw39xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111673258"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2025 18:02:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb91b-000c0p-1U;
	Fri, 24 Jan 2025 02:02:23 +0000
Date: Fri, 24 Jan 2025 10:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 228/228] kismet: WARNING: unmet
 direct dependencies detected for NETFILTER_FAMILY_BRIDGE when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202501240941.T3dcHxdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2c8b3afe8866ca4bb189aa69f1185ff225dabfa3
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [228/228] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-kismet-CONFIG_NETFILTER_FAMILY_BRIDGE-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240941.T3dcHxdS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240941.T3dcHxdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240941.T3dcHxdS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
     Depends on [n]: NET [=n] && INET [=n] && NETFILTER [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
