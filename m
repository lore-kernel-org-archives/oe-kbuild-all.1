Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC63363C6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779337800; cv=none; b=cxG2AyyA47PbE+YjRC/0CKo4c25i9XBgRjzi9p9DH1GvzlAOqU4N7GE189FvkNGftCier0v3y47z+65L+/jj3nLoXr8H0fPL5AtSEtSkcwGnTCyKPVxFqtuMuaFSB7MfoD93aaO2b9bvm5pclFCTSGcuZ/NoKvLQZO0XF9qRXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779337800; c=relaxed/simple;
	bh=5mkefR0iAm97pnzAPJe84fuKX90zVqhVEjoFx47j/Jw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SMxthVPvI030+92aR7AZ//ymamhPiB2ghKFvo1gfc3hitzvhyWsNNZCv+ud8zf511IKfCk+jNsJXYza3RpLC0APSUe1b8oI/22MRAsKsmzq5ChI66swzFdAAKIZqWwWCQcp/dvedsHCmtQR6C+de9zl52xnKHTqVdN49gTlUNVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0A0HN3A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0A0HN3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779337799; x=1810873799;
  h=date:from:to:cc:subject:message-id;
  bh=5mkefR0iAm97pnzAPJe84fuKX90zVqhVEjoFx47j/Jw=;
  b=e0A0HN3AjA5nxQ5Snp03qnzRZPx0Pj35HNzPJHy4X6Ksgp3RYUSURl9L
   4Hu1fLpWv7KpKF+V9iImBoCPbrAd/dRL2pjGyltZF3w1Jdd9AVd/yXllZ
   Xl+COkQ+4wHtEQkuW0QdibdPAeRvHkvLTezUt7NrTlxP18NKDy/kzYAfO
   TicQfJcsAOJtXq4O5i5o/GKiaNnVLN9fXU0RzFcO0LbJPXqHrvq8NypMN
   /iZFOUwIYZSB2N5bfLvu46Hp5Aj0hYil5PYmePwF8U30UEq0ExU5xaefg
   fqDI1jpuYLiOSf04VAK1i6vwvdsP2UvXGYGpOU+cSJsqkRVdh+Yp1sys8
   A==;
X-CSE-ConnectionGUID: kG2G2CSaRRecxpad16fRqA==
X-CSE-MsgGUID: NgJXNFqeTBCgxCs5hB/a7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105712409"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="105712409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 21:29:58 -0700
X-CSE-ConnectionGUID: 8WcebJ5QTbejSzHt5Grv/A==
X-CSE-MsgGUID: MkglR95dQoKpFJ/tpirO2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237808532"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 21:29:57 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPv2S-000000004Oj-2dvn;
	Thu, 21 May 2026 04:29:45 +0000
Date: Thu, 21 May 2026 12:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 629/1130]
 include/asm-generic/rwonce.h:94:2: error: passing argument 1 of '__c_pa'
 makes pointer from integer without a cast
Message-ID: <202605211218.BcyC3ge6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b373aaefd4b367da0c775c257540d05841eb8551 [629/1130] riscv: cheri: Fix arch/riscv/kernel/stacktrace.c
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211218.BcyC3ge6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211218.BcyC3ge6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211218.BcyC3ge6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/riscv/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:407,
                    from include/linux/export.h:5,
                    from arch/riscv/kernel/stacktrace.c:7:
   arch/riscv/kernel/stacktrace.c: In function 'walk_stackframe':
>> include/asm-generic/rwonce.h:94:2: error: passing argument 1 of '__c_pa' makes pointer from integer without a cast [-Wint-conversion]
      94 | ({                                                                              \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |  |
         |  long unsigned int
      95 |         compiletime_assert(sizeof(x) == sizeof(uintptr_t),                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      96 |                 "Unsupported access size for READ_ONCE_NOCHECK_PTR().");        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |         (typeof(x))__read_once_ptr_nocheck(&(x));                               \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      98 | })
         | ~~
   arch/riscv/kernel/stacktrace.c:134:29: note: in expansion of macro 'READ_ONCE_NOCHECK_PTR'
     134 |                 pc = __c_pa(READ_ONCE_NOCHECK_PTR(*ksp++)) - 0x4;
         |                             ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/cmpxchg.h:10,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from include/linux/kallsyms.h:11,
                    from arch/riscv/kernel/stacktrace.c:8:
   include/linux/cheri.h:222:29: note: expected 'const volatile void *' but argument is of type 'long unsigned int'
     222 | __c_pa(const volatile void *ptr)
         |        ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/__c_pa +94 include/asm-generic/rwonce.h

    87	
    88	/*
    89	 * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
    90	 * word from memory atomically but without telling KASAN/KCSAN. This is
    91	 * usually used by unwinding code when walking the stack of a running process.
    92	 */
    93	#define READ_ONCE_NOCHECK_PTR(x)						\
  > 94	({										\
    95		compiletime_assert(sizeof(x) == sizeof(uintptr_t),			\
    96			"Unsupported access size for READ_ONCE_NOCHECK_PTR().");	\
    97		(typeof(x))__read_once_ptr_nocheck(&(x));				\
    98	})
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
