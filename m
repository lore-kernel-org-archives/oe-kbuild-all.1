Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA76D1B0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174436; cv=none; b=eYIzPjFyD9IZ1PSQI45x88Q+ySzVXkWZQ52ujesNkV6+32UKHZ1EhWLyA3LNUNPSb9iiUt3RUpkBxfU2aeXIbU4ACCoWakY9fAW9rTmyh703GTJn9ciUsD0+kLkTN8xmtCgF6KYx7y2VRNjoGFKm8+FmNyBJRU32FR4s805xPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174436; c=relaxed/simple;
	bh=ZWyPChhyxDaVhGoXHb1MLKr/U3QAqNL0rIaNjJV8MBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4SloD67R/thvo2swoj3fDEqRZmwAc5PqawPGtd/sORKSmZBEzNNOygfsxnYZ4kTVhugRBpQClgNT8p0urRRhksD5zfBMu9QFrJ6pdIAI6CoRmuqirNOySwV3lCpG3sDrQP89TziQvMVptWZeyCXy0wA1ucigtOkwT99SoS0elk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tcw8OzFR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tcw8OzFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174435; x=1746710435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWyPChhyxDaVhGoXHb1MLKr/U3QAqNL0rIaNjJV8MBA=;
  b=Tcw8OzFRWdW7dGWe4cZeR1js5p3TikMBGWuDIkJbIyXRSUhNTN0Ewbrw
   D+HuJfFDGKk8S6RFbQ7VWZKT+Qh3yRpoPMIfDvDU6dF1YiSk38nXPaA0w
   QGCSTwwVCEEdqOmG7aVr1g/5B9kdzG4SqyKVOLB+RQsa74obKsZ+BXw7+
   B0l0vq2o9iJjCI+sQDFp5LqNB3G2gtywbLL7IgwPQTe9rwwyrnNlcMvEg
   z1kACYZTlKLt1uuMKbQeS6xGt+hhIYhtkUG2X5cc1Yh3Aa54IfMt0y9co
   rzXojxEXO0GDcICcfCRpggVudnsIpnoC6rN7pfECVmPa7YcaSiHJamc6F
   w==;
X-CSE-ConnectionGUID: 3ZmY3IC8TJ65rfefRiUlxw==
X-CSE-MsgGUID: jg83LJ6jR3CT05FYW2yLhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14839195"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="14839195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:20:32 -0700
X-CSE-ConnectionGUID: 6ju0KFzWSTqopLrRHg1r/Q==
X-CSE-MsgGUID: 8uSHWQ/OR0KHV3av8Nq4UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="66315103"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2024 06:20:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4hDg-0003R4-1K;
	Wed, 08 May 2024 13:20:28 +0000
Date: Wed, 8 May 2024 21:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 12/12]
 kernel/sched/rt.c:982:43: warning: format specifies type 'long' but the
 argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202405082144.cX4OuwUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   60159db699f14e547ce5ede2a7bad9b99e24cd3f
commit: 60159db699f14e547ce5ede2a7bad9b99e24cd3f [12/12] CHROMIUM: x86: rt: Avoid throttling over host suspend.
config: i386-buildonly-randconfig-002-20240508 (https://download.01.org/0day-ci/archive/20240508/202405082144.cX4OuwUT-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082144.cX4OuwUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082144.cX4OuwUT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rt.c:6:
   kernel/sched/sched.h:1448:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1448 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:260:6: warning: no previous prototype for function 'free_rt_sched_group' [-Wmissing-prototypes]
     260 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^
   kernel/sched/rt.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     260 | void free_rt_sched_group(struct task_group *tg) { }
         | ^
         | static 
   kernel/sched/rt.c:262:5: warning: no previous prototype for function 'alloc_rt_sched_group' [-Wmissing-prototypes]
     262 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^
   kernel/sched/rt.c:262:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     262 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/rt.c:675:6: warning: no previous prototype for function 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     675 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^
   kernel/sched/rt.c:675:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     675 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         | ^
         | static 
>> kernel/sched/rt.c:982:43: warning: format specifies type 'long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     982 |                     "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
         |                       ~~~                               ^~~~~~~~~~~~~~
         |                       %llu
   include/linux/printk.h:460:26: note: expanded from macro 'printk_deferred_once'
     460 |                 printk_deferred(fmt, ##__VA_ARGS__);            \
         |                                 ~~~    ^~~~~~~~~~~
   5 warnings generated.


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
