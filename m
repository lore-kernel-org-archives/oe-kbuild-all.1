Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE017F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 00:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686012216; x=1717548216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQphVq2xPfx28r1B43sVLLJREEOiwB8A7ZiL/3fVYII=;
  b=KAeaIdQcWObwZpOPlAL7NP7h649IBZVqJON+h29e7OPuxBppaucQkpyl
   FOXTXT6fUk0mFWs8wmSSIZI+EVKvmPqjXGNWKgKtwWXnpMU9G5otYb2VD
   1CZaoPO3rsBqzmxM2CTzyal7PpKmRCElCyHmbK48/zIM74F6KGBJVHwlj
   sO8eKQN1xinXT5e+oEIZRg64/oU5AUeCRU50FPh9M9rbqxesYODFWr9qJ
   UwUaAetoCNSNeZZORzj+iuu8Th8R8a4dQntRvuGX+Tw96AuE8VRwccDnp
   K2BWTGbiKV/FHAmrPsv1tbt7XIPc6GURxwBg+zPSRMxk9+sp6/IynEOUL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336144321"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="336144321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 17:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="853180721"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="853180721"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2023 17:43:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6KnN-0004cB-20;
	Tue, 06 Jun 2023 00:43:33 +0000
Date: Tue, 6 Jun 2023 08:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 4/7] kernel/sched/debug.c:647:33: error:
 implicit declaration of function '__pick_first_entity'; did you mean
 '__pick_last_entity'?
Message-ID: <202306060810.JgpWKKbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   4bfcd2b1530138c36d5d8fab626558123812fc92
commit: aa2d9969b7bd01b144651974835aba310fe909d0 [4/7] sched: Use fancy new guards
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230606/202306060810.JgpWKKbb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=aa2d9969b7bd01b144651974835aba310fe909d0
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout aa2d9969b7bd01b144651974835aba310fe909d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060810.JgpWKKbb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:53:
   kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:647:33: error: implicit declaration of function '__pick_first_entity'; did you mean '__pick_last_entity'? [-Werror=implicit-function-declaration]
     647 |                 MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
         |                                 ^~~~~~~~~~~~~~~~~~~
         |                                 __pick_last_entity
>> kernel/sched/debug.c:647:61: error: invalid type argument of '->' (have 'int')
     647 |                 MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
         |                                                             ^~
   cc1: some warnings being treated as errors


vim +647 kernel/sched/debug.c

43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  626  
5cef9eca3837a8 kernel/sched_debug.c Ingo Molnar     2007-08-09  627  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  628  {
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  629  	s64 MIN_vruntime = -1, min_vruntime, max_vruntime = -1,
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  630  		spread, rq0_min_vruntime, spread0;
348ec61e6268c3 kernel/sched_debug.c Hitoshi Mitake  2009-06-17  631  	struct rq *rq = cpu_rq(cpu);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  632  	struct sched_entity *last;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  633  	unsigned long flags;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  634  
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  635  #ifdef CONFIG_FAIR_GROUP_SCHED
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  636  	SEQ_printf(m, "\n");
ad789f84c9a145 kernel/sched/debug.c Waiman Long     2021-04-15  637  	SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  638  #else
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  639  	SEQ_printf(m, "\n");
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  640  	SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  641  #endif
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  642  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  643  			SPLIT_NS(cfs_rq->exec_clock));
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  644  
5cb9eaa3d274f7 kernel/sched/debug.c Peter Zijlstra  2020-11-17  645  	raw_spin_rq_lock_irqsave(rq, flags);
bfb068892d30dc kernel/sched/debug.c Davidlohr Bueso 2017-09-08  646  	if (rb_first_cached(&cfs_rq->tasks_timeline))
ac53db596cc08e kernel/sched_debug.c Rik van Riel    2011-02-01 @647  		MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  648  	last = __pick_last_entity(cfs_rq);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  649  	if (last)
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  650  		max_vruntime = last->vruntime;
5ac5c4d604bf89 kernel/sched_debug.c Peter Zijlstra  2008-11-10  651  	min_vruntime = cfs_rq->min_vruntime;
348ec61e6268c3 kernel/sched_debug.c Hitoshi Mitake  2009-06-17  652  	rq0_min_vruntime = cpu_rq(0)->cfs.min_vruntime;
5cb9eaa3d274f7 kernel/sched/debug.c Peter Zijlstra  2020-11-17  653  	raw_spin_rq_unlock_irqrestore(rq, flags);
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  654  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "MIN_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  655  			SPLIT_NS(MIN_vruntime));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  656  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  657  			SPLIT_NS(min_vruntime));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  658  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "max_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  659  			SPLIT_NS(max_vruntime));
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  660  	spread = max_vruntime - MIN_vruntime;
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  661  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  662  			SPLIT_NS(spread));
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  663  	spread0 = min_vruntime - rq0_min_vruntime;
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  664  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread0",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  665  			SPLIT_NS(spread0));
5ac5c4d604bf89 kernel/sched_debug.c Peter Zijlstra  2008-11-10  666  	SEQ_printf(m, "  .%-30s: %d\n", "nr_spread_over",
ddc972975091ba kernel/sched_debug.c Peter Zijlstra  2007-10-15  667  			cfs_rq->nr_spread_over);
c82513e513556a kernel/sched/debug.c Peter Zijlstra  2012-04-26  668  	SEQ_printf(m, "  .%-30s: %d\n", "nr_running", cfs_rq->nr_running);
304000390f88d0 kernel/sched/debug.c Josh Don        2021-07-29  669  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_running", cfs_rq->h_nr_running);
a480addecc0d89 kernel/sched/debug.c Josh Don        2021-08-19  670  	SEQ_printf(m, "  .%-30s: %d\n", "idle_nr_running",
a480addecc0d89 kernel/sched/debug.c Josh Don        2021-08-19  671  			cfs_rq->idle_nr_running);
304000390f88d0 kernel/sched/debug.c Josh Don        2021-07-29  672  	SEQ_printf(m, "  .%-30s: %d\n", "idle_h_nr_running",
304000390f88d0 kernel/sched/debug.c Josh Don        2021-07-29  673  			cfs_rq->idle_h_nr_running);
2069dd75c7d0f4 kernel/sched_debug.c Peter Zijlstra  2010-11-15  674  	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
c09595f63bb190 kernel/sched_debug.c Peter Zijlstra  2008-06-27  675  #ifdef CONFIG_SMP
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  676  	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  677  			cfs_rq->avg.load_avg);
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  678  	SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  679  			cfs_rq->avg.runnable_avg);
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  680  	SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  681  			cfs_rq->avg.util_avg);
7f65ea42eb00bc kernel/sched/debug.c Patrick Bellasi 2018-03-09  682  	SEQ_printf(m, "  .%-30s: %u\n", "util_est_enqueued",
7f65ea42eb00bc kernel/sched/debug.c Patrick Bellasi 2018-03-09  683  			cfs_rq->avg.util_est.enqueued);
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  684  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  685  			cfs_rq->removed.load_avg);
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  686  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  687  			cfs_rq->removed.util_avg);
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  688  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_avg",
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  689  			cfs_rq->removed.runnable_avg);
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  690  #ifdef CONFIG_FAIR_GROUP_SCHED
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  691  	SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  692  			cfs_rq->tg_load_avg_contrib);
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  693  	SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  694  			atomic_long_read(&cfs_rq->tg->load_avg));
c09595f63bb190 kernel/sched_debug.c Peter Zijlstra  2008-06-27  695  #endif
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  696  #endif
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  697  #ifdef CONFIG_CFS_BANDWIDTH
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  698  	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  699  			cfs_rq->throttled);
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  700  	SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  701  			cfs_rq->throttle_count);
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  702  #endif
2069dd75c7d0f4 kernel/sched_debug.c Peter Zijlstra  2010-11-15  703  

:::::: The code at line 647 was first introduced by commit
:::::: ac53db596cc08ecb8040cfb6f71ae40c6f2041c4 sched: Use a buddy to implement yield_task_fair()

:::::: TO: Rik van Riel <riel@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
