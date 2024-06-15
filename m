Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9E4963D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718465971; cv=none; b=jBi+7hKUKYm8izdgCDpcw7hZx9Jc5TMTpQ96TmLUfIbrWpLWmsE7qOBzMB2xHPnOOA2WR6BqvkGiPCXwFodmN6U9G6cydrf849U45q12CyHmT5lNzk1CCnhGDr++FWoNDumexG+GUrS6OpPEnM43oyx3R8Rom/mpOk0TDWbPUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718465971; c=relaxed/simple;
	bh=6bcmGW99JdEbY3bJDihx4MSseS60yAu/i6oM2JLatBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sb9L+c2/hI+b5mw+AnM7ODzWcdN3OC7Y2zm4SqtXnqFTOoJCUipIQ7c95qQAtxLY6ZOuaENuNCjDtzIfu5pxJtFsoeKiAp0lQ9rPIWbRJUISB1P/ClPUWSVPBFmIS0LFCbz7LqbHWPVHuW5QI2Vw54pxK1DP1r8ZFsAe//q7fkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBG1Mnhg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBG1Mnhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718465968; x=1750001968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bcmGW99JdEbY3bJDihx4MSseS60yAu/i6oM2JLatBo=;
  b=GBG1Mnhgx98RbYtnXFH4ZTisESBu3kEvf9mkMAhay7esN3lXAixAJ716
   0WPdVQq4AOiVhArgocjqm/DLh0VHYfzvxHCK5lZVBr/ZAtktS62B7Nx98
   ZTykZnNXYwz9qNyKsKG0LsRk1ns6pdVlYrBDRTStOFCf1B5vv7NQqIF1b
   s5mIb2Jt5EdLVODuOpJWt5eDQtpuZ7EWgdfa+mmdERXYR7v/Iw6XHA6N4
   icSEU0LMPlQA8l8MVgnew89GFrW8MqyOm26TZfM76vOcRXtlZSZPi4Z+t
   NqiMI1jjjdkPouGpOMXGhjZohtmLm4kLydqFcr+ZGXkMCi43RTkXA2nyS
   w==;
X-CSE-ConnectionGUID: p1KhrmnoRkibkwsPTB1Yjg==
X-CSE-MsgGUID: rFgUtY57Q/izNWqYapu7ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15222853"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15222853"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 08:39:25 -0700
X-CSE-ConnectionGUID: UpXSjZrPTbeSGtJH8iTuzQ==
X-CSE-MsgGUID: N5vNmwYCQ8K5Pwxl+ctnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45319811"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2024 08:39:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIVUw-0000BY-0X;
	Sat, 15 Jun 2024 15:39:22 +0000
Date: Sat, 15 Jun 2024 23:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_table_reclaim 10/10]
 mm/pgtable_reclaim.c:23:8: warning: no previous prototype for 'lookup_pmdp'
Message-ID: <202406152312.ZrzznsyK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_table_reclaim
head:   fba6b89e0737bc078c6e7ace5a0c8718e097464d
commit: fba6b89e0737bc078c6e7ace5a0c8718e097464d [10/10] mm: page table reclaim
config: i386-buildonly-randconfig-002-20240615 (https://download.01.org/0day-ci/archive/20240615/202406152312.ZrzznsyK-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152312.ZrzznsyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152312.ZrzznsyK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgtable_reclaim.c:23:8: warning: no previous prototype for 'lookup_pmdp' [-Wmissing-prototypes]
      23 | pmd_t *lookup_pmdp(struct mm_struct *mm, unsigned long address)
         |        ^~~~~~~~~~~
>> mm/pgtable_reclaim.c:54:8: warning: no previous prototype for 'lookup_pudp' [-Wmissing-prototypes]
      54 | pud_t *lookup_pudp(struct mm_struct *mm, unsigned long address)
         |        ^~~~~~~~~~~
   mm/pgtable_reclaim.c: In function 'try_reclaim_pmd_table':
   mm/pgtable_reclaim.c:175:9: warning: variable 'pmd' set but not used [-Wunused-but-set-variable]
     175 |  pmd_t *pmd;
         |         ^~~
   mm/pgtable_reclaim.c: In function 'mm_reclaim_pgtables':
   mm/pgtable_reclaim.c:395:20: warning: unused variable 'tlb' [-Wunused-variable]
     395 |  struct mmu_gather tlb;
         |                    ^~~
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_show':
   mm/pgtable_reclaim.c:482:33: error: 'zap_zero_pages' undeclared (first use in this function); did you mean 'zap_zero_pages_show'?
     482 |  return sysfs_emit(buf, "%d\n", zap_zero_pages);
         |                                 ^~~~~~~~~~~~~~
         |                                 zap_zero_pages_show
   mm/pgtable_reclaim.c:482:33: note: each undeclared identifier is reported only once for each function it appears in
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_store':
   mm/pgtable_reclaim.c:498:2: error: 'zap_zero_pages' undeclared (first use in this function); did you mean 'zap_zero_pages_show'?
     498 |  zap_zero_pages = value;
         |  ^~~~~~~~~~~~~~
         |  zap_zero_pages_show
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_show':
   mm/pgtable_reclaim.c:483:1: warning: control reaches end of non-void function [-Wreturn-type]
     483 | }
         | ^


vim +/lookup_pmdp +23 mm/pgtable_reclaim.c

    18	
    19	/*
    20	 * Lookup a PMD entry pointer while holding the mmap_lock in write and without
    21	 * any details about the VMA.
    22	 */
  > 23	pmd_t *lookup_pmdp(struct mm_struct *mm, unsigned long address)
    24	{
    25		pgd_t *pgdp;
    26		p4d_t *p4dp;
    27		pud_t *pudp;
    28	
    29		pgdp = pgd_offset(mm, address);
    30		if (unlikely(!pgd_present(*pgdp)))
    31			return NULL;
    32		if (unlikely(pgd_huge(*pgdp) || is_hugepd(__hugepd(pgd_val(*pgdp)))))
    33			return NULL;
    34	
    35		p4dp = p4d_offset(pgdp, address);
    36		if (unlikely(!p4d_present(*p4dp)))
    37			return NULL;
    38		if (unlikely(p4d_huge(*p4dp) || is_hugepd(__hugepd(p4d_val(*p4dp)))))
    39			return NULL;
    40	
    41		pudp = pud_offset(p4dp, address);
    42		if (unlikely(!pud_present(*pudp)))
    43			return NULL;
    44		if (unlikely(pud_huge(*pudp) || is_hugepd(__hugepd(pud_val(*pudp)))))
    45			return NULL;
    46	
    47		return pmd_offset(pudp, address);
    48	}
    49	
    50	/*
    51	 * Lookup a PUD entry pointer while holding the mmap_lock in write and without
    52	 * any details about the VMA.
    53	 */
  > 54	pud_t *lookup_pudp(struct mm_struct *mm, unsigned long address)
    55	{
    56		pgd_t *pgdp;
    57		p4d_t *p4dp;
    58	
    59		pgdp = pgd_offset(mm, address);
    60		if (unlikely(!pgd_present(*pgdp)))
    61			return NULL;
    62		if (unlikely(pgd_huge(*pgdp) || is_hugepd(__hugepd(pgd_val(*pgdp)))))
    63			return NULL;
    64	
    65		p4dp = p4d_offset(pgdp, address);
    66		if (unlikely(!p4d_present(*p4dp)))
    67			return NULL;
    68		if (unlikely(p4d_huge(*p4dp) || is_hugepd(__hugepd(p4d_val(*p4dp)))))
    69			return NULL;
    70	
    71		return pud_offset(p4dp, address);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
