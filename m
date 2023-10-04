Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7242101DB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696431318; x=1727967318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keJb0SoLLpzrIZd4MBJ7wIfmn6Csa3H/MFhHKADBYmk=;
  b=Wln0BY0Xon13dHgxlmTaDQn0Ugh7yGluXQXPT/Ut5CppmYcBj575W3qK
   ZH6eGGX7sGgVOBGJwyoWfvT9OII6A90aV/ZH1uVpX5GpbNxGMWTHpOgr+
   uzmvriwRruhB6pJNif+Ym1WsJoxO4/YDe//369lq7hrxJmQ2sutT2zzwV
   WYtTmlKJ1lgblkbMA2WZ7T4rDDOmZgRmcSzaAiN/Bs/ZiofX6ikk9omFp
   8N0GfhbTJyW9S+3MpF8FpYtjAe0M4LuUpjc75JK7cnfxjaqol/KNyigTm
   g0tDDGtSrQMhKl4e8kUZ8wYAzJZIUBTilUu5BMnr8vxEQcao85eodIekq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1788607"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="1788607"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 07:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082544797"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="1082544797"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2023 07:55:15 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo3HN-000KJO-1i;
	Wed, 04 Oct 2023 14:55:13 +0000
Date: Wed, 4 Oct 2023 22:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <Hongyan.Xia2@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] sched/uclamp: Track uclamped util_avg in
 sched_avg
Message-ID: <202310042249.E5T1luOd-lkp@intel.com>
References: <5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2@arm.com>

Hi Hongyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master tip/auto-latest v6.6-rc4 next-20231004]
[cannot apply to tip/sched/core tip/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/sched-uclamp-Track-uclamped-util_avg-in-sched_avg/20231004-170733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2%40arm.com
patch subject: [RFC PATCH 1/6] sched/uclamp: Track uclamped util_avg in sched_avg
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231004/202310042249.E5T1luOd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310042249.E5T1luOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310042249.E5T1luOd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:680:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
     680 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                       ^~~~~~~~~~~~~~~~~
     681 |                         cfs_rq->avg.util_avg);
         |                         ~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    unsigned int
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:680:36: note: format string is defined here
     680 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                                  ~~^
         |                                    |
         |                                    long unsigned int
         |                                  %u
   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:540:16: note: in expansion of macro 'KERN_CONT'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:680:9: note: in expansion of macro 'SEQ_printf'
     680 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |         ^~~~~~~~~~


vim +680 kernel/sched/debug.c

43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  628  
5cef9eca3837a8 kernel/sched_debug.c Ingo Molnar     2007-08-09  629  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar     2007-07-09  630  {
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  631  	s64 left_vruntime = -1, min_vruntime, right_vruntime = -1, spread;
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  632  	struct sched_entity *last, *first;
348ec61e6268c3 kernel/sched_debug.c Hitoshi Mitake  2009-06-17  633  	struct rq *rq = cpu_rq(cpu);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  634  	unsigned long flags;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  635  
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  636  #ifdef CONFIG_FAIR_GROUP_SCHED
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  637  	SEQ_printf(m, "\n");
ad789f84c9a145 kernel/sched/debug.c Waiman Long     2021-04-15  638  	SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  639  #else
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  640  	SEQ_printf(m, "\n");
e9ca267096674e kernel/sched/debug.c Joe Lawrence    2018-03-19  641  	SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
efe25c2c7b3a5d kernel/sched_debug.c Bharata B Rao   2011-01-11  642  #endif
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  643  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  644  			SPLIT_NS(cfs_rq->exec_clock));
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  645  
5cb9eaa3d274f7 kernel/sched/debug.c Peter Zijlstra  2020-11-17  646  	raw_spin_rq_lock_irqsave(rq, flags);
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  647  	first = __pick_first_entity(cfs_rq);
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  648  	if (first)
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  649  		left_vruntime = first->vruntime;
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  650  	last = __pick_last_entity(cfs_rq);
67e12eac328b27 kernel/sched_debug.c Ingo Molnar     2007-10-15  651  	if (last)
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  652  		right_vruntime = last->vruntime;
5ac5c4d604bf89 kernel/sched_debug.c Peter Zijlstra  2008-11-10  653  	min_vruntime = cfs_rq->min_vruntime;
5cb9eaa3d274f7 kernel/sched/debug.c Peter Zijlstra  2020-11-17  654  	raw_spin_rq_unlock_irqrestore(rq, flags);
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  655  
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  656  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_vruntime",
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  657  			SPLIT_NS(left_vruntime));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  658  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar     2007-10-15  659  			SPLIT_NS(min_vruntime));
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  660  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "avg_vruntime",
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  661  			SPLIT_NS(avg_vruntime(cfs_rq)));
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  662  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "right_vruntime",
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  663  			SPLIT_NS(right_vruntime));
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  664  	spread = right_vruntime - left_vruntime;
af4cf40470c22e kernel/sched/debug.c Peter Zijlstra  2023-05-31  665  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread", SPLIT_NS(spread));
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
9d89c257dfb9c5 kernel/sched/debug.c Yuyang Du       2015-07-15 @680  	SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
