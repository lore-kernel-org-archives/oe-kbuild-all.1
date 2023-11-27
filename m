Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920810F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 02:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oASO6qCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701050712; x=1732586712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gYKpoRiQxiM4nn8Q8j3/AyHOrto3J+PH/qNiXbNbpwY=;
  b=oASO6qCronYyHor8KXQixdjA9xYp0ZHa3+hUWObaVhLewLirFqRLhiOw
   UT14gyxxYVnIkeKnjrok+Rckk2UnEBlqmZueGMdZkjcfcS1GEXoYwzgJm
   RNc/uwAK1rClk4oRfAoxjrRMxv4ejD5hDG9zquG5J3w+Lij3a4kxjAkda
   IoOwgoe4yfInCWAhRwziZCyA2MBIs2Y1aQLVSf/DidHewA3T38s/OGLyN
   JIY2aOCVa/LPPlcOy1S4oglMCwDU73eaiucRq77NeB7OWwkM0znmW5ATT
   40dbXhX1nDEP9H25vu6ny/pe1I+yVugYcSxx1aEf6eWlPguwZ9zmyHuCw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="478814565"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="478814565"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 18:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891584001"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="891584001"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Nov 2023 18:05:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Qzj-0005kg-1r;
	Mon, 27 Nov 2023 02:05:07 +0000
Date: Mon, 27 Nov 2023 10:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/core.c:7159:19: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202311270803.Rc8OKqPc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   08e786e9ed2872cba5830c16cd1bf55b475feb22
commit: 86ec485f249360a80bc9baccebedc120b9f5347e [9/11] sched/uclamp: Remove rq max aggregation
config: x86_64-randconfig-122-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270803.Rc8OKqPc-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270803.Rc8OKqPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270803.Rc8OKqPc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:726:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:726:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:726:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:727:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:727:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:727:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:797:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:797:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:797:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1043:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1043:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1927:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1927:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1927:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1927:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1927:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:1927:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3423:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3423:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3423:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3630:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3630:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3630:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9131:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9131:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9131:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5338:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5338:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5338:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6296:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6296:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6296:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6857:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6857:17: sparse:    struct task_struct *
   kernel/sched/core.c:6857:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7072:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7072:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7072:22: sparse:    struct task_struct *
>> kernel/sched/core.c:7159:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7159:19: sparse:     expected struct task_struct *p
   kernel/sched/core.c:7159:19: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:11183:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11183:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11183:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1291:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1291:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:577:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:601:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/sched.h:1561:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1561:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:797:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1918:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1919:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1920:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1997:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/core.c:1893:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:1893:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:1893:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/core.c:7993:5: sparse: sparse: context imbalance in 'dl_task_check_affinity' - wrong count at exit
   kernel/sched/core.c:8097:9: sparse: sparse: context imbalance in 'sched_setaffinity' - different lock contexts for basic block
   kernel/sched/core.c:8159:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/core.c:8322:28: sparse: sparse: context imbalance in '__cond_resched_lock' - unexpected unlock
   kernel/sched/core.c:8340:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_read' - unexpected unlock
   kernel/sched/core.c:8358:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_write' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2091:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2091:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2259:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2259:9: sparse:    struct task_struct *

vim +7159 kernel/sched/core.c

  7126	
  7127	#ifdef CONFIG_SMP
  7128	/*
  7129	 * This function computes an effective utilization for the given CPU, to be
  7130	 * used for frequency selection given the linear relation: f = u * f_max.
  7131	 *
  7132	 * The scheduler tracks the following metrics:
  7133	 *
  7134	 *   cpu_util_{cfs,rt,dl,irq}()
  7135	 *   cpu_bw_dl()
  7136	 *
  7137	 * Where the cfs,rt and dl util numbers are tracked with the same metric and
  7138	 * synchronized windows and are thus directly comparable.
  7139	 *
  7140	 * The cfs,rt,dl utilization are the running times measured with rq->clock_task
  7141	 * which excludes things like IRQ and steal-time. These latter are then accrued
  7142	 * in the irq utilization.
  7143	 *
  7144	 * The DL bandwidth number otoh is not a measured metric but a value computed
  7145	 * based on the task model parameters and gives the minimal utilization
  7146	 * required to meet deadlines.
  7147	 */
  7148	unsigned long effective_cpu_util(int cpu, unsigned long util_cfs,
  7149					 unsigned long *min,
  7150					 unsigned long *max,
  7151					 struct task_struct *p)
  7152	{
  7153		unsigned long util, irq, scale;
  7154		struct rq *rq = cpu_rq(cpu);
  7155	
  7156		scale = arch_scale_cpu_capacity(cpu);
  7157	
  7158		if (!p)
> 7159			p = rq->curr;
  7160	
  7161		/*
  7162		 * Early check to see if IRQ/steal time saturates the CPU, can be
  7163		 * because of inaccuracies in how we track these -- see
  7164		 * update_irq_load_avg().
  7165		 */
  7166		irq = cpu_util_irq(rq);
  7167		if (unlikely(irq >= scale)) {
  7168			if (min)
  7169				*min = scale;
  7170			if (max)
  7171				*max = scale;
  7172			return scale;
  7173		}
  7174	
  7175		if (min) {
  7176			/*
  7177			 * The minimum utilization returns the highest level between:
  7178			 * - the computed DL bandwidth needed with the IRQ pressure which
  7179			 *   steals time to the deadline task.
  7180			 * - The minimum performance requirement for CFS and/or RT.
  7181			 */
  7182			*min = max(irq + cpu_bw_dl(rq), uclamp_eff_value(p, UCLAMP_MIN));
  7183	
  7184			/*
  7185			 * When an RT task is runnable and uclamp is not used, we must
  7186			 * ensure that the task will run at maximum compute capacity.
  7187			 */
  7188			if (!IS_ENABLED(CONFIG_UCLAMP_TASK) && rt_rq_is_runnable(&rq->rt))
  7189				*min = max(*min, scale);
  7190		}
  7191	
  7192		/*
  7193		 * Because the time spend on RT/DL tasks is visible as 'lost' time to
  7194		 * CFS tasks and we use the same metric to track the effective
  7195		 * utilization (PELT windows are synchronized) we can directly add them
  7196		 * to obtain the CPU's actual utilization.
  7197		 */
  7198		util = util_cfs + cpu_util_rt(rq);
  7199		util += cpu_util_dl(rq);
  7200	
  7201		/*
  7202		 * The maximum hint is a soft bandwidth requirement, which can be lower
  7203		 * than the actual utilization because of uclamp_max requirements.
  7204		 */
  7205		if (max)
  7206			*max = min(scale, uclamp_eff_value(p, UCLAMP_MAX));
  7207	
  7208		if (util >= scale)
  7209			return scale;
  7210	
  7211		/*
  7212		 * There is still idle time; further improve the number by using the
  7213		 * irq metric. Because IRQ/steal time is hidden from the task clock we
  7214		 * need to scale the task numbers:
  7215		 *
  7216		 *              max - irq
  7217		 *   U' = irq + --------- * U
  7218		 *                 max
  7219		 */
  7220		util = scale_irq_capacity(util, irq, scale);
  7221		util += irq;
  7222	
  7223		return min(scale, util);
  7224	}
  7225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
