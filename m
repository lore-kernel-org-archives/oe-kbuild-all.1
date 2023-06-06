Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696DF17AB4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686058114; x=1717594114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0PfN+7Sj1CvjhNOPrh1betu4b6J3rUmCGtY9i7H5aM=;
  b=TjzcrVakKYuX4mHqu66f1sGOh1kjxvoQFcNLeCeWors2DOlQAgr7/in8
   UNML+ANS9yry/m0AFkqO54RXVnX4whzydQx6x00Ah7FajrgyCoywfAnuZ
   nGmK3rFGl4hcYI6v68q7rzMzWlCZIRH3oXZdJ2Bs5T8qY91+PO+m4XxG7
   AmOZNFIxM+eoWoLP0YOikZ6Oscte5zBMRbtbD9Kus/doN56QrdD83rAg2
   ACLxcfJjRh4vPjj46y2B1AHAVDFuM5lak4MrCeNcYAkz3zuW9svVRCLBE
   naCNHd2/W9WVe4+OMwon8l7F5WahczvRfwCEo9faIt679Gmus3Gt+fAmz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346273581"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="346273581"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1039173693"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="1039173693"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 06:28:27 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Wja-0005Hv-2S;
	Tue, 06 Jun 2023 13:28:26 +0000
Date: Tue, 6 Jun 2023 21:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 4/7] kernel/sched/sched.h:2797:36: error:
 expected ')' before 'struct'
Message-ID: <202306062105.8Earqiki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   718ea1d26c96cdbfb623f89189b4eb3f0d48f889
commit: 80d892642a62e09af33f8c43ebcbf9f8918e214c [4/7] sched: Use fancy new guards
config: nios2-randconfig-r014-20230606 (https://download.01.org/0day-ci/archive/20230606/202306062105.8Earqiki-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=80d892642a62e09af33f8c43ebcbf9f8918e214c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout 80d892642a62e09af33f8c43ebcbf9f8918e214c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306062105.8Earqiki-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:55:
>> kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
>> kernel/sched/fair.c:653:22: warning: no previous prototype for '__pick_first_entity' [-Wmissing-prototypes]
     653 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:688:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     688 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6171:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6171 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12605:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12605 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12607:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12607 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12612:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12612 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12614:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12614 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/core.c:86:
>> kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'yield_to':
>> include/linux/guards.h:73:9: error: unknown type name 'guard_double_rq_lock_t'; did you mean 'guard_task_rq_lock_t'?
      73 |         guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro '__ptr_guard'
      91 |         __ptr_guard(_guard, _name)
         |         ^~~~~~~~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   In file included from include/linux/compiler_types.h:125,
                    from <command-line>:
>> include/linux/compiler-gcc.h:132:33: error: cleanup argument not a function
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:90:9: note: in expansion of macro '__diag'
      90 |         __diag(ignored "-Wdeclaration-after-statement")                 \
         |         ^~~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
>> include/linux/guards.h:101:9: error: implicit declaration of function 'guard_double_rq_lock_init'; did you mean 'guard_task_rq_lock_init'? [-Werror=implicit-function-declaration]
     101 |         guard_##_guard##_init(_var)
         |         ^~~~~~
   include/linux/guards.h:104:36: note: in expansion of macro 'guard_init'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |                                    ^~~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   include/linux/compiler-gcc.h:42:45: warning: unused variable '__UNIQUE_ID_guard406' [-Wunused-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/guards.h:73:28: note: in definition of macro '__ptr_guard'
      73 |         guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
         |                            ^~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/guards.h:107:29: note: in expansion of macro '__UNIQUE_ID'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |                             ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/sched/build_policy.c:34:
>> kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
--
   In file included from kernel/sched/build_utility.c:53:
>> kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:647:33: error: implicit declaration of function '__pick_first_entity'; did you mean '__pick_last_entity'? [-Werror=implicit-function-declaration]
     647 |                 MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
         |                                 ^~~~~~~~~~~~~~~~~~~
         |                                 __pick_last_entity
>> kernel/sched/debug.c:647:61: error: invalid type argument of '->' (have 'int')
     647 |                 MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
         |                                                             ^~
   cc1: some warnings being treated as errors


vim +2797 kernel/sched/sched.h

  2796	
> 2797	DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
  2798			    double_rq_lock(_G->lock, _G->lock2),
  2799			    double_rq_unlock(_G->lock, _G->lock2))
  2800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
