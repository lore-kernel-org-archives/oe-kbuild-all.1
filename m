Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E03F23D9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166434; cv=none; b=iFb2Hp+CpiR6ZP4oOCCgD/TyMe8CXIrnD1ckpkgmb2gfUAKdp+7kgaO337687j8YF/n551E7LT3h2X+no0Dam7H5M9bxP7BJFl25nHj7S3v9Ei3Ad82Ss+iFnD7qQUKcolJHc4do3VuhMcfZRNpVw1d/j272kShVeMH9FdXY1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166434; c=relaxed/simple;
	bh=S9mPNeAFB0VqFbjkPaDBiJ5YLcNq6T2QCX9DZtmjkgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XC2VyfMO8YsIaVGXz015WcO9tr4/lXOfHhKCjpwjljex/Ee5wbLD2bZpiu/ozeTReB0FQdpVkt/WMQyBAgG12NKHFeDpAt8v9BLuS7YnS7zlVFS9lvTeik/Ha8XE9D7E2Ar8TZGIGHlbnidZqMT29QrUqiGiR1W03Si0ibXUgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYqyAhS7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYqyAhS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778166432; x=1809702432;
  h=date:from:to:cc:subject:message-id;
  bh=S9mPNeAFB0VqFbjkPaDBiJ5YLcNq6T2QCX9DZtmjkgo=;
  b=HYqyAhS7+HU2cJRf4SfOMo4i3ZhB4ihb8tYHixW5kHmNhkHtcb7VOvLu
   EJ39Fhpb9RkesQByCHCftX7qHGtiwVZq2ILhESK8lMxcSZrotgmqul/E7
   TKXJzd23mLr8gjlQGDm0YwUbr21eYd/rc9qxy4NoPMMJP1Lc2Kfw/AdDT
   jBKrH3h/lXM339GoWZwB2+1n+0wt3bpk5CliZTUQbUwk2L05X8yUEHdaW
   +TGqXGVO1V77cD4OdqEPSiT05H4+i6KV6cs4rEH2vUvODan3KzeC4N11C
   6/UW4xZm4fAeDs9alaLrte4G0tSo9QQNbrcZ7vF/b1yYJJwdDdjms2sf+
   A==;
X-CSE-ConnectionGUID: GFP+bN/xQmGove9lzu1L+A==
X-CSE-MsgGUID: qsk91Mn2RGK5bX/5De6gKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78839324"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78839324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 08:07:12 -0700
X-CSE-ConnectionGUID: vD4chGbfQD2DvobCNdMGnw==
X-CSE-MsgGUID: rbKxupg/TRG/2ZbzmH28MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236599108"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2026 08:07:11 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL0Jg-000000000Bt-230V;
	Thu, 07 May 2026 15:07:08 +0000
Date: Thu, 07 May 2026 23:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v4 9/15]
 kernel/sched/core.c:5521:10: error: 'struct kernel_cpustat' has no member
 named 'idle_sleeptime_seq'
Message-ID: <202605072346.PjrwkNFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: e7ac735799f7047514ea9badbbdff16e96a5556d [9/15] tick/sched: Move dyntick-idle cputime accounting to cputime code
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605072346.PjrwkNFq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072346.PjrwkNFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072346.PjrwkNFq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5521:10: error: 'struct kernel_cpustat' has no member named 'idle_sleeptime_seq'
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
>> include/linux/seqlock.h:88:29: error: field name not in record or union initializer
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
