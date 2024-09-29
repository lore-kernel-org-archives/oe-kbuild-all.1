Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900BA7E591
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727587640; cv=none; b=cj6FVMy/XWRVakH/kRx4uD+PI5zZxtd/+fNpqwdfYmKC6n0X/lIStrcc8cZnjumNpp5uo4LXIP8WCZmON8K0N61ZzKH2XlRsIsJU+Z2ZxA2lqS/Ik1I0535HIpkbYiqVPtwzB5aKjlqLhTXve63odrPz1ZfL6x52ZR2lZVGhb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727587640; c=relaxed/simple;
	bh=PPBJZVufBNtZq1d5N07kXxihE478jxRrlNxn/5rXPxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pY3HRKP9k+3QTgswkQ8H3EXvwougTkEs4WKIpXaJMQQ86HaCoOpIAZdjaSid5q1JnjpODRai7kdbteSFe1LWrz/UVaI/Dlr/OLBIiIvgv9TcUipV8WkBIww1fiyo+X+N9t6sj6/tSJ+3MvOTdH/k6EdhfETdGwwCNn1AVQxe/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYZpd10i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYZpd10i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727587636; x=1759123636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPBJZVufBNtZq1d5N07kXxihE478jxRrlNxn/5rXPxc=;
  b=VYZpd10iBMUaMdI0KP5DabiKM+YBWqrkUUw7IvSCrLvNTxoPqUyTgdIm
   Z7MDiL06PSB778vecFN62FhkZLRPuieBRov+/28PFbv+WfNu190tLm7re
   ecFJs1zfg4hvyNGxYZRHYPWIqO0Q3mD4mLkg31ytWScYRCEO9EWnT2W6R
   IF3tXVINHhxtZesIY0KepTIqUpVP9pC60rQrhV90RVXaZfDPRyOY9OjNK
   XwTy8wDQ0ZETT3WGJNK/EPWQuEx1+iPDJ5iBjfvBgZ1E70DlBfaApDNty
   bNXILnKdSmYF+X0eYXNGgbRJE3SOY9ic7Jg+Xgjz0a0fsSCkVXQPuEZAh
   Q==;
X-CSE-ConnectionGUID: E5+N6u2kRlCWxa9PhFFOXA==
X-CSE-MsgGUID: aNma/TS0RVyFYs8aZHA5qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37258863"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37258863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 22:27:14 -0700
X-CSE-ConnectionGUID: VBDtqUdQQqiGJOdOcli/yA==
X-CSE-MsgGUID: BNFvsz4vQbub8lp1O09kQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77467224"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 22:27:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sumSc-000Nuj-06;
	Sun, 29 Sep 2024 05:27:10 +0000
Date: Sun, 29 Sep 2024 13:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Ehab <bottaawesome633@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>
Subject: [boqun:lockdep-for-tip 3/3] lib/locking-selftest.c:2713:5: sparse:
 sparse: undefined preprocessor identifier 'CONFIG_DEBUG_LOCK_ALLOC'
Message-ID: <202409291308.MTSMBIvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git lockdep-for-tip
head:   1c4aa09f488868163ce3e23df93a68610303f6af
commit: 1c4aa09f488868163ce3e23df93a68610303f6af [3/3] locking/lockdep: Add a test for lockdep_set_subclass()
config: hexagon-randconfig-r121-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291308.MTSMBIvg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409291308.MTSMBIvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291308.MTSMBIvg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/locking-selftest.c:2713:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_DEBUG_LOCK_ALLOC'
   lib/locking-selftest.c:310:1: sparse: sparse: context imbalance in 'AA_spin' - wrong count at exit
   lib/locking-selftest.c:312:1: sparse: sparse: context imbalance in 'AA_wlock' - wrong count at exit
   lib/locking-selftest.c:314:1: sparse: sparse: context imbalance in 'AA_rlock' - wrong count at exit
   lib/locking-selftest.c:333:13: sparse: sparse: context imbalance in 'rlock_AA1' - wrong count at exit
   lib/locking-selftest.c:339:13: sparse: sparse: context imbalance in 'rlock_AA1B' - wrong count at exit
   lib/locking-selftest.c:359:13: sparse: sparse: context imbalance in 'rlock_AA2' - wrong count at exit
   lib/locking-selftest.c:371:13: sparse: sparse: context imbalance in 'rlock_AA3' - wrong count at exit
   lib/locking-selftest.c:740:1: sparse: sparse: context imbalance in 'double_unlock_spin' - unexpected unlock
   lib/locking-selftest.c:742:1: sparse: sparse: context imbalance in 'double_unlock_wlock' - unexpected unlock
   lib/locking-selftest.c:744:1: sparse: sparse: context imbalance in 'double_unlock_rlock' - unexpected unlock
   lib/locking-selftest.c:771:1: sparse: sparse: context imbalance in 'init_held_spin' - wrong count at exit
   lib/locking-selftest.c:773:1: sparse: sparse: context imbalance in 'init_held_wlock' - wrong count at exit
   lib/locking-selftest.c:775:1: sparse: sparse: context imbalance in 'init_held_rlock' - wrong count at exit
   lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in 'RCU_in_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in 'RCU_in_NOTTHREADED_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in 'RCU_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_raw_spinlock' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_spinlock' - wrong count at exit
   lib/locking-selftest.c:2574:1: sparse: sparse: context imbalance in 'RCU_in_mutex' - wrong count at exit
   lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in 'raw_spinlock_in_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in 'raw_spinlock_in_NOTTHREADED_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in 'raw_spinlock_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_raw_spinlock' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_spinlock' - wrong count at exit
   lib/locking-selftest.c:2575:1: sparse: sparse: context imbalance in 'raw_spinlock_in_mutex' - wrong count at exit
   lib/locking-selftest.c:2510:1: sparse: sparse: context imbalance in 'spinlock_in_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2511:1: sparse: sparse: context imbalance in 'spinlock_in_NOTTHREADED_HARDIRQ' - wrong count at exit
   lib/locking-selftest.c:2517:1: sparse: sparse: context imbalance in 'spinlock_in_SOFTIRQ' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_raw_spinlock' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_spinlock' - wrong count at exit
   lib/locking-selftest.c:2576:1: sparse: sparse: context imbalance in 'spinlock_in_mutex' - wrong count at exit
   lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in 'mutex_in_RCU' - wrong count at exit
   lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in 'mutex_in_RCU_BH' - wrong count at exit
   lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in 'mutex_in_RCU_SCHED' - wrong count at exit
   lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in 'mutex_in_raw_spinlock' - wrong count at exit
   lib/locking-selftest.c:2577:1: sparse: sparse: context imbalance in 'mutex_in_spinlock' - wrong count at exit

vim +/CONFIG_DEBUG_LOCK_ALLOC +2713 lib/locking-selftest.c

  2712	
> 2713	#if CONFIG_DEBUG_LOCK_ALLOC
  2714	static inline const char *rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
  2715	{
  2716		return rwsem->dep_map.name;
  2717	}
  2718	#else
  2719	static inline const char *rw_semaphore_lockdep_name(struct rw_semaphore *rwsem)
  2720	{
  2721		return NULL;
  2722	}
  2723	#endif
  2724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
