Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A81624C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740516167; cv=none; b=SRdQV+NYVEZknaHCjBTrbNQyJZWCfAIkx53XAvazlp7DfiJ0mKxJW7XycNlk2q2DDGrL3M0BVMzkvUVb078k0zoJ/FfFSLe3mnA/2jr1NchTaFNWnbiF1/DrC/hO5jt72+o12jkaRK41LO1oMmvdKyVL1zI89JoK7RGVm18QEes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740516167; c=relaxed/simple;
	bh=8q98m+9sahCyEU8sNnRffbHvpfLOjRq/skA8XFFO9/c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7oEJkx63ZhHl29XLU+XDAxPhHGALMurbQkK8ix1pRLlcE2Z+rl0iBMCIY09Bov1of1YHoUwu8r/hd4yxSNek0F99pKQu1vmTrCaDPZqfMWS+YAE/tZb3umyRUAi0XwBMDo4ZZvlyPNAYR+RfRbXpfSmo6p0R+QTRgCN5mgusCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGF3IoP6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGF3IoP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740516166; x=1772052166;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8q98m+9sahCyEU8sNnRffbHvpfLOjRq/skA8XFFO9/c=;
  b=oGF3IoP6yat1F4ECAu94ag4Q7z90ZKKU6JRqafP1zh6V38MsUnlatbro
   W9fMlRhDffJA1vBistUdeRc184yjE4vRbvWOa00enkjFX4Wes4JZ/0Rp0
   XsvF3BcrOjWylkvJP35pLeSl+/Ayox298hwjvYCuvl0+pFrJ9eZTx4Vf4
   17MiLThr2y/4eFP1fn819hTWSiUWa7nq7Na5FtLPWPbNvdIRnYhdfs6eJ
   LY4bpfWCVvxYmLTpEtQKoYnIsUssXqPdj20s4c5KzAEUFR/h8KirV5PXH
   MaY8vC4dfLmkY/3Exr97kFLkqlb18dayRuyW3v8ZsUmdtzPXJdGac1wwT
   w==;
X-CSE-ConnectionGUID: ry6XCU28Ry6Rt4gE3Ua82w==
X-CSE-MsgGUID: TPmBOhJKTweGMw7oiANzjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63808230"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="63808230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 12:42:45 -0800
X-CSE-ConnectionGUID: elhlAat+SpKnLOPeKeTF1A==
X-CSE-MsgGUID: ODqxVFDdQtu/jO8HYEwI4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116298579"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Feb 2025 12:42:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn1lK-000AlH-11;
	Tue, 25 Feb 2025 20:42:42 +0000
Date: Wed, 26 Feb 2025 04:42:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [intel-lts:pr/66 1/1] mm/hmm.c:916:40: warning: unused variable 'h'
Message-ID: <202502260425.HYGF9C1P-lkp@intel.com>
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
commit: 63d5066f6e5a1713d0247ef38f0add545408896b [1/1] mm/hmm: mirror hugetlbfs (snapshoting, faulting and DMA mapping)
config: x86_64-buildonly-randconfig-004-20250224 (https://download.01.org/0day-ci/archive/20250226/202502260425.HYGF9C1P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502260425.HYGF9C1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502260425.HYGF9C1P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_range_snapshot':
>> mm/hmm.c:916:40: warning: unused variable 'h' [-Wunused-variable]
     916 |                         struct hstate *h = hstate_vma(vma);
         |                                        ^


vim +/h +916 mm/hmm.c

   873	
   874	/*
   875	 * hmm_range_snapshot() - snapshot CPU page table for a range
   876	 * @range: range
   877	 * Returns: -EINVAL if invalid argument, -ENOMEM out of memory, -EPERM invalid
   878	 *          permission (for instance asking for write and range is read only),
   879	 *          -EAGAIN if you need to retry, -EFAULT invalid (ie either no valid
   880	 *          vma or it is illegal to access that range), number of valid pages
   881	 *          in range->pfns[] (from range start address).
   882	 *
   883	 * This snapshots the CPU page table for a range of virtual addresses. Snapshot
   884	 * validity is tracked by range struct. See in include/linux/hmm.h for example
   885	 * on how to use.
   886	 */
   887	long hmm_range_snapshot(struct hmm_range *range)
   888	{
   889		const unsigned long device_vma = VM_IO | VM_PFNMAP | VM_MIXEDMAP;
   890		unsigned long start = range->start, end;
   891		struct hmm_vma_walk hmm_vma_walk;
   892		struct hmm *hmm = range->hmm;
   893		struct vm_area_struct *vma;
   894		struct mm_walk mm_walk;
   895	
   896		/* Check if hmm_mm_destroy() was call. */
   897		if (hmm->mm == NULL || hmm->dead)
   898			return -EFAULT;
   899	
   900		do {
   901			/* If range is no longer valid force retry. */
   902			if (!range->valid)
   903				return -EAGAIN;
   904	
   905			vma = find_vma(hmm->mm, start);
   906			if (vma == NULL || (vma->vm_flags & device_vma))
   907				return -EFAULT;
   908	
   909			/* FIXME support dax */
   910			if (vma_is_dax(vma)) {
   911				hmm_pfns_special(range);
   912				return -EINVAL;
   913			}
   914	
   915			if (is_vm_hugetlb_page(vma)) {
 > 916				struct hstate *h = hstate_vma(vma);
   917	
   918				if (huge_page_shift(h) != range->page_shift &&
   919				    range->page_shift != PAGE_SHIFT)
   920					return -EINVAL;
   921			} else {
   922				if (range->page_shift != PAGE_SHIFT)
   923					return -EINVAL;
   924			}
   925	
   926			if (!(vma->vm_flags & VM_READ)) {
   927				/*
   928				 * If vma do not allow read access, then assume that it
   929				 * does not allow write access, either. HMM does not
   930				 * support architecture that allow write without read.
   931				 */
   932				hmm_pfns_clear(range, range->pfns,
   933					range->start, range->end);
   934				return -EPERM;
   935			}
   936	
   937			range->vma = vma;
   938			hmm_vma_walk.last = start;
   939			hmm_vma_walk.fault = false;
   940			hmm_vma_walk.range = range;
   941			mm_walk.private = &hmm_vma_walk;
   942			end = min(range->end, vma->vm_end);
   943	
   944			mm_walk.vma = vma;
   945			mm_walk.mm = vma->vm_mm;
   946			mm_walk.pte_entry = NULL;
   947			mm_walk.test_walk = NULL;
   948			mm_walk.hugetlb_entry = NULL;
   949			mm_walk.pmd_entry = hmm_vma_walk_pmd;
   950			mm_walk.pte_hole = hmm_vma_walk_hole;
   951			mm_walk.hugetlb_entry = hmm_vma_walk_hugetlb_entry;
   952	
   953			walk_page_range(start, end, &mm_walk);
   954			start = end;
   955		} while (start < range->end);
   956	
   957		return (hmm_vma_walk.last - range->start) >> PAGE_SHIFT;
   958	}
   959	EXPORT_SYMBOL(hmm_range_snapshot);
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
