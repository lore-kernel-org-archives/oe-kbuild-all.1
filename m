Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0E10E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpRpXXvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704502863; x=1736038863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmV7VUAeS24y1QCsx8UWa0dMNJL5wbRrJ4VnQeGzfC4=;
  b=PpRpXXvQxg2nFF7Mnl+4R8/HnLkKkxq+VJa0jiFpu8s9hVCICI0nCuzQ
   vdE0RnSdEh2KsZ8k9hMa9+5DLL7aDcgMO0tI3HqFQ4z2khAOeGKPmopdv
   ncsbx6egVLm9s2vq+tdT8e172F1nidTcLjC3Lxch0RaX5dOwtjUEX5TaX
   RUmRad15zRsH66oUAtByTN8xji1tN/XXchH+CyUcz74h+5PaHXPOM3SdJ
   y7T9gFRQK1GeZQHCADi77FHs0Dr95K1ifwLQyOxiFS3szCre6J+VFdMns
   Y8AaiR2ieKlZKclQiv4LFFQ0bk5S8WpfiycudaC84UX7Lv8tLhSKdXStn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="428802755"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="428802755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 17:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="904292226"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="904292226"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Jan 2024 17:00:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLv3W-0001rY-1L;
	Sat, 06 Jan 2024 01:00:54 +0000
Date: Sat, 6 Jan 2024 09:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 kernel/livepatch/../sched/sched.h:1442:15: warning: cast from 'void
 (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to
 incompatible function type
Message-ID: <202401060839.YC5kPIaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   90c5e2a69999541578268a36d0d0a9bbe5e9923b
commit: 90c5e2a69999541578268a36d0d0a9bbe5e9923b [1/1] UPSTREAM: trace: bpf: Allow bpf to attach to bare tracepoints
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240106/202401060839.YC5kPIaQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401060839.YC5kPIaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401060839.YC5kPIaQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/livepatch/transition.c:15:
>> kernel/livepatch/../sched/sched.h:1442:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1442 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1442 kernel/livepatch/../sched/sched.h

518cd62341786a Peter Zijlstra     2011-12-07  1429  
5695c1ea6568ea Pavankumar Kondeti 2020-11-17  1430  extern int migrate_swap(struct task_struct *p, struct task_struct *t,
5695c1ea6568ea Pavankumar Kondeti 2020-11-17  1431  			int cpu, int scpu);
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1432  static inline void
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1433  queue_balance_callback(struct rq *rq,
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1434  		       struct callback_head *head,
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1435  		       void (*func)(struct rq *rq))
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1436  {
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1437  	lockdep_assert_held(&rq->lock);
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1438  
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1439  	if (unlikely(head->next))
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1440  		return;
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1441  
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11 @1442  	head->func = (void (*)(struct callback_head *))func;
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1443  	head->next = rq->balance_callback;
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1444  	rq->balance_callback = head;
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1445  }
e3fca9e7cbfb72 Peter Zijlstra     2015-06-11  1446  

:::::: The code at line 1442 was first introduced by commit
:::::: e3fca9e7cbfb72694a21c886fcdf9f059cfded9c sched: Replace post_schedule with a balance callback list

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
