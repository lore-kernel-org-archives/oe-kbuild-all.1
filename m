Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA81E526
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565511; cv=none; b=rSzVtpxU136nEHR+hFPZcttkuvcycVyo/AwILZW0jEzM41KG2PHvzSLfXRpIvVNybOJg9Rt/YJN+P36GO1oHG9OrarYJ1XrubbV3WHB5s7fo52gIYIRklvyX3b9JZrmwNW42ARtMzPGcPKUtcY+JALdXaIxpSmfaN2eqpd6flV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565511; c=relaxed/simple;
	bh=kP3Jxnx6/Kc5yHweneqQOvPD4gKRx5QKbzKRRLghXlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0dKYWpWRdJyjkm2Fqu169aPDb4tc8CQ5DMxW8OYCLSYEIAfY97x1RA+x3KOI/xldkzhy3zSP3c3qFOGktbkqywxFn9hWp1PhuPKf1Nh6NariRWYBDOm8K6EN2gF9SL6WS0QnGVTvKGYEp5+onFmlKp6GnjcFCejms6M+COj238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KObPwZ48; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KObPwZ48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737565510; x=1769101510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kP3Jxnx6/Kc5yHweneqQOvPD4gKRx5QKbzKRRLghXlE=;
  b=KObPwZ48bhr8yPUyMWrBp93KEbTzHCq97tBLL9qxyBkg5Xd822W8YwWl
   kamFbko7VwuQJa8F/5lw1BISdH3qoU4YZ7liTbL6pepKx0NY09wu1pALn
   vovh+W6QDZcyaTpvFKm77n9CxZ48+qtJQGVfGkm/tMJ0mXn7ydVpfHQDe
   4MjZantl+bkUAVB0+08BRu+4Nv0YwxLlu4rp1TeZLam49/tVkJMy9rdpn
   uBzEn6DTc6xBk56fmC8bVoTTwkBUndWTyH0IfSUa+ZDV57CdYXWAsjIZB
   1aMqwbJTxgFx/+0f+FCNeePN8K5mHmD5NJIORKdV9VB64d57jAw5iKGKz
   w==;
X-CSE-ConnectionGUID: FdNRa73+TAygminh5Vl+aA==
X-CSE-MsgGUID: geZhtB0MQM+OPgLqc2m8xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38284046"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38284046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:05:09 -0800
X-CSE-ConnectionGUID: V2v2mw2ZSwSIVFSRGbsmcg==
X-CSE-MsgGUID: JNsQNnTcRTeQD2I2rANQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144451659"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2025 09:05:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taeA5-000a8d-0X;
	Wed, 22 Jan 2025 17:05:05 +0000
Date: Thu, 23 Jan 2025 01:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/rt.c:982:50: error: 'struct rq' has no member named 'cpu'
Message-ID: <202501230010.XY9Bfcf3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suleiman,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: 60159db699f14e547ce5ede2a7bad9b99e24cd3f [1/1] CHROMIUM: x86: rt: Avoid throttling over host suspend.
config: arm-randconfig-003-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230010.XY9Bfcf3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230010.XY9Bfcf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230010.XY9Bfcf3-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> kernel/sched/rt.c:982:50: error: 'struct rq' has no member named 'cpu'
     982 |                     "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
         |                                                  ^~
   include/linux/printk.h:460:40: note: in definition of macro 'printk_deferred_once'
     460 |                 printk_deferred(fmt, ##__VA_ARGS__);            \
         |                                        ^~~~~~~~~~~


vim +982 kernel/sched/rt.c

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
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16   981  		printk_deferred_once("suspected host suspend. cpu %d rt_time "
4f653d6975381f kernel/sched/rt.c Suleiman Souhlal     2024-03-16  @982  		    "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
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

:::::: The code at line 982 was first introduced by commit
:::::: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 CHROMIUM: arm64: rt: Avoid throttling over host suspend.

:::::: TO: Suleiman Souhlal <suleiman@google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
