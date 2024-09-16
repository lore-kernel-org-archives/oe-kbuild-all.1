Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F579E5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450392; cv=none; b=B5WFf2s6H1M812jxi6ND1jowfd5VSHtsNxZRKmN5Q7aDAdtgdeVhSZ37Phch+Lsy2FnCn36COM5IurtXIAgVaiK4oJ+AsrB32Uv9yNBNiTE+2kIUhC9BfySGFeIrApl8l16wDY0zu92XtR0J2/k+p1kQobxl5g6bIkq0hpWwYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450392; c=relaxed/simple;
	bh=zKTQgc8XMz6Tt023flGFtu9oSlDN+0+OEp6jMF+6Qpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Um4q4pSHY7DCbJf0pLWLIf/iYD5k5hib9KLHEhAnVfDuFXWEAuP1vydLvUUCTT/DtxG6D6U5KSG/MT/39W/gp4J5k0snr13eNTkMRLytfvSLfj+7FyhZFDWvOK5x5eLjswQjTOmT2fGwYAhFgkE/Cb/piMxHoILUw/bwsG6JI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/lhg/2s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/lhg/2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726450390; x=1757986390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zKTQgc8XMz6Tt023flGFtu9oSlDN+0+OEp6jMF+6Qpw=;
  b=R/lhg/2szZ8whi2ZowvYaOP0mR/5skRvk2saD6t5jT3iwaEK0lEMM4O2
   a5JxeYYdYEFG+n0usRt/ros+dH58NQUVcu3SjXyZG2SBXCkUgGC8Zxqo2
   CQDAoOOD+J87ydsxv8kbzUBXusBeeba2IFvl3TljGLhns3pD8fQar3a+A
   hX4dLSsGSx8Z5d5cYfYxoqQZIvD1nQJG9BYnhadzVzKqM2zRe3GrgW3MO
   AUY8iMhmM1WkSsx/j5hFHWqscYEdObGccUyYFcvMuWQyn0FiqcAYakwCr
   MBesedNXdotf2NLHsAnFovkr/QZ9lSJ4qXXD6I+k0tmZH8B4yWb28HSkb
   w==;
X-CSE-ConnectionGUID: 8brg9I4TToaZqOw4I7h9LA==
X-CSE-MsgGUID: LK/uibgiQd+DRzBcBPjr+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25158637"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25158637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 18:33:09 -0700
X-CSE-ConnectionGUID: 1q2A/ZvITE+upCNSgsSPHw==
X-CSE-MsgGUID: InwPA7GFR3avh25rasBS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68686649"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2024 18:33:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq0bx-0009De-1h;
	Mon, 16 Sep 2024 01:33:05 +0000
Date: Mon, 16 Sep 2024 09:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/prjc 430/494] kernel/sched/alt_core.c:2080:1: warning: the
 frame size of 2376 bytes is larger than 2048 bytes
Message-ID: <202409160915.9lTYHrji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/prjc
head:   4099cf9e206cdeab5d4f25d815854d26fea387c9
commit: aff562154f37204576bc8d7454efa9e40cf19031 [430/494] sched/alt: [Sync] 932562a6045e rseq: Split out rseq.h from sched.h
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240916/202409160915.9lTYHrji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160915.9lTYHrji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160915.9lTYHrji-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1001:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1001 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1024:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1024 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1039:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1039 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1041:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1041 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1361:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1361 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2507:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2507 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2550:6: warning: no previous prototype for 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2550 | bool call_function_single_prep_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:4131:6: warning: no previous prototype for 'scheduler_tick' [-Wmissing-prototypes]
    4131 | void scheduler_tick(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7170:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    7170 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7384:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7384 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7423:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7423 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7486:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7486 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7506:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7506 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7548:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7548 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7631:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7631 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7691:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7691 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:8024:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    8024 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8035:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    8035 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8046:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    8046 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8052:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    8052 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8120:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    8120 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'select_task_rq':
>> kernel/sched/alt_core.c:2080:1: warning: the frame size of 2376 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    2080 | }
         | ^


vim +2080 kernel/sched/alt_core.c

c24076ccd41dbf0 Alfred Chen 2022-12-21  2063  
f99df1c954d477f Alfred Chen 2021-05-24  2064  static inline int select_task_rq(struct task_struct *p)
d821e3e85092581 Alfred Chen 2019-08-19  2065  {
c24076ccd41dbf0 Alfred Chen 2022-12-21  2066  	cpumask_t allow_mask, mask;
d821e3e85092581 Alfred Chen 2019-08-19  2067  
c24076ccd41dbf0 Alfred Chen 2022-12-21  2068  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
d821e3e85092581 Alfred Chen 2019-08-19  2069  		return select_fallback_rq(task_cpu(p), p);
d821e3e85092581 Alfred Chen 2019-08-19  2070  
d821e3e85092581 Alfred Chen 2019-08-19  2071  	if (
d821e3e85092581 Alfred Chen 2019-08-19  2072  #ifdef CONFIG_SCHED_SMT
c24076ccd41dbf0 Alfred Chen 2022-12-21  2073  	    cpumask_and(&mask, &allow_mask, &sched_sg_idle_mask) ||
d821e3e85092581 Alfred Chen 2019-08-19  2074  #endif
c24076ccd41dbf0 Alfred Chen 2022-12-21  2075  	    cpumask_and(&mask, &allow_mask, sched_idle_mask) ||
c24076ccd41dbf0 Alfred Chen 2022-12-21  2076  	    preempt_mask_check(p, &allow_mask, &mask))
c24076ccd41dbf0 Alfred Chen 2022-12-21  2077  		return best_mask_cpu(task_cpu(p), &mask);
d821e3e85092581 Alfred Chen 2019-08-19  2078  
c24076ccd41dbf0 Alfred Chen 2022-12-21  2079  	return best_mask_cpu(task_cpu(p), &allow_mask);
d821e3e85092581 Alfred Chen 2019-08-19 @2080  }
d821e3e85092581 Alfred Chen 2019-08-19  2081  

:::::: The code at line 2080 was first introduced by commit
:::::: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
