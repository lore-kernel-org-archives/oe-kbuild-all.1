Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6B3AD518
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782569052; cv=none; b=pnZaNiwUxvHppmPo1bdruJYqi3YrU1muWVE6mE7kZ/7SnNGXVlBgIngAr1+k/ELICCzG3TNJx/Wcldbn+2NgZRUwI3P0PxAKT2MUkgbWACa7ZQXYue6DkiaCJD2x63PCXZvn0w/eN9Z1xYLxApo/TM2fJh8cwhP11v9IuehtLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782569052; c=relaxed/simple;
	bh=xfRmVEpym/eLC5mMuOMK2lrjb+Ncm8dIoWjirLMpKgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UUT2QC+Wh3HkP0K9yfDB0D6VXnkidCGap8msiV8JYC2WPwVXPIryVcFgh6YotXth01CzIfIPdKVa1ph527xNtUIb9PNHhTm4VNL0yORaswFU3aUMIJ5LhwuqBmZytk3Fg2rfgZq/BgZKFJFKLm30EhcASjoUwOsqm6A0NsTs9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhlskJdu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhlskJdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782569050; x=1814105050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xfRmVEpym/eLC5mMuOMK2lrjb+Ncm8dIoWjirLMpKgQ=;
  b=PhlskJdurTw/iwsYiHS1g/yW92RW6T8u58UujygnXAH5fvBxjt3/zE4+
   v+8lk003McsVqUX2GE2WqkpXoQ2GIMwXGSWVSHj+UjRppjvapJYp349G9
   ncJp5OwiQF1qeSvGMfoH2iVtx1i42UkPQ2Z1dGIf/MsQ2otzMAwFEKTPe
   f5i2ueJkCAayVtoEcvacYWu/mpABm4DcavnS2uFYXqSucAtuQgVLL2rDr
   gVL7jKFLkDbul6UO2XgkrM2f16YMLQ0SOrZp15WqEFzRBmSvDdsS8LmQO
   1SONHELhMRCWKgVbGRjJyMKwSl6bape6oxtrG6bj3GCy+6moZmdO1h+d4
   A==;
X-CSE-ConnectionGUID: la6njIoOQciOvNdyvzwN7w==
X-CSE-MsgGUID: KgKTCfAER8iEctbs5dSbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="100767303"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="100767303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 07:04:09 -0700
X-CSE-ConnectionGUID: LHth4WWaSDeF+Jf1DlSf0Q==
X-CSE-MsgGUID: aNN/7ZOYTvapEthZo68mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="275803492"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2026 07:04:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdTdZ-000000005sC-3JmW;
	Sat, 27 Jun 2026 14:04:02 +0000
Date: Sat, 27 Jun 2026 22:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 5/5]
 include/asm-generic/percpu.h:151:2: error: implicit declaration of function
 'raw_local_irq_save'
Message-ID: <202606272115.eUhar4XE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   7c6a2b4d48e905380f1c24cd685e513f547f8c0a
commit: 7c6a2b4d48e905380f1c24cd685e513f547f8c0a [5/5] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: riscv-randconfig-r133-20260627 (https://download.01.org/0day-ci/archive/20260627/202606272115.eUhar4XE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606272115.eUhar4XE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606272115.eUhar4XE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/bug.h:90,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/hrtimer_rearm.h:8,
                    from include/linux/hrtimer.h:15,
                    from kernel/time/alarmtimer.c:16:
   include/linux/hrtimer_rearm.h: In function 'hrtimer_test_and_clear_rearm_deferred_tif':
   include/asm-generic/percpu.h:141:2: error: implicit declaration of function 'preempt_disable_notrace' [-Werror=implicit-function-declaration]
     141 |  preempt_disable_notrace();     \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: in definition of macro 'WARN_ON_ONCE'
     120 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/asm-generic/percpu.h:161:11: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     161 |   __ret = __this_cpu_generic_read_nopreempt(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:390:31: note: in expansion of macro 'this_cpu_generic_read'
     390 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:325:23: note: in expansion of macro 'this_cpu_read_1'
     325 |  case 1: pscr_ret__ = stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:44: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                            ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: in expansion of macro '__lockdep_enabled'
     582 |  WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |               ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:20:2: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      20 |  lockdep_assert_irqs_disabled();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:143:2: error: implicit declaration of function 'preempt_enable_notrace' [-Werror=implicit-function-declaration]
     143 |  preempt_enable_notrace();     \
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: in definition of macro 'WARN_ON_ONCE'
     120 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/asm-generic/percpu.h:161:11: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     161 |   __ret = __this_cpu_generic_read_nopreempt(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:390:31: note: in expansion of macro 'this_cpu_generic_read'
     390 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:325:23: note: in expansion of macro 'this_cpu_read_1'
     325 |  case 1: pscr_ret__ = stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:44: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                            ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: in expansion of macro '__lockdep_enabled'
     582 |  WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |               ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:20:2: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      20 |  lockdep_assert_irqs_disabled();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:151:2: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
     151 |  raw_local_irq_save(___flags);     \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: in definition of macro 'WARN_ON_ONCE'
     120 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/asm-generic/percpu.h:163:11: note: in expansion of macro '__this_cpu_generic_read_noirq'
     163 |   __ret = __this_cpu_generic_read_noirq(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:390:31: note: in expansion of macro 'this_cpu_generic_read'
     390 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:325:23: note: in expansion of macro 'this_cpu_read_1'
     325 |  case 1: pscr_ret__ = stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:44: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                            ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: in expansion of macro '__lockdep_enabled'
     582 |  WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |               ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:20:2: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      20 |  lockdep_assert_irqs_disabled();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:153:2: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
     153 |  raw_local_irq_restore(___flags);    \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: in definition of macro 'WARN_ON_ONCE'
     120 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/asm-generic/percpu.h:163:11: note: in expansion of macro '__this_cpu_generic_read_noirq'
     163 |   __ret = __this_cpu_generic_read_noirq(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:390:31: note: in expansion of macro 'this_cpu_generic_read'
     390 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:325:23: note: in expansion of macro 'this_cpu_read_1'
     325 |  case 1: pscr_ret__ = stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:499:29: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:44: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                            ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: in expansion of macro '__lockdep_enabled'
     582 |  WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |               ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:20:2: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      20 |  lockdep_assert_irqs_disabled();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raw_local_irq_save +151 include/asm-generic/percpu.h

9c28278a24c01c Tejun Heo     2014-06-17  146  
e88d62cd4b2f0b Mark Rutland  2017-09-26  147  #define __this_cpu_generic_read_noirq(pcp)				\
e88d62cd4b2f0b Mark Rutland  2017-09-26  148  ({									\
8a3c392388c6a6 Uros Bizjak   2025-01-27  149  	TYPEOF_UNQUAL(pcp) ___ret;					\
29813a2297910d Arnd Bergmann 2020-10-26  150  	unsigned long ___flags;						\
29813a2297910d Arnd Bergmann 2020-10-26 @151  	raw_local_irq_save(___flags);					\
29813a2297910d Arnd Bergmann 2020-10-26  152  	___ret = raw_cpu_generic_read(pcp);				\
29813a2297910d Arnd Bergmann 2020-10-26 @153  	raw_local_irq_restore(___flags);				\
29813a2297910d Arnd Bergmann 2020-10-26  154  	___ret;								\
e88d62cd4b2f0b Mark Rutland  2017-09-26  155  })
e88d62cd4b2f0b Mark Rutland  2017-09-26  156  

:::::: The code at line 151 was first introduced by commit
:::::: 29813a2297910d5c4be08c7b390054f23dd794a5 asm-generic: percpu: avoid Wshadow warning

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Dennis Zhou <dennis@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
