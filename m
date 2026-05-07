Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F6423A82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178274; cv=none; b=tMO0jvJvY9PwRxcoFa4q1IGUEL88YtqL8ck4HKNUkVAaOYnPRNswYONJnjZBD/gFM0pt0uqxbYGNlyKVz3H3jIb8RLhzKxR13bjArCL3oAXNqnCaQ4LD+l6dVkyXyVEPmPWzKGUdM75qTOmbMoShAK58A36vgCE5i7lskTGjmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178274; c=relaxed/simple;
	bh=bjDvC85ICkmnrHmY7IXzCtb+nTbquy9aOQRDJTpkyRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rp6OHuLjHbSiZRF74jaC3VtCdiIKGf20BnhLjQIiwmGR4819qumVNnyACuLnke7GXRXvKX2JDLE8xCKJvsZKlga21t7FLRd70Mk71lEfogTZouxKSm4J2TbxQb21EQsUiGsnt6xr3n5XRVwIW+Zx/9ciJK8KSkMdVjHInoGCMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAIPURkU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAIPURkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778178272; x=1809714272;
  h=date:from:to:cc:subject:message-id;
  bh=bjDvC85ICkmnrHmY7IXzCtb+nTbquy9aOQRDJTpkyRo=;
  b=JAIPURkUQtWYxGpAqn0hDT2/nPrxIEbN7JKxhJ8KRZNulkw3uLrBw4ji
   8LgT1Rfu5+oCMge27aOgkCYYC//2l7aUR3AtjeZrSqV5K+cH8FKRP7Pgj
   15w8F9X8DtJmefA2f4f4N00rV3+WjnAgRZQ9F7H5XEevsZHc30W62hoAp
   J9zTG1TT69Wg2dDkBmcWIqqoX0o8E7RgCUp7xtczaYag+3I9JkzjfacSY
   EizVKgP0oAKVkhzIFX0/XWDFTr4s5buwJ2PedvJR5FxFXIIyLWPkHn7tk
   EAP9mXWFanOdfSXDNC3kDbClPfO6RPq4ATwdMvQ3C+A7XcWVBHkE9An+X
   g==;
X-CSE-ConnectionGUID: SQcjR2EQROKD8McFPB5W9Q==
X-CSE-MsgGUID: lOAqHeqMQJqAgYKX//f2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79130888"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79130888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:24:32 -0700
X-CSE-ConnectionGUID: sg5+VoZPR/ycvgkCd8lZOA==
X-CSE-MsgGUID: YQQIu7uJTeip63tsBkc6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233476728"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 11:24:30 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3Od-000000000MT-3Cy8;
	Thu, 07 May 2026 18:24:27 +0000
Date: Fri, 08 May 2026 02:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v4 9/15]
 kernel/sched/core.c:5521:9: warning: braces around scalar initializer
Message-ID: <202605080234.JqOsyXtX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: e7ac735799f7047514ea9badbbdff16e96a5556d [9/15] tick/sched: Move dyntick-idle cputime accounting to cputime code
config: x86_64-randconfig-003-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080234.JqOsyXtX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080234.JqOsyXtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080234.JqOsyXtX-lkp@intel.com/

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
>> kernel/sched/core.c:5521:9: warning: braces around scalar initializer
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |         ^
   kernel/sched/core.c:5521:9: note: (near initialization for 'kernel_cpustat.cpustat[1]')
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
   kernel/sched/core.c:5521:76: error: initialization of 'u64' {aka 'long long unsigned int'} from 'char *' makes integer from pointer without a cast [-Wint-conversion]
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
