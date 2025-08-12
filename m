Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDFF1A9F9A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977928; cv=none; b=oRpazd53zIuhF7Mia5PWXd0C5Xl2lfX2jEfeuk7jRnGvCGwZxrjRM+ZBw1GAwU5yF9XcMapHnJ4iDJ9gUFA1uDJHhhe1R9JlMnCBrOggi3D+keTSw5rWwQmKgkYHoSiLHFupW3zPI2OMc25MMqzOnv9heIby6+ZCuHmGpL2W9pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977928; c=relaxed/simple;
	bh=DbXXW8eUHJC3wr/jnYM9oeqOaiJEfjC5JKp8HO1rgTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRlJYUekbOllBXcxVmwxgV0yWCtdyMeR3OzVOQURW6CexwZZoSffjoqF5obFYfoNKaS6jDMQLYVYBBKbGQXvbrd9yBrbN08xXlt1K/NZc137HdJeDojKXxZ4WncvWNObltTuoBmxpF00SUZvDMIAvg3lRTesz16bIq29IInSpt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr6cuu4C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr6cuu4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754977927; x=1786513927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbXXW8eUHJC3wr/jnYM9oeqOaiJEfjC5JKp8HO1rgTg=;
  b=lr6cuu4CN11qXTAjDQvNm6mc2fgjefwcBpbZtSe+KDdbegezOUdfzgPC
   KY3P7am91ZjLfBgjr40mowRwnlyzC99XnrjqC+QTKcJXm7en6FOrHVT1a
   2KJ1YxekwwDzm3bZ1qKtEOA6S6PSRWmcfyS9BRNFNRAlwqgce/uY84thc
   118olhoNomwIHqFFIoWH7Q30EMtXoA2k01Lu863bEfpujsWB+Ax0Xmn8x
   ofCd2BjFXtjqELP1APjsnruqOs/lfJUCZOJwAF1AZY83K5J3sX4ThCFwe
   z5AwCO5k01TGrHXv3pHwWWm7ab3UV4AeWuV32pv/vsAfSfZU25QgRCAvi
   A==;
X-CSE-ConnectionGUID: cRJvIgbfT6i8DS2idccavw==
X-CSE-MsgGUID: tdcJsPLIR5CaIiDo0O1HQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60868560"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60868560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 22:52:05 -0700
X-CSE-ConnectionGUID: bdxIZka0QXaxJOONE/+7DQ==
X-CSE-MsgGUID: EGsPTLsFReGcf6rr4SH9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165997571"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2025 22:52:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulhvW-0006Ro-11;
	Tue, 12 Aug 2025 05:52:02 +0000
Date: Tue, 12 Aug 2025 13:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/3]
 kernel/sched/core.c:2597:12: warning: no previous prototype for
 '__migrate_task'
Message-ID: <202508121323.uS2dSCYt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   aae56dea12d89f1b7d3127e2619072145dc375e5
commit: c05e84a239bffd0a739f4237a6b6c13c3735252d [0/3] Merge bf76f23aa1c1 ("Merge tag 'sched-core-2025-07-28' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip") into android-mainline
config: x86_64-buildonly-randconfig-004-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121323.uS2dSCYt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121323.uS2dSCYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121323.uS2dSCYt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:2597:12: warning: no previous prototype for '__migrate_task' [-Wmissing-prototypes]
    2597 | struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
         |            ^~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'try_to_wake_up':
>> kernel/sched/core.c:4319:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    4319 |         if (READ_ONCE(p->__state) & TASK_UNINTERRUPTIBLE)
         |         ^~
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   include/linux/compiler.h:85:20: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
      85 | # define barrier() __asm__ __volatile__("": : :"memory")
         |                    ^~~~~~~
   include/asm-generic/barrier.h:117:25: note: in expansion of macro 'barrier'
     117 | #define smp_rmb()       barrier()
         |                         ^~~~~~~
   include/asm-generic/barrier.h:232:49: note: in expansion of macro 'smp_rmb'
     232 | #define smp_acquire__after_ctrl_dep()           smp_rmb()
         |                                                 ^~~~~~~
   kernel/sched/core.c:4345:17: note: in expansion of macro 'smp_acquire__after_ctrl_dep'
    4345 |                 smp_acquire__after_ctrl_dep();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__migrate_task +2597 kernel/sched/core.c

5cc389bcee088b Peter Zijlstra 2015-06-11  2587  
5cc389bcee088b Peter Zijlstra 2015-06-11  2588  /*
d1ccc66df8bfe3 Ingo Molnar    2017-02-01  2589   * Move (not current) task off this CPU, onto the destination CPU. We're doing
5cc389bcee088b Peter Zijlstra 2015-06-11  2590   * this because either it can't run here any more (set_cpus_allowed()
5cc389bcee088b Peter Zijlstra 2015-06-11  2591   * away from this CPU, or CPU going down), or because we're
5cc389bcee088b Peter Zijlstra 2015-06-11  2592   * attempting to rebalance this task on exec (sched_exec).
5cc389bcee088b Peter Zijlstra 2015-06-11  2593   *
5cc389bcee088b Peter Zijlstra 2015-06-11  2594   * So we race with normal scheduler movements, but that's OK, as long
5cc389bcee088b Peter Zijlstra 2015-06-11  2595   * as the task is no longer on this CPU.
5cc389bcee088b Peter Zijlstra 2015-06-11  2596   */
60d27463094b8f Stephen Dickey 2021-11-04 @2597  struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
8a8c69c3277886 Peter Zijlstra 2016-10-04  2598  			  struct task_struct *p, int dest_cpu)
5cc389bcee088b Peter Zijlstra 2015-06-11  2599  {
5cc389bcee088b Peter Zijlstra 2015-06-11  2600  	/* Affinity changed (again). */
175f0e25abeaa2 Peter Zijlstra 2017-07-25  2601  	if (!is_cpu_allowed(p, dest_cpu))
5e16bbc2fb4053 Peter Zijlstra 2015-06-11  2602  		return rq;
5cc389bcee088b Peter Zijlstra 2015-06-11  2603  
8a8c69c3277886 Peter Zijlstra 2016-10-04  2604  	rq = move_queued_task(rq, rf, p, dest_cpu);
5e16bbc2fb4053 Peter Zijlstra 2015-06-11  2605  
5e16bbc2fb4053 Peter Zijlstra 2015-06-11  2606  	return rq;
5cc389bcee088b Peter Zijlstra 2015-06-11  2607  }
60d27463094b8f Stephen Dickey 2021-11-04  2608  EXPORT_SYMBOL_GPL(__migrate_task);
5cc389bcee088b Peter Zijlstra 2015-06-11  2609  

:::::: The code at line 2597 was first introduced by commit
:::::: 60d27463094b8f75b1613025b7ad89f6502315c4 ANDROID: sched: allow access to critical common code for CPU Pause

:::::: TO: Stephen Dickey <quic_dickey@quicinc.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
