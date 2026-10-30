Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387151;
	b=FYqFwf0EAeuiV5+f4726cD1arICEiJ5JObq/cEH2+9l8Cmu2lx57D7LVTJZXJmk1iHum
	 yrBLWUlMB+qLUaLQgckBj7zpZKOlMC3NOfCHI8WdA5BmO91Xh0XxiO9vneO5MZ6oCnHTb
	 FReD6a1FH3TYlfVaRYF6escZ+QonHnKqspTLFgIRURrqr0mPDwXbkSmwCIfgrqx4OG/iV
	 Vu4I+t2V37Xq2MzDfnxgAAOa8aw8XPWVH7fwpjewXy/jAUvNllc++f01OfIIW6Hd+UN4n
	 b4extPGOtvaxxSml4InsipncJU5VHy8aKMVjDJSTO9Og310J6HO7/tCErsuFFMdd0sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jRVPRToFohGmp2gvrGQqXSmysypw+7luNhb6ec4Kr3I=;
	b=tT96SPZO9mON5K3S0mBHI0h3wjgg9MxIdvNKs5sVYqsPS3UI2anupYdJYLYw73eX7FDL
	 KDoi0O8JS9LEAdv5Obriekxscn7j11iF/+gGezApN+M7MMG2OFYyG0kVe9lVjODDGDLUY
	 8llkSGmGos1NHUnoZcZJyiW1kFu1n/s+wfgqAV54Y89Jmxl8ut2dDk5UGGVrlMzCWdC2i
	 peUmVWidnMaG5VKLYCduiV+m1I33vA/5M/q5pmhIqX8wi4WjpcBo7S08fDuelc9ZQeYkA
	 zzn9IRdXSBZCJb0guUwcGafZpJK/Lx6qGbDczTg3ZKFGbpBzSKXIuDmAe4sa/OiJr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hngpnWH9;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A13606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 19:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A13606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hngpnWH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793387149; x=1824923149;
  h=date:from:to:cc:subject:message-id;
  bh=WN0KH6t3al7lkK1tBKXxqo0Juq1DUlVcQ//9SbTcIuQ=;
  b=hngpnWH9/VWr0gMpMWCdtNri3GB4qd8Ae3xoOILqJEEFgvpovWL+JvI3
   UiBg7620kbey6dCj//uXbooZwD+qU9iveMTRSbWlqacRKAXK09fj59jwQ
   WOFTbMXAktsBbpGK2TQVIEWGoGDELhG03L30UbXUdeQOJFZ1hpFqinFF/
   AuOmDC5TcrqyIFLHdTRSw+GG5N7PoQTnn3d6tpvBeCRJve1F0PH+gwXm3
   h+TFFBRjTH+GPaL1kSPGNTiJAQ8rEI0sZtpHJ1NfasFdLuJO095pzcGee
   3Vi4lwoxU6EmtCh+EqZWu6nbNkJidwm2abjdxUQIHmEWrhsX2ivXKY1TG
   w==;
X-CSE-ConnectionGUID: G7r0trlYQvWx/RdtWtyDyw==
X-CSE-MsgGUID: InVCnvWVQQiFNiJC4cHriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2175378"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2175378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 12:05:48 -0700
X-CSE-ConnectionGUID: 75ERA46xTWaNhdC8izCqdw==
X-CSE-MsgGUID: ugU+6qEaREi1cbl3e39xPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5619996"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2026 12:05:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMrv6-00000000c8C-0LXu;
	Fri, 30 Oct 2026 19:05:44 +0000
Date: Sat, 31 Oct 2026 03:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-i_lock-contention-LOCALIO
 254/296] include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid
 use of void expression
Message-ID: <202610310212.oTPeBwIB-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310212.oTPeBwIB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310212.oTPeBwIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310212.oTPeBwIB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid use of void expression
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~
--
   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from flexfilelayout.c:10:
   flexfilelayout.c: In function 'nfs4_ff_layoutstat_start_io':
>> include/linux/atomic/atomic-arch-fallback.h:259:14: error: invalid use of void expression
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4918:9: note: in expansion of macro 'raw_try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~
   flexfilelayout.c:760:16: note: in expansion of macro 'try_cmpxchg64'
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^~~~~~~~~~~~~


vim +259 include/linux/atomic/atomic-arch-fallback.h

29f006fdefe6f88 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-08-29  249  
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  250  #if defined(arch_try_cmpxchg64)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  251  #define raw_try_cmpxchg64 arch_try_cmpxchg64
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  252  #elif defined(arch_try_cmpxchg64_relaxed)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  253  #define raw_try_cmpxchg64(...) \
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  254  	__atomic_op_fence(arch_try_cmpxchg64, __VA_ARGS__)
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  255  #else
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  256  #define raw_try_cmpxchg64(_ptr, _oldp, _new) \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  257  ({ \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  258  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @259  	___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  260  	if (unlikely(___r != ___o)) \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  261  		*___op = ___r; \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  262  	likely(___r == ___o); \
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  263  })
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  264  #endif
0aa7be05d83cc58 include/linux/atomic/atomic-arch-fallback.h Uros Bizjak    2022-05-15  265  

:::::: The code at line 259 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
