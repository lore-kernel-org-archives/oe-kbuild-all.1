Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD2A23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676170837; x=1707706837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MEYl977M1gt/37+2N7vPJTwjaDUCapkNfQLIJjW/bgU=;
  b=bURoXzlTkf0FVz35ncqhdD0MFfeyK3JAmWYzTWtKWqtY7KsTRSgBd18O
   MAXJ9cQiMdYj3cG2NQsnk1fYHjDrDRXGK9MThOAFVhjla02azg3F824dP
   9Nbt51DuALYmSRnC10CfvOFuiw78EI7U8O8mTbA4gb+3TkTOTw/qF0fhb
   DK1QuwpfCId4OhMYN7GyOE5J4vafXD5XwKjhzoCiYyikyv6+axWPVDXVL
   nLgTT3aBEVzx7BOKKHF9AbknUfN/wKZg16uP3mtwKWUfpkQC4p1AX8S4R
   ziv34pe/Gkfm5zn+4pTT1fYPDxOla1YJzh63j4VU8ZwYtfFAyNBnBQfiE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="358088106"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="358088106"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 19:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="618262182"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="618262182"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2023 19:00:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR2bR-0006zL-14;
	Sun, 12 Feb 2023 03:00:33 +0000
Date: Sun, 12 Feb 2023 10:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc-test 284/375] kernel/sched/alt_sched.h:481:42:
 warning: 'struct cpuidle_state' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202302121009.8T4LfHnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc-test
head:   543613647f11584e775c4eb8c5b784576e72e9c6
commit: a9a7c3ea10ad1e83f4f64714235401ac4861dbfd [284/375] sched/alt: Headers cleanup
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230212/202302121009.8T4LfHnC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc-test
        git checkout a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121009.8T4LfHnC-lkp@intel.com/

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
   kernel/sched/psi.c:1135:17: error: implicit declaration of function 'rq_lock_irq'; did you mean 'rq_unlock_irq'? [-Werror=implicit-function-declaration]
    1135 |                 rq_lock_irq(rq, &rf);
         |                 ^~~~~~~~~~~
         |                 rq_unlock_irq
   cc1: some warnings being treated as errors


vim +481 kernel/sched/alt_sched.h

570d4c77574657 Alfred Chen 2019-08-19  473  
570d4c77574657 Alfred Chen 2019-08-19  474  static inline struct cpuidle_state *idle_get_state(struct rq *rq)
570d4c77574657 Alfred Chen 2019-08-19  475  {
570d4c77574657 Alfred Chen 2019-08-19  476  	WARN_ON(!rcu_read_lock_held());
570d4c77574657 Alfred Chen 2019-08-19  477  	return rq->idle_state;
570d4c77574657 Alfred Chen 2019-08-19  478  }
570d4c77574657 Alfred Chen 2019-08-19  479  #else
570d4c77574657 Alfred Chen 2019-08-19  480  static inline void idle_set_state(struct rq *rq,
570d4c77574657 Alfred Chen 2019-08-19 @481  				  struct cpuidle_state *idle_state)
570d4c77574657 Alfred Chen 2019-08-19  482  {
570d4c77574657 Alfred Chen 2019-08-19  483  }
570d4c77574657 Alfred Chen 2019-08-19  484  

:::::: The code at line 481 was first introduced by commit
:::::: 570d4c77574657dc1df2ca8c54e6b4407de76fd5 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
