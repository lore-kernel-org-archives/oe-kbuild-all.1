Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F9257D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732322807; cv=none; b=ooaY+Xz6iW6E8bLqpeWyTerjowzzMCUYRjwbYyBX4T8AR+liwKr8b2X4tfc52WXU4reqAB4XoFIkI/RaLA6gwCKU6/gHPQ4CR5uUxyREa871n51v92kW3JfwID5Kganu/iLNYL0UNB2IASIeNar0U1UObnHRLFdPjaT3t50vYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732322807; c=relaxed/simple;
	bh=89rMIRv07ddcMjH0IUSwBykRDh7XhJ8cG67eZgVcwIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0iDCR5aTdT7KeUF+ZUa4bsGHpUaJNnNijfKZTBWqvz9K/dzvmRHbSdHYGKDvK9TFQM+b7KP/ONab0CLcljWyOuYIrjU/v5fF8xEOQ/f/hjsJKF4sRGaoMOaol1S9kXBHs2rhg0rxpvyyi3J4Owbz0nYQ3GkEMkhKA/IvcWByRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcIgEwOn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcIgEwOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732322805; x=1763858805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89rMIRv07ddcMjH0IUSwBykRDh7XhJ8cG67eZgVcwIs=;
  b=NcIgEwOn5Wuv4IEGB2BlmP59D5eqC0icnKZOyRtCd9ozQnHa5YszOJfj
   8+/tDjqzTD9+OtFwehm/dAInREOD/jYE4hPaDx5FQoN+8xCEBtEzqQjBT
   3kqbZ1Y7t6iOyh9vmAmY3r0MwrkS9xOV1OK/phTGp+PVCm+N2GHVYdI9q
   dEbV4a+FzYmuPu+/513pZfzLDs/Gyy0mA0W+ugNSeYW8SI7bz3DWE6FER
   gSUVS7Lg2O26ptrJwZ1T7GNtkEbRxb7AlSUyjjQh22YP8iBQUUUbiT40P
   E1Y25ERvjvpoXLmqvCcGPNSp6YDkShlEAp3bJZkYBqpOrulFcMVPYg0gm
   Q==;
X-CSE-ConnectionGUID: UIeepGELTVm1iRHzhe52cg==
X-CSE-MsgGUID: 2PuHHtLoSc2klokDEwj03w==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36266428"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="36266428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 16:46:45 -0800
X-CSE-ConnectionGUID: LkleXEOfSGmF1bDLPC2D+w==
X-CSE-MsgGUID: 0AlDdjccTuC9e+++cX4C1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="128226960"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2024 16:46:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEeIL-0004Jr-1d;
	Sat, 23 Nov 2024 00:46:41 +0000
Date: Sat, 23 Nov 2024 08:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 11838/19814]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype
 for 'filter_smc'
Message-ID: <202411230825.Z8vean5A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e2fbfb2efc8d61bff3b6ca9212c57cd9568f6442
commit: cf50248e99752ee522843c0dd529c21f4f726e66 [11838/19814] ANDROID: misc: pkvm_smc: Add an allow list for SMCs
config: arm64-randconfig-003-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230825.Z8vean5A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230825.Z8vean5A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230825.Z8vean5A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype for 'filter_smc' [-Wmissing-prototypes]
      85 | bool filter_smc(struct user_pt_regs *regs)
         |      ^~~~~~~~~~
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:108:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
     108 | int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/filter_smc +85 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

    80	
    81	/*
    82	 * Block all by default.
    83	 * return false will allow the SMC to be forwarded.
    84	 */
  > 85	bool filter_smc(struct user_pt_regs *regs)
    86	{
    87		u64 smc_id = regs->regs[0];
    88		/*
    89		 * Ignore bits that doesn't change the functionality:
    90		 * Bit[30]: 32/64 bit convention
    91		 * Bit[16]: SVE hint
    92		 */
    93		u64 mask = ~(ARM_SMCCC_1_3_SVE_HINT | BIT(ARM_SMCCC_CALL_CONV_SHIFT));
    94		struct pkvm_smc_filter pval = {smc_id & mask, NULL};
    95		struct pkvm_smc_filter *entry;
    96	
    97		/* alternatively, we can do 2 level binary search or switch case by service. */
    98		entry = (struct pkvm_smc_filter *)__inline_bsearch((void *)&pval, allow_list,
    99								   ARRAY_SIZE(allow_list),
   100								   sizeof(allow_list[0]),
   101								   match_smc);
   102		if (!entry)
   103			return deny_smc(regs);
   104	
   105		return entry->cb ? entry->cb(regs) : false;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
