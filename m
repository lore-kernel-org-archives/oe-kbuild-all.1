Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55E4C8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753329148; cv=none; b=JXCQfLReUUrlY+6zH/NTENSA2EquLjiGXnrhNUXIwLEAuUjrPpUNHsuvaxrJWQh+eELpx/DcPufLmYXpfEssz1F83k4VA9z2FDl73W1BT8NgC/8LsNf7WiEuYSBSujLjdVTfMAy9R2/l+wZnViQbYXmUELkQXFcQ/d6ki4oCbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753329148; c=relaxed/simple;
	bh=/xQW1ZHqwRyU90jQS+CwU92PVuThJJAt88OIwDd4MCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYE0SmIhTDjjUHXCtlmdVjy1IePzFBxClUE0u74fX6O8tb7zfziwgKTbsrkDsYtto9bbVcopcr4GvJfnHYoE/WODQsH+nKqGVh9cKQR0i1o/lX/tyDQpiTlyRob8ibWVWohHcqojZDP8FLHJxXEfxjfoZpeEs6l49mILEprp+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4edH1cu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4edH1cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753329147; x=1784865147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xQW1ZHqwRyU90jQS+CwU92PVuThJJAt88OIwDd4MCQ=;
  b=B4edH1cu2rjU+o5pMHi6PdUsaR2s8r8WXRhARrYCBYV1bBrqEfsEGn2q
   S9aIbXD9aVqWvUfwJsKZfpQDKdvVrfL/pDKDhOmfIVr6/W7hLcZPfvKHE
   gytiuIgYH3jcr/rClUCVAs/QP8uYKYFbjetlte11r2mrvBGmQ6my6+/LJ
   uoBPylqcJkfCzY9CRr+8VMPDdJ/o8EqJla48s7GVhv+CobNHjicBzgz8K
   2lkl0PFWxJgkhmBxEfAlgQU99eAP/3Vlur9jryOPwSLtlFl1BC+5aKosi
   7OmyQ8LuMnOkviD2ek/iketAMul/YupMKAZyqjKoo4bl7qS1t222rYQw/
   w==;
X-CSE-ConnectionGUID: 6IQf+PVKREKmqCMEhV2OmQ==
X-CSE-MsgGUID: geN/kIbFSry4O1zQgYIUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55720418"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55720418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 20:52:26 -0700
X-CSE-ConnectionGUID: 4YNqSf4CQ/Sd1FV3HH6AJg==
X-CSE-MsgGUID: SrHEonbqTua2aHQvqxI5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160056945"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jul 2025 20:52:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uen0I-000K3X-2S;
	Thu, 24 Jul 2025 03:52:22 +0000
Date: Thu, 24 Jul 2025 11:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/vmalloc.c:2805: warning:
 Function parameter or member 'flag' not described in '__vmap_area_range'
Message-ID: <202507241146.1eotQXqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rongwei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   71a37bdc5fbed5d912815ad0c6fe9eb17136b81f
commit: c39d9864ef4b6fafbed9a4d35cf4f6686aab9ca6 [0/9] anolis: mm/vmalloc: add two couples of vmalloc operations for virtio-ism
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507241146.1eotQXqV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241146.1eotQXqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241146.1eotQXqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:2805: warning: Function parameter or member 'flag' not described in '__vmap_area_range'
>> mm/vmalloc.c:2805: warning: Excess function parameter 'flags' description in '__vmap_area_range'
   mm/vmalloc.c:3734: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'


vim +2805 mm/vmalloc.c

  2789	
  2790	/**
  2791	 * vmap_area_range - map an array of pages into specified and virtually contiguous space
  2792	 * @pages: array of page pointers
  2793	 * @count: number of pages to map
  2794	 * @flags: vm_area->flags
  2795	 * @prot: page protection for the mapping
  2796	 * @addr: specified virtual address
  2797	 * @check: whether to check this area has already mapped or not
  2798	 *
  2799	 * Return: true or false on failure
  2800	 *
  2801	 * THIS IS A CUSTOM INTERFACE FOR SPECIAL DRIVERS.
  2802	 */
  2803	bool __vmap_area_range(struct page **pages, unsigned int count,
  2804			     unsigned long flag, pgprot_t prot, const void *addr, bool check)
> 2805	{
  2806		struct vmap_area *va;
  2807		struct vm_struct *area;
  2808		unsigned long vaddr = (unsigned long)addr;
  2809		unsigned long size;
  2810	
  2811		va = find_vmap_area(vaddr);
  2812		if (unlikely(!va)) {
  2813			WARN(1, "Trying to map nonexistent vm area (%p)\n", addr);
  2814			return false;
  2815		}
  2816	
  2817		size = (unsigned long)count << PAGE_SHIFT;
  2818		/* make sure map with valid parameters */
  2819		if (!size || (vaddr + size) > va->va_end) {
  2820			WARN(1, "Trying to map vm area with invalid values\n");
  2821			return false;
  2822		}
  2823		area = va->vm;
  2824		if (!(area->flags & VM_ALLOC_DECOUPLE_MAP)) {
  2825			WARN(1, "Trying to call vmap_area_range() on standard area (%lx)\n",
  2826			     vaddr);
  2827			return false;
  2828		}
  2829	
  2830		/* Make sure no pages mapped at this address */
  2831		if (check) {
  2832			struct page *p;
  2833			unsigned long kaddr;
  2834	
  2835			for (kaddr = vaddr; kaddr < vaddr + size; kaddr += PAGE_SIZE) {
  2836				p = vmalloc_to_page((void *)kaddr);
  2837				if (p) {
  2838					WARN(1, "Trying to remap vm area (%lx)\n", kaddr);
  2839					return false;
  2840				}
  2841			}
  2842		}
  2843	
  2844		if (vmap_pages_range(vaddr, vaddr + size, pgprot_nx(prot),
  2845				     pages, PAGE_SHIFT) < 0) {
  2846			pr_warn("vmap_area_range error: addr %lu, size %lu", vaddr, size);
  2847			return false;
  2848		}
  2849		/*
  2850		 * Here VM_MAP_PUT_PAGES is ignored, that's because of the callers
  2851		 * will use {vmap, vunmap}_area_range() on sub area, and overlapping
  2852		 * area->pages if VM_MAP_PUT_PAGES is aware. It's different with
  2853		 * standard vmap() and vunmap().
  2854		 */
  2855		area->nr_pages += count;
  2856	
  2857		return true;
  2858	}
  2859	EXPORT_SYMBOL(__vmap_area_range);
  2860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
