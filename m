Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397638F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693875008; x=1725411008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OM5bifx9PmBfSPF75a5lO/ulzfS6sSPyJS6U5HjS+Fg=;
  b=YGeKWRGEWpXwg0vEWDLZiuokGRfXFplwr/b4XqHq50fG/Eua1S2cbuWR
   0sC09UgSYxQdyZwHifjWg3p4x6KM4yVOXbZv9cnR9ZezWaS8SWaCAHGKz
   r2J8MbqSRqEstDPyNRvO8NALXloVYKaCn79B1FfdJ/W/FAom/Tzg4rN7R
   KVs1KSzj0PB4g8URIDm1jrundb6wW1Ew00TY4vikv/Df7huW+HjQZI36t
   ueT+e03eqTTsnv5jqpDPtzlwnb6r2r8RF66cN4O0KIu2SLeWXEXGeciy8
   QDApo0jp6rUmYN3KsbiIHuCRXkeN2wj3tRhJ2xgu4BtdU/zPcL8Tn+Yez
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="380470053"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="380470053"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 17:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="740922596"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="740922596"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Sep 2023 17:50:05 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdKGZ-00012p-1N;
	Tue, 05 Sep 2023 00:50:03 +0000
Date: Tue, 5 Sep 2023 08:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 2/2]
 kernel/sched/core.c:7121:41: warning: passing argument 1 of
 'uclamp_util_with' makes pointer from integer without a cast
Message-ID: <202309050830.hxZTokBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   034e0d339ff128022624302f1a331cdc59d10ee1
commit: 034e0d339ff128022624302f1a331cdc59d10ee1 [2/2] sched/uclamp: Remove rq max aggregation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230905/202309050830.hxZTokBI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050830.hxZTokBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050830.hxZTokBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c: In function 'finish_task_switch':
   kernel/sched/core.c:4930:9: error: too many arguments to function 'uclamp_context_switch'
    4930 |         uclamp_context_switch(rq);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:86:
   kernel/sched/sched.h:3051:20: note: declared here
    3051 | static inline void uclamp_context_switch(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'effective_cpu_util':
>> kernel/sched/core.c:7121:41: warning: passing argument 1 of 'uclamp_util_with' makes pointer from integer without a cast [-Wint-conversion]
    7121 |                 util = uclamp_util_with(util, p);
         |                                         ^~~~
         |                                         |
         |                                         long unsigned int
   kernel/sched/sched.h:3040:43: note: expected 'struct rq *' but argument is of type 'long unsigned int'
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |                                ~~~~~~~~~~~^~
>> kernel/sched/core.c:7121:47: warning: passing argument 2 of 'uclamp_util_with' makes integer from pointer without a cast [-Wint-conversion]
    7121 |                 util = uclamp_util_with(util, p);
         |                                               ^
         |                                               |
         |                                               struct task_struct *
   kernel/sched/sched.h:3040:61: note: expected 'long unsigned int' but argument is of type 'struct task_struct *'
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |                                               ~~~~~~~~~~~~~~^~~~
   kernel/sched/core.c:7121:24: error: too few arguments to function 'uclamp_util_with'
    7121 |                 util = uclamp_util_with(util, p);
         |                        ^~~~~~~~~~~~~~~~
   kernel/sched/sched.h:3040:15: note: declared here
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |               ^~~~~~~~~~~~~~~~


vim +/uclamp_util_with +7121 kernel/sched/core.c

  7062	
  7063	#ifdef CONFIG_SMP
  7064	/*
  7065	 * This function computes an effective utilization for the given CPU, to be
  7066	 * used for frequency selection given the linear relation: f = u * f_max.
  7067	 *
  7068	 * The scheduler tracks the following metrics:
  7069	 *
  7070	 *   cpu_util_{cfs,rt,dl,irq}()
  7071	 *   cpu_bw_dl()
  7072	 *
  7073	 * Where the cfs,rt and dl util numbers are tracked with the same metric and
  7074	 * synchronized windows and are thus directly comparable.
  7075	 *
  7076	 * The cfs,rt,dl utilization are the running times measured with rq->clock_task
  7077	 * which excludes things like IRQ and steal-time. These latter are then accrued
  7078	 * in the irq utilization.
  7079	 *
  7080	 * The DL bandwidth number otoh is not a measured metric but a value computed
  7081	 * based on the task model parameters and gives the minimal utilization
  7082	 * required to meet deadlines.
  7083	 */
  7084	unsigned long effective_cpu_util(int cpu, unsigned long util_cfs,
  7085					 enum cpu_util_type type,
  7086					 struct task_struct *p)
  7087	{
  7088		unsigned long dl_util, util, irq, max;
  7089		struct rq *rq = cpu_rq(cpu);
  7090	
  7091		max = arch_scale_cpu_capacity(cpu);
  7092	
  7093		if (!IS_ENABLED(CONFIG_UCLAMP_TASK) &&
  7094		    type == FREQUENCY_UTIL && rt_rq_is_runnable(&rq->rt)) {
  7095			return max;
  7096		}
  7097	
  7098		/*
  7099		 * Early check to see if IRQ/steal time saturates the CPU, can be
  7100		 * because of inaccuracies in how we track these -- see
  7101		 * update_irq_load_avg().
  7102		 */
  7103		irq = cpu_util_irq(rq);
  7104		if (unlikely(irq >= max))
  7105			return max;
  7106	
  7107		/*
  7108		 * Because the time spend on RT/DL tasks is visible as 'lost' time to
  7109		 * CFS tasks and we use the same metric to track the effective
  7110		 * utilization (PELT windows are synchronized) we can directly add them
  7111		 * to obtain the CPU's actual utilization.
  7112		 *
  7113		 * CFS and RT utilization can be boosted or capped, depending on
  7114		 * utilization clamp constraints requested by currently RUNNABLE
  7115		 * tasks.
  7116		 * When there are no CFS RUNNABLE tasks, clamps are released and
  7117		 * frequency will be gracefully reduced with the utilization decay.
  7118		 */
  7119		util = util_cfs + cpu_util_rt(rq);
  7120		if (type == FREQUENCY_UTIL)
> 7121			util = uclamp_util_with(util, p);
  7122	
  7123		dl_util = cpu_util_dl(rq);
  7124	
  7125		/*
  7126		 * For frequency selection we do not make cpu_util_dl() a permanent part
  7127		 * of this sum because we want to use cpu_bw_dl() later on, but we need
  7128		 * to check if the CFS+RT+DL sum is saturated (ie. no idle time) such
  7129		 * that we select f_max when there is no idle time.
  7130		 *
  7131		 * NOTE: numerical errors or stop class might cause us to not quite hit
  7132		 * saturation when we should -- something for later.
  7133		 */
  7134		if (util + dl_util >= max)
  7135			return max;
  7136	
  7137		/*
  7138		 * OTOH, for energy computation we need the estimated running time, so
  7139		 * include util_dl and ignore dl_bw.
  7140		 */
  7141		if (type == ENERGY_UTIL)
  7142			util += dl_util;
  7143	
  7144		/*
  7145		 * There is still idle time; further improve the number by using the
  7146		 * irq metric. Because IRQ/steal time is hidden from the task clock we
  7147		 * need to scale the task numbers:
  7148		 *
  7149		 *              max - irq
  7150		 *   U' = irq + --------- * U
  7151		 *                 max
  7152		 */
  7153		util = scale_irq_capacity(util, irq, max);
  7154		util += irq;
  7155	
  7156		/*
  7157		 * Bandwidth required by DEADLINE must always be granted while, for
  7158		 * FAIR and RT, we use blocked utilization of IDLE CPUs as a mechanism
  7159		 * to gracefully reduce the frequency when no tasks show up for longer
  7160		 * periods of time.
  7161		 *
  7162		 * Ideally we would like to set bw_dl as min/guaranteed freq and util +
  7163		 * bw_dl as requested freq. However, cpufreq is not yet ready for such
  7164		 * an interface. So, we only do the latter for now.
  7165		 */
  7166		if (type == FREQUENCY_UTIL)
  7167			util += cpu_bw_dl(rq);
  7168	
  7169		return min(max, util);
  7170	}
  7171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
