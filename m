Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A827F747
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364104; cv=none; b=IIsGEq2nXKS/ftOoynsP5XtOYqEbaFAWSF5AI9tYOy8DaCWAjblFL60kn1nQdrkMSiCIX30QNXoLSmn332xgaNRFssgUyZDktSu8HYqvnV0a6wEugUbnBxP0C1qxDQNegOE5pBB/fParpXvQxjR5DYOVnnqZiwvid1/pr1rLl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364104; c=relaxed/simple;
	bh=7tVQ6vuc/eoQfl7EVYqPnhK96DwYuAwE7OatFey1MoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJabfUwluGSJ9J5bdml/XhBn7bXeVk2x9y/MoAetrQG+t8x10CKkqrwl+Q8h3yH8O3F3Ag5DjjEBQf5HGgGQz2M7mTdNEcECvbGrUEMQrLrQfX8eH6fLQt3GCjiq49Vyk4R+CGUo21Ue+fejBO9l98c28cVtnc2s3Rv1kOqj06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDSCNYl4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDSCNYl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364103; x=1779900103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tVQ6vuc/eoQfl7EVYqPnhK96DwYuAwE7OatFey1MoA=;
  b=UDSCNYl4Gdu6LLZ5lilh2PxPA2qwL+tBvsFiDe6Hm2XRrK82EDaT1rlC
   q1MnGiVC6Gcsd5wslzamACgAT/cgaUDPPCE/WDTrQy7Y1OUHV8/k+mzFO
   7pgLsOShCJMQxb703dTwp3ZVNgpmm7T8lovV7gcGOrO71Al6qQuJu/Gbc
   gfOw2a0L4HYGREV28WI+ZoMRUExVwsuEgE6mYfvI62jSMnf7U9I9AV1ZY
   LfoaHziLmNLpkH/+MgGjRLao6UNnFE+t6JrNQZGSpc41WEvv3PFcqKNsw
   w7R44rjPN4GLUhitCaP3N9BIfRYNKxVy/C7vt48z+Ub1ih/hIqvERUhZ7
   Q==;
X-CSE-ConnectionGUID: IupPCVTYTDC5fan3QA6vMw==
X-CSE-MsgGUID: CYbogAezQ5GAmyzKKNYgSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50061673"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50061673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:39 -0700
X-CSE-ConnectionGUID: 53/+WS4OSIagaM4I9Nju4Q==
X-CSE-MsgGUID: 6s0CMW3fSHSEN0hWqN8gJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143338811"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TM3-2Z;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2928/2928] mm/hugetlb.c:2216:9: warning:
 variable 'gfp' set but not used
Message-ID: <202505280024.8UbNlKSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   45e99bc87727bf5be83ac512da687f7742d4a8fb
commit: 27a782f719fdab073c5b0e19764fad1f93cddd00 [2928/2928] mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY
config: x86_64-buildonly-randconfig-004-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280024.8UbNlKSa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280024.8UbNlKSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280024.8UbNlKSa-lkp@intel.com/

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
