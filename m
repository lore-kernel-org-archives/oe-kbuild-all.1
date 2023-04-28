Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F017C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 04:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682655139; x=1714191139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a94WV84XhVZ2V76+RdBQReKkiQBCY20Lw8LkOLMRPwg=;
  b=B/kxAcobrfr0KWNcb4vjpyTlrg5brjNo5AePoWrC/ptddYX7lqx4nm+N
   k7XQkgPP0+7aKh0tIraXd52y4dHPVrSrUjldxfuyVrCR88XW0Ptk/Gi7l
   mXRnV+hty4POY4pyaz9+4VBGVWYPYtA3A5mGowHhk9Pv0vvqesTkdF3vm
   0mG7kyYZRpfGwtM/My+R4YEV1uabr2a8xa/k9D0wUjY3sfzcg/T4UH8VU
   Jwi0rMc2OtdFfenJ01XlACxXp1OwpHYMk1jbRhZStB0vusoMbyULj4204
   skE61dDO0UD/5GBdAEeW8o7EgpYCZt68Txn9DKLri50kBwWsTzsHKYUzO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413024040"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="413024040"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 21:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="725205719"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="725205719"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Apr 2023 21:12:17 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psFSz-00005j-0w;
	Fri, 28 Apr 2023 04:12:17 +0000
Date: Fri, 28 Apr 2023 12:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 304/394] kernel/sched/alt_core.c:1912:1: warning: the
 frame size of 2064 bytes is larger than 2048 bytes
Message-ID: <202304281206.W5kJvsIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   857ca2f66dabce3d14d9f2f8e3e2e338e1bbff3e
commit: 1889e596c5647b4e2c36420ecb4dc4f00ed4edcd [304/394] sched/alt: [Sync] bb4479994945 sched, drivers: Remove max param from effective_cpu_util()/sched_cpu_util()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304281206.W5kJvsIO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/zen-kernel/zen-kernel/commit/1889e596c5647b4e2c36420ecb4dc4f00ed4edcd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 1889e596c5647b4e2c36420ecb4dc4f00ed4edcd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281206.W5kJvsIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:4748:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4748 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   kernel/sched/alt_core.c:6812:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    6812 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7022:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7022 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7061:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7061 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7125:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7125 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7145 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7187:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7187 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7268:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7268 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7320:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7320 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7675:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7675 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7686:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7686 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7697:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7697 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7703:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7703 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7773:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7773 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7842:27: warning: initialized field overwritten [-Woverride-init]
    7842 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7842:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   kernel/sched/alt_core.c: In function 'select_task_rq':
>> kernel/sched/alt_core.c:1912:1: warning: the frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1912 | }
         | ^


vim +1912 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  1894  
55a31ddf5a2fc2 Alfred Chen 2021-05-24  1895  static inline int select_task_rq(struct task_struct *p)
8b025fc742d760 Alfred Chen 2019-08-19  1896  {
8b025fc742d760 Alfred Chen 2019-08-19  1897  	cpumask_t chk_mask, tmp;
8b025fc742d760 Alfred Chen 2019-08-19  1898  
a4064f26543059 Alfred Chen 2021-04-19  1899  	if (unlikely(!cpumask_and(&chk_mask, p->cpus_ptr, cpu_active_mask)))
8b025fc742d760 Alfred Chen 2019-08-19  1900  		return select_fallback_rq(task_cpu(p), p);
8b025fc742d760 Alfred Chen 2019-08-19  1901  
8b025fc742d760 Alfred Chen 2019-08-19  1902  	if (
8b025fc742d760 Alfred Chen 2019-08-19  1903  #ifdef CONFIG_SCHED_SMT
8b025fc742d760 Alfred Chen 2019-08-19  1904  	    cpumask_and(&tmp, &chk_mask, &sched_sg_idle_mask) ||
8b025fc742d760 Alfred Chen 2019-08-19  1905  #endif
375aa589787e89 Alfred Chen 2021-06-28  1906  	    cpumask_and(&tmp, &chk_mask, sched_rq_watermark) ||
8b025fc742d760 Alfred Chen 2019-08-19  1907  	    cpumask_and(&tmp, &chk_mask,
a3e377c471d72f Alfred Chen 2022-06-05  1908  			sched_rq_watermark + SCHED_QUEUE_BITS - 1 - task_sched_prio(p)))
e8a38151b98828 Alfred Chen 2020-11-03  1909  		return best_mask_cpu(task_cpu(p), &tmp);
8b025fc742d760 Alfred Chen 2019-08-19  1910  
e8a38151b98828 Alfred Chen 2020-11-03  1911  	return best_mask_cpu(task_cpu(p), &chk_mask);
8b025fc742d760 Alfred Chen 2019-08-19 @1912  }
8b025fc742d760 Alfred Chen 2019-08-19  1913  

:::::: The code at line 1912 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
