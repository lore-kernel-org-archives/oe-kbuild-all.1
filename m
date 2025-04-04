Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBD19F416
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777037; cv=none; b=IuT50KxwSDOeJyCLSQ9+wbzKNgXL9fe5RSRCqQBUURCxx4ousPxgM5gQ2HMO2F5ueVmqO0o+qgkeqhV6/gSDQxrCaYFD1bNH7E7I4UwTnULzWn8BY7TrgX11H7h5kHjW1Z7YYDImfrzgFx9lVmN6VsfBOzaHQK8XTFEJ9xdw1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777037; c=relaxed/simple;
	bh=ujI/UUwTYG7yxh47+hVB346n2b4PtISYbly55B5Bmyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTAd4/AoCV5Xff4EDTsBoJcH3CEq7tVaTXXle9EZw4czmU93komopr9QScORv4vGkR9vSYmsylT7xBOAiqAbsVW4gd7H9A9TYfcpDDih1y2qfh5VhLe0bj0Q+VMbO+CLqbpB7rOo4F+puhqzsN1yJfo/RglIg8nueCnOeni62YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPsSmHDY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPsSmHDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743777035; x=1775313035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujI/UUwTYG7yxh47+hVB346n2b4PtISYbly55B5Bmyo=;
  b=iPsSmHDYU+LfSzHq1KxlVh1TCOUECUjw1vyA+w5Fu5cC876DNW1Rg0wN
   NM7IKpPc3LbP+msHky++u3xFBLy+T5o1JC7IetXNxLbkRyg+rdsCP2NF6
   tYTESj/sqNsVrLqEFYbgB2mt0K0YUIbVWrvAWvoaOtjVWGM1VX4W9o+Pt
   UdvVyo3O1UgGBZcSPvq/gynVZYcsp/mt2JRBh4cRveGSWFWB7ZxvmhEBE
   SOQkTN8Z8ZPTC/ucL4gmwabEpyDlNxMMsMl8JrLKBj7dY5WBkVjb523eh
   3KqvAeAOvC08Yftvw1hFVwe8fyL4w1rZd9Vivnyjcf1eXJGTCP02/t55Z
   g==;
X-CSE-ConnectionGUID: ODJzh3FwTE6S4S5teS/I5g==
X-CSE-MsgGUID: a2Q1fr1sTjyNU0G/NssVNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56584706"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56584706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:30:30 -0700
X-CSE-ConnectionGUID: jTA5Y3wYSQiE9YA3e0ubXw==
X-CSE-MsgGUID: PiCBACPURBuPls2nwX53cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127845625"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 07:30:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0i3v-0001IK-0W;
	Fri, 04 Apr 2025 14:30:27 +0000
Date: Fri, 4 Apr 2025 22:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 1/6] kernel/sched/core.c:849:49: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202504042211.sPuetELJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   e75b0015ad0e3de9d7798b7cef6ca40305469f96
commit: deebcd729d011e54806d9026965fcb0c18111129 [1/6] sched/eevdf: Fix HRTICK duration
config: loongarch-randconfig-r132-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042211.sPuetELJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250404/202504042211.sPuetELJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042211.sPuetELJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:773:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:773:33: sparse:     expected struct task_struct *task
   kernel/sched/core.c:773:33: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:849:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:849:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:849:49: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:1094:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1094:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1094:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2193:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2193:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2193:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2204:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2204:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2204:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3681:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3681:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3681:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3890:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3890:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3890:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8053:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8053:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8053:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5650:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5650:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5650:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6664:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6664:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6664:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7211:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7211:17: sparse:    struct task_struct *
   kernel/sched/core.c:7211:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10145:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10145:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10145:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:598:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:623:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:647:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1766:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1766:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:98:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:98:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:98:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:849:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2274:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/core.c:2157:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2157:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2157:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:73:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:73:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:82:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:82:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:82:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1351:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *

vim +849 kernel/sched/core.c

   835	
   836	/*
   837	 * High-resolution timer tick.
   838	 * Runs from hardirq context with interrupts disabled.
   839	 */
   840	static enum hrtimer_restart hrtick(struct hrtimer *timer)
   841	{
   842		struct rq *rq = container_of(timer, struct rq, hrtick_timer);
   843		struct rq_flags rf;
   844	
   845		WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
   846	
   847		rq_lock(rq, &rf);
   848		update_rq_clock(rq);
 > 849		rq->donor->sched_class->task_tick(rq, rq->donor, 1);
   850		rq_unlock(rq, &rf);
   851	
   852		return HRTIMER_NORESTART;
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
