Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022E517D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 03:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689736751; x=1721272751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLAM0fT8gLxQj0UMOybKcUeNNtRLPChMAdUSwS8el5s=;
  b=ATm7CZHANsQpF+gcfydFIkk/9WOVzLYsy9qxDhMgF+MNlxV+CZjltelD
   gGX2Gam6XeMYNABRWoVbkwZaKuwD7g+Fx+FM1WbRBB/rrFTtbiw9KYp9s
   OpDEaAvPG2doYzYtI4I3ALnD+OHkKQd6xGns7ssuh3q//1WywarZOqdKM
   Qm1tJSl5Jk1vOAKS+H8h0+BsQBBM/wwI6Y4np75dkS3XxQl130RYlkrMZ
   /RHYRF9cJIUSo3hsn6R2YPVL+SeA84f9itPSYCiyUO7ahZ7mjNIAMXnZ7
   U/PY4kv3J9fIT3lJ70Zo43bvl5cN34hIRhMkZgPuH5hWAvq7QZEfF2WEO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365242333"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="365242333"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 20:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701131957"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="701131957"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 20:19:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLxiW-00046L-1I;
	Wed, 19 Jul 2023 03:19:08 +0000
Date: Wed, 19 Jul 2023 11:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 2/2] kernel/sched/fair.c:165:15: error:
 return type defaults to 'int'
Message-ID: <202307191141.34yA5Ndh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   f49a0141f6fa8e9f6dd3b8cacae3531f90c74343
commit: f49a0141f6fa8e9f6dd3b8cacae3531f90c74343 [2/2] sched/fair: Remove magic margin in fits_capacity()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307191141.34yA5Ndh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191141.34yA5Ndh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191141.34yA5Ndh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:165:15: error: return type defaults to 'int' [-Werror=implicit-int]
     165 | static inline fits_capacity(unsigned long util, unsigned long capacity)
         |               ^~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'fits_capacity':
>> kernel/sched/fair.c:167:16: error: implicit declaration of function 'approximate_util_avg' [-Werror=implicit-function-declaration]
     167 |         return approximate_util_avg(util, TICK_NSEC) < capacity;
         |                ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:12224:6: warning: no previous prototype for 'task_vruntime_update' [-Wmissing-prototypes]
   12224 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/int +165 kernel/sched/fair.c

   150	
   151	/*
   152	 * The util will fit the capacity if it has enough headroom to grow within the
   153	 * next tick - which is when any load balancing activity happens to do the
   154	 * correction.
   155	 *
   156	 * If util stays within the capacity before tick has elapsed, then it should be
   157	 * fine. If not, then a correction action must happen shortly after it starts
   158	 * running, hence we treat it as !fit.
   159	 *
   160	 * TODO: TICK is not actually accurate enough. balance_interval is the correct
   161	 * one to use as the next load balance doesn't not happen religiously at tick.
   162	 * Accessing balance_interval might be tricky and will require some refactoring
   163	 * first.
   164	 */
 > 165	static inline fits_capacity(unsigned long util, unsigned long capacity)
   166	{
 > 167		return approximate_util_avg(util, TICK_NSEC) < capacity;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
