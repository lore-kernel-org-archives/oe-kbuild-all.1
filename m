Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A6155389
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766695068; cv=none; b=uhFKeMnZH2Bp6vWigQHjuqEVmn7vIUYcRei7J1pkhvATwRD4BmXP/cvMjaxCeueS7MXhprRGTJp3aHwOMx45YDwEpHUbRl19yMXvU3PwXH4Im6/VcYwMfgXWRceCBgCPySFD+NdrjOLbwOXlVcE8wocFHpEPGbRrw00q/FIX0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766695068; c=relaxed/simple;
	bh=RmBYM8OEChIssli8iYKc9tuCQnw7syQ6KRquaEHQAyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MQnqrxg9KctWi53fEtjLgVM2WiL6LkCnsQHtA8jh6MDdL2RkYmutR5mlqvUf0LxDW8rK+AkJ0gGRK3Ba1XTe/uJ2EaHu9qiR9C3WA5zVW5h/EhpUW2VmnUu9qRA/LYqjIbgEVqdeAtuJq+Z2IQWpTnd00ZxBG4/G7Z0KEp4/Px8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFDVIuJd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFDVIuJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766695067; x=1798231067;
  h=date:from:to:cc:subject:message-id;
  bh=RmBYM8OEChIssli8iYKc9tuCQnw7syQ6KRquaEHQAyg=;
  b=DFDVIuJdpyayhYt58x3RxTi0gmk/L59gO9EEpGB0YNVlablj6afr1Nqw
   KJUZCDKbc97CmFtHkiXC/spSaMGpUG65uON4HVnXtPNtVYgTH9Jpv3fjh
   6ft0mj4d8Kmzq5GmLvX47K1J6GRPbjJ5wzoJCK1TpJIgjUUs7Gflqm94s
   6BOTZmzDlPBgmimg5xbvhwJwbmM1jrOhdBTuAkQE49Pd0xpJZYWD1l6fZ
   UhX75Lg07mWSdDRUw0qJcGiMWsWKPz3/mWAF0b4dG9yF9vO7p4Ow/fff9
   ORpPAI0IGB2Q1jfCJjamyjWoIJ8K8ucEplzThIonB/fRlvLckSafGmHjV
   Q==;
X-CSE-ConnectionGUID: eT6EIuQKTWam5sECOGMltA==
X-CSE-MsgGUID: oOvyXyRHQ4ic++2X75Pa4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67478592"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="67478592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 12:37:46 -0800
X-CSE-ConnectionGUID: vKXHIgx1RM+GUreJuZb1Rw==
X-CSE-MsgGUID: m+R8kA96R6ec3l0FAKY27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200287383"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2025 12:37:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYs5W-000000004Rh-16Ex;
	Thu, 25 Dec 2025 20:37:37 +0000
Date: Fri, 26 Dec 2025 04:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 arch/arm64/mm/pfn_range_alloc.c:473:8: error: call to undeclared function
 'pudp_huge_get_and_clear'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512260451.F7TC9nwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 8dabe346dae33600033f2c8bcca5f4cfec8e87fb [13/13] mm/pfn_range_alloc: support update cachable attribue of linear mapping
config: arm64-randconfig-r061-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260451.F7TC9nwx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260451.F7TC9nwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260451.F7TC9nwx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/pfn_range_alloc.c:473:8: error: call to undeclared function 'pudp_huge_get_and_clear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     473 |         pud = pudp_huge_get_and_clear(walk->mm, addr, pudp);
         |               ^
>> arch/arm64/mm/pfn_range_alloc.c:473:6: error: assigning to 'pud_t' from incompatible type 'int'
     473 |         pud = pudp_huge_get_and_clear(walk->mm, addr, pudp);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pfn_range_alloc.c:489:8: error: call to undeclared function 'pmdp_huge_get_and_clear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     489 |         pmd = pmdp_huge_get_and_clear(walk->mm, addr, pmdp);
         |               ^
>> arch/arm64/mm/pfn_range_alloc.c:489:6: error: assigning to 'pmd_t' from incompatible type 'int'
     489 |         pmd = pmdp_huge_get_and_clear(walk->mm, addr, pmdp);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/pudp_huge_get_and_clear +473 arch/arm64/mm/pfn_range_alloc.c

   463	
   464	static int nc_pud_entry(pud_t *pudp, unsigned long addr,
   465					unsigned long next, struct mm_walk *walk)
   466	{
   467		bool set_nc = (bool)walk->private;
   468		pud_t pud;
   469	
   470		if (pud_table(*pudp))
   471			return 0;
   472	
 > 473		pud = pudp_huge_get_and_clear(walk->mm, addr, pudp);
   474		update_entry_nc(&pud_val(pud), set_nc);
   475		set_pud(pudp, pud);
   476	
   477		return 0;
   478	}
   479	
   480	static int nc_pmd_entry(pmd_t *pmdp, unsigned long addr,
   481					unsigned long next, struct mm_walk *walk)
   482	{
   483		bool set_nc = (bool)walk->private;
   484		pmd_t pmd;
   485	
   486		if (pmd_table(*pmdp))
   487			return 0;
   488	
 > 489		pmd = pmdp_huge_get_and_clear(walk->mm, addr, pmdp);
   490		update_entry_nc(&pmd_val(pmd), set_nc);
   491		set_pmd(pmdp, pmd);
   492	
   493		return 0;
   494	}
   495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
