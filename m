Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B93364059
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497557; cv=none; b=CunY5OBk9fcK0AVK9cj+2VH3OT6odIFmomlPX7xW9WJp6N0VCW75iaO79fekxhZQLPBwIpBqphUADTop/+e1odNFpOpiBwNf6HKO34f8p9r53r/MyLq5Sfb9IaXr31kdh+vIUamy+QivQnaLLY6SomOMUFynbWX+fEWlk2J63Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497557; c=relaxed/simple;
	bh=nZL0ZfxMYss3a94T6hYtMH62yg7z8p7I30yfWRxGPeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=de4sOwte7Mulj4Q7cy43zPSeHrENfJrD5WDZcdRpisGIVtfeZDXXRH6MRrGhT2NjxCVrCbhyMgcd1fMC3Q+S/WtAFsYjQx+n/rAeja9+cTVGssru3MAqXjVIIpeZMKiw5DH8j2jvbNB3h1tIeiW9oHclPcp003jSd33DItCK3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g15tsLh+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g15tsLh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778497557; x=1810033557;
  h=date:from:to:cc:subject:message-id;
  bh=nZL0ZfxMYss3a94T6hYtMH62yg7z8p7I30yfWRxGPeM=;
  b=g15tsLh+JSLoJTG7fBaoQQ1pMCryUtmJpqRkrwsO/mGyfDTSlMg20s2f
   0A6E5VszFbMnI6l4o/MDr3DugjZlHPQAFrfD5GiFTxLdQQ3ZFwKMkw8ox
   LJfUQsFJG1L0d6VpbqlJzfTRpmVfVkeb5oT/uRjwniwwlf8ED9zbfqULi
   HCeOHPq6PewWJPHCGGFL6D6aYOw7QIZzjJPOcgnkWKUCDGLoPWQP8WXsl
   PJnZ/iOBARzUnftxqPnDUg6AK6iZaGmbqm3/MOyPuL1lMjZjM5PVSCQ1r
   iAvPelcNNX05rjjZDPYb0sfunfjyFj/e9Om7kNj/p3qcMarm32bQ2QGBk
   g==;
X-CSE-ConnectionGUID: A3/2W8f3QDatJo9LGF6wRg==
X-CSE-MsgGUID: +ClNDH0YSIKZdTTwGL9DkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82993200"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82993200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:05:55 -0700
X-CSE-ConnectionGUID: cL32cIMwQCCvXNzV7sRWOA==
X-CSE-MsgGUID: v2rWmmxWR4iikqim4efOZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236448767"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 04:05:52 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMOSM-000000000SN-2Wt9;
	Mon, 11 May 2026 11:05:50 +0000
Date: Mon, 11 May 2026 19:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/rt.c:982:50: error: 'struct rq' has no member named 'cpu'
Message-ID: <202605111830.JNRi4bU0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suleiman,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: 60159db699f14e547ce5ede2a7bad9b99e24cd3f [1/1] CHROMIUM: x86: rt: Avoid throttling over host suspend.
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260511/202605111830.JNRi4bU0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111830.JNRi4bU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111830.JNRi4bU0-lkp@intel.com/

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
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/rt.c:6:
   kernel/sched/rt.c: In function 'sched_rt_runtime_exceeded':
>> kernel/sched/rt.c:982:50: error: 'struct rq' has no member named 'cpu'
     982 |                     "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
         |                                                  ^~
   include/linux/printk.h:139:31: note: in definition of macro 'no_printk'
     139 |                 printk(fmt, ##__VA_ARGS__);             \
         |                               ^~~~~~~~~~~
   kernel/sched/rt.c:981:17: note: in expansion of macro 'printk_deferred_once'
     981 |                 printk_deferred_once("suspected host suspend. cpu %d rt_time "
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +982 kernel/sched/rt.c

6f505b16425a512 kernel/sched_rt.c Peter Zijlstra       2008-01-25   955  
9f0c1e560c43327 kernel/sched_rt.c Peter Zijlstra       2008-02-13   956  static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
6f505b16425a512 kernel/sched_rt.c Peter Zijlstra       2008-01-25   957  {
9f0c1e560c43327 kernel/sched_rt.c Peter Zijlstra       2008-02-13   958  	u64 runtime = sched_rt_runtime(rt_rq);
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25   959  
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25   960  	if (rt_rq->rt_throttled)
23b0fdfc9299b13 kernel/sched_rt.c Peter Zijlstra       2008-02-13   961  		return rt_rq_throttled(rt_rq);
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25   962  
5b680fd61388abb kernel/sched/rt.c Shan Hai             2011-11-29   963  	if (runtime >= sched_rt_period(rt_rq))
ac086bc22997a2b kernel/sched_rt.c Peter Zijlstra       2008-04-19   964  		return 0;
ac086bc22997a2b kernel/sched_rt.c Peter Zijlstra       2008-04-19   965  
7def2be1dc67998 kernel/sched_rt.c Peter Zijlstra       2008-06-05   966  	balance_runtime(rt_rq);
ac086bc22997a2b kernel/sched_rt.c Peter Zijlstra       2008-04-19   967  	runtime = sched_rt_runtime(rt_rq);
7def2be1dc67998 kernel/sched_rt.c Peter Zijlstra       2008-06-05   968  	if (runtime == RUNTIME_INF)
7def2be1dc67998 kernel/sched_rt.c Peter Zijlstra       2008-06-05   969  		return 0;
ac086bc22997a2b kernel/sched_rt.c Peter Zijlstra       2008-04-19   970  
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   971  	/*
60159db699f14e5 kernel/sched/rt.c Suleiman Souhlal     2024-05-07   972  	 * XXX Temporary workaround for b/307775867 and b/336912980.
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   973  	 * We think we ran for this long because the host suspended while we
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   974  	 * were running, so just pretend we didn't run instead of throttling
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   975  	 * for a long time.
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   976  	 * The "5" was chosen so that it would be highly unlikely for this to
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   977  	 * happen in normal operation, while being small enough to be able to
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   978  	 * mitigate issues for shorter suspends.
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   979  	 */
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   980  	if (unlikely(runtime > 0 && rt_rq->rt_time >= 5 * runtime)) {
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   981  		printk_deferred_once("suspected host suspend. cpu %d rt_time "
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16  @982  		    "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   983  		rt_rq->rt_time = 0;
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   984  	}
4f653d6975381f9 kernel/sched/rt.c Suleiman Souhlal     2024-03-16   985  
9f0c1e560c43327 kernel/sched_rt.c Peter Zijlstra       2008-02-13   986  	if (rt_rq->rt_time > runtime) {
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   987  		struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   988  
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   989  		/*
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   990  		 * Don't actually throttle groups that have no runtime assigned
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   991  		 * but accrue some time due to boosting.
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   992  		 */
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18   993  		if (likely(rt_b->rt_runtime)) {
6f505b16425a512 kernel/sched_rt.c Peter Zijlstra       2008-01-25   994  			rt_rq->rt_throttled = 1;
c224815dac9c739 kernel/sched/rt.c John Stultz          2014-06-04   995  			printk_deferred_once("sched: RT throttling activated\n");
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   996  
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   997  			trace_android_vh_dump_throttled_rt_tasks(
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   998  				raw_smp_processor_id(),
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02   999  				rq_clock(rq_of_rt_rq(rt_rq)),
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1000  				sched_rt_period(rt_rq),
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1001  				runtime,
bf3d991a7daad26 kernel/sched/rt.c Sai Harshini Nimmala 2020-11-02  1002  				hrtimer_get_expires_ns(&rt_b->rt_period_timer));
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1003  		} else {
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1004  			/*
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1005  			 * In case we did anyway, make it go away,
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1006  			 * replenishment is a joke, since it will replenish us
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1007  			 * with exactly 0 ns.
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1008  			 */
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1009  			rt_rq->rt_time = 0;
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1010  		}
7abc63b1bd412f7 kernel/sched/rt.c Peter Zijlstra       2011-10-18  1011  
23b0fdfc9299b13 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1012  		if (rt_rq_throttled(rt_rq)) {
9f0c1e560c43327 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1013  			sched_rt_rq_dequeue(rt_rq);
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1014  			return 1;
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1015  		}
23b0fdfc9299b13 kernel/sched_rt.c Peter Zijlstra       2008-02-13  1016  	}
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1017  
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1018  	return 0;
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1019  }
fa85ae2418e6843 kernel/sched_rt.c Peter Zijlstra       2008-01-25  1020  

:::::: The code at line 982 was first introduced by commit
:::::: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 CHROMIUM: arm64: rt: Avoid throttling over host suspend.

:::::: TO: Suleiman Souhlal <suleiman@google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
