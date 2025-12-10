Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378ED267729
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358470; cv=none; b=uaOok9v1kXjoMV4sJwqI9ZJf3sbJv/1ltisatzc6m2rBfusCAPIYvK1wk4wXJMgNjigL1OEzbF7K/FztQIZUenJKcyiO3j7oZl0AlkwK93TJHpqkMZV69hZXgWStcCoPncptU19pJ5qw5YprayVRxLp/z/K/oiocXRqHvS4Io6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358470; c=relaxed/simple;
	bh=qaI2Y+9DqQ4fA14X/sDF/dgmH0VYt8zaIMg2MeT924s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXkO5Ahs6ltL29FdmLVflfnr99/gv0r8U8u6TjCgi1FhJw/BNVlT7gn+9aL8Lhz0N6vwWNGVxZcSSXNSK2+NF9kxUeVAgtm13EaS4tIedx/OwZN6azisMxBN7QVUEPEqnJCxZTalyz12Cim9ZsB33Gcbln8TEjs4UisViJ4hWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkjswoDf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkjswoDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765358468; x=1796894468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaI2Y+9DqQ4fA14X/sDF/dgmH0VYt8zaIMg2MeT924s=;
  b=ZkjswoDfuJvZJTO1nWgBYGL3VUwj62TgQ8VXFQzBt0VgegT8YyJ6jk0k
   9J3sSNyeWGxFs1t9EVxw38S1zk+LdW6hyKVJrfM3FNnUaWNOZqbmPc8Kr
   8AgPcgwpda4DgWD8XTmzjb+wFbLXWRI0IgVmt3iM3ifNo/+c5MZv938e+
   qjRkFaUW6vsz3AkhNxhai62WnzL8rdAlFceT1tYbZfulmX5dtrFBYxD2P
   n/j5JxcLQPJEFRRWQdLPyr8+1b47hq8eVlP03xZY/MerpVqWi8NaCctjN
   XIGSGAo/SqA9J/htfNxTuIoOki1O7FO/IHAZ/3Nhj/PaOanCIgtvKRTJP
   A==;
X-CSE-ConnectionGUID: mhYHODONQmC37p6VdQMwjA==
X-CSE-MsgGUID: QqmswArsSo2K+Sh4cJ8eWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54871691"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="54871691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 01:21:07 -0800
X-CSE-ConnectionGUID: lGINpBmHRSCd6sQYIc0Sug==
X-CSE-MsgGUID: 4XIliJMmSVSVuXvMK8Gj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="201580287"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 01:21:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTGNc-00000000339-0WP3;
	Wed, 10 Dec 2025 09:21:04 +0000
Date: Wed, 10 Dec 2025 17:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v2 28/29] [EXPERIMENTAL] sched/fair: Add a
 local counter to rate limit task push
Message-ID: <202512101753.617JFKKE-lkp@intel.com>
References: <20251208092744.32737-28-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208092744.32737-28-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3eb59356014674fa1b506a122cc59b57089a4d08]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/sched-fair-Simplify-set_cpu_sd_state_-with-guards/20251208-183121
base:   3eb59356014674fa1b506a122cc59b57089a4d08
patch link:    https://lore.kernel.org/r/20251208092744.32737-28-kprateek.nayak%40amd.com
patch subject: [RESEND RFC PATCH v2 28/29] [EXPERIMENTAL] sched/fair: Add a local counter to rate limit task push
config: nios2-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101753.617JFKKE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101753.617JFKKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101753.617JFKKE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'sched_balance_domains':
>> kernel/sched/fair.c:12363:46: error: 'struct sched_domain' has no member named 'last_nr_push_update'
   12363 |                     time_after_eq(jiffies, sd->last_nr_push_update + sd->min_interval)) {
         |                                              ^~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   kernel/sched/fair.c:12363:21: note: in expansion of macro 'time_after_eq'
   12363 |                     time_after_eq(jiffies, sd->last_nr_push_update + sd->min_interval)) {
         |                     ^~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/jiffies.h:149:10: note: in expansion of macro 'typecheck'
     149 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~
   kernel/sched/fair.c:12363:21: note: in expansion of macro 'time_after_eq'
   12363 |                     time_after_eq(jiffies, sd->last_nr_push_update + sd->min_interval)) {
         |                     ^~~~~~~~~~~~~
   In file included from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:18,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:12363:46: error: 'struct sched_domain' has no member named 'last_nr_push_update'
   12363 |                     time_after_eq(jiffies, sd->last_nr_push_update + sd->min_interval)) {
         |                                              ^~
   include/linux/jiffies.h:150:25: note: in definition of macro 'time_after_eq'
     150 |          ((long)((a) - (b)) >= 0))
         |                         ^
>> kernel/sched/fair.c:12364:27: error: 'struct sched_domain' has no member named 'nr_push_attempt'
   12364 |                         sd->nr_push_attempt = READ_ONCE(sd->shared->nr_idle_scan);
         |                           ^~
   kernel/sched/fair.c:12365:27: error: 'struct sched_domain' has no member named 'last_nr_push_update'
   12365 |                         sd->last_nr_push_update = jiffies;
         |                           ^~
   kernel/sched/fair.c: In function 'has_pushable_tasks':
   kernel/sched/fair.c:13089:42: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13089 |         return !plist_head_empty(&rq->cfs.pushable_tasks);
         |                                          ^
   In file included from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'pick_next_pushable_fair_task':
   kernel/sched/fair.c:13099:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   kernel/sched/fair.c:13099:13: note: in expansion of macro 'plist_first_entry'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c:13099:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:13099:13: note: in expansion of macro 'plist_first_entry'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13099:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:13099:13: note: in expansion of macro 'plist_first_entry'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static assertion is not an integer
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:13099:13: note: in expansion of macro 'plist_first_entry'
   13099 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13112:47: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13112 |         plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                               ^
   kernel/sched/fair.c: In function 'should_push_tasks':
   kernel/sched/fair.c:13138:39: error: 'struct sched_domain' has no member named 'nr_push_attempt'
   13138 |         if (sched_feat(SIS_UTIL) && sd->nr_push_attempt <= 0)
         |                                       ^~
   kernel/sched/fair.c: In function 'push_fair_task':
   kernel/sched/fair.c:13196:11: error: 'struct sched_domain' has no member named 'nr_push_attempt'
   13196 |         sd->nr_push_attempt--;
         |           ^~
   kernel/sched/fair.c:13160:37: warning: unused variable 'sds' [-Wunused-variable]
   13160 |         struct sched_domain_shared *sds;
         |                                     ^~~
   kernel/sched/fair.c: In function 'fair_remove_pushable_task':
   kernel/sched/fair.c:13219:47: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13219 |         plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                               ^


vim +12363 kernel/sched/fair.c

 12292	
 12293	/*
 12294	 * It checks each scheduling domain to see if it is due to be balanced,
 12295	 * and initiates a balancing operation if so.
 12296	 *
 12297	 * Balancing parameters are set up in init_sched_domains.
 12298	 */
 12299	static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 12300	{
 12301		int continue_balancing = 1;
 12302		int cpu = rq->cpu;
 12303		int busy = idle != CPU_IDLE && !sched_idle_cpu(cpu);
 12304		unsigned long interval;
 12305		struct sched_domain *sd;
 12306		/* Earliest time when we have to do rebalance again */
 12307		unsigned long next_balance = jiffies + 60*HZ;
 12308		int update_next_balance = 0;
 12309		int need_decay = 0;
 12310		u64 max_cost = 0;
 12311	
 12312		rcu_read_lock();
 12313		for_each_domain(cpu, sd) {
 12314			/*
 12315			 * Decay the newidle max times here because this is a regular
 12316			 * visit to all the domains.
 12317			 */
 12318			need_decay = update_newidle_cost(sd, 0, 0);
 12319			max_cost += sd->max_newidle_lb_cost;
 12320	
 12321			/*
 12322			 * Stop the load balance at this level. There is another
 12323			 * CPU in our sched group which is doing load balancing more
 12324			 * actively.
 12325			 */
 12326			if (!continue_balancing) {
 12327				if (need_decay)
 12328					continue;
 12329				break;
 12330			}
 12331	
 12332			interval = get_sd_balance_interval(sd, busy);
 12333			if (time_after_eq(jiffies, sd->last_balance + interval)) {
 12334				if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
 12335					/*
 12336					 * The LBF_DST_PINNED logic could have changed
 12337					 * env->dst_cpu, so we can't know our idle
 12338					 * state even if we migrated tasks. Update it.
 12339					 */
 12340					idle = idle_cpu(cpu);
 12341					busy = !idle && !sched_idle_cpu(cpu);
 12342				}
 12343				sd->last_balance = jiffies;
 12344				interval = get_sd_balance_interval(sd, busy);
 12345			}
 12346			if (time_after(next_balance, sd->last_balance + interval)) {
 12347				next_balance = sd->last_balance + interval;
 12348				update_next_balance = 1;
 12349			}
 12350		}
 12351		if (need_decay) {
 12352			/*
 12353			 * Ensure the rq-wide value also decays but keep it at a
 12354			 * reasonable floor to avoid funnies with rq->avg_idle.
 12355			 */
 12356			rq->max_idle_balance_cost =
 12357				max((u64)sysctl_sched_migration_cost, max_cost);
 12358		}
 12359		if (sched_feat(SIS_UTIL)) {
 12360			sd = rcu_dereference(per_cpu(sd_llc, cpu));
 12361	
 12362			if (sd && sd->shared &&
 12363			    time_after_eq(jiffies, sd->last_nr_push_update + sd->min_interval)) {
 12364				sd->nr_push_attempt = READ_ONCE(sd->shared->nr_idle_scan);
 12365				sd->last_nr_push_update = jiffies;
 12366			}
 12367		}
 12368	
 12369		rcu_read_unlock();
 12370	
 12371		/*
 12372		 * next_balance will be updated only when there is a need.
 12373		 * When the cpu is attached to null domain for ex, it will not be
 12374		 * updated.
 12375		 */
 12376		if (likely(update_next_balance))
 12377			rq->next_balance = next_balance;
 12378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
