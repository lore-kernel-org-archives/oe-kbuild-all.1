Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7B188734
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742062831; cv=none; b=D6Y+uau3x6twxBDGbFQy0yowVftrj4/AGKThazN6H8EaZiSGNVbP9/BOGxFDvOXCGvzx9g8lWVW8xoS7LgLU6a78nutmyuGJNxLFCFDWyg01bXKuZcKzUjHyM8ss8gz60uork3tHbS5nykEbvAo+swpdqx6djKqsAJbmAlrOPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742062831; c=relaxed/simple;
	bh=Ca7Y8gyZEPbvcJ+6A25UmTXJbtCB4n2jZPYRkYYQ7aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QjOdhwU7itIDEWa25h8+mvSZTBKtUKNYJbG0LMDTF2SJHJ4g2vPivG+x+GtLJSd9GlN1k1eWW5rXWK6/dNAnbu0vNeth/pU8oeu9jtf4J3Xk/XZsd0PUIODhSfmjoj5/GwE1AFfj9x9eLriPojXXvhNsUrOq0fD7OCPPNHMq1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM00uw+m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM00uw+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742062830; x=1773598830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ca7Y8gyZEPbvcJ+6A25UmTXJbtCB4n2jZPYRkYYQ7aM=;
  b=VM00uw+mxeHHsB7P53TTD02OSpQS5JffDu2lajDcumu4sBeSrOKaZpyv
   rxrBbbE/u0dnWnN3+CamHVyVWXHNz+WmSh7MFBfI21X5NCAzYpMa+ONjh
   YKeBe1UdD4YrvJAW1W1UxdYyUaZgNSK6PmEWOajC2FzPNnnQQ1xay3mQR
   FiA6XNQA3tz9lUz0iHxiLY7xVSdl7dnAbdjFROwzXcvWhx25WBhlwn/dJ
   mOqQNG7lyxODu7I7TCIOicYJloiJ9bfsgpKkrEmLJLZE9CRY0wlyfG6LB
   anVUdBcg4QHoPpNwKpNMmHs/m4YrxkwQ4TLmVY/JDMvJaTIg/GQK5zYV+
   A==;
X-CSE-ConnectionGUID: 6nVSUf5lTvK3AzNSEXZsjw==
X-CSE-MsgGUID: BUlY+iMsTpivVw2q3cUGcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53858520"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="53858520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 11:20:29 -0700
X-CSE-ConnectionGUID: YQ5sLS0ORGqEroJQZoUyvQ==
X-CSE-MsgGUID: e8pawI6KQaCoOm8fZJRAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122508135"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2025 11:20:28 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttW7V-000BYt-15;
	Sat, 15 Mar 2025 18:20:25 +0000
Date: Sun, 16 Mar 2025 02:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:latency_debug 82/85]
 arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size'
 declared with attribute error: Bad argument size for xchg
Message-ID: <202503160231.KFXwAEKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs latency_debug
head:   cca62acccd9672466b5ac130434dff2445c0a082
commit: 160f8bf55396c94122b638bc2bbf4859b5e1bad8 [82/85] trace_sched_wakeup_backtrace
config: i386-randconfig-011-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160231.KFXwAEKp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160231.KFXwAEKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160231.KFXwAEKp-lkp@intel.com/

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
                    from include/linux/fs.h:6,
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
   kernel/sched/core.c:4226:28: note: in expansion of macro 'xchg'
    4226 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
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
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  47  			asm volatile (lock #op "b %b0, %1\n"		\
2ca052a3710fac2 Jeremy Fitzhardinge 2012-04-02  48  				      : "+q" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  49  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  50  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  51  		case __X86_CASE_W:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  52  			asm volatile (lock #op "w %w0, %1\n"		\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  53  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  54  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  55  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  56  		case __X86_CASE_L:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  57  			asm volatile (lock #op "l %0, %1\n"		\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  58  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  59  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  60  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  61  		case __X86_CASE_Q:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  62  			asm volatile (lock #op "q %q0, %1\n"		\
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
