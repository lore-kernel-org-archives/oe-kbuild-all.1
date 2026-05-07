Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9545348D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178333; cv=none; b=B2fTFa3EVtwHAi0QHer43Mk0laEKPtYbBN767xMCE6PBYRVgMOTXuhkfjVgYbHZ3MYBzdQ08V5WXQ4XW57F4u5Pb85xciZxTA+dagGOGwOKkW7Bp6t90q1a7B4/8AfXkgD6enB0KjJuukeh8W0Bkvl66dQJhC2e5teYX8PPV7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178333; c=relaxed/simple;
	bh=uArUatPYavwYAjko2vXo2BXWeThLdFaBgRbZ33hwg9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lMxeU+N1Lle29d2TvWwTs3Lk3MjtrU079ppVtozuYGOmDJ8g3wS93PU0aS/DmUEuOP0ph5HP9XLAX1NuBqBHAuND+fh+KhfzTE35fvkifIcynSati10A5TrWlN6nLvb7KDCAvCkwlK1VDqqA1fIjIYZ079Rau/eU1mSb7Mh0b38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e//KEJos; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e//KEJos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778178332; x=1809714332;
  h=date:from:to:cc:subject:message-id;
  bh=uArUatPYavwYAjko2vXo2BXWeThLdFaBgRbZ33hwg9A=;
  b=e//KEJosxy9NOPkWZSN5hBrNqJqROvZTtRG+Qc7LOrQlDCJNRQx1bNxI
   Ihc81+j30jK8A2zqwkiZpqCMxxsWSsB5zVrfBl5xM6KT5gWHDCZI8zAoj
   ZPK25hb1/IvfeBem70mH+ZHAbfgCUiWS33P7JGRIv3OldGjQyhyQ2Of4B
   /L4ezNCRCsO6HI35zpxwGXjES5u+6aQi/zizn4FVlbxWe578kGYbvSUGl
   Tss6SJBWqIYqXvo1Uay/XyhLXCE5FOFqpqlZWwZEnU/TwzZyGQr7fYcw0
   DVCkPAqfCStqpgpBCPzgZRwmAW4DaM5UPHxz1R9Mw9gL8McHqcppDDenu
   w==;
X-CSE-ConnectionGUID: PKj/aO3ORDyxNERJi/AJIg==
X-CSE-MsgGUID: HwUQWb4oTX2DdiX+SzV3EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79185411"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79185411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:25:31 -0700
X-CSE-ConnectionGUID: GBUgEy7nRQavdOUSrhnjTQ==
X-CSE-MsgGUID: xgPPYTt7TiCT8ApuasF3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241518765"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 11:25:30 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3Pb-000000000MX-3Zym;
	Thu, 07 May 2026 18:25:27 +0000
Date: Fri, 08 May 2026 02:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v4 9/15]
 kernel/sched/core.c:5521:76: warning: initialization of 'u64' {aka 'long long
 unsigned int'} from 'char *' makes integer from pointer without a cast
Message-ID: <202605080242.JY1us76S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: e7ac735799f7047514ea9badbbdff16e96a5556d [9/15] tick/sched: Move dyntick-idle cputime accounting to cputime code
config: parisc-randconfig-002-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080242.JY1us76S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080242.JY1us76S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080242.JY1us76S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:5521:10: error: 'struct kernel_cpustat' has no member named 'idle_sleeptime_seq'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |          ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:12:
   include/linux/seqlock.h:88:29: error: field name not in record or union initializer
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                             ^
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   include/linux/seqlock.h:88:29: note: (near initialization for 'kernel_cpustat.cpustat')
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                             ^
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   include/linux/seqlock.h:55:17: error: field name not in record or union initializer
      55 |                 .dep_map = { .name = #lockname }
         |                 ^
   include/linux/seqlock.h:88:44: note: in expansion of macro 'SEQCOUNT_DEP_MAP_INIT'
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   include/linux/seqlock.h:55:17: note: (near initialization for 'kernel_cpustat.cpustat')
      55 |                 .dep_map = { .name = #lockname }
         |                 ^
   include/linux/seqlock.h:88:44: note: in expansion of macro 'SEQCOUNT_DEP_MAP_INIT'
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   kernel/sched/core.c:5521:9: warning: braces around scalar initializer
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |         ^
   kernel/sched/core.c:5521:9: note: (near initialization for 'kernel_cpustat.cpustat[1]')
   In file included from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:12:
   include/linux/seqlock.h:55:30: error: field name not in record or union initializer
      55 |                 .dep_map = { .name = #lockname }
         |                              ^
   include/linux/seqlock.h:88:44: note: in expansion of macro 'SEQCOUNT_DEP_MAP_INIT'
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   include/linux/seqlock.h:55:30: note: (near initialization for 'kernel_cpustat.cpustat[1]')
      55 |                 .dep_map = { .name = #lockname }
         |                              ^
   include/linux/seqlock.h:88:44: note: in expansion of macro 'SEQCOUNT_DEP_MAP_INIT'
      88 | #define SEQCNT_ZERO(name) { .sequence = 0, SEQCOUNT_DEP_MAP_INIT(name) }
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
>> kernel/sched/core.c:5521:76: warning: initialization of 'u64' {aka 'long long unsigned int'} from 'char *' makes integer from pointer without a cast [-Wint-conversion]
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                                                                            ^
   include/linux/seqlock.h:55:39: note: in definition of macro 'SEQCOUNT_DEP_MAP_INIT'
      55 |                 .dep_map = { .name = #lockname }
         |                                       ^~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   kernel/sched/core.c:5521:76: note: (near initialization for 'kernel_cpustat.cpustat[1]')
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                                                                            ^
   include/linux/seqlock.h:55:39: note: in definition of macro 'SEQCOUNT_DEP_MAP_INIT'
      55 |                 .dep_map = { .name = #lockname }
         |                                       ^~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   kernel/sched/core.c:5521:76: error: initializer element is not computable at load time
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                                                                            ^
   include/linux/seqlock.h:55:39: note: in definition of macro 'SEQCOUNT_DEP_MAP_INIT'
      55 |                 .dep_map = { .name = #lockname }
         |                                       ^~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~
   kernel/sched/core.c:5521:76: note: (near initialization for 'kernel_cpustat.cpustat[1]')
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                                                                            ^
   include/linux/seqlock.h:55:39: note: in definition of macro 'SEQCOUNT_DEP_MAP_INIT'
      55 |                 .dep_map = { .name = #lockname }
         |                                       ^~~~~~~~
   kernel/sched/core.c:5521:31: note: in expansion of macro 'SEQCNT_ZERO'
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |                               ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +5521 kernel/sched/core.c

  5518	
  5519	DEFINE_PER_CPU(struct kernel_stat, kstat);
  5520	DEFINE_PER_CPU(struct kernel_cpustat, kernel_cpustat) = {
> 5521		.idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
  5522	};
  5523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
