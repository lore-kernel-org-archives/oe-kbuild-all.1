Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48DC2F3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675016361; x=1706552361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XT3vhFebtmiUqYAREzfL1U9PpCdM8HidgUNtdvGWWsE=;
  b=HKB8bnFXFAh9gXRCpHTqHMIO1uUWEvIh0HrgUbkGDq/St4mDTu+P7JJ7
   GpHhYuXQO2kkBUwoSCMSFdgr4AzQFmKNp2Xm/9YnahRsqMMm53b7Xx2bS
   s8Fm/hm+xd2oEmp9nZ0AMwAbfQKp54wP5LgF8UaPcNd+iecpiaMmT2KRV
   lQOiuR9SLjFzxmKtP7fpFAji9qG5UYKeI/PhA3Hto8He+iJM6e21azqui
   2fkdn7iu89swfTBxEoep85CyhVTgZBDWaZcDLn69JkV+qwFKwoB7Tut94
   cdlzK78LwkfMhpmAwYs+8U19ZEGdxbHfZmSnVakR8c+xFWD18mEaBmxv/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="354733827"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="354733827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 10:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665836618"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="665836618"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 10:19:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMCGt-00030U-0H;
	Sun, 29 Jan 2023 18:19:19 +0000
Date: Mon, 30 Jan 2023 02:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-spare-capacity-fixes 4/6]
 kernel/sched/fair.c:12689:2: error: unterminated argument list invoking
 macro "if"
Message-ID: <202301300258.OTKAa8oG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-spare-capacity-fixes
head:   a3ceff1a59cb681052ff29d3e21c89ec8927d620
commit: eb7cae7d9708a8bd005b137d0a6b3532e286686b [4/6] sched/uclamp: Set max_spare_cap_cpu even if max_spare_cap is 0
config: loongarch-randconfig-r035-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300258.OTKAa8oG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/qais-yousef/linux/commit/eb7cae7d9708a8bd005b137d0a6b3532e286686b
        git remote add qais-yousef https://github.com/qais-yousef/linux
        git fetch --no-tags qais-yousef uclamp-spare-capacity-fixes
        git checkout eb7cae7d9708a8bd005b137d0a6b3532e286686b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   kernel/sched/fair.c:6071:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6071 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'find_energy_efficient_cpu':
>> kernel/sched/fair.c:12689:2: error: unterminated argument list invoking macro "if"
   12689 | }
         |  ^
>> kernel/sched/fair.c:12690: error: expected '(' at end of input
   kernel/sched/fair.c:7459:32: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
    7459 |                         } else if ((fits > max_fits) ||
         |                                ^~
   kernel/sched/fair.c:7459:32: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
   kernel/sched/fair.c:7459:25: error: expected declaration or statement at end of input
    7459 |                         } else if ((fits > max_fits) ||
         |                         ^
   kernel/sched/fair.c:7459:25: error: expected declaration or statement at end of input
   kernel/sched/fair.c:7398:27: warning: unused variable 'max_fits' [-Wunused-variable]
    7398 |                 int fits, max_fits = -1;
         |                           ^~~~~~~~
   kernel/sched/fair.c:7397:31: warning: unused variable 'base_energy' [-Wunused-variable]
    7397 |                 unsigned long base_energy;
         |                               ^~~~~~~~~~~
   kernel/sched/fair.c:7396:21: warning: unused variable 'max_spare_cap_cpu' [-Wunused-variable]
    7396 |                 int max_spare_cap_cpu = -1;
         |                     ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7393:42: warning: unused variable 'max_spare_cap' [-Wunused-variable]
    7393 |                 unsigned long cur_delta, max_spare_cap = -1UL;
         |                                          ^~~~~~~~~~~~~
   kernel/sched/fair.c:7393:31: warning: unused variable 'cur_delta' [-Wunused-variable]
    7393 |                 unsigned long cur_delta, max_spare_cap = -1UL;
         |                               ^~~~~~~~~
   kernel/sched/fair.c:7459:25: error: expected declaration or statement at end of input
    7459 |                         } else if ((fits > max_fits) ||
         |                         ^
>> kernel/sched/fair.c:7386:17: error: label 'unlock' used but not defined
    7386 |                 goto unlock;
         |                 ^~~~
   kernel/sched/fair.c:7362:23: warning: unused variable 'prev_thermal_cap' [-Wunused-variable]
    7362 |         unsigned long prev_thermal_cap = 0;
         |                       ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7361:23: warning: unused variable 'best_thermal_cap' [-Wunused-variable]
    7361 |         unsigned long best_thermal_cap = 0;
         |                       ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7360:29: warning: unused variable 'best_fits' [-Wunused-variable]
    7360 |         int prev_fits = -1, best_fits = -1;
         |                             ^~~~~~~~~
   kernel/sched/fair.c:7359:18: warning: unused variable 'best_energy_cpu' [-Wunused-variable]
    7359 |         int cpu, best_energy_cpu, target = -1;
         |                  ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:7355:47: warning: unused variable 'best_delta' [-Wunused-variable]
    7355 |         unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
         |                                               ^~~~~~~~~~
   kernel/sched/fair.c:7355:23: warning: unused variable 'prev_delta' [-Wunused-variable]
    7355 |         unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
         |                       ^~~~~~~~~~
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:796:22: warning: 'task_h_load' used but never defined
     796 | static unsigned long task_h_load(struct task_struct *p);
         |                      ^~~~~~~~~~~
   kernel/sched/fair.c:4275:12: warning: 'newidle_balance' declared 'static' but never defined [-Wunused-function]
    4275 | static int newidle_balance(struct rq *this_rq, struct rq_flags *rf);
         |            ^~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4978:1: warning: 'wakeup_preempt_entity' used but never defined
    4978 | wakeup_preempt_entity(struct sched_entity *curr, struct sched_entity *se);
         | ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:6277:13: warning: 'set_next_buddy' used but never defined
    6277 | static void set_next_buddy(struct sched_entity *se);
         |             ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:6587:1: warning: 'find_idlest_group' used but never defined
    6587 | find_idlest_group(struct sched_domain *sd, struct task_struct *p, int this_cpu);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7352:12: warning: 'find_energy_efficient_cpu' defined but not used [-Wunused-function]
    7352 | static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7180:22: warning: 'cpu_util_without' defined but not used [-Wunused-function]
    7180 | static unsigned long cpu_util_without(int cpu, struct task_struct *p)
         |                      ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7001:12: warning: 'select_idle_sibling' defined but not used [-Wunused-function]
    7001 | static int select_idle_sibling(struct task_struct *p, int prev, int target)
         |            ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6566:12: warning: 'wake_affine' defined but not used [-Wunused-function]
    6566 | static int wake_affine(struct sched_domain *sd, struct task_struct *p,
         |            ^~~~~~~~~~~
   kernel/sched/fair.c:6471:12: warning: 'wake_wide' defined but not used [-Wunused-function]
    6471 | static int wake_wide(struct task_struct *p)
         |            ^~~~~~~~~
   kernel/sched/fair.c:6437:13: warning: 'record_wakee' defined but not used [-Wunused-function]
    6437 | static void record_wakee(struct task_struct *p)
         |             ^~~~~~~~~~~~
   kernel/sched/fair.c:6414:22: warning: 'cpu_runnable_without' defined but not used [-Wunused-function]
    6414 | static unsigned long cpu_runnable_without(struct rq *rq, struct task_struct *p)
         |                      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6391:22: warning: 'cpu_load_without' defined but not used [-Wunused-function]
    6391 | static unsigned long cpu_load_without(struct rq *rq, struct task_struct *p)
         |                      ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6284:13: warning: 'dequeue_task_fair' defined but not used [-Wunused-function]
    6284 | static void dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6191:1: warning: 'enqueue_task_fair' defined but not used [-Wunused-function]
    6191 | enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5063:1: warning: 'entity_tick' defined but not used [-Wunused-function]
    5063 | entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
         | ^~~~~~~~~~~
   kernel/sched/fair.c:5038:13: warning: 'put_prev_entity' defined but not used [-Wunused-function]
    5038 | static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *prev)
         |             ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4988:1: warning: 'pick_next_entity' defined but not used [-Wunused-function]
    4988 | pick_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *curr)
         | ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4940:1: warning: 'set_next_entity' defined but not used [-Wunused-function]
    4940 | set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:4244:13: warning: 'remove_entity_load_avg' defined but not used [-Wunused-function]
    4244 | static void remove_entity_load_avg(struct sched_entity *se)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4009:13: warning: 'migrate_se_pelt_lag' defined but not used [-Wunused-function]
    4009 | static void migrate_se_pelt_lag(struct sched_entity *se) {}
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3196:13: warning: 'task_tick_numa' defined but not used [-Wunused-function]
    3196 | static void task_tick_numa(struct rq *rq, struct task_struct *curr)
         |             ^~~~~~~~~~~~~~
   kernel/sched/fair.c:937:13: warning: 'update_curr_fair' defined but not used [-Wunused-function]
     937 | static void update_curr_fair(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~


vim +/if +12689 kernel/sched/fair.c

029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  12688  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25 @12689  }

:::::: The code at line 12689 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
