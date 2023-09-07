Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F21095A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694106980; x=1725642980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXX3YtbJaYphmg35oTDfuXrjvVV1NuhHq6pv2MfeaBU=;
  b=WXJbQE7N8pbRBRk1NC6LLX9Sy8xi/UX+hNBtXbw6pLEnLICxLWxbbmQm
   mVzru4L9aQ+/WwpJbvYHxL17Tk+79CbELebMJd8Z4H79jbZiWTT01Z666
   i41x8KQjLDpPuAk4eJKq7cyZiOdJvmG2cK3vw85LLuRsXZtXDj5QZEPmO
   8i+sIoV+6Q6+dpxx5DdW9W2yF79cKMIaV+UJulxso87+jLFyPj44VoOiY
   bvoLNnx1kNtQyqyrQOmMdLgm8+QT75ABtIYSVGeXvXSkvn7I19BIgZB61
   x8OAt02RSoR5gFMymKC275Lt8DXXVhoa/pDiggcyzguP6vWWbXaW4XtzT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357732851"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357732851"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777151151"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777151151"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 10:15:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIb5-0001QB-25;
	Thu, 07 Sep 2023 17:15:15 +0000
Date: Fri, 8 Sep 2023 01:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 33/618] arch/s390/boot/startup.c:188:17:
 error: use of undeclared identifier 'MEMCPY_REAL_SIZE'
Message-ID: <202309080140.nHdl7Ljd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   a369e6e4e96387fafd2686cb85ef80ebedec5909
commit: 39d8f183487e29d3ee2036aec204eb8bbde19d4b [33/618] s390/boot: account Real Memory Copy and Lowcore areas
config: s390-randconfig-r036-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080140.nHdl7Ljd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080140.nHdl7Ljd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080140.nHdl7Ljd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/boot/startup.c:188:17: error: use of undeclared identifier 'MEMCPY_REAL_SIZE'
     188 |                 MODULES_LEN + MEMCPY_REAL_SIZE + ABS_LOWCORE_MAP_SIZE;
         |                               ^
   1 error generated.


vim +/MEMCPY_REAL_SIZE +188 arch/s390/boot/startup.c

   172	
   173	static unsigned long setup_kernel_memory_layout(void)
   174	{
   175		unsigned long vmemmap_start;
   176		unsigned long asce_limit;
   177		unsigned long rte_size;
   178		unsigned long pages;
   179		unsigned long vsize;
   180		unsigned long vmax;
   181	
   182		pages = ident_map_size / PAGE_SIZE;
   183		/* vmemmap contains a multiple of PAGES_PER_SECTION struct pages */
   184		vmemmap_size = SECTION_ALIGN_UP(pages) * sizeof(struct page);
   185	
   186		/* choose kernel address space layout: 4 or 3 levels. */
   187		vsize = round_up(ident_map_size, _REGION3_SIZE) + vmemmap_size +
 > 188			MODULES_LEN + MEMCPY_REAL_SIZE + ABS_LOWCORE_MAP_SIZE;
   189		vsize = size_add(vsize, vmalloc_size);
   190		if (IS_ENABLED(CONFIG_KASAN) || (vsize > _REGION2_SIZE)) {
   191			asce_limit = _REGION1_SIZE;
   192			rte_size = _REGION2_SIZE;
   193		} else {
   194			asce_limit = _REGION2_SIZE;
   195			rte_size = _REGION3_SIZE;
   196		}
   197		/*
   198		 * forcing modules and vmalloc area under the ultravisor
   199		 * secure storage limit, so that any vmalloc allocation
   200		 * we do could be used to back secure guest storage.
   201		 */
   202		vmax = adjust_to_uv_max(asce_limit);
   203	#ifdef CONFIG_KASAN
   204		/* force vmalloc and modules below kasan shadow */
   205		vmax = min(vmax, KASAN_SHADOW_START);
   206	#endif
   207		__memcpy_real_area = round_down(vmax - PAGE_SIZE, PAGE_SIZE);
   208		__abs_lowcore = round_down(__memcpy_real_area - ABS_LOWCORE_MAP_SIZE,
   209					   sizeof(struct lowcore));
   210		MODULES_END = round_down(__abs_lowcore, _SEGMENT_SIZE);
   211		MODULES_VADDR = MODULES_END - MODULES_LEN;
   212		VMALLOC_END = MODULES_VADDR;
   213	
   214		/* allow vmalloc area to occupy up to about 1/2 of the rest virtual space left */
   215		vmalloc_size = min(vmalloc_size, round_down(VMALLOC_END / 2, _REGION3_SIZE));
   216		VMALLOC_START = VMALLOC_END - vmalloc_size;
   217	
   218		/* split remaining virtual space between 1:1 mapping & vmemmap array */
   219		pages = VMALLOC_START / (PAGE_SIZE + sizeof(struct page));
   220		pages = SECTION_ALIGN_UP(pages);
   221		/* keep vmemmap_start aligned to a top level region table entry */
   222		vmemmap_start = round_down(VMALLOC_START - pages * sizeof(struct page), rte_size);
   223		/* vmemmap_start is the future VMEM_MAX_PHYS, make sure it is within MAX_PHYSMEM */
   224		vmemmap_start = min(vmemmap_start, 1UL << MAX_PHYSMEM_BITS);
   225		/* make sure identity map doesn't overlay with vmemmap */
   226		ident_map_size = min(ident_map_size, vmemmap_start);
   227		vmemmap_size = SECTION_ALIGN_UP(ident_map_size / PAGE_SIZE) * sizeof(struct page);
   228		/* make sure vmemmap doesn't overlay with vmalloc area */
   229		VMALLOC_START = max(vmemmap_start + vmemmap_size, VMALLOC_START);
   230		vmemmap = (struct page *)vmemmap_start;
   231	
   232		return asce_limit;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
