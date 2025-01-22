Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435818FDAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737574934; cv=none; b=LTKOcqngsiPg6V12Iy2zfYjsoyPvzyo9nb9DdGcraXQJNZa7CswgYjZKQoedpp+1ytLM12SA+l9PZODcTvOfyuoinjywc0XzPb9w61U/fIemPKendIGW6+cES/ISuNJrpqgrny6WFI+fCOnrQon48wUL4Lnfd+ErMbJcSiGBqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737574934; c=relaxed/simple;
	bh=R/AcF88OsW2ZW2bxdIsM4Z2qEBxkiG1vAS2+B1xTCcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4hyxK1pIiTk6iA+tSwkyO16F6Z5fEONs0lBkY0Qvtng8b2we9WgafSxQ6rFa5mVjNCyGYic9MLA5CHlXYn+k1br5BNscW1LLOQkldaUdSF4LFi6ICeo6nS+C63FW1fif/p2AkDL6qDbYDh7R6PEUBXjehTt9CU+7PxsrNLdojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwvJDkLe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwvJDkLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737574932; x=1769110932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/AcF88OsW2ZW2bxdIsM4Z2qEBxkiG1vAS2+B1xTCcs=;
  b=CwvJDkLevNYyyTUzdmYqrvVY4L8BLtFd7W6Qza7aMBqA+8/9RYongUN1
   XiAxjQifVlMDZ8ULRgUgepBPKxT5MpxBIl2jkx+2iRJaV9Rfd2XZu1OKG
   NRkONvnUCMNoGOMa15wyVZYL0mjeyhwQ7qDlBVl4BtBpGe2uqk1oH1acM
   9TL/DMjFZBt3H4txwfYCF72+mRoDgj9jXV4jzNbfiSwRRkApOqMlsWia3
   +WPEYdtytxjVf5K1gI1O02mRS5eTmSlA5asdSBPB6IKmxVgOagUpeY2bS
   XNxtjmRU+9n0F3tVRcUE6WDoU+RCVHz4ZFLAsLSHv3JVw7RCpfOZOT7Pg
   A==;
X-CSE-ConnectionGUID: 1qnnQ0zLTjeZlCmnMDe+OA==
X-CSE-MsgGUID: tApTlhV7TYSCnutQY6UdIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38155473"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38155473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 11:42:12 -0800
X-CSE-ConnectionGUID: k7/fjl0LRxSRUFts8ZEqtg==
X-CSE-MsgGUID: 74MgFHRQR5C/RwMTWurw/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107067610"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2025 11:42:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tagc4-000aGZ-1S;
	Wed, 22 Jan 2025 19:42:08 +0000
Date: Thu, 23 Jan 2025 03:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 kernel/sched/rt.c:982:43: warning: format specifies type 'long' but the
 argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202501230301.Jq4Txw8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: 60159db699f14e547ce5ede2a7bad9b99e24cd3f [0/1] CHROMIUM: x86: rt: Avoid throttling over host suspend.
config: i386-buildonly-randconfig-004-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230301.Jq4Txw8a-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230301.Jq4Txw8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230301.Jq4Txw8a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rt.c:6:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:8:
   In file included from include/linux/genhd.h:19:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1597:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/rt.c:6:
   kernel/sched/sched.h:1448:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1448 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.


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
