Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67713FF3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9V2G8PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700415662; x=1731951662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//Lh8hrFd8czPefac8VmiSxSgLPPXFkocFLK+b0MEM4=;
  b=X9V2G8PSTresfalFU+ovdquzemyYABcPVeIjgQymKB1G+n69jsPNcXv1
   8GkckWqY+Yg9pElpQZTxZ62EJP2HUaWvgkqYTL5jnhYFG2eU6lX02ng68
   t5WCSnCTNKupH9LK/yHcKzqUm9RDiNt9+7D3Aa8br/6BymtHSXqGwNLlj
   gtUZDBSR12NrIDncGg3Hp3QikU1VIzr2ZIarxP0c4l/vvi4SYHpK4rx0j
   5+mNzbrEViw2rmjFsyUmzx4igHu/9Nh/IzmSkmrNh+4KaYvX9Sk4onemx
   V8HqnnDsUiWegOthRNea4oDheNbWwWMkt/zFhG0/dUl5JPWl/mLNndK9Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="13066524"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="13066524"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 09:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856792943"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="856792943"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2023 09:41:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4lmz-0005N9-2q;
	Sun, 19 Nov 2023 17:40:57 +0000
Date: Mon, 20 Nov 2023 01:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 328/449] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for function 'proc_sched_show_task'
Message-ID: <202311200148.hA2RurKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   a343b008e1bf155cdcfe9a46e38336032adeb65a
commit: d13019a47dac67a56620a6406b7639ed0ce74a4e [328/449] sched/alt: Headers cleanup
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200148.hA2RurKk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200148.hA2RurKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200148.hA2RurKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for function 'proc_sched_show_task' [-Wmissing-prototypes]
      23 | void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
         |      ^
   kernel/sched/alt_debug.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      23 | void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
         | ^
         | static 
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for function 'proc_sched_set_task' [-Wmissing-prototypes]
      30 | void proc_sched_set_task(struct task_struct *p)
         |      ^
   kernel/sched/alt_debug.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | void proc_sched_set_task(struct task_struct *p)
         | ^
         | static 
   2 warnings generated.


vim +/proc_sched_show_task +23 kernel/sched/alt_debug.c

9f08fc0c802aa6 Alfred Chen 2019-08-19  10  
9f08fc0c802aa6 Alfred Chen 2019-08-19  11  /*
9f08fc0c802aa6 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
9f08fc0c802aa6 Alfred Chen 2019-08-19  13   * to the console
9f08fc0c802aa6 Alfred Chen 2019-08-19  14   */
9f08fc0c802aa6 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
9f08fc0c802aa6 Alfred Chen 2019-08-19  16   do {						\
9f08fc0c802aa6 Alfred Chen 2019-08-19  17  	if (m)					\
9f08fc0c802aa6 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
9f08fc0c802aa6 Alfred Chen 2019-08-19  19  	else					\
9f08fc0c802aa6 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
9f08fc0c802aa6 Alfred Chen 2019-08-19  21   } while (0)
9f08fc0c802aa6 Alfred Chen 2019-08-19  22  
9f08fc0c802aa6 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
9f08fc0c802aa6 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
9f08fc0c802aa6 Alfred Chen 2019-08-19  25  {
9f08fc0c802aa6 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
9f08fc0c802aa6 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
9f08fc0c802aa6 Alfred Chen 2019-08-19  28  }
9f08fc0c802aa6 Alfred Chen 2019-08-19  29  
9f08fc0c802aa6 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: 9f08fc0c802aa60b849cb326294a06f38abaa0b0 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
