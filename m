Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78023506A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 04:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761796821; cv=none; b=iT5Bto78yimx1jsu/G304PydCzjF+7g080IEExvpcZxfnslyJrH0EFNOfcpQI7u1aaLhQ44GR6N/S0+zTOgAMVQ+ZgOgOvqJxKiQP3HYzdCce8Ts+I85CigiW7GUvVJcZbwS6rTIpcAVvWzWQpr2S7bRdLb0WRI3aeZ6tgjjraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761796821; c=relaxed/simple;
	bh=VJeAxl5Tp3k0ZENuH3BeWprswZnnb7ORKTaYjWQe1gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aGZcGLr4w7befcuFwLLV7YJDaR195n00fICMXesOy+/Cp373elfe3YeADjzfE+HZv3g/g83dwATJrSn5fa0Ukz/Nh596Eun0WLxldJkG5RvLeRLksUmQwsQOzZE5Uqgx9ysAclGhnqdNOc6UO05GTQl2cBvPGditjdnxm5E1zG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tx6Yfyw/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tx6Yfyw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761796820; x=1793332820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJeAxl5Tp3k0ZENuH3BeWprswZnnb7ORKTaYjWQe1gg=;
  b=Tx6Yfyw/tZ2fDNpXU15nQuYvmFEGqudpUZoGwbY+x8gnxCmsGN2AOl/O
   fiMRXqpYoTCoJofP0MEkVNKT5qREbX+/t5g9sM7vhcmGfnHLWfWDfNiOi
   PC/LpRd+VBaL8UfGqCQUDOlkruZ81tgBQCNan7cGrD+hZ6ztBWVSm1/49
   tbjGUTk4tBCEyGW7c4dwnm+/1LLZ0ZKMybIfIByAulVXjK/GD7F0ociyZ
   vF3upWjLWB+ZfhL4cIC4WqF19inXUMQXdvEeQ7UJHpKXESe6+v/FPe0F4
   455ykKdQIxGF6yzyxsaJ7pf3bpFm1TGToDPVtf6kmhrTWIBFB7j6Bpzgf
   Q==;
X-CSE-ConnectionGUID: wJk5AobbS9iEdInwA48JAw==
X-CSE-MsgGUID: cyDuZN8vR5SXSIDU1fDLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67764511"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67764511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:00:20 -0700
X-CSE-ConnectionGUID: qdwWyVRMTPmPFerLBQPddQ==
X-CSE-MsgGUID: ae5Ju/7gSYeA/cv6ZLPP5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="209427348"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2025 21:00:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJpd-000LRI-1d;
	Thu, 30 Oct 2025 04:00:14 +0000
Date: Thu, 30 Oct 2025 11:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 22/22]
 drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and
 code is a C99 extension
Message-ID: <202510301134.Nna3byKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   9eddaf6198dd154a6563d1ed1701c46372ad997d
commit: 9eddaf6198dd154a6563d1ed1701c46372ad997d [22/22] ANDROID: mm: Get page usage stats for the physical pages
config: arm-randconfig-002-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301134.Nna3byKE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301134.Nna3byKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301134.Nna3byKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cma/mm/mem_phys_layout.c:189:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     189 |                 struct page *page = pfn_to_page(pfn);
         |                              ^
   1 warning generated.


vim +189 drivers/cma/mm/mem_phys_layout.c

   166	
   167	static void print_page_flags(void)
   168	{
   169		unsigned long pfn;
   170		int valid = 0;
   171		int slab_pages = 0;
   172		int buddy_pages = 0;
   173		int guard_pages = 0;
   174		int page_table_pages = 0;
   175		int userspace_map_pages = 0;
   176		int pinned_pages = 0;
   177		int compound_pages = 0;
   178		int head_pages = 0;
   179		int tail_pages = 0;
   180	
   181		phys_addr_t start_addr = memblock_start_of_DRAM();
   182		unsigned long start_pfn = PHYS_PFN(start_addr);
   183		unsigned long num_physpages = get_num_physpages();
   184	
   185		for (pfn = start_pfn; pfn < (start_pfn + num_physpages); pfn++) {
   186			if (!pfn_valid(pfn))
   187				continue;
   188	
 > 189			struct page *page = pfn_to_page(pfn);
   190	
   191			valid++;
   192			if (PageSlab(page)) {
   193				slab_pages++;
   194			} else {
   195				if (page_has_type(page)) {
   196					// The struct page->page_type is used instead of _mapcount.
   197					if (PageBuddy(page))
   198						buddy_pages++;
   199					else if (PageGuard(page))
   200						guard_pages++;
   201					else if (PageTable(page))
   202						page_table_pages++;
   203	
   204				} else {
   205					// The struct page->_mapcount is used instead of page_type.
   206					userspace_map_pages++;
   207				}
   208	
   209				if (PagePinned(page))
   210					pinned_pages++;
   211	
   212				if (PageCompound(page))
   213					compound_pages++;
   214	
   215				if (PageHead(page))
   216					head_pages++;
   217	
   218				if (PageTail(page))
   219					tail_pages++;
   220			}
   221		}
   222	
   223		pr_info("valid pages          = %09d", valid);
   224		pr_info("slab_pages           = %09d", slab_pages);
   225		pr_info("buddy_pages          = %09d", buddy_pages);
   226		pr_info("guard_pages          = %09d", guard_pages);
   227		pr_info("page_table_pages     = %09d", page_table_pages);
   228		pr_info("userspace_map_pages  = %09d", userspace_map_pages);
   229		pr_info("pinned_pages         = %09d", pinned_pages);
   230		pr_info("compound_pages       = %09d", compound_pages);
   231		pr_info("head_pages           = %09d", head_pages);
   232		pr_info("tail_pages           = %09d", tail_pages);
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
