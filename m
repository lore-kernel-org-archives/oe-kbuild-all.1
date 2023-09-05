Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7C633
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693883307; x=1725419307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+zbx4lGNCsZxWkQeo8UtgNk0FfCLHbOpPtk8WdE378=;
  b=Ih4yPF52AqaxhrmeFqV6L+9/I8cWT7B+vgJ36opuXCb8A9s8MBQbS3jc
   D46aS63ae1GHOaS4gLMMI42y81wxrVdKsvUO/kdG7zxp++l/8rs+raAaK
   hNDqaBe5769XWLf42gb/RhB8B1y07blXJWd2sLTeiruGG/wR+ig0IGw73
   cpoB9cwM0+qwyfKpfjDNGhk2vSfIIjwaPec8ueOQPaEc5Aogzr5LURBBV
   pcd7MT9+e+k90DDJSuBwHhcUo/OWwHSQYPJqz3/FIKab/4w5w+qw9REKu
   rhm3ZckzrKBLiuNdoIpR1B0Sjj2llBTEn/O6vg5IOJdKjRw309MIFUiga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366918491"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="366918491"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 20:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987661595"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="987661595"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 20:08:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdMQR-0001Ax-0v;
	Tue, 05 Sep 2023 03:08:23 +0000
Date: Tue, 5 Sep 2023 11:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 2/2]
 kernel/sched/cpufreq_schedutil.c:285:34: warning: passing argument 1 of
 'uclamp_util_with' makes pointer from integer without a cast
Message-ID: <202309051133.nrqstG0l-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230905/202309051133.nrqstG0l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051133.nrqstG0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051133.nrqstG0l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:69:
   kernel/sched/cpufreq_schedutil.c: In function 'sugov_iowait_apply':
>> kernel/sched/cpufreq_schedutil.c:285:34: warning: passing argument 1 of 'uclamp_util_with' makes pointer from integer without a cast [-Wint-conversion]
     285 |         boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
         |                                  ^~~~~
         |                                  |
         |                                  long unsigned int
   In file included from kernel/sched/build_utility.c:53:
   kernel/sched/sched.h:3040:43: note: expected 'struct rq *' but argument is of type 'long unsigned int'
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |                                ~~~~~~~~~~~^~
>> kernel/sched/cpufreq_schedutil.c:285:60: warning: passing argument 2 of 'uclamp_util_with' makes integer from pointer without a cast [-Wint-conversion]
     285 |         boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
   kernel/sched/sched.h:3040:61: note: expected 'long unsigned int' but argument is of type 'struct task_struct *'
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |                                               ~~~~~~~~~~~~~~^~~~
   kernel/sched/cpufreq_schedutil.c:285:17: error: too few arguments to function 'uclamp_util_with'
     285 |         boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
         |                 ^~~~~~~~~~~~~~~~
   kernel/sched/sched.h:3040:15: note: declared here
    3040 | unsigned long uclamp_util_with(struct rq *rq, unsigned long util,
         |               ^~~~~~~~~~~~~~~~


vim +/uclamp_util_with +285 kernel/sched/cpufreq_schedutil.c

   235	
   236	/**
   237	 * sugov_iowait_apply() - Apply the IO boost to a CPU.
   238	 * @sg_cpu: the sugov data for the cpu to boost
   239	 * @time: the update time from the caller
   240	 * @max_cap: the max CPU capacity
   241	 *
   242	 * A CPU running a task which woken up after an IO operation can have its
   243	 * utilization boosted to speed up the completion of those IO operations.
   244	 * The IO boost value is increased each time a task wakes up from IO, in
   245	 * sugov_iowait_apply(), and it's instead decreased by this function,
   246	 * each time an increase has not been requested (!iowait_boost_pending).
   247	 *
   248	 * A CPU which also appears to have been idle for at least one tick has also
   249	 * its IO boost utilization reset.
   250	 *
   251	 * This mechanism is designed to boost high frequently IO waiting tasks, while
   252	 * being more conservative on tasks which does sporadic IO operations.
   253	 */
   254	static void sugov_iowait_apply(struct sugov_cpu *sg_cpu, u64 time,
   255				       unsigned long max_cap)
   256	{
   257		unsigned long boost;
   258	
   259		/* No boost currently required */
   260		if (!sg_cpu->iowait_boost)
   261			return;
   262	
   263		/* Reset boost if the CPU appears to have been idle enough */
   264		if (sugov_iowait_reset(sg_cpu, time, false))
   265			return;
   266	
   267		if (!sg_cpu->iowait_boost_pending) {
   268			/*
   269			 * No boost pending; reduce the boost value.
   270			 */
   271			sg_cpu->iowait_boost >>= 1;
   272			if (sg_cpu->iowait_boost < IOWAIT_BOOST_MIN) {
   273				sg_cpu->iowait_boost = 0;
   274				return;
   275			}
   276		}
   277	
   278		sg_cpu->iowait_boost_pending = false;
   279	
   280		/*
   281		 * sg_cpu->util is already in capacity scale; convert iowait_boost
   282		 * into the same scale so we can compare.
   283		 */
   284		boost = (sg_cpu->iowait_boost * max_cap) >> SCHED_CAPACITY_SHIFT;
 > 285		boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
   286		if (sg_cpu->util < boost)
   287			sg_cpu->util = boost;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
