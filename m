Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DBA23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687954963; x=1719490963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZJX+mvKnJ/5/yR8cGGsJmi+jZAVgN2kPHBHR9MU6yE=;
  b=NaZQhts4mgdC/vtkySLHodnn2O/yv7m0SiH2JzpsuvmyLUjBsKx3/kvB
   /Rp2joveDU0ojSSbX42BD3gBXarUlZkOGWmiZEwJU9Xgz14YPpO6uxcEr
   pY7YoJunCL+ep2iAX1crnaguzJwb1vapCE+mzPJJIb5gh16jd0VxV14KW
   caxL3zchhNI4YNolnE8HcFWoER/xU6G8h70H4nyP7acOC/HHR3gXZg55V
   ozSjMZimuoWOhYD72kepHT0TqI0EB5KJzbKxlJEPdsk8nVBsnYxD3suMs
   3qz6PfywED3BKspBapO6DffOLR7E2EvVbZOwpwd6OGwrwLBfoOoFYpHJE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392552343"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="392552343"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 05:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="787028440"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="787028440"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 05:22:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEUC0-000DFZ-0T;
	Wed, 28 Jun 2023 12:22:40 +0000
Date: Wed, 28 Jun 2023 20:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 284/385] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for function 'proc_sched_show_task'
Message-ID: <202306282038.S1xibRCt-lkp@intel.com>
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
config: x86_64-randconfig-x014-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282038.S1xibRCt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282038.S1xibRCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282038.S1xibRCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for function 'proc_sched_show_task' [-Wmissing-prototypes]
   void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
        ^
   kernel/sched/alt_debug.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
   ^
   static 
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for function 'proc_sched_set_task' [-Wmissing-prototypes]
   void proc_sched_set_task(struct task_struct *p)
        ^
   kernel/sched/alt_debug.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void proc_sched_set_task(struct task_struct *p)
   ^
   static 
   2 warnings generated.


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
