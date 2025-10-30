Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63429D28A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 01:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761788609; cv=none; b=Dcksm2Aa9UZajX9ZH+Se/yZfWxGMIFuoTirekfp4z2yUrQl8X+n8z0NhFHP1zbCu478p3RsnRRjcVTpqqxm40Fw2vtu5AqV+fbINN6oOCqUhE5xbJJ+N73r9LlQpTRqiMFvQuaTr538xEpOqKiaUS76pkyzsigNYFGzwtQuLp0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761788609; c=relaxed/simple;
	bh=6tBY3YZH/6y5my5JOBxw7TLCOTz5JOYQEVn57vx9Yqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAAnaUsQa05HTQ6piWkCBGeEz25SrjxU+UOroQ+IJr07V2hRF5a2ZGu7WapmUyNhyl1OKZeb9RdDb2fRsx03UrnHS4ZJLCaHwL+s+4dzl0CRIHlx4ebI73vf6YJS9ZUd5TYKnPWN0b/hESjdjUE/jiKkYQeNFDDOJxaxannPUYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krHVAUwG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krHVAUwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761788608; x=1793324608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tBY3YZH/6y5my5JOBxw7TLCOTz5JOYQEVn57vx9Yqw=;
  b=krHVAUwGPG8LiJTStU38wSRHgyKNzDzCEbikR49V+BNKlGjYKOPeKaZU
   IJiPuhk4n5SyNL47DGWmfcdfwTSEjmWDo+rinej1UQdfV2kZVXPvgsYgr
   8E8mGlqad8s8wZtqYR9Eh8/6w0iv9VoTlADnBh7LF2sLxr6ZWCrZcPcxv
   FgLwXrPAW2d+nILJgmxUGYIckJRz9ZzgLPXze4FQdJqHvvZksftl2Z1xP
   9BhST5RAx8Vx/C5ccFY5SrflxC+4r7Q+/QTg4f8V5QC+h26P1tnYRvwBP
   +Tq9vz9AOx6JEDfH1YWQjJreTfaCnzIVX6ItdTTUA3o0IxJ56x9Ll2+xY
   Q==;
X-CSE-ConnectionGUID: wj2X+bEET+6G4BmLLw4U8w==
X-CSE-MsgGUID: E6NsnExySXyHXSe73+jQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63852994"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63852994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:43:28 -0700
X-CSE-ConnectionGUID: ksP2VgAWReKo/AC6oRQqKA==
X-CSE-MsgGUID: xo5SV4k0TAOVitBbbvatYg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 18:43:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEHhE-000LLw-00;
	Thu, 30 Oct 2025 01:43:24 +0000
Date: Thu, 30 Oct 2025 09:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 22/22]
 drivers/cma/mm/mem_phys_layout.c:189:3: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202510300933.5ml0YbpP-lkp@intel.com>
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
config: arm-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251030/202510300933.5ml0YbpP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300933.5ml0YbpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300933.5ml0YbpP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/memblock.h:13,
                    from drivers/cma/mm/mem_phys_layout.c:14:
   drivers/cma/mm/mem_phys_layout.c: In function 'print_node_data':
   drivers/cma/mm/mem_phys_layout.c:72:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      72 |    (unsigned long long)first_page);
         |    ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
     422 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     523 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:71:2: note: in expansion of macro 'pr_info'
      71 |  pr_info("First VALID struct page starts at: pfn_to_page(start_pfn) [mem %#010Lx]\n",
         |  ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'print_pfn_start_address':
   drivers/cma/mm/mem_phys_layout.c:94:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      94 |    (unsigned long long)first_page);
         |    ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
     422 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     523 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:93:2: note: in expansion of macro 'pr_info'
      93 |  pr_info("First struct page starts at: pfn_to_page(0) [mem %#010Lx]\n",
         |  ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'print_mem_model':
   drivers/cma/mm/mem_phys_layout.c:115:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     115 |    (u64) page,
         |    ^
   include/linux/printk.h:422:19: note: in definition of macro 'printk_index_wrap'
     422 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:523:2: note: in expansion of macro 'printk'
     523 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   drivers/cma/mm/mem_phys_layout.c:112:2: note: in expansion of macro 'pr_info'
     112 |  pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
         |  ^~~~~~~
   drivers/cma/mm/mem_phys_layout.c: In function 'print_page_flags':
>> drivers/cma/mm/mem_phys_layout.c:189:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     189 |   struct page *page = pfn_to_page(pfn);
         |   ^~~~~~


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
