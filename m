Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7618376BF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891804; cv=none; b=jS8slNeL+qOng/0BAxOTgWw1KvVsaQAlJz5GkCwncwV4JIfz3IdjghxeE6VLQqBiZIdlwNKpRLENERQURx1upXx2CHXnEV9m9n8y9iIEly3qYpXbtXo9zL/yDZeYY/8sAOvspMkFCd5FYB0P9UkWksHYdLTKlFZF0540wzD4ZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891804; c=relaxed/simple;
	bh=RTLXkMOacQujEuMPysI9MCOpZIztPWRNZaAiBzEMNnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hH4P+GllzD0cg7gar9w1535yd7w7+buVQv+kcF9FbHzaVdBQPrYn/8Pt2kmYHN87Khh8Pq6+D5xoff0pPBlC+qW/bJVJsqsDet1puqN2sZFlkF7lCet00vwxHwctjiEz5Mhi3Pme/bpmXSqSRLNUf5oTWcpqNmPHnlbB2s2OeGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3jFFB/I; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3jFFB/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765891803; x=1797427803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTLXkMOacQujEuMPysI9MCOpZIztPWRNZaAiBzEMNnA=;
  b=b3jFFB/ISVZSoE4WoL5p4tPlD47u4BPmXqdwdmRYwgsbMROpYM9CfmMm
   zP3qg11vQtT8wyA2guhhOaZLkx/DCTDaL7Bep8Cgm4lwdjasdiMYQCcmi
   ij1agg4XyztKzTrIX6dteZOQQT8DESIqFFE1tYcfRXBkCUInIQKK8uLH4
   cBmDRVLysXLWaaVciUqy/se8xkhmDlZNhBUHbal1gm26ei+DzfqnRhnjy
   FAyatx2B9dgS2Sn1AqCDrMYIWsiMct81sc2DEmlueZF+9acQb/PJYUHKk
   CxDX62MzbwttviY4K0mnwdhtNN2t+V7QofL1WbvqdxNzBmzNnM5iqZe4L
   A==;
X-CSE-ConnectionGUID: HxnO+7rvQ+mpO5k+iwrAFw==
X-CSE-MsgGUID: 7UB84GIlRQSPgE5AbMEQUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67964600"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67964600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:30:00 -0800
X-CSE-ConnectionGUID: 3Q2A8k7dTlelTke95HynMA==
X-CSE-MsgGUID: CjfKCsFPQYmqVJLeQDxftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198829828"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 05:29:58 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVV7k-000000003EW-0sjU;
	Tue, 16 Dec 2025 13:29:56 +0000
Date: Tue, 16 Dec 2025 21:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1215 1/1] arch/loongarch/include/asm/pgalloc.h:24:56:
 error: passing argument 1 of 'page_address' from incompatible pointer type
Message-ID: <202512162148.C86VDB4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1215
head:   f6b3ada105829eaafc93899aabaee60344844f57
commit: f6b3ada105829eaafc93899aabaee60344844f57 [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: loongarch-randconfig-r112-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162148.C86VDB4s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162148.C86VDB4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162148.C86VDB4s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/loongarch/kernel/asm-offsets.c:11:
   arch/loongarch/include/asm/pgalloc.h: In function 'pmd_populate':
>> arch/loongarch/include/asm/pgalloc.h:24:56: error: passing argument 1 of 'page_address' from incompatible pointer type [-Werror=incompatible-pointer-types]
      24 |         set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
         |                                                        ^~~
         |                                                        |
         |                                                        pgtable_t {aka struct ptdesc *}
   arch/loongarch/include/asm/pgtable.h:192:37: note: in definition of macro '__pmd'
     192 | #define __pmd(x)        ((pmd_t) { (x) })
         |                                     ^
   include/linux/mm.h:2493:53: note: expected 'const struct page *' but argument is of type 'pgtable_t' {aka 'struct ptdesc *'}
    2493 | static inline void *page_address(const struct page *page)
         |                                  ~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +/page_address +24 arch/loongarch/include/asm/pgalloc.h

09cfefb7fa70c3 Huacai Chen 2022-05-31  21  
09cfefb7fa70c3 Huacai Chen 2022-05-31  22  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
09cfefb7fa70c3 Huacai Chen 2022-05-31  23  {
09cfefb7fa70c3 Huacai Chen 2022-05-31 @24  	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
09cfefb7fa70c3 Huacai Chen 2022-05-31  25  }
09cfefb7fa70c3 Huacai Chen 2022-05-31  26  

:::::: The code at line 24 was first introduced by commit
:::::: 09cfefb7fa70c3af011b0db0a513fd80b2f18abc LoongArch: Add memory management

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
