Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7F34C140
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 04:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262734; cv=none; b=gdh4K3xT/ctY4hAg+0ONARG5bQ5GsFZC5bAYJQdFO+MwvUD/FJIWv5fhpUtVf/fug5dA0a6d7Q7EusTFAqLaojbFULeub6qTXRsFOOi0VmtbzM2yHaZiaeZzSHqJwvCLJMonVyT1WN4J+2W5nC1p+OZIotr5iQw+Kr5w0TST6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262734; c=relaxed/simple;
	bh=O6xO8rnfFW9yATqtSKanZ5AFaoQB/yIJZeNUZ4oFlEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bVuwU0LQKcWwLAaoG12bVfUjoLJMrTcK6sSBmF1zadscfZzY2VxckG3acUeOxRs6MDzwRMO0ZvKhjnUZ/CjIEiooVn/g+BTHyCbkUUB82RlA061GL0lq2Ty1fWlHQe6g03IBQThLs7hXDIAmNg0Eof7ihl6D0z9uJNePxkkrBJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVoFXx/z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVoFXx/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791262733; x=1822798733;
  h=date:from:to:cc:subject:message-id;
  bh=O6xO8rnfFW9yATqtSKanZ5AFaoQB/yIJZeNUZ4oFlEc=;
  b=iVoFXx/zM8lsNBJBKQ7PpXuBfhV9JCQEw0aRN/uFSBd+kARgdTRLu1ZY
   CZdekXTXpbVXhSjxEvaZGEyNVnCnPGop+D7fHn4nk/BSWxF6vayS923jp
   6FH+9yiudtOXgJ9zuxe35ry2Fxffs73oIO9Ym/qJa1b5222ECQjMYFJQT
   K6NxkudHUnQUCAIBBSjjgOk6KIArmJT8m6lBBd4G1oGrbXXIE6nyavkNd
   1r4Vz8PerIl/bwPLI94vN3AoV5cokCIUE4MsSfcXc63z/PFRdeTk+Xhq6
   ijanQ4181z7KRbvqPRqzxQB3KLq9L4uhHy1Yod1H+87GoTnTH7OMNB7HE
   A==;
X-CSE-ConnectionGUID: XYBjsLsEQUeTgBxtP6Ig7g==
X-CSE-MsgGUID: C0fznqotQPKU9KsfZTSZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101263400"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="101263400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:58:52 -0700
X-CSE-ConnectionGUID: vBxAg5F/QhGmK/LBMqZ1Ow==
X-CSE-MsgGUID: M5NMLjiWSdeEDwimYmKAGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="306537355"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 21:58:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDxGK-000000001Au-2Umr;
	Tue, 06 Oct 2026 04:58:48 +0000
Date: Tue, 06 Oct 2026 12:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 kernel/sched/rt.c:981:38: warning: format '%ld' expects argument of type
 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'}
Message-ID: <202610061221.k97B5AiT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   6f82755ed602e815541b2c6617a3f30f53500cdc
commit: 60159db699f14e547ce5ede2a7bad9b99e24cd3f [4/4] CHROMIUM: x86: rt: Avoid throttling over host suspend.
config: arm-u8500_defconfig (https://download.01.org/0day-ci/archive/20261006/202610061221.k97B5AiT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061221.k97B5AiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061221.k97B5AiT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/rt.c:260:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     260 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:262:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     262 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:675:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     675 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:17,
                    from include/asm-generic/bug.h:20,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/rt.c:6:
   kernel/sched/rt.c: In function 'sched_rt_runtime_exceeded':
>> kernel/sched/rt.c:981:38: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     981 |                 printk_deferred_once("suspected host suspend. cpu %d rt_time "
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     982 |                     "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
         |                                                         ~~~~~~~~~~~~~~
         |                                                              |
         |                                                              u64 {aka long long unsigned int}
   include/linux/printk.h:460:33: note: in definition of macro 'printk_deferred_once'
     460 |                 printk_deferred(fmt, ##__VA_ARGS__);            \
         |                                 ^~~


vim +981 kernel/sched/rt.c

6f505b16425a51 kernel/sched_rt.c Peter Zijlstra       2008-01-25   955  
9f0c1e560c4332 kernel/sched_rt.c Peter Zijlstra       2008-02-13   956  static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra       2008-01-25   957  {
9f0c1e560c4332 kernel/sched_rt.c Peter Zijlstra       2008-02-13   958  	u64 runtime = sched_rt_runtime(rt_rq);
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25   959  
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25   960  	if (rt_rq->rt_throttled)
23b0fdfc9299b1 kernel/sched_rt.c Peter Zijlstra       2008-02-13   961  		return rt_rq_throttled(rt_rq);
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25   962  
5b680fd61388ab kernel/sched/rt.c Shan Hai             2011-11-29   963  	if (runtime >= sched_rt_period(rt_rq))
ac086bc22997a2 kernel/sched_rt.c Peter Zijlstra       2008-04-19   964  		return 0;
ac086bc22997a2 kernel/sched_rt.c Peter Zijlstra       2008-04-19   965  
7def2be1dc6799 kernel/sched_rt.c Peter Zijlstra       2008-06-05   966  	balance_runtime(rt_rq);
ac086bc22997a2 kernel/sched_rt.c Peter Zijlstra       2008-04-19   967  	runtime = sched_rt_runtime(rt_rq);
7def2be1dc6799 kernel/sched_rt.c Peter Zijlstra       2008-06-05   968  	if (runtime == RUNTIME_INF)
7def2be1dc6799 kernel/sched_rt.c Peter Zijlstra       2008-06-05   969  		return 0;
ac086bc22997a2 kernel/sched_rt.c Peter Zijlstra       2008-04-19   970  
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   971  	/*
60159db699f14e kernel/sched/rt.c Suleiman Souhlal     2024-05-07   972  	 * XXX Temporary workaround for b/307775867 and b/336912980.
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   973  	 * We think we ran for this long because the host suspended while we
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   974  	 * were running, so just pretend we didn't run instead of throttling
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   975  	 * for a long time.
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   976  	 * The "5" was chosen so that it would be highly unlikely for this to
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   977  	 * happen in normal operation, while being small enough to be able to
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   978  	 * mitigate issues for shorter suspends.
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   979  	 */
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   980  	if (unlikely(runtime > 0 && rt_rq->rt_time >= 5 * runtime)) {
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16  @981  		printk_deferred_once("suspected host suspend. cpu %d rt_time "
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   982  		    "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   983  		rt_rq->rt_time = 0;
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   984  	}
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   985  
9f0c1e560c4332 kernel/sched_rt.c Peter Zijlstra       2008-02-13   986  	if (rt_rq->rt_time > runtime) {
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   987  		struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   988  
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   989  		/*
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   990  		 * Don't actually throttle groups that have no runtime assigned
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   991  		 * but accrue some time due to boosting.
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   992  		 */
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18   993  		if (likely(rt_b->rt_runtime)) {
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra       2008-01-25   994  			rt_rq->rt_throttled = 1;
c224815dac9c73 kernel/sched/rt.c John Stultz          2014-06-04   995  			printk_deferred_once("sched: RT throttling activated\n");
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   996  
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   997  			trace_android_vh_dump_throttled_rt_tasks(
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   998  				raw_smp_processor_id(),
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   999  				rq_clock(rq_of_rt_rq(rt_rq)),
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1000  				sched_rt_period(rt_rq),
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1001  				runtime,
bf3d991a7daad2 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1002  				hrtimer_get_expires_ns(&rt_b->rt_period_timer));
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1003  		} else {
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1004  			/*
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1005  			 * In case we did anyway, make it go away,
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1006  			 * replenishment is a joke, since it will replenish us
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1007  			 * with exactly 0 ns.
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1008  			 */
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1009  			rt_rq->rt_time = 0;
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1010  		}
7abc63b1bd412f kernel/sched/rt.c Peter Zijlstra       2011-10-18  1011  
23b0fdfc9299b1 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1012  		if (rt_rq_throttled(rt_rq)) {
9f0c1e560c4332 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1013  			sched_rt_rq_dequeue(rt_rq);
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1014  			return 1;
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1015  		}
23b0fdfc9299b1 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1016  	}
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1017  
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1018  	return 0;
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1019  }
fa85ae2418e684 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1020  

:::::: The code at line 981 was first introduced by commit
:::::: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 CHROMIUM: arm64: rt: Avoid throttling over host suspend.

:::::: TO: Suleiman Souhlal <suleiman@google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
