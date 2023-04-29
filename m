Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3877C53A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682791992; x=1714327992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O22idOHGu5taYdXgvYf/LeK40nT8LIVR1VCviCQx2eE=;
  b=NLXPolgMSdjbnn94UtxJejLWj7dYN5D9uSWRRx1knA9GWnApscLu+ujp
   jop5vSIyScfhPuOyMwzVYzOaNYxDIWnvCjHEGEcxSr171YgsqnaEhe/1h
   d8kTqzENL6drvwz/k8HixnUwWe1UJs3YHz9iQ1stk4rJZbbI3sLS3S/T3
   QF4OjGvdi90A5vuzONNqQYFAmn+hqpQtywIztQhcpXkcs4lTrIQvD4d4y
   FO36f6333T92+7f+TXcoBo2n7Ybg6HzJE+DTIwgRGgcvzPua5ptFZycxv
   zCqUqjzoebxHQ5c8jDDGZXhDqMLzRRebnJaAy4yB0FChdPcMuBiQxTmW7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="375981402"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="375981402"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 11:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="819462912"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="819462912"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2023 11:13:10 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psp4H-0001IH-2Y;
	Sat, 29 Apr 2023 18:13:09 +0000
Date: Sun, 30 Apr 2023 02:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 284/395] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for 'proc_sched_show_task'
Message-ID: <202304300255.6iiiHNyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   6a80d978aa1f981122f7478fedea389aa9475f9d
commit: 2f71a7687db0896451980a290f1fa0a9f5c47e3d [284/395] sched/alt: Headers cleanup
config: arc-randconfig-r043-20230430 (https://download.01.org/0day-ci/archive/20230430/202304300255.6iiiHNyH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/2f71a7687db0896451980a290f1fa0a9f5c47e3d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 2f71a7687db0896451980a290f1fa0a9f5c47e3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300255.6iiiHNyH-lkp@intel.com/

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

8b025fc742d760 Alfred Chen 2019-08-19  10  
8b025fc742d760 Alfred Chen 2019-08-19  11  /*
8b025fc742d760 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
8b025fc742d760 Alfred Chen 2019-08-19  13   * to the console
8b025fc742d760 Alfred Chen 2019-08-19  14   */
8b025fc742d760 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
8b025fc742d760 Alfred Chen 2019-08-19  16   do {						\
8b025fc742d760 Alfred Chen 2019-08-19  17  	if (m)					\
8b025fc742d760 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
8b025fc742d760 Alfred Chen 2019-08-19  19  	else					\
8b025fc742d760 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
8b025fc742d760 Alfred Chen 2019-08-19  21   } while (0)
8b025fc742d760 Alfred Chen 2019-08-19  22  
8b025fc742d760 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
8b025fc742d760 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
8b025fc742d760 Alfred Chen 2019-08-19  25  {
8b025fc742d760 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
8b025fc742d760 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
8b025fc742d760 Alfred Chen 2019-08-19  28  }
8b025fc742d760 Alfred Chen 2019-08-19  29  
8b025fc742d760 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: 8b025fc742d76091232a7404a7ad09c8cad61492 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
