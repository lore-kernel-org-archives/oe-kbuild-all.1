Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694E18A6AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735639412; cv=none; b=c3hqu3OSOTbFLE6drrPQvtfJBLekWlCx6TZv9G0SAW+CUEd2axDQP7aq+MRzp/4mcYCYPcXp65Y4m98uyMMujKcdhkFwRZVHhjA+1xHO8LUzdUPH52JC/2fMVK5fT42JdqVp4RA+SgHMhM0UxXkUmUZ5uKTbyl1AzWuPfgJfPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735639412; c=relaxed/simple;
	bh=69ghK9w7okuoZXcQ7nHbdsGYj+TV7FyQPSn4cYOdmb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbK4V4QyrcWcDNClzHxfxo1WBKBgDZTj8CwfokV9TAiBAJe8Okh6FegZlbVhP13ksGbO410tHUZyfhIpwoksCUlWaYlPeRWs8319VyzF+19iwPooaYemFvMuBUfVvhtHPO/DJhEhTXulmKIX5t1LxbQITp0BmSP0+5i+iFOEeUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYKGGkPb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYKGGkPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735639410; x=1767175410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69ghK9w7okuoZXcQ7nHbdsGYj+TV7FyQPSn4cYOdmb8=;
  b=EYKGGkPbxzXKR8s61MjO+dd2ryyavSr9BaR8fp/MUg+D4Hvt3KvgWbzO
   RGrsKxySY7GqbRdZDytflwnttTwKmB6uV9XLDolQ8KZguBrEaf3HKq5ij
   oEc3fyMZeOnw/3SaCYhG5gWIQ+PmjP3rlLZsrKD1ldUkNfzViXZnE7VOu
   5RMGfQyjse8RXOLQnwwFCJXG1ctyhQdunzXp3eEid7Fs9VdfeYIcsIJPq
   GNz3tPs2lM8mfNSsmuRihQAI7AnzBGgsKBVOcWrZgaLczko/YmTw14Dqf
   4YLyicpyZn+XGAZapOuQ4O8M2veRZFNgjajUsdo7++XXT+8+IAno9mjo4
   A==;
X-CSE-ConnectionGUID: 7M5mDT3cT0WZsERTmoJygw==
X-CSE-MsgGUID: sWnniaAsQUqAzh4x1M6lkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47282589"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="47282589"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 02:03:27 -0800
X-CSE-ConnectionGUID: sIrEzcnNTz+kXY70oj6xYg==
X-CSE-MsgGUID: 3V+eEwerQwehskW08qHGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="105874680"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Dec 2024 02:03:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSZ5w-00072p-1W;
	Tue, 31 Dec 2024 10:03:24 +0000
Date: Tue, 31 Dec 2024 18:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype
 for 'filter_smc'
Message-ID: <202412311725.SPemYtNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   69b3c870d0b8d800f7140a73551a9603ccf67c93
commit: cf50248e99752ee522843c0dd529c21f4f726e66 [2/2] ANDROID: misc: pkvm_smc: Add an allow list for SMCs
config: arm64-randconfig-r123-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311725.SPemYtNa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241231/202412311725.SPemYtNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311725.SPemYtNa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype for 'filter_smc' [-Wmissing-prototypes]
      85 | bool filter_smc(struct user_pt_regs *regs)
         |      ^~~~~~~~~~
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:108:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
     108 | int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
