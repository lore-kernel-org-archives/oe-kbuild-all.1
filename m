Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CE3B634C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482275; cv=none; b=MavQQwPlgLUIYCm7EybOG2AaZwU9TS+Tpz+c1YvaEYr3SpV940McLmlHlE3ZV90YhpK/ixopZCzzsJfvHBxTYfPtvVvtKjm4EsuCfZ6bz1Hlc276RHA6VFv2I8QH0PZFjZ9P3jZ5UuRee2yyl3farVaxlp1upUZoU8yiiUFs9X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482275; c=relaxed/simple;
	bh=7LvJ/NtJsBTGlSU9F1Di8KWxl66HJhw3+kKZy1XqlEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=glYDZUy8c4mYF541v8nkT8OBaNCOE5ejTPsO55Ura62iLJx5367ewQeRA6MFTv1u+av7qIN0BlA5LS6vSu7Vyu1mEZI5hyidrLr/pyzJ27YBK4cD48d/YTlGcJyp7TsFWAfTmqkcKX85tOAZJ2WvqY4hcRhe9BNoEd08TM46xO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQWZ5o+8; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQWZ5o+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789482273; x=1821018273;
  h=date:from:to:cc:subject:message-id;
  bh=7LvJ/NtJsBTGlSU9F1Di8KWxl66HJhw3+kKZy1XqlEk=;
  b=fQWZ5o+8fvOQRqicS3Nz86LpceKI/DO25EgVcHqTE9SJ/G/U4nzU0UFX
   uEtPueExqiGY/Jomv9i+ZfJo4UYKp4VinW8afSxYNxRwEkWBN87xkT/eP
   FUCYP9s9wHtyV/Ctk0TEz2gEgah6a51gmCE5ICbJtNiV9ZJUDMm6QWauB
   A4QSkaVRb3UoYH6Dx/lYernmN52RVbkmmZvNyHVmnQgqFIWKq/NdkTDbL
   /iSqhOGBTHHPR0ZP3CtNw3suOgK2rhLdV5VjIrjbcw1IOrTGrXml3f5xn
   LjtzatCpisdA6StNHJkcxXVqmcfcfwuqnaLNTT0VwmVzLVZNYzJ8TY6CP
   w==;
X-CSE-ConnectionGUID: cDaMrOGiQP2MLCK+wzWnGg==
X-CSE-MsgGUID: vdvEL9qAQR+BNsFmhvqsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="354945"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="354945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:24:33 -0700
X-CSE-ConnectionGUID: Nlt8bQz+TMafSjlkFJF6pQ==
X-CSE-MsgGUID: YtVzDF0qTaWZRgfdjuQj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276554534"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2026 07:24:31 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6U5F-000000000ct-04sY;
	Tue, 15 Sep 2026 14:24:29 +0000
Date: Tue, 15 Sep 2026 16:23:55 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 118/118] kernel/sched/alt_core.c:5356:6:
 warning: no previous prototype for function 'rt_mutex_futex_pre_schedule'
Message-ID: <202609151610.HZbfQR10-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   ecdb5900a34a8291a8457c0e29cca911c55dbf67
commit: ecdb5900a34a8291a8457c0e29cca911c55dbf67 [118/118] sched/alt: [Sync] b715872ef0cc futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260915/202609151610.HZbfQR10-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151610.HZbfQR10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151610.HZbfQR10-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:5356:6: warning: no previous prototype for function 'rt_mutex_futex_pre_schedule' [-Wmissing-prototypes]
    5356 | void rt_mutex_futex_pre_schedule(void)
         |      ^
   kernel/sched/alt_core.c:5356:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5356 | void rt_mutex_futex_pre_schedule(void)
         | ^
         | static 
>> kernel/sched/alt_core.c:5375:6: warning: no previous prototype for function 'rt_mutex_futex_post_schedule' [-Wmissing-prototypes]
    5375 | void rt_mutex_futex_post_schedule(void)
         |      ^
   kernel/sched/alt_core.c:5375:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5375 | void rt_mutex_futex_post_schedule(void)
         | ^
         | static 
   kernel/sched/alt_core.c:2051:19: warning: stack frame size (2176) exceeds limit (2048) in 'select_task_rq' [-Wframe-larger-than]
    2051 | static inline int select_task_rq(struct task_struct *p, int wake_flags)
         |                   ^
   kernel/sched/alt_core.c:4703:20: warning: stack frame size (2232) exceeds limit (2048) in 'prio_balance' [-Wframe-larger-than]
    4703 | static inline void prio_balance(struct rq *rq, const int cpu)
         |                    ^
   4 warnings generated.


vim +/rt_mutex_futex_pre_schedule +5356 kernel/sched/alt_core.c

  5351	
  5352	/*
  5353	 * Used within the futex syscall context, skips sched_submit_work() because none
  5354	 * its work will be done. Asserts ensure that it is indeed the case.
  5355	 */
> 5356	void rt_mutex_futex_pre_schedule(void)
  5357	{
  5358		lockdep_assert(!(current->flags & (PF_WQ_WORKER | PF_IO_WORKER)));
  5359		lockdep_assert(!current->plug);
  5360		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  5361	}
  5362	
  5363	void rt_mutex_schedule(void)
  5364	{
  5365		lockdep_assert(current->sched_rt_mutex);
  5366		__schedule_loop(SM_NONE);
  5367	}
  5368	
  5369	void rt_mutex_post_schedule(void)
  5370	{
  5371		sched_update_worker(current);
  5372		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5373	}
  5374	
> 5375	void rt_mutex_futex_post_schedule(void)
  5376	{
  5377		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5378	}
  5379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
