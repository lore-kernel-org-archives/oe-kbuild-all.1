Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87982A2C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688482799; x=1720018799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ejosdCDJF6KhbFugBwXVGKw1t8Tuz/2EYmzqqFIU0fw=;
  b=HRVKJP29SHycMgK9nHNZCbA7D4wsDGlZIUBEwx1rvRGP8FCabkpB6pYY
   PV2DbkaCd+bblT5QVAWteHvRzB9Lc9qXdAyoKn8ZluaN7x1j3Z+Ao+Mn1
   7sDONdsa4ri0j+3sCqlueeCb6owbpxjSlSWBSCYwhpWXYmKiEjZ3Houb0
   +HQ8ahzi5O0o8Ybi/35+rn9Btq7pAkDQJh5/pM4X+0dRyRYd9dNzlV2Cs
   6KsuOZTj9eSEryuyQ2DX2DWcHe1HFR9aXVpfzp9YEUROmy6I+CJyDFNAN
   /Sbcbrvh+6BFAeLiJEmC+Gnk2AsR2dAMGrnoiSyssI9twDZiymcZ7Motc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="449506475"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="449506475"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892889519"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="892889519"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jul 2023 07:59:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGhVU-000IJP-10;
	Tue, 04 Jul 2023 14:59:56 +0000
Date: Tue, 4 Jul 2023 22:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 2/4] kernel/time/hrtimer.c:701:6: warning:
 no previous declaration for 'hrtimer_switch_to_lres'
Message-ID: <202307042203.ktXkp7s3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   4d89af6ae49b62b28be9c5bacc14997e409188d3
commit: cdc5027eae87be4fbce2aa7892bdd12b38388f63 [2/4] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: um-defconfig (https://download.01.org/0day-ci/archive/20230704/202307042203.ktXkp7s3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042203.ktXkp7s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042203.ktXkp7s3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/ioport.h:13:0,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:34:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
                      ^
   include/linux/compiler.h:313:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:336:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
     ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:8:0,
                    from include/linux/mm.h:27,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:82,
                    from kernel/time/hrtimer.c:39:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
    #define pgtable_cache_init() do ; while (0)
                                    ^
   include/linux/mm.h:1839:2: note: in expansion of macro 'pgtable_cache_init'
     pgtable_cache_init();
     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14:0,
                    from include/linux/poll.h:12,
                    from include/linux/ring_buffer.h:7,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:82,
                    from kernel/time/hrtimer.c:39:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
       (((unsigned long) (addr) >= FIXADDR_USER_START) && \
                                ^
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      __access_ok_vsyscall(addr, size) ||
      ^~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:104:21: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_REALTIME] = HRTIMER_BASE_REALTIME,
                        ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:104:21: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:105:22: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_MONOTONIC] = HRTIMER_BASE_MONOTONIC,
                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:105:22: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:106:21: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_BOOTTIME] = HRTIMER_BASE_BOOTTIME,
                        ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:106:21: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:107:17: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_TAI]  = HRTIMER_BASE_TAI,
                    ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:107:17: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
>> kernel/time/hrtimer.c:701:6: warning: no previous declaration for 'hrtimer_switch_to_lres' [-Wmissing-declarations]
    void hrtimer_switch_to_lres(void)
         ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:716:6: warning: no previous declaration for 'hrtimer_switch_to_hres' [-Wmissing-declarations]
    void hrtimer_switch_to_hres(void)
         ^~~~~~~~~~~~~~~~~~~~~~


vim +/hrtimer_switch_to_lres +701 kernel/time/hrtimer.c

   697	
   698	/*
   699	 * Switch to low resolution mode
   700	 */
 > 701	void hrtimer_switch_to_lres(void)
   702	{
   703		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   704	
   705		if (!__hrtimer_hres_active(base))
   706			return;
   707	
   708		tick_nohz_hres_to_lres();
   709		base->hres_active = 0;
   710		hrtimer_resolution = LOW_RES_NSEC;
   711	}
   712	
   713	/*
   714	 * Switch to high resolution mode
   715	 */
 > 716	void hrtimer_switch_to_hres(void)
   717	{
   718		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   719	
   720		if (__hrtimer_hres_active(base))
   721			return;
   722	
   723		if (tick_init_highres()) {
   724			printk(KERN_WARNING "Could not switch to high resolution "
   725					    "mode on CPU %d\n", base->cpu);
   726			return;
   727		}
   728		base->hres_active = 1;
   729		hrtimer_resolution = HIGH_RES_NSEC;
   730	
   731		tick_setup_sched_timer();
   732		/* "Retrigger" the interrupt to get things going */
   733		retrigger_next_event(NULL);
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
