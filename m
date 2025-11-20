Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4C302CB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643795; cv=none; b=MntZXYLfKJqEpfMPvRKcFCFawlgYx8gxcHU9t3UlsX/UoyvjDQkzqja6tV7v6pXMgS3kxT/CPXSwUuILMK4NRIAeoA7rkIW+/hAs6fgmHmP97bn9I5oGGX/pktUBILVeqIjZRe7EzNhGbO7EfBiYjbs39xH+aKLoHsVbNu7kraQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643795; c=relaxed/simple;
	bh=MwODkwVMyoxd8zG0ScqwDEayJCh7vQmwmAB7Ik5uCes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVChEnN3t82ncTquQo2a/FixJOgOQGPD/koEIwAjIwo1AMF7/bHLKz8oi3qWzbPd0YgPb5cPgdsivV+Q2gNbteK7Fqrhcn8sF6N+DM8TgnFs7YmJoPF712Slhkb1mvg8qM8WCdfETjduOw6dgBMMlgOCW0PMNMn+7Crk2VbWK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIdq/8Ak; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIdq/8Ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763643794; x=1795179794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwODkwVMyoxd8zG0ScqwDEayJCh7vQmwmAB7Ik5uCes=;
  b=kIdq/8AkIIfHyrO1Qz8po3PMcAywebP1IVVdouTeBsxB9MPtLzQjDe/t
   AVFDsolD7/xhVbdElA1tzgZHMNkeicX2nAagv+sw/Uaplv8VR0yBw+1LV
   5ub9aHt2+0JXSXFalmusPE3sjYpWhDw6KJWZzfkNks/Oim8LSSymH6Qyh
   to9qias1NAhPk1yNpFJX9bOiSyPbUAd0eJN/4Dnjz8IO9PLYCKd98Ga9n
   O/GCZo7YEE7ALLkZxE4/0ucn0DatDbPmtjrXi2c6uTGv7dunXirMGVIlb
   TYk/kjM59hILN2kMp/FR1/uO7clPUuT961LnBmq2GqjPG+IJp37aFhHBt
   g==;
X-CSE-ConnectionGUID: k3mVQr3NQ3yHeA9FKgesyQ==
X-CSE-MsgGUID: tqqbiyu0T5aAbZvoJ1DSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69579294"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69579294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:03:13 -0800
X-CSE-ConnectionGUID: gdBgaFjET/+OuR1fE5wDGQ==
X-CSE-MsgGUID: bLcUQWVOThmH1HNYCDT36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222007904"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 05:03:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM4JY-00041J-28;
	Thu, 20 Nov 2025 13:03:08 +0000
Date: Thu, 20 Nov 2025 21:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hugetlb_unshare 7/8] mm/rmap.c:1877:38: error:
 'range' undeclared
Message-ID: <202511202035.upT8IyD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux hugetlb_unshare
head:   f73f34e9b553d94cf3030e2674fbf2dab619181a
commit: b9189040ca4a05c8025ecff5b70a7895018d34e5 [7/8] mm/rmap: factor out PMD table unsharing into try_to_unshare_hugetlb_pmd_table()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511202035.upT8IyD8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202035.upT8IyD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202035.upT8IyD8-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'try_to_unshare_hugetlb_pmd_table':
   mm/rmap.c:1873:38: error: 'tlb' undeclared (first use in this function)
    1873 |         unshared = huge_pmd_unshare(&tlb, vma, address);
         |                                      ^~~
   mm/rmap.c:1873:38: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:36,
                    from mm/rmap.c:55:
>> mm/rmap.c:1877:38: error: 'range' undeclared (first use in this function)
    1877 |                 flush_tlb_range(vma, range.start, range.end);
         |                                      ^~~~~
   arch/x86/include/asm/tlbflush.h:311:42: note: in definition of macro 'flush_tlb_range'
     311 |         flush_tlb_mm_range((vma)->vm_mm, start, end,                    \
         |                                          ^~~~~


vim +/range +1877 mm/rmap.c

  1848	
  1849	static bool try_to_unshare_hugetlb_pmd_table(struct vm_area_struct *vma,
  1850			unsigned long address, enum ttu_flags flags,
  1851			struct page_vma_mapped_walk *pvmw, bool *ret)
  1852	{
  1853		bool unshared;
  1854	
  1855		if (!IS_ENABLED(CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING))
  1856			return false;
  1857	
  1858		/*
  1859		* To call huge_pmd_unshare, i_mmap_rwsem must be held in write mode.
  1860		* Callers needs to explicitly do this outside rmap routines.
  1861		*
  1862		* We also must hold hugetlb vma_lock in write mode. Lock order dictates
  1863		* acquiring vma_lock BEFORE i_mmap_rwsem. We can only try lock here
  1864		* and fail if unsuccessful.
  1865		*/
  1866		VM_WARN_ON_ONCE(!(flags & TTU_RMAP_LOCKED));
  1867		if (!hugetlb_vma_trylock_write(vma)) {
  1868			page_vma_mapped_walk_done(pvmw);
  1869			*ret = false;
  1870			return true;
  1871		}
  1872	
> 1873		unshared = huge_pmd_unshare(&tlb, vma, address);
  1874		hugetlb_vma_unlock_write(vma);
  1875	
  1876		if (unshared) {
> 1877			flush_tlb_range(vma, range.start, range.end);
  1878			/*
  1879			* The PMD table was unmapped, consequently unmapping the
  1880			* folio.
  1881			*/
  1882			page_vma_mapped_walk_done(pvmw);
  1883		}
  1884		return unshared;
  1885	}
  1886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
