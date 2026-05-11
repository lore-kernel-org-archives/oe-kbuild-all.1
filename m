Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEE35C1B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497556; cv=none; b=ajLmPzRgLQaZu2ckOKMs7lYpIOIEisnXb57uP8Lqj5wNTQbcBdg1mH2ArafMOb9BSlTSy20ODjV+JTIc7bHhEqHTZOwUfFyO1zDhONB2UfCEgDdads2UDMykBZzGExNagGbzgs7Lhwi7a2go0NzwnvgJurtvNZm3/KQJTJFCpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497556; c=relaxed/simple;
	bh=3ef6sgA6XOWaI1vtjKzsbcArg7oq0QokO1LL5MdT8HQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VYiby4c7DvIDQSc+ldGFb8tIX3TRicMdLyCfD1uHivREtiK8hoA14np0GHOfs69gDIQ2yAkjxilZgtSSKIb6PzL2S6Iit5iCmt9ryS8HrcPqSprlac9r/7Zr+vNLbFZ/i9Ms/qsvqp+KyprVxjkGaCdq12/i13u4KBvjs1tXxz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezuKRJfw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezuKRJfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778497555; x=1810033555;
  h=date:from:to:cc:subject:message-id;
  bh=3ef6sgA6XOWaI1vtjKzsbcArg7oq0QokO1LL5MdT8HQ=;
  b=ezuKRJfwMMSPnfSSIkZfeO8/PVpfLxWlgn1qT7Dvx8rPPJCQa5hHoY2z
   JLVmxfWyNIEVBTdAmBerhKh2bs9xQozO2HzWuwLt0+SU8gdqHmmTyprhi
   6EnyYMMn4NgxLVhWdtHLapNOcic/x5PolPDkOrn0f5fPRbw+neCq0FDRH
   cVpykA3BG2zqMg8I2nDTlleBduIHwHJ7ispkNC4dUCjEaA9kFzBH52K7q
   skzbFnTLi0UKmknI8oPToga4DBdrl0dXiD/DQMjD8A0qQqVBy/0xPggxo
   NWCI47wp2alMqqdMkZeO/7Hnybzs/5jZy2mckj9YrRL3LP4+GzcOTSElm
   g==;
X-CSE-ConnectionGUID: hMyy/sjkQH+XA9nAd5wd8Q==
X-CSE-MsgGUID: YBB6fVzuSQi1/j7HAQ/tNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="102044500"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="102044500"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:05:55 -0700
X-CSE-ConnectionGUID: LvInfKw1TaSBFVpoDbacWQ==
X-CSE-MsgGUID: wMNT38m+REeU/aVADMFA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233094237"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 04:05:52 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMOSM-000000000SP-2dkN;
	Mon, 11 May 2026 11:05:50 +0000
Date: Mon, 11 May 2026 19:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/rt.c:982:38: warning: format '%ld' expects argument of type
 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'}
Message-ID: <202605111838.wkGAn0ZT-lkp@intel.com>
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
commit: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 [1/1] CHROMIUM: arm64: rt: Avoid throttling over host suspend.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260511/202605111838.wkGAn0ZT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111838.wkGAn0ZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111838.wkGAn0ZT-lkp@intel.com/

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
   include/linux/printk.h:139:24: note: in definition of macro 'no_printk'
     139 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ^~~
   kernel/sched/rt.c:982:17: note: in expansion of macro 'printk_deferred_once'
     982 |                 printk_deferred_once("suspected host suspend. cpu %d rt_time "
         |                 ^~~~~~~~~~~~~~~~~~~~


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
