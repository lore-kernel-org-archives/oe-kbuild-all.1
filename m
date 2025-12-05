Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5033EC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918838; cv=none; b=AGRAkoD0nM9aC5F1yqcMpmKRIGuHyDfnrrt1662fsDE1nbQBXsBOGdmhh2AlB9CVYuSgeFpVE3PcOkwaKyEKkhg4vGz0aItqJyngnL+IkkTrPA+PGe5BxxtTpT4bRA4JrrXX1v8bW3qGcX3Z2iNwc9F27oGiTjD3+J00RS0VgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918838; c=relaxed/simple;
	bh=YyV97tXQ1KbLdfVVpCzVqZPsz+xO/DpQy6trbLhzBKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhMy8Imu7EtdVI+d0jyeu2Y9HqaWfB6upGNkQvq1CFaPTRombd7IvEWYx2r2svfAuKeyiYK3b9EYOpNsmIg//zdiEr6R+dOqgQcINLADBM+w/WbPPpO++UMwCwPTw3yFQ1CQ+by9JNzscfTKGd7KZsMmDXPCUufcfLP9Wv2A13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6bEDZuu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6bEDZuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764918836; x=1796454836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YyV97tXQ1KbLdfVVpCzVqZPsz+xO/DpQy6trbLhzBKs=;
  b=h6bEDZuultNGCI1c70ZXAk6g6LNwlwZu8KbMoLcziLaYsHhYNkhz0Dx+
   CEsNcNuGuzQa6eAID0KSBv6imRVeY6V2M1vWxGNDckiZ1T9tUQZPM5Nck
   iI09kj0phDN0WK+M6aDhjoVJmNuB+4RxlKulxy/UnBSNCWCQXk9FpSVLG
   +gmt3v4PAjGYANgTzzn3iHMflTc8JUFhwysxrF5sNAhqTnXzUUb961vj4
   8CxVhmmSUYWgtuOcOsK/cGFmBD2pgqmIL7TPpXIwmjjKbatc16gv2NVkY
   XmNd4i+xaoW3xbBTLgNTzqXSFkIbvkGQEJl2aJXzo3KnUdOaVphxiJz8o
   Q==;
X-CSE-ConnectionGUID: 8LEmO5HhRxaD6rHKYanLYQ==
X-CSE-MsgGUID: 5GOrQ0EeRHypQy5LANnysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77567505"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="77567505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 23:13:33 -0800
X-CSE-ConnectionGUID: LzESY7pmS4i10XmDgs6cYA==
X-CSE-MsgGUID: owCWujKTTbq+tael3oB1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="226200732"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2025 23:13:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRQ0P-00000000Eiv-3Vmv;
	Fri, 05 Dec 2025 07:13:29 +0000
Date: Fri, 5 Dec 2025 15:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/vmalloc.c:2805: warning:
 Function parameter or member 'flag' not described in '__vmap_area_range'
Message-ID: <202512051537.6pokkNV3-lkp@intel.com>
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
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: c39d9864ef4b6fafbed9a4d35cf4f6686aab9ca6 [2/2] anolis: mm/vmalloc: add two couples of vmalloc operations for virtio-ism
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512051537.6pokkNV3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051537.6pokkNV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051537.6pokkNV3-lkp@intel.com/

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
