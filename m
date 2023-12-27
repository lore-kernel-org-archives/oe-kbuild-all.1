Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76992919
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezLYfri5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703649548; x=1735185548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+g5ceF2EYrQvlvPyOEbfwmfVhMRPmgoS2RDjFsgohI=;
  b=ezLYfri5Gsr85rfyD3UzTft3sVC/LG+niU5Al2RBXNwP5KCX7XoW0tUW
   FterQn3WumBv4sOnVO2TLIHTWvYG8B9Z8s/IXsBaxMfZ7+05weGdUHXQG
   T4aILmT4jiOY0FxflPjWvdLhZ4YFp8sBv4CPZxqABNgBzg4q5Jg3RC4jn
   51XvCXN6A0NmrDI21pvDuYVBaV/byYGgh8VdmmmEtLQqLtt45+/cIxOCQ
   0sfpF9446Zki0rJw7+wdeUAqJ6wm+nbkX0hGeq9k+Zk8EKoju+sY4t7Md
   8ei0lSuxNuotaCd6gQJwsKP0OHY9lQz8O0JT1AH5ZNqo68G/EPjoVuWTc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="427575943"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="427575943"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 19:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="771326294"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="771326294"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Dec 2023 19:59:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIL4O-000F3L-34;
	Wed, 27 Dec 2023 03:59:01 +0000
Date: Wed, 27 Dec 2023 11:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 6/11] include/linux/tick.h:28:1:
 warning: no return statement in function returning non-void
Message-ID: <202312271122.e6aLJwtY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   018d96d27486694a8496e3937ac2f7270442c7c3
commit: 0f851847642e32105fa0ace39063fa5018379f8c [6/11] timers: Start centralizing tick related CPU hotplug operations
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20231227/202312271122.e6aLJwtY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271122.e6aLJwtY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271122.e6aLJwtY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/isolation.h:6,
                    from kernel/cpu.c:13:
   include/linux/tick.h: In function 'tick_cpu_dying':
>> include/linux/tick.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
      28 | static inline int tick_cpu_dying(unsigned int cpu) { }
         | ^~~~~~
--
   In file included from kernel/irq_work.c:17:
   include/linux/tick.h: In function 'tick_cpu_dying':
>> include/linux/tick.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
      28 | static inline int tick_cpu_dying(unsigned int cpu) { }
         | ^~~~~~
   kernel/irq_work.c: At top level:
   kernel/irq_work.c:72:13: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
      72 | void __weak arch_irq_work_raise(void)
         |             ^~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/time/hrtimer.c:32:
   include/linux/tick.h: In function 'tick_cpu_dying':
>> include/linux/tick.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
      28 | static inline int tick_cpu_dying(unsigned int cpu) { }
         | ^~~~~~
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')


vim +28 include/linux/tick.h

    15	
    16	#ifdef CONFIG_GENERIC_CLOCKEVENTS
    17	extern void __init tick_init(void);
    18	/* Should be core only, but ARM BL switcher requires it */
    19	extern void tick_suspend_local(void);
    20	/* Should be core only, but XEN resume magic and ARM BL switcher require it */
    21	extern void tick_resume_local(void);
    22	extern int tick_cpu_dying(unsigned int cpu);
    23	extern void tick_cleanup_dead_cpu(int cpu);
    24	#else /* CONFIG_GENERIC_CLOCKEVENTS */
    25	static inline void tick_init(void) { }
    26	static inline void tick_suspend_local(void) { }
    27	static inline void tick_resume_local(void) { }
  > 28	static inline int tick_cpu_dying(unsigned int cpu) { }
    29	static inline void tick_cleanup_dead_cpu(int cpu) { }
    30	#endif /* !CONFIG_GENERIC_CLOCKEVENTS */
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
