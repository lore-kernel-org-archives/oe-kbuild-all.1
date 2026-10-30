Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397007;
	b=Uqbf3Z0zb1wp7kiAkUvq7lFLZyf3Y5vMiMSK2Xa7oSjamIDhPO1jtaMgKFmq2r6ISc3+
	 nfIArRkT6OQXCe0FCOYGKUSU2bpreORsAY0SUwPDkJ4nWWTdlgvmDt1YzFUXrFac8x5x9
	 CFvQxQkKfiZt/msbx7bZvy5cv6y0EpFbu+atAsiRu4c1hP4fjlwmW8ucRxJDS2xqw2iZJ
	 35aElyB4dqmlSUAIiZMTM4Dqb0q6x2NojgDcHRFj2bRO8Wu9umFBrAO+xDqE7cOGGXpLO
	 Fhn4j19UcT4VMPCSTVhrklGUK1MdVzeiqyOLw/1O3aKaqhnW+eQhfMDl8xWddI1ntAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397007;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5SCE3QSYCmAn7PDO660y7kct1JV2gDNSfok0S2yMylU=;
	b=uW1EOQvXfWS/zXOe7w5uPhOtvvccV1w3TLLkDvwTn64Qqmwte/ks/yAYbY2I786fT5hd
	 1SPTLdFAJHJuXPY7kNUuIuPaAckXcD0xpCmm7+ShBC5C+NqUC/Ym/SnGz6bEhcAZ36odG
	 sIGkS0PuFEsEJypADv4GP7OyhO6JdbDZlAhI0hB7PagyjMjZUEU/N/q20COyC51ChWVVe
	 pJUBOcp5AYHlJsOXGGr+XifkEQjbPHtI57EDDBiScbYRPjvrvIhMQF52xnbSrphS/3Rmm
	 64cSdjP6EWDkj3YurFZ1GdE9axA7Y7+0fhfoNtoWQmCjf6cn9M9/HGLmxF5ZriOmnWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QCP+ONSX;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F59606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QCP+ONSX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397007; x=1824933007;
  h=date:from:to:cc:subject:message-id;
  bh=R+92+Ww6oo4tPcQMZ1P+ecYzKDMPo3rkTThL9T+AKo4=;
  b=QCP+ONSXBDh6X83GT7vKqWcsnV0LVt8O++EpRUhN6IIcklxAa/3lkCl3
   LrIwdmkSihWNlXdjf1+YmknNo+/yCBWeea/J5fK3WEcQ367H5vH/EvyAe
   3Sa3+tw88Fd5dt2/UTRHn6Y1BO7teFSTl8ZnxUtAKBWRUU01gjiMag7ok
   0pA7HoMEw6318zmXZOOfY/zdL28xgxP6V5CAgsXogiRXzFEj+9lPCIZKN
   voXXtasiz70btuJNmYBpEnpnh90h7yWeN1V232prkBU88cu39c1PKfcMQ
   jr78ufRXxLPACX8CbmNeKGisE2svrO8OWDIunWXwTAC4sqa2SpZsos1xG
   g==;
X-CSE-ConnectionGUID: 80j/dB4lTqiS8sFMl5G9IQ==
X-CSE-MsgGUID: Zr4eVnHBTPK2bB2GSROZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174833"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:06 -0700
X-CSE-ConnectionGUID: 7HZVD60SS3iBlg9+FXn5CQ==
X-CSE-MsgGUID: n/kRw4rLTbSCEOsuc/L5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5618469"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2026 14:50:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuU6-00000000cGy-0ERY;
	Fri, 30 Oct 2026 21:50:02 +0000
Date: Sat, 31 Oct 2026 05:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-i_lock-contention-LOCALIO
 254/296] arch/mips/include/asm/cmpxchg.h:315:25: error: call to
 '__cmpxchg64_unsupported' declared with attribute error: cmpxchg64 not
 available; cpu_has_64bits may be false
Message-ID: <202610310533.pGzKIE6L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfs-testing-canary-reduce-i_lock-contention-LOCALIO
head:   93c8d10ac1fcb3644730ae74700a965f34304bdf
commit: 31c1686e8f4441749d31204c83efc843f02d6af6 [254/296] NFSv4/flexfiles: move layoutstats accounting to a per-stripe lock
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310533.pGzKIE6L-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310533.pGzKIE6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310533.pGzKIE6L-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from arch/mips/include/asm/processor.h:14,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> arch/mips/include/asm/cmpxchg.h:315:25: error: call to '__cmpxchg64_unsupported' declared with attribute error: cmpxchg64 not available; cpu_has_64bits may be false
     315 |                 __res = __cmpxchg64_unsupported();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:98:23: note: in expansion of macro 'arch_cmpxchg64'
      98 | #define raw_cmpxchg64 arch_cmpxchg64
         |                       ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:259:16: note: in expansion of macro 'raw_cmpxchg64'
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~
--
   In file included from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from arch/mips/include/asm/processor.h:14,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from flexfilelayout.c:10:
   flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> arch/mips/include/asm/cmpxchg.h:315:25: error: call to '__cmpxchg64_unsupported' declared with attribute error: cmpxchg64 not available; cpu_has_64bits may be false
     315 |                 __res = __cmpxchg64_unsupported();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:98:23: note: in expansion of macro 'arch_cmpxchg64'
      98 | #define raw_cmpxchg64 arch_cmpxchg64
         |                       ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:259:16: note: in expansion of macro 'raw_cmpxchg64'
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~


vim +/__cmpxchg64_unsupported +315 arch/mips/include/asm/cmpxchg.h

c7e2d71dda7ac4 Paul Burton    2019-02-06  298  
c7b5fd6faa1dc6 Mark Rutland   2021-05-25  299  #  define arch_cmpxchg64(ptr, o, n) ({					\
c7e2d71dda7ac4 Paul Burton    2019-02-06  300  	unsigned long long __old = (__typeof__(*(ptr)))(o);		\
c7e2d71dda7ac4 Paul Burton    2019-02-06  301  	unsigned long long __new = (__typeof__(*(ptr)))(n);		\
c7e2d71dda7ac4 Paul Burton    2019-02-06  302  	__typeof__(*(ptr)) __res;					\
c7e2d71dda7ac4 Paul Burton    2019-02-06  303  									\
c7e2d71dda7ac4 Paul Burton    2019-02-06  304  	/*								\
c7e2d71dda7ac4 Paul Burton    2019-02-06  305  	 * We can only use cmpxchg64 if we know that the CPU supports	\
c7e2d71dda7ac4 Paul Burton    2019-02-06  306  	 * 64-bits, ie. lld & scd. Our call to __cmpxchg64_unsupported	\
c7e2d71dda7ac4 Paul Burton    2019-02-06  307  	 * will cause a build error unless cpu_has_64bits is a		\
c7e2d71dda7ac4 Paul Burton    2019-02-06  308  	 * compile-time constant 1.					\
c7e2d71dda7ac4 Paul Burton    2019-02-06  309  	 */								\
dfc8d8de855d56 Peter Zijlstra 2019-06-13  310  	if (cpu_has_64bits && kernel_uses_llsc) {			\
dfc8d8de855d56 Peter Zijlstra 2019-06-13  311  		smp_mb__before_llsc();					\
c7e2d71dda7ac4 Paul Burton    2019-02-06  312  		__res = __cmpxchg64((ptr), __old, __new);		\
dfc8d8de855d56 Peter Zijlstra 2019-06-13  313  		smp_llsc_mb();						\
dfc8d8de855d56 Peter Zijlstra 2019-06-13  314  	} else {							\
c7e2d71dda7ac4 Paul Burton    2019-02-06 @315  		__res = __cmpxchg64_unsupported();			\
dfc8d8de855d56 Peter Zijlstra 2019-06-13  316  	}								\
c7e2d71dda7ac4 Paul Burton    2019-02-06  317  									\
c7e2d71dda7ac4 Paul Burton    2019-02-06  318  	__res;								\
c7e2d71dda7ac4 Paul Burton    2019-02-06  319  })
c7e2d71dda7ac4 Paul Burton    2019-02-06  320  

:::::: The code at line 315 was first introduced by commit
:::::: c7e2d71dda7ac4731bae54a25c49cd81fe7b9046 MIPS: Fix set_pte() for Netlogic XLR using cmpxchg64()

:::::: TO: Paul Burton <paul.burton@mips.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
