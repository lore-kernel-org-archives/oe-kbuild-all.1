Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C037F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693015575; x=1724551575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caIW/Z1lrful3cUbvAebjy9wdBJdzuGDBSvN0lfRGfo=;
  b=PEkhcgZElqzFsNjw4r96GEzesjnWroH56TmR9qWZO8zV8iLXzkI0yag3
   n5w4BvwBM6zmkXEMqKelh85ebqTMK1v5cpzdf4KjRm7Lj1bVPtfe1fTqa
   7FAzzuA+HfDB8GNlZmUYpDrf79V85DF/TjHYYk/Sxzb/fCQoqUxc65O5d
   ndP8oRJlOMWaROv3PpjbBZVCMMf+7QoLiE/7j+kYBNq41nhL04fIJUN+/
   BDkqTTs0tYSNtKLwxLJEmJc5620r+VT8XJpRd1ucfpy10N2bvhP5okmET
   Yj7ucQAp3WkhydYmNJ7nESmJEvoxxzbXfhSQuhf6kgxG5td9EjLxNglNM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354365255"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354365255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 19:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772686709"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="772686709"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 19:06:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZigk-0004Fb-16;
	Sat, 26 Aug 2023 02:06:10 +0000
Date: Sat, 26 Aug 2023 10:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 1/6] kernel/kthread.c:343:41:
 warning: 'param' defined but not used
Message-ID: <202308260917.05uz5app-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   0b1dc9f56a3ff638c5763c3618e6b177fa0c72cf
commit: 2dc8313c0917a1cabf05516d405cf128534215b1 [1/6] kthread: convert to use sched_set_normal()
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230826/202308260917.05uz5app-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260917.05uz5app-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260917.05uz5app-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kthread.c: In function 'kthread':
   kernel/kthread.c:343:41: warning: unused variable 'param' [-Wunused-variable]
     343 |         static const struct sched_param param = { .sched_priority = 0 };
         |                                         ^~~~~
   kernel/kthread.c: At top level:
>> kernel/kthread.c:343:41: warning: 'param' defined but not used [-Wunused-const-variable=]


vim +/param +343 kernel/kthread.c

cead1855266070 Eric W. Biederman         2021-11-22  340  
^1da177e4c3f41 Linus Torvalds            2005-04-16  341  static int kthread(void *_create)
^1da177e4c3f41 Linus Torvalds            2005-04-16  342  {
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10 @343  	static const struct sched_param param = { .sched_priority = 0 };
63706172f332fd Oleg Nesterov             2009-06-17  344  	/* Copy data: it's on kthread's stack */
^1da177e4c3f41 Linus Torvalds            2005-04-16  345  	struct kthread_create_info *create = _create;
63706172f332fd Oleg Nesterov             2009-06-17  346  	int (*threadfn)(void *data) = create->threadfn;
63706172f332fd Oleg Nesterov             2009-06-17  347  	void *data = create->data;
786235eeba0e1e Tetsuo Handa              2013-11-12  348  	struct completion *done;
1da5c46fa965ff Oleg Nesterov             2016-11-29  349  	struct kthread *self;
63706172f332fd Oleg Nesterov             2009-06-17  350  	int ret;
^1da177e4c3f41 Linus Torvalds            2005-04-16  351  
00b89fe0197f0c Valentin Schneider        2021-05-10  352  	self = to_kthread(current);
^1da177e4c3f41 Linus Torvalds            2005-04-16  353  
d25c83c6606ffc Petr Mladek               2022-03-15  354  	/* Release the structure when caller killed by a fatal signal. */
786235eeba0e1e Tetsuo Handa              2013-11-12  355  	done = xchg(&create->done, NULL);
786235eeba0e1e Tetsuo Handa              2013-11-12  356  	if (!done) {
73e0c116594d99 Mike Christie             2023-03-10  357  		kfree(create->full_name);
786235eeba0e1e Tetsuo Handa              2013-11-12  358  		kfree(create);
bbda86e988d4c1 Eric W. Biederman         2021-11-22  359  		kthread_exit(-EINTR);
1da5c46fa965ff Oleg Nesterov             2016-11-29  360  	}
1da5c46fa965ff Oleg Nesterov             2016-11-29  361  
73e0c116594d99 Mike Christie             2023-03-10  362  	self->full_name = create->full_name;
52782c92ac85c4 J. Bruce Fields           2020-05-06  363  	self->threadfn = threadfn;
1da5c46fa965ff Oleg Nesterov             2016-11-29  364  	self->data = data;
1da5c46fa965ff Oleg Nesterov             2016-11-29  365  
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10  366  	/*
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10  367  	 * The new thread inherited kthreadd's priority and CPU mask. Reset
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10  368  	 * back to default in case they have been changed.
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10  369  	 */
2dc8313c0917a1 Qais Yousef               2020-07-23  370  	sched_set_normal(current, task_nice(current));
04d4e665a60902 Frederic Weisbecker       2022-02-07  371  	set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_KTHREAD));
1a7243ca4074be Sebastian Andrzej Siewior 2020-11-10  372  
^1da177e4c3f41 Linus Torvalds            2005-04-16  373  	/* OK, tell user we're spawned, wait for stop or wakeup */
a076e4bca2fdab Oleg Nesterov             2007-05-23  374  	__set_current_state(TASK_UNINTERRUPTIBLE);
3217ab97f14c5c Vitaliy Gusev             2009-04-09  375  	create->result = current;
26c7295be0c5e6 Liang Chen                2020-03-06  376  	/*
26c7295be0c5e6 Liang Chen                2020-03-06  377  	 * Thread is going to call schedule(), do not preempt it,
26c7295be0c5e6 Liang Chen                2020-03-06  378  	 * or the creator may spend more time in wait_task_inactive().
26c7295be0c5e6 Liang Chen                2020-03-06  379  	 */
26c7295be0c5e6 Liang Chen                2020-03-06  380  	preempt_disable();
786235eeba0e1e Tetsuo Handa              2013-11-12  381  	complete(done);
26c7295be0c5e6 Liang Chen                2020-03-06  382  	schedule_preempt_disabled();
26c7295be0c5e6 Liang Chen                2020-03-06  383  	preempt_enable();
^1da177e4c3f41 Linus Torvalds            2005-04-16  384  
63706172f332fd Oleg Nesterov             2009-06-17  385  	ret = -EINTR;
1da5c46fa965ff Oleg Nesterov             2016-11-29  386  	if (!test_bit(KTHREAD_SHOULD_STOP, &self->flags)) {
77f88796cee819 Tejun Heo                 2017-03-16  387  		cgroup_kthread_ready();
1da5c46fa965ff Oleg Nesterov             2016-11-29  388  		__kthread_parkme(self);
2a1d446019f9a5 Thomas Gleixner           2012-07-16  389  		ret = threadfn(data);
2a1d446019f9a5 Thomas Gleixner           2012-07-16  390  	}
bbda86e988d4c1 Eric W. Biederman         2021-11-22  391  	kthread_exit(ret);
^1da177e4c3f41 Linus Torvalds            2005-04-16  392  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  393  

:::::: The code at line 343 was first introduced by commit
:::::: 1a7243ca4074beed97b68d7235a6e34862fc2cd6 kthread: Move prio/affinite change into the newly created thread

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
