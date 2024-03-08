Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B23548E8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897332; cv=none; b=uWe/FXBrY34wJNr4avssoXy/j7QkZxaanKEQQK2yJ3oiYAvYqdpL4eyeweglpgg2h9xqwN4PIofJ5T1A2bW1rZmrrc5aD0/nUc0HLdOwuA41H691xwmrqJImSehduDuItkFh/m+0zNGESVlOevkSqH3H0A3mrGlBinK+5Fa/kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897332; c=relaxed/simple;
	bh=5p2RCYtLEG02PZjo/BQ8cd0mwtnTCYfi14aCa9EKZ08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CkndgxWGGF0xw+bvAZWIRQILA8DKnk1WGypHXr06B2AHjr6ct37v0RI+dRZhkRa1FsfcKAjF02iKVsT+0BknutaywD1TFD6aelL8No+XkwZfn2Mw6ClVBzNVIoFKnA9jr9cZsuicCmO1VY4KcZrAH8IIKTNimYWWsoRZLZe7CYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQLIVnEq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQLIVnEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897331; x=1741433331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5p2RCYtLEG02PZjo/BQ8cd0mwtnTCYfi14aCa9EKZ08=;
  b=KQLIVnEqsJWjWyeLCjEVTj24jx/qbilYrnnVyHKrHDPTU1q8KeCYaSMe
   waOFOjcI23HZ9+8TwyrTnxLDQCms7LYw6rwrjMI2fiVaNAUN944hQhrqN
   9xDmQcr7saSA73R9TwMuex4ANqxZp+JyszJ8Rr9zkm1TLNHiMXkNoCJKZ
   jnhRLSCTuFJnyEhCEXrysL3ByjuGShtq9/2C8Ms5hdbjNpyiZtL1fSNbv
   vhq5aRDb17edbltlzM7gcreNoHMupt2tuFoKb7MBpvyP85SecS9mVDGyS
   I8yUUQJbpcdjGJZJIGxeQOjivqurf/lj11DnKNyoGIN1vrYF19kXwOTrx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4491004"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4491004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="47904420"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2024 03:28:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYP8-0006Kn-1O;
	Fri, 08 Mar 2024 11:28:46 +0000
Date: Fri, 8 Mar 2024 19:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pfn_cow 3/5] arch/x86/mm/pat/memtype.c:199:36:
 warning: right shift count >= width of type
Message-ID: <202403081901.TbUIkbal-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081901.TbUIkbal-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081901.TbUIkbal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081901.TbUIkbal-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:292,
                    from include/linux/seq_file.h:6,
                    from arch/x86/mm/pat/memtype.c:34:
   arch/x86/mm/pat/memtype.c: In function 'vma_set_pat_info':
>> arch/x86/mm/pat/memtype.c:199:36: warning: right shift count >= width of type [-Wshift-count-overflow]
     199 |         WARN_ON_ONCE(vma->vm_pgoff >> 61);
         |                                    ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +199 arch/x86/mm/pat/memtype.c

   178	
   179	static inline void vma_set_pat_info(struct vm_area_struct *vma,
   180					    resource_size_t paddr, pgprot_t pgprot)
   181	{
   182		const int64_t diff = (paddr >> PAGE_SHIFT) - vma->vm_pgoff;
   183	
   184		/*
   185		 * With VM_PAT, we will indicate that the whole VMA maps a contiguous
   186		 * PFN range. To avoid walking page tables, we store the start PFN
   187		 * and the requested cachemode in the VMA.
   188		 *
   189		 * In order to obtain the start PFN in a VMA even after the VMA was
   190		 * split or mremapped without additional hooks, store the diff
   191		 * of the PFN to the vm_pgoff. Merging o extending VMAs does not apply
   192		 * to "special" mappings.
   193		 *
   194		 * If our vm_pgoff would exceed 61 bit, we would not be able to reuse
   195		 * 3 bit for our cachemode. We really don't expect that big vm_pgoffs
   196		 * in VM_PFNMAP mappings, so let's keep it simple and avoid storing
   197		 * the cachemode separately.
   198		 */
 > 199		WARN_ON_ONCE(vma->vm_pgoff >> 61);
   200		BUILD_BUG_ON((_PAGE_CACHE_MODE_NUM - 1) & ~0x7);
   201	
   202		vm_flags_set(vma, VM_PAT);
   203		vma->pat_info = (diff << 3) | pgprot2cachemode(pgprot);
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
