Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E8555E6D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897336; cv=none; b=Oe/91pQHxzZQshlU9T7867cvfIAuVya8MP05me1t1u3GWHWI9bY8W+uRAb1vA5pGwu42K40uC8NFiA0TQdIPbCso6wA8+sQt/Gtufkr0FWu/fiStuNG8Pb98t8PBnsQyqU1O9LZLTrowequkAfNzsKGSoLctOV2s1uLYOBGBkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897336; c=relaxed/simple;
	bh=odFsIKvKt+Ceha/jmvORmDouyXEb+qiaobCNBfHEGj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obpvr3Wmesn8FDotbqBydaRMSIIw7O508cnTYb1bEjH3nTbTolHDQLHz+kFeD2/5UN/2vges+eTUaASJeQH2ewJytvRRQQwE+SWJYUTC922YpBcBNTtBHhTMH6msI0bkkCu7xHQWP2vaGK3jpACYehzBhK6v3etSIoKcP0vLQj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8tj4lsC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8tj4lsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897333; x=1741433333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odFsIKvKt+Ceha/jmvORmDouyXEb+qiaobCNBfHEGj4=;
  b=Q8tj4lsCRat5gi9x94Z14LMGdJLBtzRf+tZO42b8B538h9XH+Qn2Q6Cy
   BFDbd12Todw5K1ff/6R7MTZ+MiUnfiZV+PykSJobc16tq61ohaq8+9laU
   7SoVnvw7bbGUI/66rd6HnR8NWPvWRSzKKQ7juzp7u3xaI6fz/dVGzsrSD
   x62XuOJRUtq/ER8fiqX7mvxex4N1P4NtVsurzTcCy5Mz/aA/pwrxZlF09
   yHt9TU27oL+GUTueF0+qgoBC9baLb7JCu0Al9TsXO3Pvw+NWWMQgWqUgR
   g0E1XwmhL4Pl6pTVIf7EuTXJlpUNagGtOwXQdMDsICfzzPHzu9H2ZSlUm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4739765"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4739765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10449488"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 03:28:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYP8-0006Kp-1S;
	Fri, 08 Mar 2024 11:28:46 +0000
Date: Fri, 8 Mar 2024 19:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pfn_cow 3/5] arch/x86/mm/pat/memtype.c:1018:13:
 error: implicit declaration of function 'vma_get_pat_info'
Message-ID: <202403081918.flOyPDKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pfn_cow
head:   e522fd14b455b4012d7c9388026dc849daf6f8b5
commit: 17725734e525b4cc4ae1f26107e45c0ca19c17a6 [3/5] x86/mm/pat: store PAT information for VM_PAT in VMA
config: i386-buildonly-randconfig-004-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081918.flOyPDKn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081918.flOyPDKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081918.flOyPDKn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/pat/memtype.c: In function 'track_pfn_copy':
>> arch/x86/mm/pat/memtype.c:1018:13: error: implicit declaration of function 'vma_get_pat_info' [-Werror=implicit-function-declaration]
    1018 |         if (vma_get_pat_info(vma, &paddr, &pgprot))
         |             ^~~~~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c: In function 'track_pfn_remap':
>> arch/x86/mm/pat/memtype.c:1042:25: error: implicit declaration of function 'vma_set_pat_info' [-Werror=implicit-function-declaration]
    1042 |                         vma_set_pat_info(vma, paddr, *prot);
         |                         ^~~~~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c: In function 'untrack_pfn':
>> arch/x86/mm/pat/memtype.c:1103:17: error: implicit declaration of function 'vma_clear_pat_info' [-Werror=implicit-function-declaration]
    1103 |                 vma_clear_pat_info(vma, mm_wr_locked);
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vma_get_pat_info +1018 arch/x86/mm/pat/memtype.c

  1004	
  1005	/*
  1006	 * track_pfn_copy is called when vma that is covering the pfnmap gets
  1007	 * copied through copy_page_range().
  1008	 *
  1009	 * If the vma has a linear pfn mapping for the entire range, we get the prot
  1010	 * from pte and reserve the entire vma range with single reserve_pfn_range call.
  1011	 */
  1012	int track_pfn_copy(struct vm_area_struct *vma)
  1013	{
  1014		resource_size_t paddr;
  1015		unsigned long vma_size = vma->vm_end - vma->vm_start;
  1016		pgprot_t pgprot;
  1017	
> 1018		if (vma_get_pat_info(vma, &paddr, &pgprot))
  1019			return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
  1020		return 0;
  1021	}
  1022	
  1023	/*
  1024	 * prot is passed in as a parameter for the new mapping. If the vma has
  1025	 * a linear pfn mapping for the entire range, or no vma is provided,
  1026	 * reserve the entire pfn + size range with single reserve_pfn_range
  1027	 * call.
  1028	 */
  1029	int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
  1030			    unsigned long pfn, unsigned long addr, unsigned long size)
  1031	{
  1032		resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
  1033		enum page_cache_mode pcm;
  1034	
  1035		/* Reserve the whole chunk starting from paddr. */
  1036		if (!vma || (addr == vma->vm_start &&
  1037			     size == (vma->vm_end - vma->vm_start))) {
  1038			int ret;
  1039	
  1040			ret = reserve_pfn_range(paddr, size, prot, 0);
  1041			if (ret == 0 && vma)
> 1042				vma_set_pat_info(vma, paddr, *prot);
  1043			return ret;
  1044		}
  1045	
  1046		if (!pat_enabled())
  1047			return 0;
  1048	
  1049		/*
  1050		 * For anything smaller than the vma size we set prot based on the
  1051		 * lookup.
  1052		 */
  1053		pcm = lookup_memtype(paddr);
  1054	
  1055		/* Check memtype for the remaining pages */
  1056		while (size > PAGE_SIZE) {
  1057			size -= PAGE_SIZE;
  1058			paddr += PAGE_SIZE;
  1059			if (pcm != lookup_memtype(paddr))
  1060				return -EINVAL;
  1061		}
  1062	
  1063		*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
  1064				 cachemode2protval(pcm));
  1065	
  1066		return 0;
  1067	}
  1068	
  1069	void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
  1070	{
  1071		enum page_cache_mode pcm;
  1072	
  1073		if (!pat_enabled())
  1074			return;
  1075	
  1076		/* Set prot based on lookup */
  1077		pcm = lookup_memtype(pfn_t_to_phys(pfn));
  1078		*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
  1079				 cachemode2protval(pcm));
  1080	}
  1081	
  1082	/*
  1083	 * untrack_pfn is called while unmapping a pfnmap for a region.
  1084	 * untrack can be called for a specific region indicated by pfn and size or
  1085	 * can be for the entire vma (in which case pfn, size are zero).
  1086	 */
  1087	void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
  1088			 unsigned long size, bool mm_wr_locked)
  1089	{
  1090		resource_size_t paddr;
  1091		pgprot_t pgprot;
  1092	
  1093		if (vma && !vma_get_pat_info(vma, &paddr, &pgprot))
  1094			return;
  1095	
  1096		/* free the chunk starting from pfn or the whole chunk */
  1097		if (!pfn && !size)
  1098			size = vma->vm_end - vma->vm_start;
  1099		else
  1100			paddr = (resource_size_t)pfn << PAGE_SHIFT;
  1101		free_pfn_range(paddr, size);
  1102		if (vma)
> 1103			vma_clear_pat_info(vma, mm_wr_locked);
  1104	}
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
