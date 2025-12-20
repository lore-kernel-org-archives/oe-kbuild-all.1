Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94C86341
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232114; cv=none; b=DjzjdImo+R5f4Fc7497vONfnGoI/mAkLrY5XCveAWa+hpuyR63IdsjSqmJBHirUTIkomN6bt3F0xbNKF49UhglX/N0GL7gXH7JMplgBB7bhQpaRhB8TuX1WLwOckeX/d5jkSpaI/gVWDbGHxDm6rwL6fmBRmxSW0XUdD1usElDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232114; c=relaxed/simple;
	bh=ny6grBHDCdf3fjMHb1kmLArgJZT6Jwr141Fc54U9x4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4qDDS2w9Ti7Ql8wLGGhgMGMxeyI8n0+IeAd8sLBiVA6Vb7JyN9dSM4GnHoQO4t73VKL2/XmkXRaGsw4ZYWCoFjoXgTSWyoiqwXVW1khx6+69gYt2UGs0WDkDpNbmJrRbI629/aihzesrQqHv+EzlabKameDZB+hiif3TU1i/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brzILjJw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brzILjJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766232113; x=1797768113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ny6grBHDCdf3fjMHb1kmLArgJZT6Jwr141Fc54U9x4A=;
  b=brzILjJwjhv2oRGBL9MOeaB6eimiwTaw/E4WcozwbHMeFfZIVPPokmDa
   uTP9NExVoEQJlf2TFB7F5Q2zkbH5FzQAblJYfxsrbfJKfK9XtUlX7gsq/
   S4JeIHajuDZtAOmWGQ4WotzsOEFO6YxEZ+4sd0alIteBMQze36gXtO8fD
   gopE3gujbxK4ySs4Xp7+G/k2fWiv1Pkheqh6+jauy4LaT7OghXpeqPdXQ
   hQAZT3TdtYhkFba9cZJsmjmXYFRcJskYbkktLYM2tFsgkIsc9Xwbqbyvk
   p2tGL8+/hI4qXvkO12CyFMFeLv69CReLtjpZC8ERhMmix5PDSqsZKrae+
   Q==;
X-CSE-ConnectionGUID: bfukP/yZQkmGUXQ9WvKuEw==
X-CSE-MsgGUID: 5K9jr5/AQmWAhO1JhMFY1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68049911"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68049911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:01:51 -0800
X-CSE-ConnectionGUID: pvYkaqTSThyVd6BDwS7bJA==
X-CSE-MsgGUID: ytz1dkY5RPGUrhRQBpL2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203528228"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 04:01:51 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWvee-000000004W1-3FfF;
	Sat, 20 Dec 2025 12:01:48 +0000
Date: Sat, 20 Dec 2025 20:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:stageing2 3/4] include/linux/mm.h:3472:15: error: use of
 undeclared identifier 'PMD_SHIFT'
Message-ID: <202512202236.SK4aqxcX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git stageing2
head:   02122754a0d846c51f96405c17b44bf723f78d0f
commit: c3b93c1c3dab4373661c8ed654e4bd5243b72ee2 [3/4] mm/thp: appoint THP pmd size by oder
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251220/202512202236.SK4aqxcX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202236.SK4aqxcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202236.SK4aqxcX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:3472:15: error: use of undeclared identifier 'PMD_SHIFT'
    3472 |         if (order == PMD_ORDER) {
         |                      ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/PMD_SHIFT +3472 include/linux/mm.h

  3466	
  3467	static inline spinlock_t *thp_pxd_lock(struct mm_struct *mm, struct vm_fault *vmf,
  3468					       const int order)
  3469	{
  3470		spinlock_t *ptl;
  3471	
> 3472		if (order == PMD_ORDER) {
  3473			ptl = pmd_lockptr(mm, vmf->pmd);
  3474			spin_lock(ptl);
  3475		} else {
  3476			ptl = pud_lockptr(mm, vmf->pud);
  3477			spin_lock(ptl);
  3478		}
  3479	
  3480		return ptl;
  3481	}
  3482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
