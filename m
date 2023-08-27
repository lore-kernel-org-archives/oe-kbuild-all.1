Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E117E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693132015; x=1724668015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STfLKTBdCd/pQH0G5xo57BUfNJU8mODnwHNBt8U1IBI=;
  b=fd5eiJn4H+M5FeXI1gUWLKmx4hVaNyy9InSOuaHtjHWCjZbuhuDSYLkP
   aGxgTprM4HJL6vwOP7o8XtOxVb/iooOOsTeqSVu3QcTlIUk4tOPn8VG6p
   H3Icibp2kn0ljb6LHz5htBUXHcb+DZrgFYea60XfFDpM3HLsKJDSzqRzx
   gs5qFLbdtMgB5EAXagH6g6IoBwGA2F0f7/kRmHM1roeCLKMj9Q77B6Y79
   GtnnTsHNPjxhrvOxifCEhCux4g5s1t1USVnnBtPvKXU5keQ8blZFHw4Sr
   7wys/XNm5hJ14ZR/KDRp6NJSxQ7GzBzQkVYEjO2bjZEN2QCHJ7ZGZdgNv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372334427"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372334427"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="714824093"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714824093"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 03:26:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCyn-0005gD-0V;
	Sun, 27 Aug 2023 10:26:49 +0000
Date: Sun, 27 Aug 2023 18:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 1/2] getcpu.c:(.text+0x0): multiple definition of
 `bitmap_remap';
 arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x0): first
 defined here
Message-ID: <202308271810.ycTntDLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi ynorov,

First bad commit (maybe != root cause):

tree:   https://github.com/norov/linux aass
head:   ad585573c81bc132c3f64aae4eef20d68484abfb
commit: 09c5536da36c57d74f151b53a4b810a46fc63948 [1/2] fixq
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20230827/202308271810.ycTntDLv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271810.ycTntDLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271810.ycTntDLv-lkp@intel.com/

Note: the norov/aass HEAD ad585573c81bc132c3f64aae4eef20d68484abfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/s390/kernel/asm-offsets.c:11:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/include/asm/syscall.h:13,
                    from arch/s390/include/asm/vdso/gettimeofday.h:9,
                    from include/vdso/datapage.h:137,
                    from arch/s390/kernel/vdso64/vdso.h:5,
                    from arch/s390/kernel/vdso64/getcpu.c:7:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/s390/include/asm/syscall.h:13,
                    from arch/s390/include/asm/vdso/gettimeofday.h:9,
                    from include/vdso/datapage.h:137,
                    from arch/s390/kernel/vdso64/../../../../lib/vdso/gettimeofday.c:5,
                    from arch/s390/kernel/vdso64/vdso64_generic.c:2:
   include/linux/bitmap.h:720:6: warning: no previous prototype for 'bitmap_remap' [-Wmissing-prototypes]
     720 | void bitmap_remap(unsigned long *dst, const unsigned long *src,
         |      ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_remap':
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:724:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     724 |                 if (*src & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:725:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     725 |                     *old & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:726:57: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     726 |                     *new & BITMAP_LAST_WORD_MASK(nbits) == 0 ||
         |                                                         ^
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   include/linux/bitmap.h: At top level:
   include/linux/bitmap.h:747:5: warning: no previous prototype for 'bitmap_bitremap' [-Wmissing-prototypes]
     747 | int bitmap_bitremap(int oldbit,
         |     ^~~~~~~~~~~~~~~
   s390-linux-ld: arch/s390/kernel/vdso64/getcpu.o: in function `bitmap_remap':
>> getcpu.c:(.text+0x0): multiple definition of `bitmap_remap'; arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x0): first defined here
   s390-linux-ld: arch/s390/kernel/vdso64/getcpu.o: in function `bitmap_bitremap':
>> getcpu.c:(.text+0x28): multiple definition of `bitmap_bitremap'; arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x28): first defined here
   make[3]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:160: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
