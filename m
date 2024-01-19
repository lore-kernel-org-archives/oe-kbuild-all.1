Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCE63D568
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705707501; cv=none; b=VnV6RVBNT1q7XcK+1hv7t+4fYJFDOoRkWZcNMPYQMsBv5f1h6foNPAStoNhEWqmFUfton8sFN+/6cFjvyALXODz/UDnvwtzPxhIaW4qXyWP0mJZx9TIq2CSGCq9N9ZHMJhjWrj0m4PN9FYMwwIO5yBzGFzMapDKKbUtDVkLLh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705707501; c=relaxed/simple;
	bh=OjNkfxp0HSKMpRmrIyDUle+vo2ftWjBat5ZSFTkVl7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibVBgQ+FiJfwBbbpNjlR5iHuc85tWP5WzpJCtrvdSOizLs57mtUBOo/A40tg7ZYp851SJHnrKI7NufMSr/tKSThKJmSd5DdQbDksDduJi8YLS3d58EdU0BOP///iNTs0BWFhMBdRXnpY6zj0SBbtfCpfrGHA+zMIG1tx10IV7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeXDrAXW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeXDrAXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705707499; x=1737243499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OjNkfxp0HSKMpRmrIyDUle+vo2ftWjBat5ZSFTkVl7s=;
  b=UeXDrAXW+uXDFuWyEt3ISe/9Vt9EQFbUHPemgBhpCL39OZTVrbWLaXbO
   Q0kfvuGBdQGd4rZsAoqr3Oe90I4ApiguDaOj2QArfb7x4rQf+uoJxCejC
   KUX2Zmgb/ztfPKgFrfSkdFa0uA6pHcfvLtolNetiISfzB8mm2RS1izXaz
   qKSfEL1siE191DfmvWX3rnqlF+46BcXo+LK4zFNri3fPT2TB+h31H8dv2
   iektDLVeYIqbkbd6mngp5Ah4dk3xPoIGeUPka47Gra0Iz8A0HGxEusPPz
   XlvGvDezXAykXYVWDNjmt4HhZmeFJFufPJOpHJhpDGbzjpNaFiAn734ra
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="751688"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="751688"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 15:38:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="855452103"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="855452103"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2024 15:38:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQyRD-0004VE-1e;
	Fri, 19 Jan 2024 23:38:15 +0000
Date: Sat, 20 Jan 2024 07:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22464/30000] mm/hugetlb.c:2216:9: warning:
 variable 'gfp' set but not used
Message-ID: <202401200745.JL37noPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   26f718c6e41b3a8a59f843439fa6f2f6816427d8
commit: 27a782f719fdab073c5b0e19764fad1f93cddd00 [22464/30000] mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY
config: x86_64-buildonly-randconfig-002-20240114 (https://download.01.org/0day-ci/archive/20240120/202401200745.JL37noPA-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200745.JL37noPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200745.JL37noPA-lkp@intel.com/

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
