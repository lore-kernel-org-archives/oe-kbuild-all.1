Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F151859
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 04:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717304201; cv=none; b=NGucTuisyE2lGc7yywfkCou5k9dm7KPRSHEJ0+7fXuHQZ4Q24Fx+jdb13x1NSzBnFK42hGDDjJl0yS2Dd+iHwhJutP6BWpRND0l0wYTWO0LF/IcZEzsn9MFMNXO8twfdHuHDB1akCh/65lxzjF2am0TzrZG0dhpcWUk9EyHTRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717304201; c=relaxed/simple;
	bh=BitTYzbRQZyRVwiJ40x0sOa8LTZSumHsgou4xa6gD7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFwCYw+4rkPGXwyHMX0pkxTGXJeFmNO3GllDvLfZ8ntf7uGprsqkKBA5k1Gdv8DCufEnCmV4+fgjmpETvPokyYHkNhS46LepuTOQ/uf4SuHSeYtvnhRhMH0ehzdrVB8Vqc8Acyl2zDhsz+vdcwpODCsFTAhdagV5rUYI2rtLBkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgE4ih6Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgE4ih6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717304199; x=1748840199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BitTYzbRQZyRVwiJ40x0sOa8LTZSumHsgou4xa6gD7o=;
  b=mgE4ih6QsR9aXz3wy+4kaWsx5uIiFTpmKtDvamsK/0GswpM/Cf6VqKkV
   BpPHHbIIkX2ESeSOemoi1uNmDINz6FZUa7rTB19ZX53IQWLOFCDhcwz0b
   X03w6WlTrbA4RAGkJJkks15WRt03yfG6veW6ang6BUETdOzvDJybpAbDD
   Q7OWkBnsNoZ7H1cvLbL+pHJeBkxbP75Pe9z5dVPlVtnkv7lJeW7LE+FNd
   xArplqCuvh0PXpaRznMGECkwMvzX6cIoV2WXHWAM+EGLOGEWiQGmcAojO
   YwpJF5J450rfEulLwEFHX/OUWlFW1mQ+Qzz62UcjwkoLpcYy6Cyyr1IVN
   w==;
X-CSE-ConnectionGUID: puhnCHXlRei+kmuPRh/3fw==
X-CSE-MsgGUID: am80HMbBQLW1aNSLP5V+Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24445712"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="24445712"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 21:56:38 -0700
X-CSE-ConnectionGUID: /21ttMJuQy++RffejsDasQ==
X-CSE-MsgGUID: i3PGojbQTsOXRCtnNXlqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="37183856"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 21:56:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDdGk-000Ji7-2c;
	Sun, 02 Jun 2024 04:56:34 +0000
Date: Sun, 2 Jun 2024 12:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2654/3060] arch/arm/include/asm/cmpxchg.h:167:12:
 error: call to undeclared function 'cmpxchg_emu_u8'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202406021249.imvU1Clu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0e1980c40b6edfa68b6acf926bab22448a6e40c9
commit: 6ba3d5014d24a46ed329fc567e554c218eb62cfa [2654/3060] ARM: Emulate one-byte cmpxchg
config: arm-randconfig-r051-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021249.imvU1Clu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021249.imvU1Clu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406021249.imvU1Clu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:63:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:167:12: error: call to undeclared function 'cmpxchg_emu_u8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |                 oldval = cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
         |                          ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u8 +167 arch/arm/include/asm/cmpxchg.h

   152	
   153	/*
   154	 * cmpxchg only support 32-bits operands on ARMv6.
   155	 */
   156	
   157	static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
   158					      unsigned long new, int size)
   159	{
   160		unsigned long oldval, res;
   161	
   162		prefetchw((const void *)ptr);
   163	
   164		switch (size) {
   165	#ifdef CONFIG_CPU_V6	/* min ARCH >= ARMv6K */
   166		case 1:
 > 167			oldval = cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
   168			break;
   169	#else
   170		case 1:
   171			do {
   172				asm volatile("@ __cmpxchg1\n"
   173				"	ldrexb	%1, [%2]\n"
   174				"	mov	%0, #0\n"
   175				"	teq	%1, %3\n"
   176				"	strexbeq %0, %4, [%2]\n"
   177					: "=&r" (res), "=&r" (oldval)
   178					: "r" (ptr), "Ir" (old), "r" (new)
   179					: "memory", "cc");
   180			} while (res);
   181			break;
   182		case 2:
   183			do {
   184				asm volatile("@ __cmpxchg1\n"
   185				"	ldrexh	%1, [%2]\n"
   186				"	mov	%0, #0\n"
   187				"	teq	%1, %3\n"
   188				"	strexheq %0, %4, [%2]\n"
   189					: "=&r" (res), "=&r" (oldval)
   190					: "r" (ptr), "Ir" (old), "r" (new)
   191					: "memory", "cc");
   192			} while (res);
   193			break;
   194	#endif
   195		case 4:
   196			do {
   197				asm volatile("@ __cmpxchg4\n"
   198				"	ldrex	%1, [%2]\n"
   199				"	mov	%0, #0\n"
   200				"	teq	%1, %3\n"
   201				"	strexeq %0, %4, [%2]\n"
   202					: "=&r" (res), "=&r" (oldval)
   203					: "r" (ptr), "Ir" (old), "r" (new)
   204					: "memory", "cc");
   205			} while (res);
   206			break;
   207		default:
   208			__bad_cmpxchg(ptr, size);
   209			oldval = 0;
   210		}
   211	
   212		return oldval;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
