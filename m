Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC80846F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161520; cv=none; b=qaBCNJXYlT89dLzR/Q7aSo3WRNUi4npQ6VJba4u+s6bU5Oyjt78bPUTdAKXQk7puw394hLkjDbiG4CCB6AhMVDhiG2pTz8ZB8GY3lLfwLfHDZwPytZwl1jR9WDP270f/hobVCZVc0R8FZ40/C4GAWH0TtohbpVoj5UH/FP45SyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161520; c=relaxed/simple;
	bh=NHzNueM3DHgHtoJzES1mp9BS/VqaE9xi+/lo0EJjemE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5VYDKz170hP337Q6ktiv0iq9w1EREjsgfGGB0+d4uD1SyZA7tkpzpNmHKVrOlvA+wDmGXhWHh+b7ZVbmPlOaSyka0MBMJWrCpR39x5r3TUffpqBilZpXOaKV/SzZA1RE7EXx375M8XbBqttuMUax7NwwoF82mxOt+8DtJ+wXI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9pL0vAO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9pL0vAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737161519; x=1768697519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHzNueM3DHgHtoJzES1mp9BS/VqaE9xi+/lo0EJjemE=;
  b=g9pL0vAOsSQFNH3IIC+gqhQ6vpydXEqqgO/XUVIzg3PaRIB8N1nWxJb8
   n6Dyjly9y3A158OqpsYG6MpZvPU8SuZMndbXkfe/euOEnyZdGmzx55kdZ
   XqqZe1L1FWuAy3vjcbGFD0MRJPjWyy+aeuWRlfOL1YEnR8MyDLEODM4gT
   lBXBYGEWrB3ihzcnpVT91/aO2yD3SBemmMK/XMRY8gGmW03JPsxMJw6pQ
   VRUCGgLWhhzZeQp7nXxqKuppWaB98macdQw0PGLUhiJnHzd21VNxAdF+Q
   Yzc4LiSvcmlm1b3pE3W0wM5lNCDVngoU2M6CFRSNxtfI9vPhAeUoiaouR
   A==;
X-CSE-ConnectionGUID: U73VmaOcRg+l1wr3GXxpDA==
X-CSE-MsgGUID: yF1usM68RK6figA3zqMcVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37491423"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37491423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 16:51:58 -0800
X-CSE-ConnectionGUID: 6xsynSEJQnyh5ooxBR5Hnw==
X-CSE-MsgGUID: qNm/cYk7RDKqRQ8czJggPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106546394"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 16:51:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYx46-000TtH-2y;
	Sat, 18 Jan 2025 00:51:54 +0000
Date: Sat, 18 Jan 2025 08:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/rt.c:982:38: warning: format '%ld' expects argument of type
 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'}
Message-ID: <202501180859.ZCZUiwvU-lkp@intel.com>
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
head:   354b0c4c1ebb89a4198fdec59a447bc102320bac
commit: 4f653d6975381f93075754c0d2b1ec8bc37b0df8 [1/1] CHROMIUM: arm64: rt: Avoid throttling over host suspend.
config: arm64-randconfig-002-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180859.ZCZUiwvU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180859.ZCZUiwvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180859.ZCZUiwvU-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
