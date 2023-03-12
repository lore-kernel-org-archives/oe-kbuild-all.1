Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA711101
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 04:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678595532; x=1710131532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vGNccyixd1aBGoaQTIHKnHVnFhIE9HzqZYK3CReIuk=;
  b=Y5HalGxmISpPDBm3WfUJsTtUklN5QJktajpQtIatV+qmrvbBa2ebDNRJ
   tfgRHpH+e4okp3tTF9L08G8/CEo2tHpH++Mjz1Tw2SA5RZwY7TNXHnpfk
   Ph4ztQP6BKl0cFxNeV7RHgmvyIQsKiruZBzy6OH0AhCM3VmsAXeuLeDzr
   bZu0NeKdynbkT/elXlO7bE3h9EA1V0n4FwIftYA0VwRLdb88Vira0Y9uM
   ZNDj7VyuAg5waV+T1O9TrrtFVz7lc4LD+XNYjUsfK3aAfAeFHwOBp9+py
   YAmKW5cwb5s6zGPT0mcPLvdj8lnEiOUUb8bz7ZaAuWJliZYZEVNJTp0j5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320813281"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="320813281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 20:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="802059197"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="802059197"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2023 20:32:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbDNS-0004yl-1K;
	Sun, 12 Mar 2023 04:32:10 +0000
Date: Sun, 12 Mar 2023 12:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 284/371] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for function 'proc_sched_show_task'
Message-ID: <202303121207.zruPFiss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   66bb0e6d857d9b3bce5062779df9216e00986c6f
commit: 2f71a7687db0896451980a290f1fa0a9f5c47e3d [284/371] sched/alt: Headers cleanup
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230312/202303121207.zruPFiss-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/2f71a7687db0896451980a290f1fa0a9f5c47e3d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 2f71a7687db0896451980a290f1fa0a9f5c47e3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121207.zruPFiss-lkp@intel.com/

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
