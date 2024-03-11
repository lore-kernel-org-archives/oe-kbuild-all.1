Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B752F72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174175; cv=none; b=mwaNDPOab2hdBlGwSoK01PTEQBt0lcQJTYhwFCotvah7ad3e5rem6llwh9YHwij9/Dz8+XiqwUMR1CXgjwFQ5BH8k1zRY7RmhZbzYsegoi4DB6snQzvF9N9THr0/bRBORMfRLG3gxp5usAG+NvvFbtmMU7QuK2r9gvIW+2Tc0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174175; c=relaxed/simple;
	bh=SJStuGYiyJ5KgW3Tx/rSOD2YNNeA9aZk0ECy5WG/wAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCE0HoLm/3II0b6sRDgOgLN6HCsy5d9XxH8jiX7+ZgkjfQSxmm7mHNXgJi7wNUuCfk6vRGm6pEund2fXfsEOA2L+JjFtLNO1K0H+HTZiSUPtZYvwF9J8YAjGzCcOc1CXiK/ZXuiJw9Iygh6pq9ScgcHj6zRTqKhg3B2Vzdg7wuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P//e1SsX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P//e1SsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710174172; x=1741710172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJStuGYiyJ5KgW3Tx/rSOD2YNNeA9aZk0ECy5WG/wAI=;
  b=P//e1SsXOeeHM3EtkcVC4eY6uh66JuWWp4IpAWwjn8k686A8hyoi0oY5
   zE4vdJPFn4PbhF4wXNCWy73vfHpuLzYRcDx56PGp791iqaXg2CkGQZCV6
   KeaKA58BOKB1X7MFnk4MOksDGNGLq3itLAO4XWHhiEtjvQWVGud4i2Js4
   WWV15HDYdWn7Lrqwu+3dKqGzDyYpS9l7Fd3pHRKnLQ21b6Ohtu8neoaYy
   fvXhK0XT+m8h8YkPUUQm7nNwparMDXLrL0lju2sRSBWUbjbTBw9Ef9XDu
   8ff6klCW8Lgg640jKh9PoHTfCE2ijaqf48fmNdJUnM6h0i383u+jt369G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27317680"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="27317680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 09:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11649837"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 09:22:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjiQI-0009FF-0Z;
	Mon, 11 Mar 2024 16:22:46 +0000
Date: Tue, 12 Mar 2024 00:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>
Subject: [jfern:sched/dlserver.debug.mar3.2024 29987/30000]
 kernel/sched/fair_eevdf.c:6401:58: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202403120054.uKHWJSib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.debug.mar3.2024
head:   6890cea305eadbebc9f3fcf8d31c6672af797ee5
commit: 9711072dc8002713616f71f8235b337aea9b3db8 [29987/30000] BACKPORT: FROMGIT: sched/deadline: Account idle time for deferred server
config: x86_64-randconfig-121-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120054.uKHWJSib-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120054.uKHWJSib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120054.uKHWJSib-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair_eevdf.c:28:5: sparse: sparse: symbol 'sysctl_sched_use_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:708:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:1271:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:1271:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:1271:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:1318:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:1318:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:1318:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair_eevdf.c:2974:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:2974:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair_eevdf.c:2974:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:12016:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:12016:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:12016:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:5793:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:5793:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:5793:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:6322:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:6322:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:6322:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair_eevdf.c:6401:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:6401:58: sparse:     expected struct task_struct *p
   kernel/sched/fair_eevdf.c:6401:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:6592:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6593:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7648:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7648:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7648:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7829:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7829:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7829:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:8019:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:8019:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:8019:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:8345:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:8345:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:8345:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:9400:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:9400:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:9400:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair_eevdf.c:9942:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9942:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9942:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:11305:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11305:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11305:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10963:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10963:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10963:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:11401:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11401:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11401:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:12930:1: sparse: sparse: symbol '__pcpu_scope_eevdf_switch_tasks' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:12935:5: sparse: sparse: symbol 'scheduler_switch_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:12996:5: sparse: sparse: symbol 'sched_use_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:2918:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair_eevdf.c:5442:31: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2075:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2075:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2075:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:12933:32: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c:12932:32: sparse: sparse: marked inline, but without a definition

vim +6401 kernel/sched/fair_eevdf.c

  6376	
  6377	/*
  6378	 * The enqueue_task method is called before nr_running is
  6379	 * increased. Here we update the fair scheduling stats and
  6380	 * then put the task into the rbtree:
  6381	 */
  6382	static void
  6383	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6384	{
  6385		struct cfs_rq *cfs_rq;
  6386		struct sched_entity *se = &p->se;
  6387		int idle_h_nr_running = task_has_idle_policy(p);
  6388		int task_new = !(flags & ENQUEUE_WAKEUP);
  6389	
  6390		/*
  6391		 * The code below (indirectly) updates schedutil which looks at
  6392		 * the cfs_rq utilization to select a frequency.
  6393		 * Let's add the task's estimated utilization to the cfs_rq's
  6394		 * estimated utilization, before we update schedutil.
  6395		 */
  6396		util_est_enqueue(&rq->cfs, p);
  6397	
  6398		if (!rq->cfs.h_nr_running) {
  6399			/* Account for idle runtime */
  6400			if (!rq->nr_running)
> 6401				dl_server_update_idle_time(rq, rq->curr);
  6402			dl_server_start(&rq->fair_server);
  6403		}
  6404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
