Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C0E14B978
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837195; cv=none; b=Tl8l0XrUAZz8TxZYorIhKOxXvNR7eTtVPdb3JtwQcah8ISlkvHEUMKzY/fLRsGgX4vzK4ZCTWEkPGe8Uc63caGkNejMVywvCmdZZh23hQ+U+m6glR0bK5gALXu+1OMwesFCjRI6GabiDRMCpsdQTUG5gldNAuM13JTtuooMSVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837195; c=relaxed/simple;
	bh=e0yCRrXieMTaIXnS6p4T5Gxk+lIfG+o9QACXTy+6Gqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7i1kBw3o4oJ/b3inOCimVuwRAvEYoK7bc15qsqIWNtCm3MLtnB7+/pkLiejLMyGDKFINip0kCl+Hin1vOfrTOw3l9xnRz0bQgnhvUSt7RsEWno/6l5eyM1+tDaEpCxbi9IX1C1kTctk6xBmmGUdVhVURNUwfKrslvxFUM7hG2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HASj8pLr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HASj8pLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721837194; x=1753373194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0yCRrXieMTaIXnS6p4T5Gxk+lIfG+o9QACXTy+6Gqc=;
  b=HASj8pLrSZ/WyrchlYG2wVXwdcilZ/b9c7SAl+c//vmAB3JXcBPlk28n
   1gjZ+ZFFz0ZCOk0RjUCLy/hznCWw0AsGhXafoX3bn24QwAeyP3JGSL51u
   arhlRRaLgy6cwiypREAqpwyymE5ceoFvIYAz//pi9AoLOkjTWDCGP2upt
   7L74Z1wldbBbrZG4p+HGM/+zJzuAc9VoHLnCVTPqw3BhG+hEpI1D+0zBJ
   oyfCpx3KOuW2sdzZAE62I1o1M98dd2WyBW7jELyj5Begp4/Ot5eZsCdyU
   4ev0dlS9FTRZQ3xkpCMeYVoyH20tzVWqDpMxGy8ndDiNZAJGtdmpyisYk
   A==;
X-CSE-ConnectionGUID: AX+ouECNQ96LCJT53CGgpA==
X-CSE-MsgGUID: 9NhCwh+iTTaMJ3jmbVaquw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19654157"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19654157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 09:06:32 -0700
X-CSE-ConnectionGUID: qdGd/mSyQLy9K8KKtc30Iw==
X-CSE-MsgGUID: VRB3FcK6QPqFyRo/cT+R4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="56778914"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2024 09:06:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWeVU-000nAM-0Q;
	Wed, 24 Jul 2024 16:06:24 +0000
Date: Thu, 25 Jul 2024 00:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/41]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1372:59: error: passing
 argument 3 of 'hash__pgtable_trans_huge_deposit' from incompatible pointer
 type
Message-ID: <202407250231.VDYZiiJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: 0eb0bad67d339a9f84a2b8a3723eba5297425516 [35/41] mm/pgtable: return ptdesc pointer in pgtable_trans_huge_withdraw
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240725/202407250231.VDYZiiJ3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250231.VDYZiiJ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250231.VDYZiiJ3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/hash.h:17,
                    from arch/powerpc/include/asm/book3s/64/pgtable.h:297,
                    from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:385,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/book3s/64/hash-64k.h:277:53: warning: 'struct ptdesc' declared inside parameter list will not be visible outside of this definition or declaration
     277 |                                              struct ptdesc *ptdesc);
         |                                                     ^~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h: In function 'pgtable_trans_huge_deposit':
   arch/powerpc/include/asm/book3s/64/pgtable.h:1371:68: error: passing argument 3 of 'radix__pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1371 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                                    ^~~~~~~
         |                                                                    |
         |                                                                    pgtable_t {aka pte_t *}
   In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:298:
   arch/powerpc/include/asm/book3s/64/radix.h:294:56: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'pte_t *'}
     294 |                                         struct ptdesc *ptdesc);
         |                                         ~~~~~~~~~~~~~~~^~~~~~
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:59: error: passing argument 3 of 'hash__pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1372 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                           ^~~~~~~
         |                                                           |
         |                                                           pgtable_t {aka pte_t *}
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:61: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'pte_t *'}
     277 |                                              struct ptdesc *ptdesc);
         |                                              ~~~~~~~~~~~~~~~^~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/hash__pgtable_trans_huge_deposit +1372 arch/powerpc/include/asm/book3s/64/pgtable.h

3dfcb315d81e663 Aneesh Kumar K.V 2015-12-01  1355  
75358ea359e7c0d Aneesh Kumar K.V 2020-05-05  1356  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
75358ea359e7c0d Aneesh Kumar K.V 2020-05-05  1357  pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
75358ea359e7c0d Aneesh Kumar K.V 2020-05-05  1358  				   unsigned long addr,
75358ea359e7c0d Aneesh Kumar K.V 2020-05-05  1359  				   pmd_t *pmdp, int full);
75358ea359e7c0d Aneesh Kumar K.V 2020-05-05  1360  
27af67f35631ac4 Aneesh Kumar K.V 2023-07-25  1361  #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
27af67f35631ac4 Aneesh Kumar K.V 2023-07-25  1362  pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
27af67f35631ac4 Aneesh Kumar K.V 2023-07-25  1363  				   unsigned long addr,
27af67f35631ac4 Aneesh Kumar K.V 2023-07-25  1364  				   pud_t *pudp, int full);
27af67f35631ac4 Aneesh Kumar K.V 2023-07-25  1365  
3dfcb315d81e663 Aneesh Kumar K.V 2015-12-01  1366  #define __HAVE_ARCH_PGTABLE_DEPOSIT
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29  1367  static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29  1368  					      pmd_t *pmdp, pgtable_t pgtable)
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29  1369  {
bde3eb6222e4967 Aneesh Kumar K.V 2016-04-29  1370  	if (radix_enabled())
bde3eb6222e4967 Aneesh Kumar K.V 2016-04-29  1371  		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29 @1372  	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29  1373  }
3df33f12be2f6fa Aneesh Kumar K.V 2016-04-29  1374  

:::::: The code at line 1372 was first introduced by commit
:::::: 3df33f12be2f6fa88dff12564ab1d069482e3224 powerpc/mm/thp: Abstraction for THP functions

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
