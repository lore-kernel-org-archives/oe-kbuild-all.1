Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B74400
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721584313; cv=none; b=VbstlW1+9envTvJN9Kg+yfgD4gPVzBF6/Uf/sXWk91dze1ZdMYiqgGEWHcWIImgeihSGkPzj8+h4vd3H+biye7Q+EmStDG1umzxW6CyNCh913ipTYUJ98VNxUhkILq6/wWzl5Ri1tEjWm8bY/THrW1W8iU4EczQGB4goIpWDAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721584313; c=relaxed/simple;
	bh=RrRQBBRPFv53A8lypttVt8UklkKNLYSZWaGKoXFMZx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwTA4khb2bQZ7hc/OqMTanHxVl8hv6vOlCy4CigjiqEVSYpM4RBuVC8r9jtMeIZvPw055zlqoVoCMRv2XbDx5bx4UXPiEaZtW3lI3xSt8MeWEOFyVZiBvWr5dFPQwOZdC4jvet1JsuKMZC7gcGi2KCcbkPB6SczGYkgpbeq4vjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcirOkfp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcirOkfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721584312; x=1753120312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrRQBBRPFv53A8lypttVt8UklkKNLYSZWaGKoXFMZx8=;
  b=PcirOkfpq4eWlzecnbT25J1SzgodmoZxlq5A2wSIC6fIz5nNjLyyj93W
   i1v1PPiNJ7cOLfXpc0TRFqteW4EWd3/NZ0/ZO0+65cYnK2oPaPH5P1p2V
   P6hsGBb0MilbZPenbRvQpTGqzXSgsy7Durm38vimPdeE1sMIAAzuAa3ED
   siL8iGrWSQRvT9yg9UpYcpTXXnjfhrVV5yoNtbehjcSW3+M28oylzPm3v
   W5jbNcqE0AKYs7jeUUhV1fe0my2wt7bT5S6S03exfbvAgXQMqp+DoruF2
   WRGtiV9974hXgxkBkfMGcngE7azZ4bG+dncne8U6Nm9nDRJfabVlDvHYB
   g==;
X-CSE-ConnectionGUID: YXmtkmA4RyesCcK0/keZDg==
X-CSE-MsgGUID: qCiMV5JBRvakh051diJvJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18962078"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18962078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 10:51:51 -0700
X-CSE-ConnectionGUID: oNGiuztzSh+7+y9GGb4m5A==
X-CSE-MsgGUID: j60d1CIoS12UNnPP1jciHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="82273659"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jul 2024 10:51:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVaip-000kR8-24;
	Sun, 21 Jul 2024 17:51:47 +0000
Date: Mon, 22 Jul 2024 01:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/43]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1371:68: error: passing
 argument 3 of 'radix__pgtable_trans_huge_deposit' from incompatible pointer
 type
Message-ID: <202407220116.NzJtzeR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: e164d85b0aa7cdfe03777158ca995f093884d420 [35/43] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240722/202407220116.NzJtzeR3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220116.NzJtzeR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220116.NzJtzeR3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
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
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1368:67: warning: 'struct ptdesc' declared inside parameter list will not be visible outside of this definition or declaration
    1368 |                                               pmd_t *pmdp, struct ptdesc *pgtable)
         |                                                                   ^~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h: In function 'pgtable_trans_huge_deposit':
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1371:68: error: passing argument 3 of 'radix__pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1371 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                                    ^~~~~~~
         |                                                                    |
         |                                                                    struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:298:
   arch/powerpc/include/asm/book3s/64/radix.h:294:51: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     294 |                                         pgtable_t pgtable);
         |                                         ~~~~~~~~~~^~~~~~~
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:59: error: passing argument 3 of 'hash__pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1372 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                           ^~~~~~~
         |                                                           |
         |                                                           struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/64/hash.h:17,
                    from arch/powerpc/include/asm/book3s/64/pgtable.h:297:
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:52: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     277 |                                          pgtable_t pgtable);
         |                                          ~~~~~~~~~~^~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/radix__pgtable_trans_huge_deposit +1371 arch/powerpc/include/asm/book3s/64/pgtable.h

3dfcb315d81e66 Aneesh Kumar K.V   2015-12-01  1355  
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1356  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1357  pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1358  				   unsigned long addr,
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1359  				   pmd_t *pmdp, int full);
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1360  
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1361  #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1362  pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1363  				   unsigned long addr,
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1364  				   pud_t *pudp, int full);
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1365  
3dfcb315d81e66 Aneesh Kumar K.V   2015-12-01  1366  #define __HAVE_ARCH_PGTABLE_DEPOSIT
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1367  static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
e164d85b0aa7cd Alex Shi (Tencent  2024-07-19 @1368) 					      pmd_t *pmdp, struct ptdesc *pgtable)
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1369  {
bde3eb6222e496 Aneesh Kumar K.V   2016-04-29  1370  	if (radix_enabled())
bde3eb6222e496 Aneesh Kumar K.V   2016-04-29 @1371  		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29 @1372  	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1373  }
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1374  

:::::: The code at line 1371 was first introduced by commit
:::::: bde3eb6222e49673d2ee9dfdc6ab6e7b6ff69e91 powerpc/mm/radix: Add radix THP callbacks

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
