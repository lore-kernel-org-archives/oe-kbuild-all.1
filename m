Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A93BF66D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509284; cv=none; b=t9QN6SfRi/y7wE9WLdAi7Y8kxFnSuVu0Pm7diEqb4ZpOrGjYFLx0/aXYBPlwQVc+rthW/cN6509GaB42HFY3yF9FNioSXJF0rXZ90s7aSfFLtnn5JwLSzhbfcvahXIzo2ULAeOrqnF9Wp1AJdjWaT3GM5MdD8/bD6vAJ9IQ5QTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509284; c=relaxed/simple;
	bh=SUpvuHrq1K+cZZyTkZ3NepJZMxW01slSE7YcomHq7H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YANKLYpBBlt+4vxUuEDJA+kkB+rzW70b0KIY8scVgQG3bIk9rXA1+9O3k5OK8y8rYJvtF94Gcri1yeOO3iPM2AcmmwMPv+xo1zZ0i4kHQvU6+GHH279rCTx5AG2KkFH2BGIz9Unn6Q70TiS24friC/tKYHQVt+wX3H7yFKqAYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9TUOsUD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9TUOsUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782509283; x=1814045283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUpvuHrq1K+cZZyTkZ3NepJZMxW01slSE7YcomHq7H8=;
  b=X9TUOsUDfk+tIoWRDJHUMpINLLhwyQthDuXS+iUWa2xRcmWTxoZE7A3I
   wpVSisB+bsX2Qw3fUIsq9tC9qt3gaUqIXdG5ZUbY5oJgcwY1hNRtVPGGG
   xH5BolVU/wpWt7JvXa549CepgSOVKB5+08i1ZBDEqn8Dtyh6wKfM+vBzH
   5vsWWpAIu1Sehty/benDPsvJwfMtrm0q1Nuy6VKD6h7BFkhnQsizwTv4V
   oi0Etb86xmdfS75CinMz/ggVTO+BcFg3UcHkHoFakMcSmcgzk5ppDGIWI
   FXsYzttCFSkwU7upNYuYo4UayJNtcNCSwpJA9tmuT9cWiapGUJpwqDWcq
   Q==;
X-CSE-ConnectionGUID: daRTv3NHQyGFQz+Y+y4gdA==
X-CSE-MsgGUID: X8l+YoWER9Kt+eA5GBGWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85853949"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="85853949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 14:28:02 -0700
X-CSE-ConnectionGUID: mTAtORp1Qf22Jku2iyczzQ==
X-CSE-MsgGUID: UsMI/VLOQ/SNKJLVGeTEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="251030119"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2026 14:28:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdE5c-000000005Rb-1W2k;
	Fri, 26 Jun 2026 21:27:57 +0000
Date: Sat, 27 Jun 2026 05:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/65]
 include/asm-generic/percpu.h:141:9: error: implicit declaration of function
 'preempt_disable_notrace'
Message-ID: <202606270525.2VjTL4hN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   966d161648444411a43989942a75a398d47275a8
commit: 382846fc625bfddd6612b6f7038071c9974351a9 [32/65] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: i386-randconfig-017-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270525.2VjTL4hN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270525.2VjTL4hN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270525.2VjTL4hN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/hrtimer_rearm.h:6,
                    from include/linux/hrtimer.h:15,
                    from kernel/time/vsyscall.c:10:
   include/linux/hrtimer_rearm.h: In function 'hrtimer_test_and_clear_rearm_deferred_tif':
>> include/asm-generic/percpu.h:141:9: error: implicit declaration of function 'preempt_disable_notrace' [-Wimplicit-function-declaration]
     141 |         preempt_disable_notrace();                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/asm-generic/percpu.h:161:25: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     161 |                 __ret = __this_cpu_generic_read_nopreempt(pcp);         \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:399:41: note: in expansion of macro 'this_cpu_generic_read'
     399 | #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:328:30: note: in expansion of macro 'this_cpu_read_8'
     328 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:50: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:18:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      18 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:143:9: error: implicit declaration of function 'preempt_enable_notrace' [-Wimplicit-function-declaration]
     143 |         preempt_enable_notrace();                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/asm-generic/percpu.h:161:25: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     161 |                 __ret = __this_cpu_generic_read_nopreempt(pcp);         \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:399:41: note: in expansion of macro 'this_cpu_generic_read'
     399 | #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:328:30: note: in expansion of macro 'this_cpu_read_8'
     328 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:50: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/hrtimer_rearm.h:18:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
      18 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/preempt_disable_notrace +141 include/asm-generic/percpu.h

c5c0ba953b8c969 Peter Zijlstra 2023-05-31  137  
e88d62cd4b2f0b1 Mark Rutland   2017-09-26  138  #define __this_cpu_generic_read_nopreempt(pcp)				\
eba117889ac444b Tejun Heo      2014-06-17  139  ({									\
8a3c392388c6a6e Uros Bizjak    2025-01-27  140  	TYPEOF_UNQUAL(pcp) ___ret;					\
7f8d61f005228fc Heiko Carstens 2016-11-03 @141  	preempt_disable_notrace();					\
29813a2297910d5 Arnd Bergmann  2020-10-26  142  	___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));			\
7f8d61f005228fc Heiko Carstens 2016-11-03 @143  	preempt_enable_notrace();					\
29813a2297910d5 Arnd Bergmann  2020-10-26  144  	___ret;								\
9c28278a24c01c0 Tejun Heo      2014-06-17  145  })
9c28278a24c01c0 Tejun Heo      2014-06-17  146  

:::::: The code at line 141 was first introduced by commit
:::::: 7f8d61f005228fc48e6e2ca3c9af3302cd4870af percpu: use notrace variant of preempt_disable/preempt_enable

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
