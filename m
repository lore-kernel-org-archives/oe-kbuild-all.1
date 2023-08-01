Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6072514C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914821; x=1722450821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MaofhV/LOZ8PBboi5iynxW5OjUOoOX2CI/GPtBDIXs=;
  b=JvoKgQSbYbiDy+QUxFUR9SuXnlx1GSiCgWflqY47ey+68QanBb/xj5CW
   QUouoySbhJ7h1WAEUBl5oGVu5bVPEG6UO1LPFSg3UQ7Pj2/qaSFMXamI4
   B3SwoLdCEKQfxjK0AcfRYfz/dw9V40+eUjfJyEXypttBjw8Sg269t7VMB
   e/2Bp24rlYSiOJGUmJsmDcg5CMuSWjUjejwXwWSxuIGby4hF7hghlLM2B
   vCLfFwY6ZxPP1f+yZgYnO/2T/iov8hGl1mMg1dnBffD5Y6BenFuIsoqsH
   pw7POZutfif7UNvWtfUSnxYvTuARMylmvrktpuGXcsuy4xHpfI/52ZQO5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369383839"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369383839"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705880070"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="705880070"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 11:33:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQuBd-0000WR-2F;
	Tue, 01 Aug 2023 18:33:37 +0000
Date: Wed, 2 Aug 2023 02:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Auld <pauld@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 5/5] kernel/sched/core.c:1254:21: error:
 implicit declaration of function 'cfs_task_bw_constrained'
Message-ID: <202308020255.e0KP5AaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2bf98cd67594f382efdf6c313228f41b542eb4b9
commit: 2bf98cd67594f382efdf6c313228f41b542eb4b9 [5/5] sched/fair: Block nohz tick_stop when cfs bandwidth in use
config: sparc64-randconfig-r013-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020255.e0KP5AaS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020255.e0KP5AaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020255.e0KP5AaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'sched_can_stop_tick':
>> kernel/sched/core.c:1254:21: error: implicit declaration of function 'cfs_task_bw_constrained' [-Werror=implicit-function-declaration]
    1254 |                 if (cfs_task_bw_constrained(rq->curr))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/sched/core.c:1254:17: note: in expansion of macro 'if'
    1254 |                 if (cfs_task_bw_constrained(rq->curr))
         |                 ^~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:6845:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    6845 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cfs_task_bw_constrained +1254 kernel/sched/core.c

  1210	
  1211	bool sched_can_stop_tick(struct rq *rq)
  1212	{
  1213		int fifo_nr_running;
  1214	
  1215		/* Deadline tasks, even if single, need the tick */
  1216		if (rq->dl.dl_nr_running)
  1217			return false;
  1218	
  1219		/*
  1220		 * If there are more than one RR tasks, we need the tick to affect the
  1221		 * actual RR behaviour.
  1222		 */
  1223		if (rq->rt.rr_nr_running) {
  1224			if (rq->rt.rr_nr_running == 1)
  1225				return true;
  1226			else
  1227				return false;
  1228		}
  1229	
  1230		/*
  1231		 * If there's no RR tasks, but FIFO tasks, we can skip the tick, no
  1232		 * forced preemption between FIFO tasks.
  1233		 */
  1234		fifo_nr_running = rq->rt.rt_nr_running - rq->rt.rr_nr_running;
  1235		if (fifo_nr_running)
  1236			return true;
  1237	
  1238		/*
  1239		 * If there are no DL,RR/FIFO tasks, there must only be CFS tasks left;
  1240		 * if there's more than one we need the tick for involuntary
  1241		 * preemption.
  1242		 */
  1243		if (rq->nr_running > 1)
  1244			return false;
  1245	
  1246		/*
  1247		 * If there is one task and it has CFS runtime bandwidth constraints
  1248		 * and it's on the cpu now we don't want to stop the tick.
  1249		 * This check prevents clearing the bit if a newly enqueued task here is
  1250		 * dequeued by migrating while the constrained task continues to run.
  1251		 * E.g. going from 2->1 without going through pick_next_task().
  1252		 */
  1253		if (sched_feat(HZ_BW) && __need_bw_check(rq, rq->curr)) {
> 1254			if (cfs_task_bw_constrained(rq->curr))
  1255				return false;
  1256		}
  1257	
  1258		return true;
  1259	}
  1260	#endif /* CONFIG_NO_HZ_FULL */
  1261	#endif /* CONFIG_SMP */
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
