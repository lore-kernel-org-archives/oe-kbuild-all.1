Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29611078E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 23:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679441544; x=1710977544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Debxss1L116IwV7lPWA7hjQpItrvKfHLrKuGz8B+LSo=;
  b=NQ9k0DQ0i99eAYg4Pqsdpmfz1gTOZaUflQ9fzZTR0qdpPAnOgqh4G72X
   L+6Uk9CUOdKpK6TwZkb3FEVr11WjGqcL8/dnPmga/7pSLmUb1m65m4iHM
   oNyXUsjMecXz4XHRDeTZelfD2qVp+fty7i89kK9Uh0F6VY8x2wCiLfcXx
   3bOgE3GtjA3sSlvKFjZtMdkq+u9T2Fvq7UpSlfWsypdldnQY5sGEeQpxi
   nHVolv/8FiiDMh9yHpNsCJeDl8k96bMGH3hd09LnOHGI2COZDTtct5BAf
   IswFOmuiUTgHzlsB2WqzhQ/neY8pYIXMUZDnuMfXZTjQWTdThvapdQ4Ty
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327462447"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="327462447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 16:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="805616251"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="805616251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2023 16:32:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pelSS-000CYE-1n;
	Tue, 21 Mar 2023 23:32:00 +0000
Date: Wed, 22 Mar 2023 07:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 7847/9999] kernel/sched/sched.h:1763:39:
 warning: left shift count >= width of type
Message-ID: <202303220712.8KAPqVzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 9d168f216486333f24aa1b33706eddf3b13d7228 [7847/9999] alinux: sched: Defend cfs and rt bandwidth against overflow
config: m68k-randconfig-r001-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220712.8KAPqVzc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alibaba/cloud-kernel/commit/9d168f216486333f24aa1b33706eddf3b13d7228
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 9d168f216486333f24aa1b33706eddf3b13d7228
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash M=kernel/sched

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220712.8KAPqVzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:1607:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    1607 |         struct rq *rq;
         |                    ^~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:3699:35: warning: no previous prototype for 'preempt_schedule_irq' [-Wmissing-prototypes]
    3699 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:8:
>> kernel/sched/sched.h:1763:39: warning: left shift count >= width of type [-Wshift-count-overflow]
    1763 | #define MAX_BW_USEC             ((1UL << MAX_BW_BITS) - 1)
         |                                       ^~
   kernel/sched/core.c:6516:29: note: in expansion of macro 'MAX_BW_USEC'
    6516 | const u64 max_cfs_runtime = MAX_BW_USEC * NSEC_PER_USEC;
         |                             ^~~~~~~~~~~
   kernel/sched/core.c:6602:5: warning: no previous prototype for 'tg_set_cfs_quota' [-Wmissing-prototypes]
    6602 | int tg_set_cfs_quota(struct task_group *tg, long cfs_quota_us)
         |     ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:6617:6: warning: no previous prototype for 'tg_get_cfs_quota' [-Wmissing-prototypes]
    6617 | long tg_get_cfs_quota(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:6630:5: warning: no previous prototype for 'tg_set_cfs_period' [-Wmissing-prototypes]
    6630 | int tg_set_cfs_period(struct task_group *tg, long cfs_period_us)
         |     ^~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6643:6: warning: no previous prototype for 'tg_get_cfs_period' [-Wmissing-prototypes]
    6643 | long tg_get_cfs_period(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~
--
   kernel/sched/rt.c:626:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     626 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/rt.c:6:
>> kernel/sched/sched.h:1763:39: warning: left shift count >= width of type [-Wshift-count-overflow]
    1763 | #define MAX_BW_USEC             ((1UL << MAX_BW_BITS) - 1)
         |                                       ^~
   kernel/sched/rt.c:2514:35: note: in expansion of macro 'MAX_BW_USEC'
    2514 | static const u64 max_rt_runtime = MAX_BW_USEC * NSEC_PER_USEC;
         |                                   ^~~~~~~~~~~


vim +1763 kernel/sched/sched.h

  1758	
  1759	#define BW_SHIFT		20
  1760	#define BW_UNIT			(1 << BW_SHIFT)
  1761	#define RATIO_SHIFT		8
  1762	#define MAX_BW_BITS		(64 - BW_SHIFT)
> 1763	#define MAX_BW_USEC		((1UL << MAX_BW_BITS) - 1)
  1764	unsigned long to_ratio(u64 period, u64 runtime);
  1765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
