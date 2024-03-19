Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE827FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710811101; cv=none; b=cQOU9c6C7SYzn+y5+DOXmKehBNpF5n+5zqV7PRocXaL1d7xfqnE56VnU50X18jEZJWf7XtE9tSsXlfodSrC71ToxYJYn6BXJT50XSyvDmxhjdmmz99Yje1aWRwORY1iqsquIWmXNzdMWCCCh5Yf1ycU6OZXU9matRwSdGi0UCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710811101; c=relaxed/simple;
	bh=vBvaq+grjBizECE/wzq2vVG2ZNeOD2elKgkXd9GkQW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbW58V/eSuGuoYpaI2cJt4iqez0DpQBIASp97wIyR3v6ifCOPLmM7IVy1bmKca8bRMHVg1nM4Rjn2Ah1vP1j3Gl8jkSiwt/iS1h+V7Ko4Gq9DdvLgpGq8AthkqYYKxIXpeFDv/hacNPKysVyPrGMz7NBBlDY8W6vuwFHiMgcXa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSIkG1Mc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSIkG1Mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710811100; x=1742347100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBvaq+grjBizECE/wzq2vVG2ZNeOD2elKgkXd9GkQW0=;
  b=QSIkG1Mc5NS7WKPNt5gMfjrOtkZ0H0+SFzkrvMBCKtd1WqjgWHdPjDwk
   yyP7WSDp8eXogxeOsMM6ExqSMS1hv3NYafdbDEIrhRUkic6QQmNXa2QKS
   ugaFmsLlN9nsjPZNADWLYS1lMkfU5Bn1fJq/RmZZ3LjbsC2UGy7s6kbD9
   k6GxzrlK0+HnCnfS8cutv24JfURW+SH9ehKHyOadWxOTr6yV39UNA+zlq
   /NDbHS2gG0ysPqpJtNJhsbrvmTZAGxthFL9EEoa0dOIUcYRomfZ4Gp6Lz
   oP3eVMOwHVZfdLoe1Vxl8bH1059K77R8CUi5YB8jD6a7n03fwYszKkBxP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16379637"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16379637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 18:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="18299453"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2024 18:18:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmO7L-000HM3-2t;
	Tue, 19 Mar 2024 01:18:15 +0000
Date: Tue, 19 Mar 2024 09:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 2/2]
 kernel/sched/rt.c:982:38: warning: format '%ld' expects argument of type
 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'}
Message-ID: <202403190904.f42Mq6C2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4f653d6975381f93075754c0d2b1ec8bc37b0df8
commit: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 [2/2] CHROMIUM: arm64: rt: Avoid throttling over host suspend.
config: arm64-randconfig-001-20240319 (https://download.01.org/0day-ci/archive/20240319/202403190904.f42Mq6C2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190904.f42Mq6C2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190904.f42Mq6C2-lkp@intel.com/

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
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/rt.c:6:
   kernel/sched/rt.c: In function 'sched_rt_runtime_exceeded':
>> kernel/sched/rt.c:982:38: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     982 |                 printk_deferred_once("suspected host suspend. cpu %d rt_time "
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     983 |                     "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
         |                                                         ~~~~~~~~~~~~~~
         |                                                              |
         |                                                              u64 {aka long long unsigned int}
   include/linux/printk.h:460:33: note: in definition of macro 'printk_deferred_once'
     460 |                 printk_deferred(fmt, ##__VA_ARGS__);            \
         |                                 ^~~


vim +982 kernel/sched/rt.c

   955	
   956	static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
   957	{
   958		u64 runtime = sched_rt_runtime(rt_rq);
   959	
   960		if (rt_rq->rt_throttled)
   961			return rt_rq_throttled(rt_rq);
   962	
   963		if (runtime >= sched_rt_period(rt_rq))
   964			return 0;
   965	
   966		balance_runtime(rt_rq);
   967		runtime = sched_rt_runtime(rt_rq);
   968		if (runtime == RUNTIME_INF)
   969			return 0;
   970	
   971	#ifdef CONFIG_ARM64
   972		/*
   973		 * XXX Temporary workaround for b/307775867.
   974		 * We think we ran for this long because the host suspended while we
   975		 * were running, so just pretend we didn't run instead of throttling
   976		 * for a long time.
   977		 * The "5" was chosen so that it would be highly unlikely for this to
   978		 * happen in normal operation, while being small enough to be able to
   979		 * mitigate issues for shorter suspends.
   980		 */
   981		if (unlikely(runtime > 0 && rt_rq->rt_time >= 5 * runtime)) {
 > 982			printk_deferred_once("suspected host suspend. cpu %d rt_time "
   983			    "(%ld)\n", rq_of_rt_rq(rt_rq)->cpu, rt_rq->rt_time);
   984			rt_rq->rt_time = 0;
   985		}
   986	#endif
   987	
   988		if (rt_rq->rt_time > runtime) {
   989			struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
   990	
   991			/*
   992			 * Don't actually throttle groups that have no runtime assigned
   993			 * but accrue some time due to boosting.
   994			 */
   995			if (likely(rt_b->rt_runtime)) {
   996				rt_rq->rt_throttled = 1;
   997				printk_deferred_once("sched: RT throttling activated\n");
   998	
   999				trace_android_vh_dump_throttled_rt_tasks(
  1000					raw_smp_processor_id(),
  1001					rq_clock(rq_of_rt_rq(rt_rq)),
  1002					sched_rt_period(rt_rq),
  1003					runtime,
  1004					hrtimer_get_expires_ns(&rt_b->rt_period_timer));
  1005			} else {
  1006				/*
  1007				 * In case we did anyway, make it go away,
  1008				 * replenishment is a joke, since it will replenish us
  1009				 * with exactly 0 ns.
  1010				 */
  1011				rt_rq->rt_time = 0;
  1012			}
  1013	
  1014			if (rt_rq_throttled(rt_rq)) {
  1015				sched_rt_rq_dequeue(rt_rq);
  1016				return 1;
  1017			}
  1018		}
  1019	
  1020		return 0;
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
