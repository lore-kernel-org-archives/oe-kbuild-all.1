Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6E37F8CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771509; cv=none; b=dAZdSWc/SBwV8YHKi2VTpTOyxKz432/2XXe/IvP7oS9kqG88ymK3vW6fWj6VP0zjughvQ57zLsAp32m3c+ywIcJOEUGhWbVnn5mqZGrKkujmbvtGBeTQ4TPqc/e2psCvzZbxjQ8OGsNKGATcITv8ZSfU7PXXaP5tbu2/D8FF2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771509; c=relaxed/simple;
	bh=LYs0wpbMJHtEtmUd4Ld9gnRvBQP88SfhISzVvE8kcrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hSvjLbjy+G4P3Q5PTBBvub4hiUBE0uOeOw2Gdy5+LYMb5UGSxc5uXS/bBeScd44nB38WBiIAMjATBs4TdXoH8HyakU8DmN8FfYog3fui1tPT+dJGr9gSlCTTc0fih2LL/Ml4S24aHlRXIL6aIP2pwEDX3cBldguP+WWgryzUS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hqggk5Pb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hqggk5Pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773771509; x=1805307509;
  h=date:from:to:cc:subject:message-id;
  bh=LYs0wpbMJHtEtmUd4Ld9gnRvBQP88SfhISzVvE8kcrQ=;
  b=Hqggk5PbNT5DJR8RRDjkK9LgNsxlPnp7DzdCYRUyAXybkWk6k2Sy1Y0q
   Fr9pzNEoGc7QbSqWqmsltbGAMSOl+ksXHeO2nWkL2oe3w6pz2wcDXbCc5
   K3uudCqJ6RGrxBL6dQ2ermNmealTLMq4CINNPg1bF96nlm1ygOWDtp3sJ
   aNy/Hz0HXfwO4nwAwn43MNIkREbvqBmZ/3vHAAAjSVGXUbyFatrXQK7fq
   OzCw8YawVJ2SJjeeA2tYIu7AKjayF7uyQihhX7geRGr6ATT+ZJpOLrjT+
   VCEpF2A4XYOM0Vc13GNbOsWjj9PveskgQA5tx565JemBh7UTj4MS+3MGn
   g==;
X-CSE-ConnectionGUID: PlNmjgthTi+wfetVSBe1xA==
X-CSE-MsgGUID: euYC0b8OQRO12WXXkgiiTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86288133"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="86288133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 11:18:28 -0700
X-CSE-ConnectionGUID: 5vPkjq2UQXWO9lMPGRdvtg==
X-CSE-MsgGUID: NGlWBsITQdORQmiXYvpkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221421888"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2026 11:18:26 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Yzn-000000001mf-3Wz0;
	Tue, 17 Mar 2026 18:18:23 +0000
Date: Wed, 18 Mar 2026 02:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma/mm/mem_phys_layout.c:151:16: warning: mixing declarations and
 code is a C99 extension
Message-ID: <202603180241.H8swoYyJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   8404bec96d8beeedc68b62c9235f1ac09495f9ab
commit: b6f7366938c4d377ba5179501f82eea795a17bc2 [30/30] ANDROID: mm: Calculate struct page address given the PFN and vemmap
config: x86_64-buildonly-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180241.H8swoYyJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180241.H8swoYyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180241.H8swoYyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/cma/mm/mem_phys_layout.c:151:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     151 |         unsigned long last_pfn = pfn - 1;
         |                       ^
   2 warnings generated.


vim +151 drivers/cma/mm/mem_phys_layout.c

   116	
   117	static void print_page_info(void)
   118	{
   119		unsigned long pfn;
   120		int valid = 0;
   121		int invalid = 0;
   122		unsigned long num_physpages = get_num_physpages();
   123	
   124		// Start address as per DTS memory@40000000. The first valid PFN represents
   125		// this page frame.
   126		phys_addr_t start_addr = memblock_start_of_DRAM();
   127		unsigned long start_pfn = PHYS_PFN(start_addr);
   128	
   129		for (pfn = start_pfn; pfn < (start_pfn + num_physpages); pfn++) {
   130			if (pfn_valid(pfn))
   131				valid++;
   132			else
   133				invalid++;
   134		}
   135	
   136		pr_info("get_num_physpages() = %lu", num_physpages);
   137		pr_info("valid %d, invalid %d, physpages %lu", valid, invalid, num_physpages);
   138	
   139		pr_info("Start PFN");
   140		print_mem_model(start_pfn);
   141		pr_info("End PFN");
   142		print_mem_model(pfn - 1);
   143	
   144	#ifdef CONFIG_SPARSEMEM_VMEMMAP
   145		// CALCULATE STRUCT *P GIVEN THE PFN and vmemmap address
   146		pr_info("First struct page starts at: vmemmap        [mem %#010Lx]\n",
   147				(unsigned long long)vmemmap);
   148	
   149		// How to calculate Physical Address of the Page Frame and the struct page
   150		// given the PFN.
 > 151		unsigned long last_pfn = pfn - 1;
   152		struct page *page = vmemmap + last_pfn;
   153		phys_addr_t addr = last_pfn << PAGE_SHIFT;
   154	
   155		pr_info("Calculating physical address given vmemmap and PFN %10llu == %#010Lx",
   156					(u64)last_pfn, (u64)last_pfn);
   157		pr_info("    PFN: %10llu == %#010Lx  struct page[mem %#010Lx], PHYS[mem %#010Lx]",
   158				(u64)last_pfn,
   159				(u64)last_pfn,
   160				(u64)page,
   161				addr);
   162	#endif
   163	}
   164	static int __init mem_phys_layout_init(void)
   165	{
   166		print_ram_info();
   167		print_node_data();
   168		print_pfn_start_address();
   169		print_pageblock_info();
   170		print_page_info();
   171	
   172		return 0;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
