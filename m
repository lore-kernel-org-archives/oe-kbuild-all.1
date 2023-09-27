Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11444568A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695801382; x=1727337382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tB5AA52gmT/eV/Oqe/pm7IH26gDSE69iG0HYRxTi7fc=;
  b=DKoGluEOuYXuCIgm2d6U+4H7qdo7lG4jP9LKgsF5wSOFzKmGQWR9S8L6
   LhRXWMy2JlNXsEDDC+iGuRstfWqZEisy6UGe4XfajVbXGlwZblkrBlQHw
   q148YJkSB0hbeoLGN3Cpq7XKzHqrPJNtLgwGh+jy4RvHLyB1PrN+rOwFG
   OyxEpvLYV0H/360l6F/C396rwzEC4FBCD4oEBOjNGU41aSgCMvDm4J6vp
   hZvDhQGfHrnYlPaFYhMMzTZKa87ceZlXqdeXBc8gu3hQwhYPjvoadMPeD
   Ds8o/a6qOlLEOEEPJaQrC3Lsy+D0Tb4UJl2R0MQ8OOQFLUcJxmrP/X775
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448251405"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="448251405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 00:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="441815"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2023 00:56:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlPP8-0003sy-0F;
	Wed, 27 Sep 2023 07:56:18 +0000
Date: Wed, 27 Sep 2023 15:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12688/30000]
 kernel/sched/fair.c:5854:6: warning: no previous prototype for
 'schedtune_task_margin'
Message-ID: <202309271538.DUsiRF9Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   8daba3e055d00086f153f5562449f11065001703
commit: f609a2239f83f7c0d0da8a032922e04eaa8fb9c2 [12688/30000] ANDROID: sched/core: Move SchedTune task API into UtilClamp wrappers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230927/202309271538.DUsiRF9Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271538.DUsiRF9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271538.DUsiRF9Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:2515:6: warning: no previous prototype for 'task_numa_work' [-Wmissing-prototypes]
    2515 | void task_numa_work(struct callback_head *work)
         |      ^~~~~~~~~~~~~~
   kernel/sched/fair.c:2660:6: warning: no previous prototype for 'task_tick_numa' [-Wmissing-prototypes]
    2660 | void task_tick_numa(struct rq *rq, struct task_struct *curr)
         |      ^~~~~~~~~~~~~~
   kernel/sched/fair.c:3631:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3631 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3644:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3644 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:5854:6: warning: no previous prototype for 'schedtune_task_margin' [-Wmissing-prototypes]
    5854 | long schedtune_task_margin(struct task_struct *task)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6527:15: warning: no previous prototype for 'capacity_curr_of' [-Wmissing-prototypes]
    6527 | unsigned long capacity_curr_of(int cpu)
         |               ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'find_best_target':
   kernel/sched/fair.c:6542:23: warning: variable 'target_util' set but not used [-Wunused-but-set-variable]
    6542 |         unsigned long target_util = ULONG_MAX;
         |                       ^~~~~~~~~~~


vim +/schedtune_task_margin +5854 kernel/sched/fair.c

  5853	
> 5854	long schedtune_task_margin(struct task_struct *task)
  5855	{
  5856		int boost = schedtune_task_boost(task);
  5857		unsigned long util;
  5858		long margin;
  5859	
  5860		if (boost == 0)
  5861			return 0;
  5862	
  5863		util = task_util_est(task);
  5864		margin = schedtune_margin(util, boost);
  5865	
  5866		return margin;
  5867	}
  5868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
