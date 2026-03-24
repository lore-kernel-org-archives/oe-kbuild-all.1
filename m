Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF9C19C54E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313671; cv=none; b=McIACW9l9ztrKiS+nQGAViz2cu2v3Vg6SadN7jiWAdH+GOUH4XXQ8j9gEpvwKvcg1FQ5Kk3mLuLtTOV4vKoneQZuhDMf5M7hdPrqD50Kj26hs6XND9UYiBPgyw+c275F+jeDWH5YrwlIuV7xLHg2T10/QOv+LO1sToDoHnqLCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313671; c=relaxed/simple;
	bh=Pz6zISq8eHm1uTScVQMOcgtHVDmZKppJktluKg+70R8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mHD73aD+RBXinieagnIAAUR0/5KQehyEjaai2tquEBKpYEWLe0QcXIX1zJuF6jRfxRaL7HEIaFN6so1FTp6pZuwssrZ3GJ8AztlxGePWqrE7hG36136rkwQN6fKRI5C844YZGxlqo9kj4ysxhswFuUqq7K7A7O/thaQBSJEFcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7/1hLwc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7/1hLwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774313670; x=1805849670;
  h=date:from:to:cc:subject:message-id;
  bh=Pz6zISq8eHm1uTScVQMOcgtHVDmZKppJktluKg+70R8=;
  b=a7/1hLwcqoXUtVeAzQQssrhnZn8celLTP4OS6a6ybFtX8G7vrTJ7YShR
   vd6KcjfcLLDvkQm/jj3fxxmqEyphvxrpjvLgx6MWwZDBbDJ1ZuzLNAQ7M
   z1FYIgEc95J77YJJ20gHuPeBbiQIO9liTH/DYgmwK/YwUZySCyrgsJdq8
   vio5Sg0etMa2u3T1pQ5odaPImiw4kG8jTl9p0UR3YfAJtN1u1xoXFEsl/
   s/7kbi//E75D/olUZiTx/QpuGWnRPtkZzvW8SWuA1J5E7XKZfFacWvkzP
   itUuZVcEbPfwHnvasCR9Sp1KLz7aBJ7SCHBq0AVGwEdhus5dyLLBMXFix
   g==;
X-CSE-ConnectionGUID: 4PdezqRyRUuXsSD0gLhNgw==
X-CSE-MsgGUID: B0FBBzOhRjK6CbU7TdFx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75513920"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75513920"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:54:30 -0700
X-CSE-ConnectionGUID: HwvIpx6CTWqaUW+ADIdnKQ==
X-CSE-MsgGUID: Tj0e76+PSDSIe4Oihr8BMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229120087"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Mar 2026 17:54:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4q2L-000000003T3-2CxU;
	Tue, 24 Mar 2026 00:54:25 +0000
Date: Tue, 24 Mar 2026 08:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/mmc/core/mmc.c:985:6: warning: no previous prototype for function
 'mmc_set_bus_speed'
Message-ID: <202603240805.dfUbWeto-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: a8fe5ae5628fd3e6d29af800e7c63bf58d1380ee [1/1] ANDROID: mmc: core: Export core functions required for clk scaling
config: arm-randconfig-004-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240805.dfUbWeto-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240805.dfUbWeto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240805.dfUbWeto-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/core/mmc.c:18:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mmc/core/mmc.c:985:6: warning: no previous prototype for function 'mmc_set_bus_speed' [-Wmissing-prototypes]
     985 | void mmc_set_bus_speed(struct mmc_card *card)
         |      ^
   drivers/mmc/core/mmc.c:985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     985 | void mmc_set_bus_speed(struct mmc_card *card)
         | ^
         | static 
   2 warnings generated.


vim +/mmc_set_bus_speed +985 drivers/mmc/core/mmc.c

   981	
   982	/*
   983	 * Set the bus speed for the selected speed mode.
   984	 */
 > 985	void mmc_set_bus_speed(struct mmc_card *card)
   986	{
   987		unsigned int max_dtr = (unsigned int)-1;
   988	
   989		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   990		     max_dtr > card->ext_csd.hs200_max_dtr)
   991			max_dtr = card->ext_csd.hs200_max_dtr;
   992		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   993			max_dtr = card->ext_csd.hs_max_dtr;
   994		else if (max_dtr > card->csd.max_dtr)
   995			max_dtr = card->csd.max_dtr;
   996	
   997		mmc_set_clock(card->host, max_dtr);
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
