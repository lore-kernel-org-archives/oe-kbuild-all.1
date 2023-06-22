Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB75246
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687429472; x=1718965472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Chk1naoIc1HnORlxlpxDFmy6/hVBpOPOZr4rZKYFxyw=;
  b=nMDiCcGiPHvGVh341d0Ck5OFXBP0PsESG5G5qG//r2nl6WTddlD++GUc
   0WMYPP3sErx9vrxgL32kvGh5yAKWarxt39WrY0DcjTndGQwWHQXRXUlQc
   F4hG2uwm+8OZ9MHFPjIMgiOHhuKlEEwsT5Dn7uxkQLB6LqDasEgPYoWls
   ec+K/C1ggv0TfMD2mW5k01Kuh2yDKUQIxz8lsH/HL8RLDD6IH0TcKleVO
   5vQOnBSahp7+qsXIg5M0AVoxgMZDw2VDlK8dQqU5jYGcgoAKOWWifrZyK
   utI7Pkmm6gVDWU8Q8c+lQABwdUMJ247GzYi9wSgTHVqoVLWlIGmbUK4s8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="426406379"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="426406379"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 03:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="780177326"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="780177326"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2023 03:21:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCHRX-0007Ux-2V;
	Thu, 22 Jun 2023 10:21:35 +0000
Date: Thu, 22 Jun 2023 18:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 206/209] kernel/sched/debug.c:603:23:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 4 has type 'u32' {aka 'unsigned int'}
Message-ID: <202306221812.Jj25MCVk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   f79defe3c750e95ce7cf290a0c01d349058ab17e
commit: e5bd4b2be5dc132da85f230bdfa93bd00698f5d3 [206/209] CHROMIUM: BACKPORT: FROMLIST: sched/fair: Add util_guest for tasks
config: mips-randconfig-r006-20230622 (https://download.01.org/0day-ci/archive/20230622/202306221812.Jj25MCVk-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221812.Jj25MCVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221812.Jj25MCVk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:603:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     603 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                       ^~~~~~~~~~~~~~~~~
     604 |                         cfs_rq->avg.util_avg);
         |                         ~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    u32 {aka unsigned int}
   kernel/sched/debug.c:18:31: note: in definition of macro 'SEQ_printf'
      18 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:603:36: note: format string is defined here
     603 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                                  ~~^
         |                                    |
         |                                    long unsigned int
         |                                  %u
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from include/asm-generic/bug.h:20,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/debug.c:9:
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:385:16: note: in expansion of macro 'KERN_CONT'
     385 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   kernel/sched/debug.c:20:17: note: in expansion of macro 'pr_cont'
      20 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:603:9: note: in expansion of macro 'SEQ_printf'
     603 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |         ^~~~~~~~~~


vim +603 kernel/sched/debug.c

43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  554  
5cef9eca3837a8 kernel/sched_debug.c Ingo Molnar     2007-08-09  555  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  556  {
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  557  	s64 MIN_vruntime = -1, min_vruntime, max_vruntime = -1,
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  558  		spread, rq0_min_vruntime, spread0;
348ec61e6268c3 kernel/sched_debug.c Hitoshi Mitake  2009-06-17  559  	struct rq *rq = cpu_rq(cpu);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  560  	struct sched_entity *last;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  561  	unsigned long flags;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  562  
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  563  #ifdef CONFIG_FAIR_GROUP_SCHED
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  564  	SEQ_printf(m, "\n");
94f1bdf01b3930 kernel/sched/debug.c Waiman Long     2021-04-15  565  	SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  566  #else
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  567  	SEQ_printf(m, "\n");
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  568  	SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  569  #endif
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  570  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  571  			SPLIT_NS(cfs_rq->exec_clock));
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  572  
8a257c4205fa5a kernel/sched/debug.c Peter Zijlstra  2020-11-17  573  	raw_spin_rq_lock_irqsave(rq, flags);
bfb068892d30dc kernel/sched/debug.c Davidlohr Bueso 2017-09-08  574  	if (rb_first_cached(&cfs_rq->tasks_timeline))
ac53db596cc08e kernel/sched_debug.c Rik van Riel    2011-02-01  575  		MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  576  	last = __pick_last_entity(cfs_rq);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  577  	if (last)
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  578  		max_vruntime = last->vruntime;
5ac5c4d604bf89 kernel/sched_debug.c Peter Zijlstra  2008-11-10  579  	min_vruntime = cfs_rq->min_vruntime;
348ec61e6268c3 kernel/sched_debug.c Hitoshi Mitake  2009-06-17  580  	rq0_min_vruntime = cpu_rq(0)->cfs.min_vruntime;
8a257c4205fa5a kernel/sched/debug.c Peter Zijlstra  2020-11-17  581  	raw_spin_rq_unlock_irqrestore(rq, flags);
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  582  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "MIN_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  583  			SPLIT_NS(MIN_vruntime));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  584  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  585  			SPLIT_NS(min_vruntime));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  586  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "max_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  587  			SPLIT_NS(max_vruntime));
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  588  	spread = max_vruntime - MIN_vruntime;
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  589  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  590  			SPLIT_NS(spread));
86d9560cb6bd85 kernel/sched_debug.c Ingo Molnar     2007-10-15  591  	spread0 = min_vruntime - rq0_min_vruntime;
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  592  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread0",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  593  			SPLIT_NS(spread0));
5ac5c4d604bf89 kernel/sched_debug.c Peter Zijlstra  2008-11-10  594  	SEQ_printf(m, "  .%-30s: %d\n", "nr_spread_over",
ddc972975091ba kernel/sched_debug.c Peter Zijlstra  2007-10-15  595  			cfs_rq->nr_spread_over);
c82513e513556a kernel/sched/debug.c Peter Zijlstra  2012-04-26  596  	SEQ_printf(m, "  .%-30s: %d\n", "nr_running", cfs_rq->nr_running);
2069dd75c7d0f4 kernel/sched_debug.c Peter Zijlstra  2010-11-15  597  	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
c09595f63bb190 kernel/sched_debug.c Peter Zijlstra  2008-06-27  598  #ifdef CONFIG_SMP
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  599  	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  600  			cfs_rq->avg.load_avg);
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  601  	SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  602  			cfs_rq->avg.runnable_avg);
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15 @603  	SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  604  			cfs_rq->avg.util_avg);
7f65ea42eb00bc kernel/sched/debug.c Patrick Bellasi 2018-03-09  605  	SEQ_printf(m, "  .%-30s: %u\n", "util_est_enqueued",
7f65ea42eb00bc kernel/sched/debug.c Patrick Bellasi 2018-03-09  606  			cfs_rq->avg.util_est.enqueued);
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  607  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  608  			cfs_rq->removed.load_avg);
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  609  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
2a2f5d4e44ed16 kernel/sched/debug.c Peter Zijlstra  2017-05-08  610  			cfs_rq->removed.util_avg);
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  611  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_avg",
9f68395333ad7f kernel/sched/debug.c Vincent Guittot 2020-02-24  612  			cfs_rq->removed.runnable_avg);
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  613  #ifdef CONFIG_FAIR_GROUP_SCHED
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  614  	SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15  615  			cfs_rq->tg_load_avg_contrib);
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  616  	SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  617  			atomic_long_read(&cfs_rq->tg->load_avg));
c09595f63bb190 kernel/sched_debug.c Peter Zijlstra  2008-06-27  618  #endif
333bb864f19201 kernel/sched/debug.c Alex Shi        2013-06-28  619  #endif
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  620  #ifdef CONFIG_CFS_BANDWIDTH
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  621  	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  622  			cfs_rq->throttled);
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  623  	SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  624  			cfs_rq->throttle_count);
f9f9ffc237dd92 kernel/sched/debug.c Ben Segall      2013-10-16  625  #endif
2069dd75c7d0f4 kernel/sched_debug.c Peter Zijlstra  2010-11-15  626  

:::::: The code at line 603 was first introduced by commit
:::::: 9d89c257dfb9c51a532d69397f6eed75e5168c35 sched/fair: Rewrite runnable load and utilization average tracking

:::::: TO: Yuyang Du <yuyang.du@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
