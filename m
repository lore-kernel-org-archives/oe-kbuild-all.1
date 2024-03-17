Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E41BC39
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710685528; cv=none; b=VpSLKhsXdbyxNZ+Lmnkkjj7arEtZcIq2ZHis7S812FVwFqU77+8Her5eG3a/exZMyUaqMlOb0W1VKiizXInF2YqCXGdY++euyzjZJrZKd/aNTJbMstLuO+uj/ITm+DXbQEL5FSqTI59zcLammJw3JPetELdOqct8Rcyp7ft5lTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710685528; c=relaxed/simple;
	bh=xpm/s30LeaUR9O/WmQuwihv3ucvu4BTNHBqeRMfpgEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YDT+LwAnDimDUF/sSEi3EC4F5kBXrDdL7Lcm87uukBzdOHU0+JSo7yHuZuxp579YaR+JU5bHp1m3ANVeEqwTfMnjqO4bjZ6cxv/Wf0xPGG5z/utmO1I7V/T9TrAQdsLY+nlzIy0CoRxEMBheGWvhSDIk02iwg3aO9GHcyhk9k6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDjD8/KK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDjD8/KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710685527; x=1742221527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpm/s30LeaUR9O/WmQuwihv3ucvu4BTNHBqeRMfpgEU=;
  b=nDjD8/KK6ENebThFZ/Rd+yX7ovh3GH63rsofh7rbw/gzgAxWpImx7Xk2
   1vUl5gX2RqXjIsPAvLi0BNd+SVxxpkYQ86X+tkuBgk9fAjumiuOXz2l1Z
   Mc/5oCUpDJtVonDAm2d7UEUfCIL6/3EYu1z55m+7Lvs5OyN5kQgCkgDuX
   gJEJ8UVEi5Zui0O5A8qGne13RkhNgWQJXD07sQQoe8Meqlm0grtglUoVt
   5qCtC7WbfLAE6p+qhWyW7mlMq0I42G7mcMwLZgYeaAwjymMJ745AwJOq/
   ly1rCknKOgrTszl8f2+QpH/qceqCSxl7NgGRn2S584ZCH0PHe6h/kyk8q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9327623"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="9327623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13595383"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2024 07:25:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlrRv-000GHt-1H;
	Sun, 17 Mar 2024 14:25:19 +0000
Date: Sun, 17 Mar 2024 22:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26602/27507]
 kernel/sched/ht_isolate.h:20:6: warning: no previous prototype for
 'sensitive_running_on_sibling'
Message-ID: <202403172235.s9KenUpT-lkp@intel.com>
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
commit: a588a0f9dc76adc6f515dfe0c240cfeac67964b2 [26602/27507] rue/cpu: Add basic hyperthread isolate support
config: x86_64-randconfig-r053-20240315 (https://download.01.org/0day-ci/archive/20240317/202403172235.s9KenUpT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403172235.s9KenUpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403172235.s9KenUpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/batch.c:17:
>> kernel/sched/ht_isolate.h:20:6: warning: no previous prototype for 'sensitive_running_on_sibling' [-Wmissing-prototypes]
      20 | bool sensitive_running_on_sibling(int cpu) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:428:6: warning: no previous prototype for 'unthrottle_bt_rq' [-Wmissing-prototypes]
     428 | void unthrottle_bt_rq(struct bt_rq *bt_rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'do_sched_bt_period_timer':
   kernel/sched/batch.c:499:29: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
     499 |                         u64 runtime;
         |                             ^~~~~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:707:25: warning: no previous prototype for '__pick_first_bt_entity' [-Wmissing-prototypes]
     707 | struct sched_bt_entity *__pick_first_bt_entity(struct bt_rq *bt_rq)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:1437:6: warning: no previous prototype for 'place_bt_entity' [-Wmissing-prototypes]
    1437 | void place_bt_entity(struct bt_rq *bt_rq, struct sched_bt_entity *se,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/batch.c:2352:12: warning: no previous prototype for 'find_busiest_rq' [-Wmissing-prototypes]
    2352 | struct rq *find_busiest_rq(struct rq *this_rq, struct cpumask *mask)
         |            ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'can_migrate_bt':
   kernel/sched/batch.c:2378:37: error: 'struct rq' has no member named 'cpu'
    2378 |         if (!cpumask_test_cpu(dst_rq->cpu, p->cpus_ptr) ||
         |                                     ^~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2384:5: warning: no previous prototype for 'load_balance_bt' [-Wmissing-prototypes]
    2384 | int load_balance_bt(struct rq *this_rq, struct cpumask *mask)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'load_balance_bt':
   kernel/sched/batch.c:2408:24: error: 'struct rq' has no member named 'bt_tasks'
    2408 |         tasks = &src_rq->bt_tasks;
         |                        ^~
   kernel/sched/batch.c: In function 'rebalance_domains_bt':
   kernel/sched/batch.c:2465:9: error: implicit declaration of function 'for_each_domain'; did you mean 'for_each_class'? [-Werror=implicit-function-declaration]
    2465 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
         |         for_each_class
   kernel/sched/batch.c:2465:33: error: expected ';' before '{' token
    2465 |         for_each_domain(cpu, sd) {
         |                                 ^~
         |                                 ;
   kernel/sched/batch.c:2456:23: warning: unused variable 'interval' [-Wunused-variable]
    2456 |         unsigned long interval;
         |                       ^~~~~~~~
   kernel/sched/batch.c:2455:25: warning: unused variable 'mask' [-Wunused-variable]
    2455 |         struct cpumask *mask;
         |                         ^~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2484:6: warning: no previous prototype for 'trigger_load_balance_bt' [-Wmissing-prototypes]
    2484 | void trigger_load_balance_bt(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'idle_balance_bt':
   kernel/sched/batch.c:2517:38: error: expected ';' before '{' token
    2517 |         for_each_domain(this_cpu, sd) {
         |                                      ^~
         |                                      ;
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2647:6: warning: no previous prototype for 'init_offline_cpu_control' [-Wmissing-prototypes]
    2647 | void init_offline_cpu_control(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:2477:30: warning: 'run_rebalance_domains_bt' defined but not used [-Wunused-function]
    2477 | static __latent_entropy void run_rebalance_domains_bt(struct softirq_action *h)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:2439:22: warning: 'get_sd_balance_interval_bt' defined but not used [-Wunused-function]
    2439 | static unsigned long get_sd_balance_interval_bt(struct cpumask *mask)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:2038:12: warning: 'balance_bt' defined but not used [-Wunused-function]
    2038 | static int balance_bt(struct rq *rq, struct task_struct *prev,
         |            ^~~~~~~~~~
   kernel/sched/batch.c:459:13: warning: '__enable_bt_runtime' defined but not used [-Wunused-function]
     459 | static void __enable_bt_runtime(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:441:13: warning: '__disable_bt_runtime' defined but not used [-Wunused-function]
     441 | static void __disable_bt_runtime(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sensitive_running_on_sibling +20 kernel/sched/ht_isolate.h

    13	
    14	extern int sysctl_ht_isolate;
    15	extern void kick_sibling_offline_task(void);
    16	extern void kick_sibling_offline_run(void);
    17	#ifdef CONFIG_HT_ISOLATE
    18	extern bool sensitive_running_on_sibling(int cpu);
    19	#else
  > 20	bool sensitive_running_on_sibling(int cpu) { return false; }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
