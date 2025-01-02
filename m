Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9B179D2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823095; cv=none; b=lZnHZoHcBB81ihFcUyl7mGQ83mEzka1rb4Yg3b3icyMqlmcqvmms5fmhpE9dwutJ4AGBnqucHMbJhfL0xahzfhfvIB3KJUbOWuGmQU5yfFMztSVwUmiLztOQeCxv3sbVOK5Y2zyjdMc5jZGkuUlGzxJ/+r5/lzjNdKCMsZVo9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823095; c=relaxed/simple;
	bh=hhKvfEBFgF2u9e2083KgSFQCmQMQRRyn3Z9uTqsrTPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNvb6uaHcXWc5lpRctPFkR+FBe9/F215O0beyqDje24gFhbyY2lrrobPfCWYtZjgT/naVKPw76Yvjo1+Wgp+pcQwbHb5Ta45OtzzPIIcvtq19c1MPVuLygBBXoF01NQvymt+E/4WKZx3elND8KmtqXmtesBzufyPQK7BWl0RQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCX+Yjc1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCX+Yjc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735823093; x=1767359093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhKvfEBFgF2u9e2083KgSFQCmQMQRRyn3Z9uTqsrTPE=;
  b=FCX+Yjc19ZUYXke9qWYEwRE7deNZ5Zp0+PhdhjgJBvtUJyV/W2GdU0p6
   +PSO4F6j+BM59cHDaF6S7ZlbSM/3hx81o1xCLqPvFYew2RE5ACmszNnf8
   WWZqdM+O7Jau7wXGwLJrJxm9Vrku2V3GEsiC0fl+uZOIO/2VhifYpFvU+
   JxgluFIEs5PEFbwwFSZJUgsXT/ZXSA9QTV8VPAFOvk2xf2o3WhtP/t7U8
   qP93HsQx2de/eHKV+rwUegwqwJIWNaUA++oFgFacvr528WFtVQgTObv2h
   yiquca2tBEtKqQ9tDRtCLwqTNhLO4bppVwosM5xFUKpZaQoQrVKEtyHp5
   w==;
X-CSE-ConnectionGUID: jeqNBiG2RAmEXWsDk/Uuyw==
X-CSE-MsgGUID: Ow8jxlEwTlW4AfSbO8EDOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35301540"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35301540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:04:36 -0800
X-CSE-ConnectionGUID: euxTHnWnTomY7LZM8I1cyQ==
X-CSE-MsgGUID: Hq0n6sENT+yMU3YPXyQA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124775516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jan 2025 05:04:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTKsJ-0008Vn-1u;
	Thu, 02 Jan 2025 13:04:31 +0000
Date: Thu, 2 Jan 2025 21:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 12/12]
 kernel/sched/alt_core.c:6106:29: error: 'sched_smt_mask' undeclared; did you
 mean 'sched_idle_mask'?
Message-ID: <202501022028.qZ3yoZop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/prjc-revert-active-balance
head:   4a42958cae493501eea276a2926f0d3727193c66
commit: b4cf9a3ce4daba6de657f836ab47c4ea825f964e [12/12] Revert "sched/alt: Introduce active balance"
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501022028.qZ3yoZop-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022028.qZ3yoZop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022028.qZ3yoZop-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:2218:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2216:33: error: storage size of 'ac' isn't known
    2216 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c:2226:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2226 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c:2216:33: warning: unused variable 'ac' [-Wunused-variable]
    2216 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'relax_compatible_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2295:16: error: variable 'ac' has initializer but incomplete type
    2295 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2296:18: error: 'struct affinity_context' has no member named 'new_mask'
    2296 |                 .new_mask  = task_user_cpus(p),
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:2296:30: warning: excess elements in struct initializer
    2296 |                 .new_mask  = task_user_cpus(p),
         |                              ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2296:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2297:18: error: 'struct affinity_context' has no member named 'flags'
    2297 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:2297:30: warning: excess elements in struct initializer
    2297 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:2297:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2295:33: error: storage size of 'ac' isn't known
    2295 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c:2305:15: error: implicit declaration of function '__sched_setaffinity'; did you mean 'sched_setaffinity'? [-Wimplicit-function-declaration]
    2305 |         ret = __sched_setaffinity(p, &ac);
         |               ^~~~~~~~~~~~~~~~~~~
         |               sched_setaffinity
   kernel/sched/alt_core.c:2295:33: warning: unused variable 'ac' [-Wunused-variable]
    2295 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'ttwu_runnable':
   kernel/sched/alt_core.c:2409:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2409 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c: In function 'sched_fork':
   kernel/sched/alt_core.c:3136:21: error: implicit declaration of function 'task_has_rt_policy' [-Wimplicit-function-declaration]
    3136 |                 if (task_has_rt_policy(p)) {
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:3513:26: warning: no previous prototype for 'splice_balance_callbacks' [-Wmissing-prototypes]
    3513 | struct balance_callback *splice_balance_callbacks(struct rq *rq)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3523:6: warning: no previous prototype for 'balance_callbacks' [-Wmissing-prototypes]
    3523 | void balance_callbacks(struct rq *rq, struct balance_callback *head)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5165:6: warning: no previous prototype for 'check_task_changed' [-Wmissing-prototypes]
    5165 | void check_task_changed(struct task_struct *p, struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5175:6: warning: no previous prototype for '__setscheduler_prio' [-Wmissing-prototypes]
    5175 | void __setscheduler_prio(struct task_struct *p, int prio)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'rt_mutex_setprio':
   kernel/sched/alt_core.c:5226:16: error: implicit declaration of function '__rt_effective_prio' [-Wimplicit-function-declaration]
    5226 |         prio = __rt_effective_prio(pi_task, p->normal_prio);
         |                ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5234:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    5234 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c: In function 'init_idle':
   kernel/sched/alt_core.c:5779:16: error: variable 'ac' has initializer but incomplete type
    5779 |         struct affinity_context ac = (struct affinity_context) {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5780:18: error: 'struct affinity_context' has no member named 'new_mask'
    5780 |                 .new_mask  = cpumask_of(cpu),
         |                  ^~~~~~~~
   include/linux/cpumask.h:863:25: warning: excess elements in struct initializer
     863 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^
   kernel/sched/alt_core.c:5780:30: note: in expansion of macro 'cpumask_of'
    5780 |                 .new_mask  = cpumask_of(cpu),
         |                              ^~~~~~~~~~
   include/linux/cpumask.h:863:25: note: (near initialization for '(anonymous)')
     863 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^
   kernel/sched/alt_core.c:5780:30: note: in expansion of macro 'cpumask_of'
    5780 |                 .new_mask  = cpumask_of(cpu),
         |                              ^~~~~~~~~~
   kernel/sched/alt_core.c:5781:18: error: 'struct affinity_context' has no member named 'flags'
    5781 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:5781:30: warning: excess elements in struct initializer
    5781 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:5781:30: note: (near initialization for '(anonymous)')
   kernel/sched/alt_core.c:5779:64: error: invalid use of undefined type 'struct affinity_context'
    5779 |         struct affinity_context ac = (struct affinity_context) {
         |                                                                ^
   kernel/sched/alt_core.c:5779:33: error: storage size of 'ac' isn't known
    5779 |         struct affinity_context ac = (struct affinity_context) {
         |                                 ^~
   kernel/sched/alt_core.c:5779:33: warning: unused variable 'ac' [-Wunused-variable]
   kernel/sched/alt_core.c: In function 'sched_smt_present_inc':
>> kernel/sched/alt_core.c:6106:29: error: 'sched_smt_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    6106 |                 cpumask_or(&sched_smt_mask, &sched_smt_mask, cpu_smt_mask(cpu));
         |                             ^~~~~~~~~~~~~~
         |                             sched_idle_mask
   kernel/sched/alt_core.c: In function 'sched_smt_present_dec':
>> kernel/sched/alt_core.c:6117:39: error: 'sched_pcore_idle_mask' undeclared (first use in this function); did you mean 'sched_sg_idle_mask'?
    6117 |                         cpumask_clear(sched_pcore_idle_mask);
         |                                       ^~~~~~~~~~~~~~~~~~~~~
         |                                       sched_sg_idle_mask
   kernel/sched/alt_core.c:6118:33: error: 'sched_smt_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    6118 |                 cpumask_andnot(&sched_smt_mask, &sched_smt_mask, cpu_smt_mask(cpu));
         |                                 ^~~~~~~~~~~~~~
         |                                 sched_idle_mask
   kernel/sched/alt_core.c: In function 'normalize_rt_tasks':
   kernel/sched/alt_core.c:6691:17: error: implicit declaration of function '__sched_setscheduler'; did you mean 'sched_setscheduler'? [-Wimplicit-function-declaration]
    6691 |                 __sched_setscheduler(p, &attr, false, false);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 sched_setscheduler
   kernel/sched/alt_core.c: In function 'set_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2200:1: warning: control reaches end of non-void function [-Wreturn-type]
    2200 | }
         | ^


vim +6106 kernel/sched/alt_core.c

54431cbdff3201 Alfred Chen 2019-08-19  6100  
5de6b3770f103b Alfred Chen 2024-09-13  6101  static inline void sched_smt_present_inc(int cpu)
5de6b3770f103b Alfred Chen 2024-09-13  6102  {
5de6b3770f103b Alfred Chen 2024-09-13  6103  #ifdef CONFIG_SCHED_SMT
5de6b3770f103b Alfred Chen 2024-09-13  6104  	if (cpumask_weight(cpu_smt_mask(cpu)) == 2) {
5de6b3770f103b Alfred Chen 2024-09-13  6105  		static_branch_inc_cpuslocked(&sched_smt_present);
5de6b3770f103b Alfred Chen 2024-09-13 @6106  		cpumask_or(&sched_smt_mask, &sched_smt_mask, cpu_smt_mask(cpu));
5de6b3770f103b Alfred Chen 2024-09-13  6107  	}
5de6b3770f103b Alfred Chen 2024-09-13  6108  #endif
5de6b3770f103b Alfred Chen 2024-09-13  6109  }
5de6b3770f103b Alfred Chen 2024-09-13  6110  
5de6b3770f103b Alfred Chen 2024-09-13  6111  static inline void sched_smt_present_dec(int cpu)
5de6b3770f103b Alfred Chen 2024-09-13  6112  {
5de6b3770f103b Alfred Chen 2024-09-13  6113  #ifdef CONFIG_SCHED_SMT
5de6b3770f103b Alfred Chen 2024-09-13  6114  	if (cpumask_weight(cpu_smt_mask(cpu)) == 2) {
5de6b3770f103b Alfred Chen 2024-09-13  6115  		static_branch_dec_cpuslocked(&sched_smt_present);
5de6b3770f103b Alfred Chen 2024-09-13  6116  		if (!static_branch_likely(&sched_smt_present))
5de6b3770f103b Alfred Chen 2024-09-13 @6117  			cpumask_clear(sched_pcore_idle_mask);
5de6b3770f103b Alfred Chen 2024-09-13  6118  		cpumask_andnot(&sched_smt_mask, &sched_smt_mask, cpu_smt_mask(cpu));
5de6b3770f103b Alfred Chen 2024-09-13  6119  	}
5de6b3770f103b Alfred Chen 2024-09-13  6120  #endif
5de6b3770f103b Alfred Chen 2024-09-13  6121  }
5de6b3770f103b Alfred Chen 2024-09-13  6122  

:::::: The code at line 6106 was first introduced by commit
:::::: 5de6b3770f103bb695f56dce7b247c90928c020c sched/alt: [Sync] 31b164e2e4af sched/smt: Introduce sched_smt_present_inc/dec() helper

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
