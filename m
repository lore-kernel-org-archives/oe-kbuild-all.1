Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09C3FE37A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939374; cv=none; b=UT2gPyn5w13sqSTI67+P/9oVbxs5tlWU/elCbBWzQPswmCoNd4pP2C7g14909FiD+GBItowi5k0ROnB1HG2nDkd/7bsn46B4cPrUu63kZXz20pCM8yZkeq9OQZXreyw+KUxKdRkaGuWYGcBIFoSF1jdDqLDGyAkAnoagyxdwniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939374; c=relaxed/simple;
	bh=YyfmR9gJfF6TN6DJKBC+mIjL1XvaJm1PVzwVGY/yvpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dnGmq1sQT/f6B8HP1hiGeeW6Jy01aMroeDENCe6qAzJQwZiKS0iDsApTj9mEkR2wY5iuDml31Ih7N/NDVohkjCaY5OflWutpycVHwHmEK1V5CBC+TX+56jW7YKyfQrmQLbZBqmnCzsXsn9i4Ahi/QeuhGpO3/B47Et/Fqu79E8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rmcp0FlO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rmcp0FlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789939370; x=1821475370;
  h=date:from:to:cc:subject:message-id;
  bh=YyfmR9gJfF6TN6DJKBC+mIjL1XvaJm1PVzwVGY/yvpA=;
  b=Rmcp0FlOQwxe2zL7vfEeZekmmO8AIot1Jdlg5bOuSVr1yi+kGIQbGyJ0
   8v4C55iJvptOovzUUGZBtwciOcf/Vn7byyfKqbGWPah/EiRVsrOSulYaG
   nj6cFOf80h7jsXcCRZ33/ijfavO9AnW39ofd8TWIl0w8iEmGMqEei8gJa
   V0OQupj4alDR2tEEJL6Cmm4yEaFT5kjDwmMx7q4YhJdJGLa3qUX0gWdmn
   N+Y3+CVIuuZABgTGJ7wBceHqE+pfcS8x/wAldFiQW+1Bhvv6hSx5A4/k9
   QpV9bMP7lPRRX5jXFbnQX7jrgAJfRV/IH8cFllZ/smYPAqPQTL82Ptr2Q
   A==;
X-CSE-ConnectionGUID: 9jYEktQkTA+VnJmZZ0J5QA==
X-CSE-MsgGUID: R7MF2yxlTcGF9Myvlja1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="78000911"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="78000911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 14:22:49 -0700
X-CSE-ConnectionGUID: k+Bymxp1Ssi93nbHdL2Vsg==
X-CSE-MsgGUID: nCvuWuf+SbueyYNuX4t6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="271869586"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Sep 2026 14:22:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Ozl-00000000CpL-0PkO;
	Sun, 20 Sep 2026 21:22:45 +0000
Date: Mon, 21 Sep 2026 05:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype
 for 'filter_smc'
Message-ID: <202609210516.eHWkdOH7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 20d9754be1965db7c4cdc06d647e0984e635432d [1/1] ANDROID: misc: pkvm_smc: Add an allow list for SMCs
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260921/202609210516.eHWkdOH7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609210516.eHWkdOH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609210516.eHWkdOH7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: warning: no previous prototype for 'filter_smc' [-Wmissing-prototypes]
    bool filter_smc(struct user_pt_regs *regs)
         ^~~~~~~~~~
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:108:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
    int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
        ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


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
