Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7023C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693306913; x=1724842913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3SZ/imTwnMsdXsN2+KSifT2NgSnW7tsFM00Qc2r/cao=;
  b=EEUJWeWqxLaXvmnpA5IH2XJ5/BwzWc/hrY6pTborAU8vlin08DZp6aDu
   C8JDjpe6MFgn2E5dPJ9Wv1VB5vnKkphqeAzw5TIHkZCiXurvv+TwfsdME
   Ta8i1LoM6d5SzQRnTRGtI2uMCl+PpEi0KBiRIUY8hekzpWDCaXnjrraoX
   kFjKYSca7hm83ybZD5dIvwd+R6BM0RTJJ5n3vl19XOJ8qSwR81ujjbvOF
   PUkrQ2IBzHbflgGYe1jEq6q1icscOoDbnok4r9/gznD25DP2YilNwMtUQ
   H/DYmdc/De+Jbt14fbQ7n8alnxKmwcuB6OpwXffC53U6St+hgaXgKXE43
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="374228103"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="374228103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 04:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="768033830"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="768033830"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2023 04:01:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qawTK-0008ft-2Z;
	Tue, 29 Aug 2023 11:01:29 +0000
Date: Tue, 29 Aug 2023 19:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 61/64] kernel/sched/debug.c:551:23: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 4
 has type 'u32' {aka 'unsigned int'}
Message-ID: <202308291901.XvgTkjC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   a1f444069f1cadb488c919ead761560c4135de15
commit: cda81ec600e3709bef3de7b2f65a227a4582802b [61/64] CHROMIUM: BACKPORT: FROMLIST: sched/fair: Add util_guest for tasks
config: i386-randconfig-011-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291901.XvgTkjC3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291901.XvgTkjC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291901.XvgTkjC3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:551:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     551 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                       ^~~~~~~~~~~~~~~~~
     552 |                         cfs_rq->avg.util_avg);
         |                         ~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    u32 {aka unsigned int}
   kernel/sched/debug.c:18:31: note: in definition of macro 'SEQ_printf'
      18 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:551:36: note: format string is defined here
     551 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |                                  ~~^
         |                                    |
         |                                    long unsigned int
         |                                  %u
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from arch/x86/include/asm/percpu.h:45,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/debug.c:9:
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:313:16: note: in expansion of macro 'KERN_CONT'
     313 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   kernel/sched/debug.c:20:17: note: in expansion of macro 'pr_cont'
      20 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:551:9: note: in expansion of macro 'SEQ_printf'
     551 |         SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
         |         ^~~~~~~~~~


vim +551 kernel/sched/debug.c

43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar     2007-07-09  501  
5cef9eca3837a8d kernel/sched_debug.c Ingo Molnar     2007-08-09  502  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar     2007-07-09  503  {
86d9560cb6bd859 kernel/sched_debug.c Ingo Molnar     2007-10-15  504  	s64 MIN_vruntime = -1, min_vruntime, max_vruntime = -1,
86d9560cb6bd859 kernel/sched_debug.c Ingo Molnar     2007-10-15  505  		spread, rq0_min_vruntime, spread0;
348ec61e6268c3c kernel/sched_debug.c Hitoshi Mitake  2009-06-17  506  	struct rq *rq = cpu_rq(cpu);
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  507  	struct sched_entity *last;
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  508  	unsigned long flags;
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  509  
efe25c2c7b3a5d1 kernel/sched_debug.c Bharata B Rao   2011-01-11  510  #ifdef CONFIG_FAIR_GROUP_SCHED
e9ca267096674ea kernel/sched/debug.c Joe Lawrence    2018-03-19  511  	SEQ_printf(m, "\n");
279749d0d4ef1e6 kernel/sched/debug.c Waiman Long     2021-04-15  512  	SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
efe25c2c7b3a5d1 kernel/sched_debug.c Bharata B Rao   2011-01-11  513  #else
e9ca267096674ea kernel/sched/debug.c Joe Lawrence    2018-03-19  514  	SEQ_printf(m, "\n");
e9ca267096674ea kernel/sched/debug.c Joe Lawrence    2018-03-19  515  	SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
efe25c2c7b3a5d1 kernel/sched_debug.c Bharata B Rao   2011-01-11  516  #endif
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  517  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  518  			SPLIT_NS(cfs_rq->exec_clock));
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  519  
70028b3759665de kernel/sched/debug.c Peter Zijlstra  2019-02-18  520  	raw_spin_lock_irqsave(rq_lockp(rq), flags);
bfb068892d30dcf kernel/sched/debug.c Davidlohr Bueso 2017-09-08  521  	if (rb_first_cached(&cfs_rq->tasks_timeline))
ac53db596cc08ec kernel/sched_debug.c Rik van Riel    2011-02-01  522  		MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  523  	last = __pick_last_entity(cfs_rq);
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  524  	if (last)
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  525  		max_vruntime = last->vruntime;
5ac5c4d604bf894 kernel/sched_debug.c Peter Zijlstra  2008-11-10  526  	min_vruntime = cfs_rq->min_vruntime;
348ec61e6268c3c kernel/sched_debug.c Hitoshi Mitake  2009-06-17  527  	rq0_min_vruntime = cpu_rq(0)->cfs.min_vruntime;
70028b3759665de kernel/sched/debug.c Peter Zijlstra  2019-02-18  528  	raw_spin_unlock_irqrestore(rq_lockp(rq), flags);
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  529  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "MIN_vruntime",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  530  			SPLIT_NS(MIN_vruntime));
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  531  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  532  			SPLIT_NS(min_vruntime));
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  533  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "max_vruntime",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  534  			SPLIT_NS(max_vruntime));
67e12eac328b276 kernel/sched_debug.c Ingo Molnar     2007-10-15  535  	spread = max_vruntime - MIN_vruntime;
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  536  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  537  			SPLIT_NS(spread));
86d9560cb6bd859 kernel/sched_debug.c Ingo Molnar     2007-10-15  538  	spread0 = min_vruntime - rq0_min_vruntime;
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  539  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread0",
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar     2007-10-15  540  			SPLIT_NS(spread0));
5ac5c4d604bf894 kernel/sched_debug.c Peter Zijlstra  2008-11-10  541  	SEQ_printf(m, "  .%-30s: %d\n", "nr_spread_over",
ddc972975091ba5 kernel/sched_debug.c Peter Zijlstra  2007-10-15  542  			cfs_rq->nr_spread_over);
c82513e513556a0 kernel/sched/debug.c Peter Zijlstra  2012-04-26  543  	SEQ_printf(m, "  .%-30s: %d\n", "nr_running", cfs_rq->nr_running);
2069dd75c7d0f49 kernel/sched_debug.c Peter Zijlstra  2010-11-15  544  	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
c09595f63bb1909 kernel/sched_debug.c Peter Zijlstra  2008-06-27  545  #ifdef CONFIG_SMP
1ea6c46a23f1213 kernel/sched/debug.c Peter Zijlstra  2017-05-06  546  	SEQ_printf(m, "  .%-30s: %ld\n", "runnable_weight", cfs_rq->runnable_weight);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15  547  	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15  548  			cfs_rq->avg.load_avg);
139622343ef3194 kernel/sched/debug.c Yuyang Du       2015-07-15  549  	SEQ_printf(m, "  .%-30s: %lu\n", "runnable_load_avg",
1ea6c46a23f1213 kernel/sched/debug.c Peter Zijlstra  2017-05-06  550  			cfs_rq->avg.runnable_load_avg);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15 @551  	SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15  552  			cfs_rq->avg.util_avg);
7f65ea42eb00bc9 kernel/sched/debug.c Patrick Bellasi 2018-03-09  553  	SEQ_printf(m, "  .%-30s: %u\n", "util_est_enqueued",
7f65ea42eb00bc9 kernel/sched/debug.c Patrick Bellasi 2018-03-09  554  			cfs_rq->avg.util_est.enqueued);
2a2f5d4e44ed160 kernel/sched/debug.c Peter Zijlstra  2017-05-08  555  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
2a2f5d4e44ed160 kernel/sched/debug.c Peter Zijlstra  2017-05-08  556  			cfs_rq->removed.load_avg);
2a2f5d4e44ed160 kernel/sched/debug.c Peter Zijlstra  2017-05-08  557  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
2a2f5d4e44ed160 kernel/sched/debug.c Peter Zijlstra  2017-05-08  558  			cfs_rq->removed.util_avg);
0e2d2aaaae52c24 kernel/sched/debug.c Peter Zijlstra  2017-05-08  559  	SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_sum",
0e2d2aaaae52c24 kernel/sched/debug.c Peter Zijlstra  2017-05-08  560  			cfs_rq->removed.runnable_sum);
333bb864f192015 kernel/sched/debug.c Alex Shi        2013-06-28  561  #ifdef CONFIG_FAIR_GROUP_SCHED
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15  562  	SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du       2015-07-15  563  			cfs_rq->tg_load_avg_contrib);
333bb864f192015 kernel/sched/debug.c Alex Shi        2013-06-28  564  	SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
333bb864f192015 kernel/sched/debug.c Alex Shi        2013-06-28  565  			atomic_long_read(&cfs_rq->tg->load_avg));
c09595f63bb1909 kernel/sched_debug.c Peter Zijlstra  2008-06-27  566  #endif
333bb864f192015 kernel/sched/debug.c Alex Shi        2013-06-28  567  #endif
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  568  #ifdef CONFIG_CFS_BANDWIDTH
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  569  	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  570  			cfs_rq->throttled);
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  571  	SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  572  			cfs_rq->throttle_count);
f9f9ffc237dd924 kernel/sched/debug.c Ben Segall      2013-10-16  573  #endif
2069dd75c7d0f49 kernel/sched_debug.c Peter Zijlstra  2010-11-15  574  

:::::: The code at line 551 was first introduced by commit
:::::: 9d89c257dfb9c51a532d69397f6eed75e5168c35 sched/fair: Rewrite runnable load and utilization average tracking

:::::: TO: Yuyang Du <yuyang.du@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
