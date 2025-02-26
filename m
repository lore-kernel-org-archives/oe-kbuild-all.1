Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C7139B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 04:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740544797; cv=none; b=BCCnmK3Kre9MgRa5wW71uMo4P8KensXqmH4IH76/vAwFEKDYye0az5GPwziJpY0qKVJxxGixKKpBwcjNrNaJopVL6Eh82MQIUT20bCGdz2wKZUe8Lm4g09YBo6F7PBg7BxwRE4+mn6V+weKBdG3WGHcHOgzA1ZfqA6aRaji6ivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740544797; c=relaxed/simple;
	bh=OM7Am2SL2hGKZ6HRBvcPKib/xri8HqhpI3qgm4Kl22I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVJRVgXhDY3xzB9bArJlc4uSiYyFPp0v5eYdE4/GJ+t+oFm3HRUSNGnWaUMYYxXWxONhjpUzRxvpgaYBTpp5oWVAyetFOBs8nHfDqTphYQpLPlxsNcwDrXbLuvEnMM60FhYXU5D1FYc0eBsZIEgxCZBrk4FtK2pkTiZ29hOwthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG0E7Xfl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG0E7Xfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740544796; x=1772080796;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OM7Am2SL2hGKZ6HRBvcPKib/xri8HqhpI3qgm4Kl22I=;
  b=NG0E7Xflrd4ZCBId5AhTpnqMGSQwJTdy+qvo5TNagm3YjWvB0Zuwy1Bx
   R3EBY8O2Bta5J/iTRNV7z1JkrvU4xonQiTfj4hUbGUaHz3Q0J2M9dUcBT
   SkZKgdJP2eWBpm4Lm60+Svz5mQ1sNvUCrscvRmW4AzxmSCh9VCx7oTPrx
   0TL3Y8lediP7btko9PeccOfJOehuXAhVKDoiyOAG62IJeD/HrCclTqzGN
   J0kcIdwFEZduJPFQolVJ5magnJfnVMqoNIIBTJo7dcswxGZE1VNyUYxfc
   uYA9dESWfXlDffYxPmlDS0ptSPUTEXuVVaTTtEOf1qSdO9FBoV0JHSI9I
   Q==;
X-CSE-ConnectionGUID: b6+b/hGKQ4mpPwJW49ALGg==
X-CSE-MsgGUID: uxzFTXd+SFCBGWoZf+yG3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41577196"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41577196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 20:39:55 -0800
X-CSE-ConnectionGUID: thYxqe9ZSAqiiLC/QCnDwg==
X-CSE-MsgGUID: f/FF91L3SxOUh6GsDlFolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="139820420"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2025 20:39:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn9CF-000B91-0j
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 04:39:27 +0000
Date: Wed, 26 Feb 2025 12:37:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/66 1/1] mm/hmm.c:780:42: warning: unused variable 'pfn'
Message-ID: <202502261205.xy3eJKJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/66
head:   c9b203c66daa53a537a014663bf01aaec2da3b32
commit: 992de9a8b7511673156df7d2bb1039dea3b2f7f3 [1/1] mm/hmm: allow to mirror vma of a file on a DAX backed filesystem
config: x86_64-buildonly-randconfig-004-20250224 (https://download.01.org/0day-ci/archive/20250226/202502261205.xy3eJKJZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261205.xy3eJKJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261205.xy3eJKJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_vma_walk_pud':
>> mm/hmm.c:780:42: warning: unused variable 'pfn' [-Wunused-variable]
     780 |                 unsigned long i, npages, pfn;
         |                                          ^~~
   mm/hmm.c: In function 'hmm_range_snapshot':
   mm/hmm.c:1023:40: warning: unused variable 'h' [-Wunused-variable]
    1023 |                         struct hstate *h = hstate_vma(vma);
         |                                        ^


vim +/pfn +780 mm/hmm.c

   761	
   762	static int hmm_vma_walk_pud(pud_t *pudp,
   763				    unsigned long start,
   764				    unsigned long end,
   765				    struct mm_walk *walk)
   766	{
   767		struct hmm_vma_walk *hmm_vma_walk = walk->private;
   768		struct hmm_range *range = hmm_vma_walk->range;
   769		unsigned long addr = start, next;
   770		pmd_t *pmdp;
   771		pud_t pud;
   772		int ret;
   773	
   774	again:
   775		pud = READ_ONCE(*pudp);
   776		if (pud_none(pud))
   777			return hmm_vma_walk_hole(start, end, walk);
   778	
   779		if (pud_huge(pud) && pud_devmap(pud)) {
 > 780			unsigned long i, npages, pfn;
   781			uint64_t *pfns, cpu_flags;
   782			bool fault, write_fault;
   783	
   784			if (!pud_present(pud))
   785				return hmm_vma_walk_hole(start, end, walk);
   786	
   787			i = (addr - range->start) >> PAGE_SHIFT;
   788			npages = (end - addr) >> PAGE_SHIFT;
   789			pfns = &range->pfns[i];
   790	
   791			cpu_flags = pud_to_hmm_pfn_flags(range, pud);
   792			hmm_range_need_fault(hmm_vma_walk, pfns, npages,
   793					     cpu_flags, &fault, &write_fault);
   794			if (fault || write_fault)
   795				return hmm_vma_walk_hole_(addr, end, fault,
   796							write_fault, walk);
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
