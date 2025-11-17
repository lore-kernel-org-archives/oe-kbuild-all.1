Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A09191F91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362165; cv=none; b=OIPoFUQaI2IXLm+0YYcsVODFlXXO5VWX+mcan8YVyw7uLLsKuwAO7Q2b3CdIYqado5Kf+/OpD27p1C1Vh8Zoi6m6zCpmJW4KpAcprc1lO3GQIh0/xv9A1n6s2wJAUJUKe1os94K+msZRpKgV1H0jNXGE5eJVUOy6cfwhhI3jzhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362165; c=relaxed/simple;
	bh=hn+dHpJ/PX5gnK+D3UaLvxEPRSEOYJAo3fcFn8LG6wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNoGDez0k1U/gyBIWbhSyI7/o1a6XPtcekdeypsQMkp2PNXp6xL5XdDaQSB+4dAdJ5jnsS+vwz+fF9VjYHpoJmDe0K0b3mYYd62DHyYJZc7okmryvAJzyYm0hcWKqIUn9h7d6sigSRNYMPVgc8k+EJOvF6ODOeQ5JSp/9AFKTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOCbU5mB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOCbU5mB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763362164; x=1794898164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hn+dHpJ/PX5gnK+D3UaLvxEPRSEOYJAo3fcFn8LG6wg=;
  b=jOCbU5mB/Vzc5Mx7Pkwo5mPwca5GbwknlbH5kvptCLRy0ZYkQMS7qnEx
   bwpxVBwOAZFBQRdp0wJfJZH1REbumQCzqxdDG6ok+waVVrAmhTqmieTxp
   4PCjsDkqPFSzteGJ7REcs37BTUgH0ytFbOQFYGawP6VXxAt/kCGmepf0P
   y2/jXdnCj8XuBmGBUPXG2SDS4prBY8tGRzLB26Xqh9JHUTDWQeGa/tSNc
   SR0id4KN/kR/IivFlBWmaZ3z3st/zc/O5egvugNP67kM0bKYDVN3OW6yP
   363tJSWII/yz3qs6F1Lkddjbez/aFD3o2+Y9flZnTawjQVLuZgWNJZwDV
   w==;
X-CSE-ConnectionGUID: kuSZ7CUOT+2KhXQyho1OwA==
X-CSE-MsgGUID: cTtPHJe3QFq2RzIgKxh3Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82742134"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82742134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:49:21 -0800
X-CSE-ConnectionGUID: tXeyHgRvQJObyppjBJ7p5A==
X-CSE-MsgGUID: ndu37YH+RC6n2hksTaOq5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189668868"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2025 22:49:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKt38-0000EW-1Q;
	Mon, 17 Nov 2025 06:49:18 +0000
Date: Mon, 17 Nov 2025 14:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yin Tirui <yintirui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3198/3198] mm/memory.c:2802:5: warning: no
 previous prototype for function '__remap_pfn_range'
Message-ID: <202511171230.PQsrWhhz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9058fc5efa4aa44340385ca69fb4ef016931af50
commit: 923e224a12462d640fa37f3069c6bfafd378ac3b [3198/3198] mm: introduce remap_pfn_range_try_pmd() for PMD-level hugepage mapping
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171230.PQsrWhhz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171230.PQsrWhhz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171230.PQsrWhhz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:68:
   include/linux/migrate.h:102:2: error: expected identifier or '('
     102 |         { return -EINVAL; }
         |         ^
>> mm/memory.c:2802:5: warning: no previous prototype for function '__remap_pfn_range' [-Wmissing-prototypes]
    2802 | int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
         |     ^
   mm/memory.c:2802:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2802 | int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
         | ^
         | static 
   mm/memory.c:5614:17: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5614 |         int flags = 0, nr_pages;
         |                        ^
   2 warnings and 1 error generated.


vim +/__remap_pfn_range +2802 mm/memory.c

  2789	
  2790	/**
  2791	 * remap_pfn_range - remap kernel memory to userspace
  2792	 * @vma: user vma to map to
  2793	 * @addr: target page aligned user address to start at
  2794	 * @pfn: page frame number of kernel physical memory address
  2795	 * @size: size of mapping area
  2796	 * @prot: page protection flags for this mapping
  2797	 *
  2798	 * Note: this is only safe if the mm semaphore is held when called.
  2799	 *
  2800	 * Return: %0 on success, negative error code otherwise.
  2801	 */
> 2802	int __remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
  2803			    unsigned long pfn, unsigned long size, pgprot_t prot,
  2804				unsigned int page_shift)
  2805	{
  2806		int err;
  2807	
  2808		err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
  2809		if (err)
  2810			return -EINVAL;
  2811	
  2812		err = __remap_pfn_range_notrack(vma, addr, pfn, size, prot, page_shift);
  2813		if (err)
  2814			untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
  2815		return err;
  2816	}
  2817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
