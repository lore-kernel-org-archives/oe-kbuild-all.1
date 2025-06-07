Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29C42A83
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749282745; cv=none; b=DJhtRW6G+SVn00dIIrSd+INDBPHCDxh9Qx4sd2P2Nlf4ivxXvRa8FV1bVEzKVVvPcJSZtE/1v0FsYaaxNlINV/xlrZa6x5sXJUBexanCNo6/V0IdirFxu0SGdcbKp487HksVonUCrzbcneI2bF5pA81JsKJ6TQDVJBBWapyLecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749282745; c=relaxed/simple;
	bh=/s9O8ofVJte+uwcfbXKRb8bEDB2xPIUrTMFMY4bcmOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEPB35fBGvuC44ZKPzjJ94fNp/RmqKCVlkq/GTfIknNvyYBUnKGKsJ1Lg9f2ycjjc+HZnxku1ySOWExstbiiarYbRceTbAKFWDI3hJQe+HuoME/Ivzum5k7WRWShPeWn5ffijTRC7dRqOuMrm6A0B1cNufgu5ihQ9qtS7uX8ZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvQAfPer; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvQAfPer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749282743; x=1780818743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/s9O8ofVJte+uwcfbXKRb8bEDB2xPIUrTMFMY4bcmOk=;
  b=FvQAfPer/ZRn6tlPVlPHiwq8vODjLidVTN3OX7VZZgtSuAW4ntoG0Jtf
   9044ZyAfj250HVCBQU4hKBH69MfodormQOFjqzvUp1cWxrIaqZDi4W7i0
   5t48bRER8Zh+vqkOZvxrrd4GGITknYdwsPt4YpeT9iGTsfpCbUR/NVLmy
   O8fjVUbNnCm8mWk9XZbJ5JM4uOikYkBQ5hK1npzV9hhWdayyOFnk3QOgb
   I2H7swLGgH6VXZVz7mDJE1aABabA8mJMaTvbaiWDLoFvy4ye5eO7dglp1
   O8elCED3d3vX2LmmgLI9slp1YHlhuJweYdcgs7vFg4SMY0WbOHXTsXcjK
   A==;
X-CSE-ConnectionGUID: xRcE4Y/OS/2af19D6qi/wg==
X-CSE-MsgGUID: 0Jlv3vxnTxm7UAkS++iGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55235946"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="55235946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 00:52:23 -0700
X-CSE-ConnectionGUID: LtMqZfnZTxivnPQGq+Ughg==
X-CSE-MsgGUID: UlI95Cf1RJGPpSf5Cng+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146622720"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2025 00:52:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNoLj-0005Xb-2D;
	Sat, 07 Jun 2025 07:52:19 +0000
Date: Sat, 7 Jun 2025 15:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 13/15] mm/memory.c:2715:21:
 error: implicit declaration of function 'vm_normal_page_in_pfnmap'; did you
 mean 'vm_normal_page_pfn'?
Message-ID: <202506071528.zLcwku9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   5e55c4b55694005e4fb9300605ca3723623a61f9
commit: 8b161f2eb8f8556a2d88e3544648b37584c4d1ed [13/15] mm: remove "horrible special case to handle copy-on-write behaviour"
config: x86_64-buildonly-randconfig-004-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071528.zLcwku9D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071528.zLcwku9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071528.zLcwku9D-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'remap_pte_range':
>> mm/memory.c:2715:21: error: implicit declaration of function 'vm_normal_page_in_pfnmap'; did you mean 'vm_normal_page_pfn'? [-Werror=implicit-function-declaration]
    2715 |                 if (vm_normal_page_in_pfnmap(vma, pfn)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     vm_normal_page_pfn
   cc1: some warnings being treated as errors


vim +2715 mm/memory.c

  2686	
  2687	/*
  2688	 * maps a range of physical memory into the requested pages. the old
  2689	 * mappings are removed. any references to nonexistent pages results
  2690	 * in null mappings (currently treated as "copy-on-access")
  2691	 */
  2692	static int remap_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
  2693				unsigned long addr, unsigned long end,
  2694				unsigned long pfn, pgprot_t prot)
  2695	{
  2696		struct mm_struct *mm = vma->vm_mm;
  2697		pte_t *pte, *mapped_pte;
  2698		spinlock_t *ptl;
  2699		int err = 0;
  2700	
  2701		mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
  2702		if (!pte)
  2703			return -ENOMEM;
  2704		arch_enter_lazy_mmu_mode();
  2705		do {
  2706			BUG_ON(!pte_none(ptep_get(pte)));
  2707			if (!pfn_modify_allowed(pfn, prot)) {
  2708				err = -EACCES;
  2709				break;
  2710			}
  2711			/*
  2712			 * Refuse this pfn if we could mistake it as a refcounted folio
  2713			 * in a CoW mapping.
  2714			 */
> 2715			if (vm_normal_page_in_pfnmap(vma, pfn)) {
  2716				err = -EINVAL;
  2717				break;
  2718			}
  2719			set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
  2720			pfn++;
  2721		} while (pte++, addr += PAGE_SIZE, addr != end);
  2722		arch_leave_lazy_mmu_mode();
  2723		pte_unmap_unlock(mapped_pte, ptl);
  2724		return err;
  2725	}
  2726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
