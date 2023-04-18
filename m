Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC3AFED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681847647; x=1713383647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UqJKL8np1RtDaJgXxGurUtXUjOENIv/xaYt5risaf30=;
  b=RBIx3maORwjB0etQgfJ7zVJQIxQm36cws+F8uyq8KA5csPFV2GHP6ggz
   rvmjGxGUQdgKXczMdAMFKXIDtUyThJS1orKPXvbyJEk7n8YIzhG2kRqrv
   ISVv+/nV6BEok6TfVbFpLfHaPNU+yAZI1Z0YgKWw+STy6Dpy2+j9+c5Iv
   N/Vw29OkfrzESVsffC3a9KpL/wX2IFn4gd8/QZRFePUxjhaa2g40qKHIM
   lsPJ0VQxh4MVHXO09SkjxxeMLqViy/afzJ7et5E7SvW28dTGMqSN6ORjd
   4caKXklbzyafdfLSzEcnP1RJOzC92Om0kLx86GQZPLTXo4Jm7A9vqOkjv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347124446"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347124446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 12:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="668684462"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="668684462"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 12:54:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1porOu-000dyt-2s;
	Tue, 18 Apr 2023 19:54:04 +0000
Date: Wed, 19 Apr 2023 03:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 284/390] kernel/sched/alt_sched.h:481:42: warning:
 'struct cpuidle_state' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202304190335.AQD9PbWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   e1fa9ea876458eade5717e6e00b375bff8d86c98
commit: 2f71a7687db0896451980a290f1fa0a9f5c47e3d [284/390] sched/alt: Headers cleanup
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190335.AQD9PbWj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/2f71a7687db0896451980a290f1fa0a9f5c47e3d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 2f71a7687db0896451980a290f1fa0a9f5c47e3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190335.AQD9PbWj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_core.c:42:
>> kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
   kernel/sched/alt_core.c:46:10: fatal error: ../../fs/io-wq.h: No such file or directory
      46 | #include "../../fs/io-wq.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_debug.c:9:
>> kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for 'proc_sched_show_task' [-Wmissing-prototypes]
      23 | void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for 'proc_sched_set_task' [-Wmissing-prototypes]
      30 | void proc_sched_set_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/build_utility.c:53:
>> kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/stats.c: In function '__update_stats_enqueue_sleeper':
   kernel/sched/stats.c:100:38: error: 'prof_on' undeclared (first use in this function)
     100 |                         if (unlikely(prof_on == SLEEP_PROFILING)) {
         |                                      ^~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/stats.c:100:38: note: each undeclared identifier is reported only once for each function it appears in
     100 |                         if (unlikely(prof_on == SLEEP_PROFILING)) {
         |                                      ^~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/stats.c:100:49: error: 'SLEEP_PROFILING' undeclared (first use in this function)
     100 |                         if (unlikely(prof_on == SLEEP_PROFILING)) {
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from kernel/sched/build_utility.c:77:
   kernel/sched/stats.c:101:33: error: implicit declaration of function 'profile_hits'; did you mean 'profile_pc'? [-Werror=implicit-function-declaration]
     101 |                                 profile_hits(SLEEP_PROFILING,
         |                                 ^~~~~~~~~~~~
         |                                 profile_pc
   In file included from kernel/sched/build_utility.c:99:
   kernel/sched/psi.c: In function 'psi_cgroup_restart':
   kernel/sched/psi.c:1202:17: error: implicit declaration of function 'rq_lock_irq'; did you mean 'rq_unlock_irq'? [-Werror=implicit-function-declaration]
    1202 |                 rq_lock_irq(rq, &rf);
         |                 ^~~~~~~~~~~
         |                 rq_unlock_irq
   cc1: some warnings being treated as errors


vim +481 kernel/sched/alt_sched.h

8b025fc742d760 Alfred Chen 2019-08-19  473  
8b025fc742d760 Alfred Chen 2019-08-19  474  static inline struct cpuidle_state *idle_get_state(struct rq *rq)
8b025fc742d760 Alfred Chen 2019-08-19  475  {
8b025fc742d760 Alfred Chen 2019-08-19  476  	WARN_ON(!rcu_read_lock_held());
8b025fc742d760 Alfred Chen 2019-08-19  477  	return rq->idle_state;
8b025fc742d760 Alfred Chen 2019-08-19  478  }
8b025fc742d760 Alfred Chen 2019-08-19  479  #else
8b025fc742d760 Alfred Chen 2019-08-19  480  static inline void idle_set_state(struct rq *rq,
8b025fc742d760 Alfred Chen 2019-08-19 @481  				  struct cpuidle_state *idle_state)
8b025fc742d760 Alfred Chen 2019-08-19  482  {
8b025fc742d760 Alfred Chen 2019-08-19  483  }
8b025fc742d760 Alfred Chen 2019-08-19  484  

:::::: The code at line 481 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
