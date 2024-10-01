Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF54A21
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727740848; cv=none; b=Lx0Cy4ECoNJiXn4dg4a4rl/xL0BoSoimCQDx5dINxlDJQE5F6WblcEOMJC6cx+Azjy/q7aTAt4uj8a77V3SUI7XeH4s1nGSKiZddBS8uk+10qxgWRJ1tXhhQ2z1KVhp9Xd7T1UoLbquxquNwVjQBADcPe5gZSxJVmvmyKoiJ7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727740848; c=relaxed/simple;
	bh=GAmGv2X5Sq0ENPie8G0qzaEVg3RvUiM+ClGci9A/hY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTVvdTrrYvHSqN6ocuD3qliZV9tGwCDKVRP3anXO5mY7429pLfUtzv6ydQG7c7YNfz5C17TjNoLee9qeT/zZCE4ypHp/M3Wpebf5EENgjiR5+MdjCLNG5xdlsSK8v1hP5MS1VBzVLbGYE2PQc0fIbug61ShvCtH7TXxONtKxDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSxwFhWb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSxwFhWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727740847; x=1759276847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GAmGv2X5Sq0ENPie8G0qzaEVg3RvUiM+ClGci9A/hY4=;
  b=BSxwFhWblqQcRNfJaJqgeEHdxUmnfxfUASGJQ8Gy9CgJg61RPY6Jsiqe
   LQJGSeafRdhXPodveTgSR5nVhtsZvTnYHHKrR/bzk49PiN5HbEwRoKBYW
   1uY9cdWor4guiiVhU6C7O+SkGYfQuq0q8xaXbe5A5nk05ix3JKw5CQBnS
   lPpj+HQWGeJyp989+HjAajvBlo8jQjGY6YjlZCTVfOJjF5mUXsi4x0G8F
   PCzOsNwTiAe59VA75oYklF7OxUCK4y0I7ZRJ25k5A/29iJMh3RH1hpPaa
   qVvyMyOyaBa5qGUl2NIX4+KjA4fUhvHR0hzY7kvXs5U1ZXG073DRz3X0F
   A==;
X-CSE-ConnectionGUID: xLOupjtRQ9y6EDbWM6es2w==
X-CSE-MsgGUID: eruKJLbvSouWs+7FcSJ+Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30741292"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="30741292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 17:00:46 -0700
X-CSE-ConnectionGUID: lQiwoAboR5KHSxCtTXQ0KQ==
X-CSE-MsgGUID: 0chmLJO0Qw6CRQx8OosYWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="104294641"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2024 17:00:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svQJl-000Q3h-2Q;
	Tue, 01 Oct 2024 00:00:41 +0000
Date: Tue, 1 Oct 2024 08:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [broonie-ci:arm64-gcs 28/40] arch/arm64/kernel/signal.c:1046:36:
 sparse: sparse: cast removes address space '__user' of expression
Message-ID: <202410010724.YzZzWMhC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   cf6cb1bdc403154eb3d34ffafea0ca566d71906d
commit: 874e32b873e572e8b6483417fd16814c0a29a796 [28/40] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-r123-20240930 (https://download.01.org/0day-ci/archive/20241001/202410010724.YzZzWMhC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241001/202410010724.YzZzWMhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010724.YzZzWMhC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/signal.c:1046:36: sparse: sparse: cast removes address space '__user' of expression
   arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression
   arch/arm64/kernel/signal.c:1461:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@     got void * @@
   arch/arm64/kernel/signal.c:1461:26: sparse:     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )
   arch/arm64/kernel/signal.c:1461:26: sparse:     got void *

vim +/__user +1046 arch/arm64/kernel/signal.c

2c020ed8d148f7 Catalin Marinas 2012-03-05  1010  
c18ea640166b1d Mark Brown      2023-06-21  1011  #ifdef CONFIG_ARM64_GCS
c18ea640166b1d Mark Brown      2023-06-21  1012  static int gcs_restore_signal(void)
c18ea640166b1d Mark Brown      2023-06-21  1013  {
c18ea640166b1d Mark Brown      2023-06-21  1014  	unsigned long __user *gcspr_el0;
c18ea640166b1d Mark Brown      2023-06-21  1015  	u64 cap;
c18ea640166b1d Mark Brown      2023-06-21  1016  	int ret;
c18ea640166b1d Mark Brown      2023-06-21  1017  
c18ea640166b1d Mark Brown      2023-06-21  1018  	if (!system_supports_gcs())
c18ea640166b1d Mark Brown      2023-06-21  1019  		return 0;
c18ea640166b1d Mark Brown      2023-06-21  1020  
c18ea640166b1d Mark Brown      2023-06-21  1021  	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
c18ea640166b1d Mark Brown      2023-06-21  1022  		return 0;
c18ea640166b1d Mark Brown      2023-06-21  1023  
c18ea640166b1d Mark Brown      2023-06-21  1024  	gcspr_el0 = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
c18ea640166b1d Mark Brown      2023-06-21  1025  
c18ea640166b1d Mark Brown      2023-06-21  1026  	/*
c18ea640166b1d Mark Brown      2023-06-21  1027  	 * Ensure that any changes to the GCS done via GCS operations
c18ea640166b1d Mark Brown      2023-06-21  1028  	 * are visible to the normal reads we do to validate the
c18ea640166b1d Mark Brown      2023-06-21  1029  	 * token.
c18ea640166b1d Mark Brown      2023-06-21  1030  	 */
c18ea640166b1d Mark Brown      2023-06-21  1031  	gcsb_dsync();
c18ea640166b1d Mark Brown      2023-06-21  1032  
c18ea640166b1d Mark Brown      2023-06-21  1033  	/*
c18ea640166b1d Mark Brown      2023-06-21  1034  	 * GCSPR_EL0 should be pointing at a capped GCS, read the cap.
c18ea640166b1d Mark Brown      2023-06-21  1035  	 * We don't enforce that this is in a GCS page, if it is not
c18ea640166b1d Mark Brown      2023-06-21  1036  	 * then faults will be generated on GCS operations - the main
c18ea640166b1d Mark Brown      2023-06-21  1037  	 * concern is to protect GCS pages.
c18ea640166b1d Mark Brown      2023-06-21  1038  	 */
c18ea640166b1d Mark Brown      2023-06-21  1039  	ret = copy_from_user(&cap, gcspr_el0, sizeof(cap));
c18ea640166b1d Mark Brown      2023-06-21  1040  	if (ret)
c18ea640166b1d Mark Brown      2023-06-21  1041  		return -EFAULT;
c18ea640166b1d Mark Brown      2023-06-21  1042  
c18ea640166b1d Mark Brown      2023-06-21  1043  	/*
c18ea640166b1d Mark Brown      2023-06-21  1044  	 * Check that the cap is the actual GCS before replacing it.
c18ea640166b1d Mark Brown      2023-06-21  1045  	 */
c18ea640166b1d Mark Brown      2023-06-21 @1046  	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
c18ea640166b1d Mark Brown      2023-06-21  1047  		return -EINVAL;
c18ea640166b1d Mark Brown      2023-06-21  1048  
c18ea640166b1d Mark Brown      2023-06-21  1049  	/* Invalidate the token to prevent reuse */
c18ea640166b1d Mark Brown      2023-06-21  1050  	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
c18ea640166b1d Mark Brown      2023-06-21  1051  	if (ret != 0)
c18ea640166b1d Mark Brown      2023-06-21  1052  		return -EFAULT;
c18ea640166b1d Mark Brown      2023-06-21  1053  
c18ea640166b1d Mark Brown      2023-06-21  1054  	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
c18ea640166b1d Mark Brown      2023-06-21  1055  
c18ea640166b1d Mark Brown      2023-06-21  1056  	return 0;
c18ea640166b1d Mark Brown      2023-06-21  1057  }
c18ea640166b1d Mark Brown      2023-06-21  1058  

:::::: The code at line 1046 was first introduced by commit
:::::: c18ea640166b1dc952cf33f0903bcab93adbd729 arm64/signal: Set up and restore the GCS context for signal handlers

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
