Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860D1BF34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710630370; cv=none; b=IW3CWj82w4bUI1qHxcWdjbJJ+dABpkNw0zjs6kWtefhS3ulmHUd+NW9UUOcjyOYvqWfw8Rk4/uSZ7w4eC/70aLwR3dcouboAmn7+xfboVh7ECyDIjs04rfsdMxaTQmZS9o+bacCmjWjuHdSJ7n1eCbwvvsznzDZnTU714W6RChk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710630370; c=relaxed/simple;
	bh=TZ3F7+hCOfQNg3KWOhDXsBZ/kCYnYlOo37CfmhNLJEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRmZgiiYpu9As7/KdNkjXedOiIiihpK0ntDuRJDgcZGxGdrbYgziVgPnoMkefQYzTF0f8e9U7yGAq6c8lCvhINVLcwGryLAOHb84B8JabcPLB5bsdECx3rBHPey03PtXvujSHJuVCMPc+8kSiRUU7BcZTqo5IhKI/5bJI9Zl4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZA2bQWt+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA2bQWt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710630368; x=1742166368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZ3F7+hCOfQNg3KWOhDXsBZ/kCYnYlOo37CfmhNLJEY=;
  b=ZA2bQWt+K+DTKswFKpHgjV2m0SyTGRmijF34j7Wcy6mPZmj9X4ZmUqSy
   V+8iuluffKmeltqy/KXrjz6VtSQqRY3V4tdFD5CCGMX/Mh1iqQG3EUF9X
   3nQ3QJnI+Sm4NFRqN/stX0u4mB0sxmZ0UFmtZJ1uGuxSG8LQgYsh+wIeb
   NaFXSYG5+PHTZH5OhfZxYhv9sDRSrdzn9qT31OvBbxhTxdRRrclo9p65O
   Eie/2p67eTdol+MIEmnNb+1aEQsfQJ3GaFj78fZcxZ1ToovZ+5Roo21so
   d8ryX91iW/k2E65Q0ZIzmotbATm+UFuF0u/2SLq6bwcou8fnpOQDWESzd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9305799"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="9305799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 16:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="13132836"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2024 16:06:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rld6H-000Fqr-23;
	Sat, 16 Mar 2024 23:06:01 +0000
Date: Sun, 17 Mar 2024 07:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26597/27507] kernel/sched/batch.c:336:6:
 warning: no previous prototype for 'unthrottle_bt_rq'
Message-ID: <202403170620.zPKxRdyT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 9ff06b0724df4f4a8796426f4c755787784c1254 [26597/27507] rue/cpu: Add bandwidth control support for SCHED_BT
config: x86_64-randconfig-r053-20240315 (https://download.01.org/0day-ci/archive/20240317/202403170620.zPKxRdyT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170620.zPKxRdyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170620.zPKxRdyT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/batch.c:336:6: warning: no previous prototype for 'unthrottle_bt_rq' [-Wmissing-prototypes]
     336 | void unthrottle_bt_rq(struct bt_rq *bt_rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'do_sched_bt_period_timer':
   kernel/sched/batch.c:407:29: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
     407 |                         u64 runtime;
         |                             ^~~~~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:613:25: warning: no previous prototype for '__pick_first_bt_entity' [-Wmissing-prototypes]
     613 | struct sched_bt_entity *__pick_first_bt_entity(struct bt_rq *bt_rq)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:1343:6: warning: no previous prototype for 'place_bt_entity' [-Wmissing-prototypes]
    1343 | void place_bt_entity(struct bt_rq *bt_rq, struct sched_bt_entity *se,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/batch.c:2249:12: warning: no previous prototype for 'find_busiest_rq' [-Wmissing-prototypes]
    2249 | struct rq *find_busiest_rq(struct rq *this_rq, struct cpumask *mask)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'can_migrate_bt':
   kernel/sched/batch.c:2275:37: error: 'struct rq' has no member named 'cpu'
    2275 |         if (!cpumask_test_cpu(dst_rq->cpu, p->cpus_ptr) ||
         |                                     ^~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2281:5: warning: no previous prototype for 'load_balance_bt' [-Wmissing-prototypes]
    2281 | int load_balance_bt(struct rq *this_rq, struct cpumask *mask)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'load_balance_bt':
   kernel/sched/batch.c:2305:24: error: 'struct rq' has no member named 'bt_tasks'
    2305 |         tasks = &src_rq->bt_tasks;
         |                        ^~
   kernel/sched/batch.c: In function 'rebalance_domains_bt':
   kernel/sched/batch.c:2362:9: error: implicit declaration of function 'for_each_domain'; did you mean 'for_each_class'? [-Werror=implicit-function-declaration]
    2362 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
         |         for_each_class
   kernel/sched/batch.c:2362:33: error: expected ';' before '{' token
    2362 |         for_each_domain(cpu, sd) {
         |                                 ^~
         |                                 ;
   kernel/sched/batch.c:2353:23: warning: unused variable 'interval' [-Wunused-variable]
    2353 |         unsigned long interval;
         |                       ^~~~~~~~
   kernel/sched/batch.c:2352:25: warning: unused variable 'mask' [-Wunused-variable]
    2352 |         struct cpumask *mask;
         |                         ^~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2381:6: warning: no previous prototype for 'trigger_load_balance_bt' [-Wmissing-prototypes]
    2381 | void trigger_load_balance_bt(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'idle_balance_bt':
   kernel/sched/batch.c:2411:38: error: expected ';' before '{' token
    2411 |         for_each_domain(this_cpu, sd) {
         |                                      ^~
         |                                      ;
   kernel/sched/batch.c: At top level:
>> kernel/sched/batch.c:2529:6: warning: no previous prototype for 'init_offline_cpu_control' [-Wmissing-prototypes]
    2529 | void init_offline_cpu_control(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:2374:30: warning: 'run_rebalance_domains_bt' defined but not used [-Wunused-function]
    2374 | static __latent_entropy void run_rebalance_domains_bt(struct softirq_action *h)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:2336:22: warning: 'get_sd_balance_interval_bt' defined but not used [-Wunused-function]
    2336 | static unsigned long get_sd_balance_interval_bt(struct cpumask *mask)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:1935:12: warning: 'balance_bt' defined but not used [-Wunused-function]
    1935 | static int balance_bt(struct rq *rq, struct task_struct *prev,
         |            ^~~~~~~~~~
>> kernel/sched/batch.c:367:13: warning: '__enable_bt_runtime' defined but not used [-Wunused-function]
     367 | static void __enable_bt_runtime(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/batch.c:349:13: warning: '__disable_bt_runtime' defined but not used [-Wunused-function]
     349 | static void __disable_bt_runtime(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/unthrottle_bt_rq +336 kernel/sched/batch.c

   335	
 > 336	void unthrottle_bt_rq(struct bt_rq *bt_rq)
   337	{
   338		struct rq *rq = rq_of_bt_rq(bt_rq);
   339		long task_delta;
   340	
   341		bt_rq->bt_throttled = 0;
   342		bt_rq->throttled_clock_task_time +=
   343			rq->clock_task - bt_rq->throttled_clock_task;
   344		task_delta = bt_rq->h_nr_running;
   345		rq->nr_running += task_delta;
   346		rq->bt_nr_running += task_delta;
   347	}
   348	
 > 349	static void __disable_bt_runtime(struct rq *rq)
   350	{
   351		struct bt_rq *iter;
   352		struct bt_rq *bt_rq;
   353	
   354		if (unlikely(!scheduler_running))
   355			return;
   356	
   357		for_each_bt_rq(bt_rq, iter, rq) {
   358			raw_spin_lock(&bt_rq->bt_runtime_lock);
   359			if (bt_rq->bt_throttled)
   360				unthrottle_bt_rq(bt_rq);
   361			bt_rq->bt_runtime = RUNTIME_INF;
   362			bt_rq->bt_throttled = 0;
   363			raw_spin_unlock(&bt_rq->bt_runtime_lock);
   364		}
   365	}
   366	
 > 367	static void __enable_bt_runtime(struct rq *rq)
   368	{
   369		int cpu = cpu_of(rq);
   370		struct br_rq *iter;
   371		struct bt_rq *bt_rq;
   372	
   373		if (unlikely(!scheduler_running))
   374			return;
   375	
   376		for_each_bt_rq(bt_rq, iter, rq) {
   377			struct bt_bandwidth *bt_b = sched_bt_bandwidth(bt_rq);
   378			unsigned long percent = 100;
   379	
   380			raw_spin_lock(&bt_b->bt_runtime_lock);
   381			raw_spin_lock(&bt_rq->bt_runtime_lock);
   382			bt_rq->bt_runtime = bt_b->bt_runtime;
   383			bt_rq->bt_time = 0;
   384			bt_rq->bt_throttled = 0;
   385			if (bt_cpu_control_set)
   386				percent = (*((unsigned long *)bt_cpu_control_set + cpu));
   387			bt_rq->bt_runtime = (u64)sysctl_sched_bt_period * NSEC_PER_USEC * percent / 100;
   388			raw_spin_unlock(&bt_rq->bt_runtime_lock);
   389			raw_spin_unlock(&bt_b->bt_runtime_lock);
   390		}
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
