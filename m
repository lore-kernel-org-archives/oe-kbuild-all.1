Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB68161
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 00:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691109539; x=1722645539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlMe0uMhgeAs6X3fD0qsSyBcylLs2W1xXLlVhrjkb7Y=;
  b=QCP8ziHve+08Po00jBqfIAptoRkkezIV/hFVAwcQImZYCU0MhzVLm+6s
   Tbzy533LkckT4oXi3AMMJ0YtIQimfeDMMvr3TNOKdrOrrkZYXdTFhlnGM
   XQvCsljoDdZOAY0ZtYVJEApEJgHS6xuct1m8wV3gEB41WQLPoVrQZFtVT
   BnTUT6OUpuo5Kszx4Kub8Xn+UhYGufH/ww3JuyJlrGRO/sAj4K6yLYN2d
   mU/f/Y/00hBMwjvZlAbXxd1gjbRLbF5xqc3q4jPOYXS6/LfifwxHVSZ7k
   GoLbtjiIfAVsEvVvrOCId5cp2UsEkCVoo7khubuR/qY+pvZKZN/YTs71v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="372780142"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="372780142"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 17:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="795183024"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="795183024"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 17:38:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRiqG-0002Uj-1y;
	Fri, 04 Aug 2023 00:38:56 +0000
Date: Fri, 4 Aug 2023 08:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 284/387] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for function 'proc_sched_show_task'
Message-ID: <202308040841.L1xDJlvx-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: fa51a210dd580901cb9fde19d3d268b3dc9cd597 [284/387] sched/alt: Headers cleanup
config: x86_64-randconfig-x006-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040841.L1xDJlvx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040841.L1xDJlvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040841.L1xDJlvx-lkp@intel.com/

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

cedcd3e67433b34 Alfred Chen 2019-08-19  10  
cedcd3e67433b34 Alfred Chen 2019-08-19  11  /*
cedcd3e67433b34 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
cedcd3e67433b34 Alfred Chen 2019-08-19  13   * to the console
cedcd3e67433b34 Alfred Chen 2019-08-19  14   */
cedcd3e67433b34 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
cedcd3e67433b34 Alfred Chen 2019-08-19  16   do {						\
cedcd3e67433b34 Alfred Chen 2019-08-19  17  	if (m)					\
cedcd3e67433b34 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
cedcd3e67433b34 Alfred Chen 2019-08-19  19  	else					\
cedcd3e67433b34 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
cedcd3e67433b34 Alfred Chen 2019-08-19  21   } while (0)
cedcd3e67433b34 Alfred Chen 2019-08-19  22  
cedcd3e67433b34 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
cedcd3e67433b34 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
cedcd3e67433b34 Alfred Chen 2019-08-19  25  {
cedcd3e67433b34 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
cedcd3e67433b34 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
cedcd3e67433b34 Alfred Chen 2019-08-19  28  }
cedcd3e67433b34 Alfred Chen 2019-08-19  29  
cedcd3e67433b34 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
