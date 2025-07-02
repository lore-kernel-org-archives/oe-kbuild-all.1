Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B91E7C18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440548; cv=none; b=VdxL00wJnH9mLzS9zjA6EyEo5r00nG0Y6ZEKUVrUwC5p4jFKG0ZHhIq+Kw7PLGEdLvA2S0kU33jisG71R1PjLAKfn/aII8M+sLIF0EIxAlmp+aY7bwfgrM0ITMMok8U1d+VGwB4BEi1Q7uH8CX51UL0BBEFUyjMLxcE7yFXFYFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440548; c=relaxed/simple;
	bh=KaYC/BnRJQ/ql2lfpXT+YTpNzLd0eAPKNQpC3M/5quI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtpFnHVGqWUNcHIHkkv8XH1ryoPmKF6/6Yrm+/IfGBIabgvr/UMb91WQ3Mpj5lxX4Yp7g6OEh/Psamu451i6UJn3loalONK7Fbtr0vo8EBxrm8+/OQhVG4moKQOTcDGfHAO8aYTwCkjrO6ktRgjyY8XiMc1l7WaiBs1qokeYMZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF+IlqLs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF+IlqLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751440546; x=1782976546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaYC/BnRJQ/ql2lfpXT+YTpNzLd0eAPKNQpC3M/5quI=;
  b=UF+IlqLs95qVD9PiUEKNAxLr1Q3OwH64v+2JeYaWFo8/oc05UicuU8iq
   x3nt/y8oLvmsrSQB0xqsLYBrtGsX8LmzWdrrggb2MGG9QAatKwTrHBVbH
   rENMS/wtTHK2kj2WMfWy/w3ZrXXN9LJXPOEcnho11mkoVaKpVyNXK4syZ
   EL+kfS3qKqivapIhQlUHdBJRfw9dtLXNa/MCPrVi9Wan5KwIj70AM9fN/
   fCTSWZK1joo0rMEIvbIVndqQcCPjv0QAb8z0UqDWDWWecMz1MN0a3Wxow
   HxN954sn0XvdC5a/SyLweANrPuR8fQ0d419XrZWOW6C6id7lvazcWEb+q
   w==;
X-CSE-ConnectionGUID: 0eN3/u77RayFWrMLl6dgQw==
X-CSE-MsgGUID: Pqz/2+OMQh+WzUyxW9GINA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53438967"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53438967"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:15:46 -0700
X-CSE-ConnectionGUID: +q9paK9vS5CPRJRVQtstUw==
X-CSE-MsgGUID: HSDYEWOmTK+APedX7bXu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154153401"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2025 00:15:45 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWrh0-0000Er-1m;
	Wed, 02 Jul 2025 07:15:42 +0000
Date: Wed, 2 Jul 2025 09:14:58 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] mm/hugetlb.c:2216:9: warning:
 variable 'gfp' set but not used
Message-ID: <202507020936.wpYnAMsn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fdf755b0cabc80fc65da83c9da27ec2cee144dc
commit: 27a782f719fdab073c5b0e19764fad1f93cddd00 [2882/2882] mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507020936.wpYnAMsn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020936.wpYnAMsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020936.wpYnAMsn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:2216:9: warning: variable 'gfp' set but not used [-Wunused-but-set-variable]
    2216 |                 gfp_t gfp = gfp_mask | __GFP_NOWARN;
         |                       ^
   1 warning generated.


vim +/gfp +2216 mm/hugetlb.c

  2200	
  2201	/*
  2202	 * Use the VMA's mpolicy to allocate a huge page from the buddy.
  2203	 */
  2204	static
  2205	struct page *alloc_buddy_huge_page_with_mpol(struct hstate *h,
  2206			struct vm_area_struct *vma, unsigned long addr)
  2207	{
  2208		struct page *page = NULL;
  2209		struct mempolicy *mpol;
  2210		gfp_t gfp_mask = htlb_alloc_mask(h);
  2211		int nid;
  2212		nodemask_t *nodemask;
  2213	
  2214		nid = huge_node(vma, addr, gfp_mask, &mpol, &nodemask);
  2215		if (mpol_is_preferred_many(mpol)) {
> 2216			gfp_t gfp = gfp_mask | __GFP_NOWARN;
  2217	
  2218			gfp &=  ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
  2219			page = alloc_surplus_huge_page(h, gfp_mask, nid, nodemask);
  2220	
  2221			/* Fallback to all nodes if page==NULL */
  2222			nodemask = NULL;
  2223		}
  2224	
  2225		if (!page)
  2226			page = alloc_surplus_huge_page(h, gfp_mask, nid, nodemask);
  2227		mpol_cond_put(mpol);
  2228		return page;
  2229	}
  2230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
