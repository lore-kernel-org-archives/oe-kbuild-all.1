Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCD83CD3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732293172; cv=none; b=nkjdxaM1HsMKFtMsMEtWVAxUduvPE1E3HdwDRnRRsOXpkM8rK2MYt+4EzNN1CeGIN5MP8vUQSlPoNAHallKRPEtAg0aoXNrmEte4H+eHKZ0U0ROSceJjl1T7oyAEgvtRrSvo21G8waOUd/hAMFpTcS0odxovZuZt2IBimVfFpuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732293172; c=relaxed/simple;
	bh=nLT2UnCSttfxHhk7tAjXn4m3lA4OikCzozUQRBmJCCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQy5ix+tzBGtlw3AJmYa9r+8hI9qLKaZA60TBYg1u0BpEDQQcoZQaZihSDvQkqV59VLJ6giYcnFhxW43nepGx9ukfF4l+5Rq8vuEQvvx22GvjV+ZJpp5x6SbEksHuLmTfmEz1DhZE0LKKDzq9kYPDNIcD0GNmxYU2nOO3p4TqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljcs0sgQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljcs0sgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732293170; x=1763829170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLT2UnCSttfxHhk7tAjXn4m3lA4OikCzozUQRBmJCCM=;
  b=Ljcs0sgQxVu9D1o2k/JYDdR+68N/0Xyf0EHB7ntrPqrq5HzoaUwl0nxS
   eisBx9bAwVvufVRW5dsdyI4oWjOnj9H1RalsJipjzB6rAC84NRJZ4xHTP
   fZUJP4aWRM9K63khtDykV98s+ZNxRrdeVOEQD6PsjnbEzyioZZnqJFN3b
   NkbUi1UU73zVdmn/pyIcq9uFCRFlmf5RBFjA79F2W0/Cked3Q0/ctwHIt
   lGP78+hyagnogplwnP75DsoaGVroXymBzQKxosiQWUwgQV6c3KJD1nI2Y
   k/++R1GuoXf7ltwYz7W36+AqnzUkirCM9nhfCfg5g+h0zECAOMNeRjL/X
   g==;
X-CSE-ConnectionGUID: B07gbwK6QI+mTq6OqNtTMg==
X-CSE-MsgGUID: puvQS2AqRJaW6IKFY4HqNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32198119"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32198119"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 08:32:50 -0800
X-CSE-ConnectionGUID: H2QwMnPCTHeG4N5ic2Xbpw==
X-CSE-MsgGUID: jHryQBNQQfq9TwIUz2Cvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90544796"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 08:32:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEWaM-00043v-1t;
	Fri, 22 Nov 2024 16:32:46 +0000
Date: Sat, 23 Nov 2024 00:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1/1491]
 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2190:16: error: too many
 arguments to function 'ieee80211_mandatory_rates'
Message-ID: <202411230042.Ot93Tzea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 7af46bb010c480a7e7fad519fd2ffd9590255a97 [1/1491] Merge branch 'android15-6.6' into android15-6.6-desktop
config: x86_64-randconfig-103-20241121 (https://download.01.org/0day-ci/archive/20241123/202411230042.Ot93Tzea-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230042.Ot93Tzea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230042.Ot93Tzea-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2168:8: error: redefinition of 'struct cfg80211_ttlm_params'
    2168 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:7,
                    from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   include/net/cfg80211.h:1603:8: note: originally defined here
    1603 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: In function 'iwl7000_ieee80211_mandatory_rates':
>> drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2190:16: error: too many arguments to function 'ieee80211_mandatory_rates'
    2190 |         return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:7,
                    from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   include/net/cfg80211.h:6380:5: note: declared here
    6380 | u32 ieee80211_mandatory_rates(struct ieee80211_supported_band *sband);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2168:8: error: redefinition of 'struct cfg80211_ttlm_params'
    2168 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:7,
                    from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   include/net/cfg80211.h:1603:8: note: originally defined here
    1603 | struct cfg80211_ttlm_params {
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: In function 'iwl7000_ieee80211_mandatory_rates':
>> drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:2190:16: error: too many arguments to function 'ieee80211_mandatory_rates'
    2190 |         return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h:7,
                    from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:149,
                    from <command-line>:
   include/net/cfg80211.h:6380:5: note: declared here
    6380 | u32 ieee80211_mandatory_rates(struct ieee80211_supported_band *sband);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: At top level:
   drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error: linux/hsr_main.h: No such file or directory
      10 | #include <linux/hsr_main.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/ieee80211_mandatory_rates +2190 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h

8faa6d09277325 Johannes Berg    2020-09-15  2185  
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2186  #if CFG80211_VERSION < KERNEL_VERSION(6,7,0)
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2187  static inline u32
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2188  iwl7000_ieee80211_mandatory_rates(struct ieee80211_supported_band *sband)
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2189  {
07a7b0f48ea5d5 Gregory Greenman 2023-11-20 @2190  	return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2191  }
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2192  #define ieee80211_mandatory_rates iwl7000_ieee80211_mandatory_rates
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2193  #endif
07a7b0f48ea5d5 Gregory Greenman 2023-11-20  2194  

:::::: The code at line 2190 was first introduced by commit
:::::: 07a7b0f48ea5d57aa19cd05b74da8d81cba8b1ba CHROMIUM: iwl7000: Merge remote-tracking branch 'auto/master'

:::::: TO: Gregory Greenman <gregory.greenman@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
