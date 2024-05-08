Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E4254FA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174434; cv=none; b=SD8ChuKmbWysp95UWFH12+NL7l14qwfcg1M48jTWbpt6P7to90ljIyLSqbEL4M3BXoh6rjXyzOmIwskgbdOWxqlouLgA9Eg4PcIg4c9OOCFyg2ODoR+QGN/o7o/2dP8Na3IgYoBC6UuJ5JzOhHUphaYC2x6QTcSgj7mZG4UdgGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174434; c=relaxed/simple;
	bh=fAXVGILNG/47zIsMCPqg7mpxvnGj371c1vvDoSfpDSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cq+SVuZqrnH5pYMgAbtR7pZxQQkRO8MYnp/0MEa4NjaH53gcvL1YVTdTNUJIhXnht/FMOHHw//QO39D9qor/lW3fwiIHVZB6KZuqEILxusNeX8QW9lajxyev5FLLjA+yosfEuIPYxPYS1opxbXbNajc1ba1qcxHyW4LA4D4I7EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4keX/8l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4keX/8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174433; x=1746710433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fAXVGILNG/47zIsMCPqg7mpxvnGj371c1vvDoSfpDSA=;
  b=g4keX/8l9oJJEadT1Go9FX6k87VDstDjC30/G2GgN7N0ZSaqH6vmJo6j
   AarN3lhuSk6vi0tRa9FQVD4Xjb/uHQDKuCrR3RC+KQ0Uu/sXPFzZhlUkJ
   Q3dYjGSoFtiput9RrIX9Zv8f3WDf5Jd4LYX2hRLJjfA32vp4pt8CcYMG7
   fvPXsLiNGpL6VGlbupyYdV1YKUoN4U++K/S9e5hqyxeSH4sDctf1rPlTH
   rpMVqIgphTpPSs9uSPve+D2T0nT/NytqwwcVVCt6ik7+W/Mzz1eAKVKBR
   8Zr7MXem0jMl0xZhLfj1MTsyYZ4TfCD8UMLnopsSAsYohHYGKdXRxPfcJ
   A==;
X-CSE-ConnectionGUID: S1JgY1NRRkG8fjyCiu5FMg==
X-CSE-MsgGUID: tDTwoBM+QRWCrAzp9HiMSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14839192"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="14839192"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:20:32 -0700
X-CSE-ConnectionGUID: uVS4+sXkQ0WlaUPDuUwjyA==
X-CSE-MsgGUID: ZtvKv/nfQEi7VslF8Pc/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="66315104"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2024 06:20:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4hDg-0003R7-1W;
	Wed, 08 May 2024 13:20:28 +0000
Date: Wed, 8 May 2024 21:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 12/12]
 kernel/sched/rt.c:982:50: error: 'struct rq' has no member named 'cpu'
Message-ID: <202405082117.kaRrlF8q-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240508 (https://download.01.org/0day-ci/archive/20240508/202405082117.kaRrlF8q-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082117.kaRrlF8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082117.kaRrlF8q-lkp@intel.com/

All errors (new ones prefixed by >>):

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
