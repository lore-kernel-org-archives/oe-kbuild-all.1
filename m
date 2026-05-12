Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72935F5E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600915; cv=none; b=XufJK39kV5LB5+2vwd0RpByAPL+0oQhhDRA4D4sXmO4xtg3cw0UZjFRX18Y1Lhof8/sKzB0J3H+0K7SnPwiA+o5DUtrxLDkTJ2stV42KCx+/BpBfiEJP8+F/fNgv5tVUn/Szr92EV8HKiBVS2G5rXEnsxI7sjZzj4tts6lBjMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600915; c=relaxed/simple;
	bh=2A9fizeXBkjHEG6y+2zpaIaVpIvwAm0gJ7jCM15m4Ys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pWHQH5rPscXopXariOPQimUyEH0qtsdDID6FYNtp549PcZ/aMqzx/HrvQKvNnuHMufk1AGc4IVJ/vHAtALwOJTy7pD7YNwgAXytOnQkbTimJOYdamt0Mjb9tGzeFCeWVT8F9kH9VOeOGNmevDI/rn4vEgk9nMiA1CuD4s8VDM18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAFIrhSN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAFIrhSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778600914; x=1810136914;
  h=date:from:to:cc:subject:message-id;
  bh=2A9fizeXBkjHEG6y+2zpaIaVpIvwAm0gJ7jCM15m4Ys=;
  b=JAFIrhSNi5hCNaL/JipThkts6CSKaByf9XN2UkjIGgOVc4aEVPZQwake
   xkxyvXs2P/1ilmAh4Ckt4cHevfIMJx4COI/ZvIFwGeGAFw7AEufH+3Fqv
   UFUOTAH0OiygVzp6CiGm2f1X2KD4mgKrm8kHNixW6LU+iNdjO7BdL0BHu
   tvq2IF4/AfMEvNsQWzd0XJVNTeszovFPLsfoNM/l+y0HqPygNPJgLtCko
   8CWODV+iAiKQbtrecM+5V/KIduLleeztnK4dRvQnuHVYoaU7gnYnWJRj+
   tb6orc4+xr2yPXIShYAgorc3V1hHqnvZBNe/LGdy1EhT8zTyJeBiyRSAt
   w==;
X-CSE-ConnectionGUID: PbOvHVQ0RkKuiZW8TpHjYA==
X-CSE-MsgGUID: J6McIJAZR8W0B/PW+yG0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79228253"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79228253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:48:34 -0700
X-CSE-ConnectionGUID: Jt6B0MTVQeypqqA9ZDJuqQ==
X-CSE-MsgGUID: MoNEDcxoSEaWGLsQQTNx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237731410"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2026 08:48:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMpLR-000000002L1-3JA6;
	Tue, 12 May 2026 15:48:29 +0000
Date: Tue, 12 May 2026 23:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-08 8/8]
 include/linux/local_lock_internal.h:41:9: error: implicit declaration of
 function 'lock_map_acquire_try'; did you mean 'lock_map_acquire_tryread'?
Message-ID: <202605122341.tPYVhghL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-08
head:   d9fe799ca2218c0bfd4fe20d538a102be53c9ca2
commit: dcec04b830ed18003986b243ff4e48dd34268713 [8/8] UPSTREAM: locking/local_lock: Introduce localtry_lock_t
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605122341.tPYVhghL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122341.tPYVhghL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122341.tPYVhghL-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/local_lock.h:5,
                    from include/linux/mmzone.h:24,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/local_lock_internal.h: In function 'local_trylock_acquire':
>> include/linux/local_lock_internal.h:41:9: error: implicit declaration of function 'lock_map_acquire_try'; did you mean 'lock_map_acquire_tryread'? [-Wimplicit-function-declaration]
      41 |         lock_map_acquire_try(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         lock_map_acquire_tryread
   make[2]: *** [scripts/Makefile.build:118: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1369: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:256: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +41 include/linux/local_lock_internal.h

    38	
    39	static inline void local_trylock_acquire(local_lock_t *l)
    40	{
  > 41		lock_map_acquire_try(&l->dep_map);
    42		DEBUG_LOCKS_WARN_ON(l->owner);
    43		l->owner = current;
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
