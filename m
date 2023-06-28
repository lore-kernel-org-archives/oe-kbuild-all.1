Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDE7E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 02:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687920157; x=1719456157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HRvLnMxNCtbOyeLn5m49lmxWMU9FiFS3yeC2KhDouY=;
  b=kVFwr6BC5o3i7Peo3E3LgwjHAHi1S8X7nX6lOBws6oGLw64ak8wPwF6W
   iTx4rxvEIa4/Pu89UbJwhaT6p4Kpz1KmOmKF5ATyd2qUM0MeMqYCi+6l9
   AfK0XG1NOU+lJ+WT0F0+kReJfew9lAOkckLREax9i6XT7C0uQPjtOCquj
   BYe3p3yhh/CQ/sP60Q856fv+QKyp1osiHFlzyoudYEmoItdf9w5RkArjL
   klaJ8TDaN5ev9sxgRqAaDBlP/Cr8LvHGYQ+vhtBwzipt0IjislmKGQqcE
   urdYyHNCksTw6xJxH6Q2D++JfFz2R5lFhWpdbsSoCNYGc3mJSlKvMT6J8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351516218"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="351516218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 19:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="710868168"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="710868168"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Jun 2023 19:42:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEL8c-000CYM-1P;
	Wed, 28 Jun 2023 02:42:34 +0000
Date: Wed, 28 Jun 2023 10:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 284/385] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for 'proc_sched_show_task'
Message-ID: <202306281025.qzMWob0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: fa51a210dd580901cb9fde19d3d268b3dc9cd597 [284/385] sched/alt: Headers cleanup
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230628/202306281025.qzMWob0D-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281025.qzMWob0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281025.qzMWob0D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_debug.c:9:
   kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for 'proc_sched_show_task' [-Wmissing-prototypes]
      23 | void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for 'proc_sched_set_task' [-Wmissing-prototypes]
      30 | void proc_sched_set_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/proc_sched_show_task +23 kernel/sched/alt_debug.c

cedcd3e67433b3 Alfred Chen 2019-08-19  10  
cedcd3e67433b3 Alfred Chen 2019-08-19  11  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
cedcd3e67433b3 Alfred Chen 2019-08-19  13   * to the console
cedcd3e67433b3 Alfred Chen 2019-08-19  14   */
cedcd3e67433b3 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
cedcd3e67433b3 Alfred Chen 2019-08-19  16   do {						\
cedcd3e67433b3 Alfred Chen 2019-08-19  17  	if (m)					\
cedcd3e67433b3 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
cedcd3e67433b3 Alfred Chen 2019-08-19  19  	else					\
cedcd3e67433b3 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
cedcd3e67433b3 Alfred Chen 2019-08-19  21   } while (0)
cedcd3e67433b3 Alfred Chen 2019-08-19  22  
cedcd3e67433b3 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
cedcd3e67433b3 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
cedcd3e67433b3 Alfred Chen 2019-08-19  25  {
cedcd3e67433b3 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
cedcd3e67433b3 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
cedcd3e67433b3 Alfred Chen 2019-08-19  28  }
cedcd3e67433b3 Alfred Chen 2019-08-19  29  
cedcd3e67433b3 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
