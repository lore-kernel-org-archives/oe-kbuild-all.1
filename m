Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495933EB0B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466125; cv=none; b=dFG3dJ+WmzyWhxUijsFAFYw3xSOgbZARUfNwWTLtJMhdyvpBBmpxV/CZ2BMEhgMf8jYLPkjrf3ZRcHtCw9qQy8RcTrSFNoXamUElfDaoiDr86BqMSLOuzuBSjBnul1gpMoXHZXvO/LqPS0SSUFdo6cjIx1672NoAORfW+2vRHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466125; c=relaxed/simple;
	bh=clCM9w668mCBRkc/vP3lZRK9uMAED6ocxIdLnptKVSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T0pU2e8XCp8cKw9fvVblW28oQGNr2kuqgZ3FhpZm3SVPMYLmSpFhUjYE4zMXp8HAJELP1wKU1y3IgJP2wMOKThuPLs/fZbFKLNbKZ9+PSwguLtSFvy3Hl2QudfiPHHr02ZTeji1MiuDMrrly8HV8R6nKejhyg58uy56/yBQcIDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCLniT+o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCLniT+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770466125; x=1802002125;
  h=date:from:to:cc:subject:message-id;
  bh=clCM9w668mCBRkc/vP3lZRK9uMAED6ocxIdLnptKVSA=;
  b=KCLniT+ohnjeWnl1UNJfkg9ZjGtuYGnRyAj9SFXLx93PAJAVanbuXr6r
   wpIXyKjQlhinB3gv9nyxLG8wLflQu9N85ytakNG8rF1r7cdrOFJJDVg56
   cbEhYDoSkLQJWHaWwT1XrQMe9OyyKvzCcq+HqI0QEhD6k4xHQJG2IMYLx
   22VFOJskHnr/dAIgj+jt3Ksj65ZU3QYGAeFtbrZJVOv1eb8A4fVaZwSSI
   Lwb/bf/tILQf0VKz0W1g1E1ajxqyjcsDKfUBdsaAu6rNLwG1dgVQ9nawR
   G1ckPWWq1DagXT1l7BgG8Rv3vJh5kp+YqBatXw3abTo8fW4zWwsq2Omq+
   A==;
X-CSE-ConnectionGUID: O61EcscCSXiv/IFdfndeVA==
X-CSE-MsgGUID: oHtZSEhrRBukc4i5HFcZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71374551"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71374551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:08:44 -0800
X-CSE-ConnectionGUID: IO2vGl1gTXOfXny+GEKjRA==
X-CSE-MsgGUID: 3B1w+6DhRrCfktX+F0ycHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210205842"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2026 04:08:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voh7A-00000000ld8-09sg;
	Sat, 07 Feb 2026 12:08:40 +0000
Date: Sat, 07 Feb 2026 20:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 332/332]
 arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size'
 declared with attribute error: Bad argument size for xchg
Message-ID: <202602071923.uG2nqYEL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 9e7cbd4ad9c7a7ba461dbba9185628c006e200cd [332/332] trace_sched_wakeup_backtrace
config: i386-buildonly-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071923.uG2nqYEL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071923.uG2nqYEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071923.uG2nqYEL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'try_to_wake_up':
>> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/core.c:4229:28: note: in expansion of macro 'xchg'
    4229 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^~~~


vim +/__xchg_wrong_size +67 arch/x86/include/asm/cmpxchg.h

e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  37  
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  38  /* 
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  39   * An exchange-type operation, which takes a value and a pointer, and
7f5281ae8a8e7f8 Li Zhong            2013-04-25  40   * returns the old value.
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  41   */
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  42  #define __xchg_op(ptr, arg, op, lock)					\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  43  	({								\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  44  	        __typeof__ (*(ptr)) __ret = (arg);			\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  45  		switch (sizeof(*(ptr))) {				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  46  		case __X86_CASE_B:					\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  47  			asm_inline volatile (lock #op "b %b0, %1"	\
2ca052a3710fac2 Jeremy Fitzhardinge 2012-04-02  48  				      : "+q" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  49  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  50  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  51  		case __X86_CASE_W:					\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  52  			asm_inline volatile (lock #op "w %w0, %1"	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  53  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  54  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  55  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  56  		case __X86_CASE_L:					\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  57  			asm_inline volatile (lock #op "l %0, %1"	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  58  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  59  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  60  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  61  		case __X86_CASE_Q:					\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  62  			asm_inline volatile (lock #op "q %q0, %1"	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  63  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  64  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  65  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  66  		default:						\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30 @67  			__ ## op ## _wrong_size();			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  68  		}							\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  69  		__ret;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  70  	})
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  71  

:::::: The code at line 67 was first introduced by commit
:::::: 31a8394e069e47dc47f4c29e4213aa943342f19f x86: consolidate xchg and xadd macros

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Jeremy Fitzhardinge <jeremy@goop.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
