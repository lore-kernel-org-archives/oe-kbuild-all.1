Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127D7F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692843133; x=1724379133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kL2F0fdL40R3JbpylzN6/lLWca8m7gc0BbiXkJkNDSc=;
  b=PAJE8PRUgUt/BuyFGSSJWNqtgngD20YMmcOUODGFrqb6GAYGUUEmkyIl
   GH30vCCPYWywGna0eIbuJLe2XqRE3XpHHQX/Agwp7FrvrZ1ErM+pbiMDV
   12Zp0Gt8i00N6Tbnb/REkOG8gWJM0OEAjRwPx0G8oMI617VTM1HX5FH3w
   3hUkpYqnLtpxUz6sau3IYysqkwJQCRDMsG9Sfj1arCShSu3pB/lxa/GST
   2GZ+kmkjG7LFa+akw4cvFoPlF0TzmM6SybDeTHdGzEe3Cs136e+p7T6Lu
   nyQvwJqJ6eEdGFpa1KgjCMZM3KOTbneP5oQVu91yDmVSY0yNxm0krxgIJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353870777"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353870777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 19:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851285752"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="851285752"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2023 19:12:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYzpS-0001fa-11;
	Thu, 24 Aug 2023 02:12:10 +0000
Date: Thu, 24 Aug 2023 10:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 7/13]
 kernel/sched/fair.c:10814:42: error: 'UPMIGRATION' undeclared
Message-ID: <202308241026.qF0ReUNr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux generalized-misfit-lb
head:   c3b510f9f9b7eb321f7179b6036214b7a9509333
commit: 4f1c772d36fcd69a18428ffebb84b0a6be2ce14a [7/13] sched/fair: Don't skip cpu in find_busiest_queue for DOWNMIGRATION misfit
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230824/202308241026.qF0ReUNr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241026.qF0ReUNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241026.qF0ReUNr-lkp@intel.com/

All errors (new ones prefixed by >>):

    9953 |         if (rq->curr != rq->idle && rq->curr != p)
         |               ^~
   kernel/sched/fair.c:9953:27: error: invalid use of undefined type 'struct rq'
    9953 |         if (rq->curr != rq->idle && rq->curr != p)
         |                           ^~
   kernel/sched/fair.c:9953:39: error: invalid use of undefined type 'struct rq'
    9953 |         if (rq->curr != rq->idle && rq->curr != p)
         |                                       ^~
   kernel/sched/fair.c:9963:15: error: invalid use of undefined type 'struct rq'
    9963 |         if (rq->ttwu_pending)
         |               ^~
   kernel/sched/fair.c: In function 'update_sg_wakeup_stats':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/fair.c:9991:33: note: in expansion of macro 'cpu_rq'
    9991 |                 struct rq *rq = cpu_rq(i);
         |                                 ^~~~~~
   kernel/sched/fair.c:9992:17: warning: statement with no effect [-Wunused-value]
    9992 |                 misfit_reason_t reason;
         |                 ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:9992:32: error: expected ';' before 'reason'
    9992 |                 misfit_reason_t reason;
         |                                ^~~~~~~
         |                                ;
   kernel/sched/fair.c:9999:44: error: invalid use of undefined type 'struct rq'
    9999 |                 sgs->sum_h_nr_running += rq->cfs.h_nr_running - local;
         |                                            ^~
   kernel/sched/fair.c:10001:32: error: invalid use of undefined type 'struct rq'
   10001 |                 nr_running = rq->nr_running - local;
         |                                ^~
   kernel/sched/fair.c:10013:49: error: 'reason' undeclared (first use in this function)
   10013 |                     if (!is_misfit_task(p, rq, &reason)) {
         |                                                 ^~~~~~
   kernel/sched/fair.c:10015:30: error: 'struct sg_lb_stats' has no member named 'group_misfit_reason'; did you mean 'group_misfit_task_load'?
   10015 |                         sgs->group_misfit_reason = -1;
         |                              ^~~~~~~~~~~~~~~~~~~
         |                              group_misfit_task_load
   kernel/sched/fair.c:10018:30: error: 'struct sg_lb_stats' has no member named 'group_misfit_reason'; did you mean 'group_misfit_task_load'?
   10018 |                         sgs->group_misfit_reason = reason;
         |                              ^~~~~~~~~~~~~~~~~~~
         |                              group_misfit_task_load
   kernel/sched/fair.c: In function 'find_idlest_group':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/fair.c:10119:47: note: in expansion of macro 'cpu_rq'
   10119 |                 if (!sched_group_cookie_match(cpu_rq(this_cpu), p, group))
         |                                               ^~~~~~
   kernel/sched/fair.c: In function 'update_sd_lb_stats':
   kernel/sched/fair.c:10396:53: error: invalid use of undefined type 'struct rq'
   10396 |                 struct root_domain *rd = env->dst_rq->rd;
         |                                                     ^~
   kernel/sched/fair.c:10405:53: error: invalid use of undefined type 'struct rq'
   10405 |                 struct root_domain *rd = env->dst_rq->rd;
         |                                                     ^~
   kernel/sched/fair.c: In function 'find_busiest_group':
   kernel/sched/fair.c:10646:53: error: invalid use of undefined type 'struct rq'
   10646 |                 struct root_domain *rd = env->dst_rq->rd;
         |                                                     ^~
   kernel/sched/fair.c: In function 'find_busiest_queue':
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct rq'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:235:9: note: in expansion of macro '__verify_pcpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/sched.h:1224:35: note: in expansion of macro 'per_cpu'
    1224 | #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
         |                                   ^~~~~~~
   kernel/sched/fair.c:10776:22: note: in expansion of macro 'cpu_rq'
   10776 |                 rq = cpu_rq(i);
         |                      ^~~~~~
   kernel/sched/fair.c:10801:32: error: invalid use of undefined type 'struct rq'
   10801 |                 nr_running = rq->cfs.h_nr_running;
         |                                ^~
   kernel/sched/fair.c:10814:23: error: invalid use of undefined type 'struct rq'
   10814 |                     rq->misfit_reason == UPMIGRATION &&
         |                       ^~
>> kernel/sched/fair.c:10814:42: error: 'UPMIGRATION' undeclared (first use in this function)
   10814 |                     rq->misfit_reason == UPMIGRATION &&
         |                                          ^~~~~~~~~~~
   kernel/sched/fair.c:10893:31: error: invalid use of undefined type 'struct rq'
   10893 |                         if (rq->misfit_task_load > busiest_load) {
         |                               ^~
   kernel/sched/fair.c:10894:50: error: invalid use of undefined type 'struct rq'
   10894 |                                 busiest_load = rq->misfit_task_load;
         |                                                  ^~
   kernel/sched/fair.c: In function 'need_active_balance':
   kernel/sched/fair.c:10965:25: error: invalid use of undefined type 'struct rq'
   10965 |             (env->src_rq->cfs.h_nr_running == 1)) {
         |                         ^~
   kernel/sched/fair.c: In function 'should_we_balance':
   kernel/sched/fair.c:10999:32: error: invalid use of undefined type 'struct rq'
   10999 |                 if (env->dst_rq->nr_running > 0 || env->dst_rq->ttwu_pending)
         |                                ^~
   kernel/sched/fair.c:10999:63: error: invalid use of undefined type 'struct rq'
   10999 |                 if (env->dst_rq->nr_running > 0 || env->dst_rq->ttwu_pending)
         |                                                               ^~
   kernel/sched/fair.c: In function 'load_balance':
   kernel/sched/fair.c:11083:30: error: invalid use of undefined type 'struct rq'
   11083 |         env.src_cpu = busiest->cpu;
         |                              ^~
   kernel/sched/fair.c:11089:20: error: invalid use of undefined type 'struct rq'
   11089 |         if (busiest->nr_running > 1) {
         |                    ^~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/minmax.h:20:46: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                              ^
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:67:25: note: in expansion of macro '__careful_cmp'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:11096:33: note: in expansion of macro 'min'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                 ^~~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/const.h:12:55: note: in definition of macro '__is_constexpr'
      12 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:26:39: note: in expansion of macro '__no_side_effects'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                                       ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:67:25: note: in expansion of macro '__careful_cmp'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:11096:33: note: in expansion of macro 'min'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                 ^~~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/minmax.h:28:34: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                  ^
   include/linux/minmax.h:67:25: note: in expansion of macro '__careful_cmp'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:11096:33: note: in expansion of macro 'min'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                 ^~~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/minmax.h:28:46: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                              ^
   include/linux/minmax.h:67:25: note: in expansion of macro '__careful_cmp'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:11096:33: note: in expansion of macro 'min'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                 ^~~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/minmax.h:32:24: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y = (y);               \
         |                        ^
   include/linux/minmax.h:67:25: note: in expansion of macro '__careful_cmp'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:11096:33: note: in expansion of macro 'min'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                 ^~~
   kernel/sched/fair.c:11096:69: error: invalid use of undefined type 'struct rq'
   11096 |                 env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
         |                                                                     ^~
   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y = (y);               \


vim +/UPMIGRATION +10814 kernel/sched/fair.c

 10759	
 10760	/*
 10761	 * find_busiest_queue - find the busiest runqueue among the CPUs in the group.
 10762	 */
 10763	static struct rq *find_busiest_queue(struct lb_env *env,
 10764					     struct sched_group *group)
 10765	{
 10766		struct rq *busiest = NULL, *rq;
 10767		unsigned long busiest_util = 0, busiest_load = 0, busiest_capacity = 1;
 10768		unsigned int busiest_nr = 0;
 10769		int i;
 10770	
 10771		for_each_cpu_and(i, sched_group_span(group), env->cpus) {
 10772			unsigned long capacity, load, util;
 10773			unsigned int nr_running;
 10774			enum fbq_type rt;
 10775	
 10776			rq = cpu_rq(i);
 10777			rt = fbq_classify_rq(rq);
 10778	
 10779			/*
 10780			 * We classify groups/runqueues into three groups:
 10781			 *  - regular: there are !numa tasks
 10782			 *  - remote:  there are numa tasks that run on the 'wrong' node
 10783			 *  - all:     there is no distinction
 10784			 *
 10785			 * In order to avoid migrating ideally placed numa tasks,
 10786			 * ignore those when there's better options.
 10787			 *
 10788			 * If we ignore the actual busiest queue to migrate another
 10789			 * task, the next balance pass can still reduce the busiest
 10790			 * queue by moving tasks around inside the node.
 10791			 *
 10792			 * If we cannot move enough load due to this classification
 10793			 * the next pass will adjust the group classification and
 10794			 * allow migration of more tasks.
 10795			 *
 10796			 * Both cases only affect the total convergence complexity.
 10797			 */
 10798			if (rt > env->fbq_type)
 10799				continue;
 10800	
 10801			nr_running = rq->cfs.h_nr_running;
 10802			if (!nr_running)
 10803				continue;
 10804	
 10805			capacity = capacity_of(i);
 10806	
 10807			/*
 10808			 * For ASYM_CPUCAPACITY domains, don't pick a CPU that could
 10809			 * eventually lead to active_balancing high->low capacity.
 10810			 * Higher per-CPU capacity is considered better than balancing
 10811			 * average load.
 10812			 */
 10813			if (env->sd->flags & SD_ASYM_CPUCAPACITY &&
 10814			    rq->misfit_reason == UPMIGRATION &&
 10815			    !capacity_greater(capacity_of(env->dst_cpu), capacity) &&
 10816			    nr_running == 1)
 10817				continue;
 10818	
 10819			/*
 10820			 * Make sure we only pull tasks from a CPU of lower priority
 10821			 * when balancing between SMT siblings.
 10822			 *
 10823			 * If balancing between cores, let lower priority CPUs help
 10824			 * SMT cores with more than one busy sibling.
 10825			 */
 10826			if ((env->sd->flags & SD_ASYM_PACKING) &&
 10827			    sched_use_asym_prio(env->sd, i) &&
 10828			    sched_asym_prefer(i, env->dst_cpu) &&
 10829			    nr_running == 1)
 10830				continue;
 10831	
 10832			switch (env->migration_type) {
 10833			case migrate_load:
 10834				/*
 10835				 * When comparing with load imbalance, use cpu_load()
 10836				 * which is not scaled with the CPU capacity.
 10837				 */
 10838				load = cpu_load(rq);
 10839	
 10840				if (nr_running == 1 && load > env->imbalance &&
 10841				    !check_cpu_capacity(rq, env->sd))
 10842					break;
 10843	
 10844				/*
 10845				 * For the load comparisons with the other CPUs,
 10846				 * consider the cpu_load() scaled with the CPU
 10847				 * capacity, so that the load can be moved away
 10848				 * from the CPU that is potentially running at a
 10849				 * lower capacity.
 10850				 *
 10851				 * Thus we're looking for max(load_i / capacity_i),
 10852				 * crosswise multiplication to rid ourselves of the
 10853				 * division works out to:
 10854				 * load_i * capacity_j > load_j * capacity_i;
 10855				 * where j is our previous maximum.
 10856				 */
 10857				if (load * busiest_capacity > busiest_load * capacity) {
 10858					busiest_load = load;
 10859					busiest_capacity = capacity;
 10860					busiest = rq;
 10861				}
 10862				break;
 10863	
 10864			case migrate_util:
 10865				util = cpu_util_cfs_boost(i);
 10866	
 10867				/*
 10868				 * Don't try to pull utilization from a CPU with one
 10869				 * running task. Whatever its utilization, we will fail
 10870				 * detach the task.
 10871				 */
 10872				if (nr_running <= 1)
 10873					continue;
 10874	
 10875				if (busiest_util < util) {
 10876					busiest_util = util;
 10877					busiest = rq;
 10878				}
 10879				break;
 10880	
 10881			case migrate_task:
 10882				if (busiest_nr < nr_running) {
 10883					busiest_nr = nr_running;
 10884					busiest = rq;
 10885				}
 10886				break;
 10887	
 10888			case migrate_misfit:
 10889				/*
 10890				 * For ASYM_CPUCAPACITY domains with misfit tasks we
 10891				 * simply seek the "biggest" misfit task.
 10892				 */
 10893				if (rq->misfit_task_load > busiest_load) {
 10894					busiest_load = rq->misfit_task_load;
 10895					busiest = rq;
 10896				}
 10897	
 10898				break;
 10899	
 10900			}
 10901		}
 10902	
 10903		return busiest;
 10904	}
 10905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
