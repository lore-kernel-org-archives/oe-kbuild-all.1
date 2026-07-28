Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289ED3AE18D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261555; cv=none; b=RKoA/ZAK9vHUnSe9M5huAF4eNjfEodKlzO6LnXeq/HL8IhQsBCdSsrXjfAp03xL2EEsFZ8hS9LjAaRVxLWWVPJ2Ggl8MuNbW7IwFQtAtwp/Ps+zywUCaD5LIsIjseKw92Xr0SclJIoxI71fN+n8Q5a0ROskVwzdfeK1iPYFOkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261555; c=relaxed/simple;
	bh=qVvf/NAdLVFQiGuh10f0/vXBvr2JCiBa4dKi9BC4eng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCB5X/D9LU82N+h5iZfL+Mh62tk9crZbaY33q+aeqeki309cm8D3yuwiVKU1MhDvF63ixjNzh8zoZoNEDDZcLpY+2JYDXJOy0350GT0tmZI5vUW7ezYEqtrebmyz0uzlWbp5w2KLB4aKxyTu4r6QOym2PMEubH8OmDaMzPYaRks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZ1Dq6Us; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZ1Dq6Us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785261553; x=1816797553;
  h=date:from:to:cc:subject:message-id;
  bh=qVvf/NAdLVFQiGuh10f0/vXBvr2JCiBa4dKi9BC4eng=;
  b=YZ1Dq6UsZzxEW0ouhwQvvutIMpmeBaK5spKW3uYBXHLCOokvKWlgx5I+
   EEzBhE4ZdLzsHRwt0n9X1kQEnzqseqQMnXJUSVrdkgcP4IGpBHUKvhoxQ
   Ymy81s5xSKO7AWYubEwhN2kV7CXWritfVZ00mOSlZx911SFI8UPsnCs9A
   ccHxx1hz00gR0axEAj/zPfNmvMh0SLkhqbevEngkdF/mpct8u7aFzDTbZ
   F/RiFo1G9Cn/7TF6BO941scBPWQP41ukNScZbbQSybddn1deth83sUlfd
   GG9K7fRDmETdm5NfUzlyV08KL77mMkxLyoPXHcKjJ4o0Zdie/6hk0yn98
   w==;
X-CSE-ConnectionGUID: mZm3eVWuQD6x09OsEzdsyw==
X-CSE-MsgGUID: tvfyrwXZTq+qmK7AO0+glQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108655320"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="108655320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:59:13 -0700
X-CSE-ConnectionGUID: PnEYz3YFTWarsl8LWKp4Yw==
X-CSE-MsgGUID: ixn+qgcdQlyypX4mXCAgqw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 10:59:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wom56-00000000edD-2RRF;
	Tue, 28 Jul 2026 17:59:08 +0000
Date: Wed, 29 Jul 2026 01:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:151:9: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202607290034.iLGhlM4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: b6f7366938c4d377ba5179501f82eea795a17bc2 [35/35] ANDROID: mm: Calculate struct page address given the PFN and vemmap
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260729/202607290034.iLGhlM4U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290034.iLGhlM4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290034.iLGhlM4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cma/mm/mem_phys_layout.c: In function 'print_page_info':
>> drivers/cma/mm/mem_phys_layout.c:151:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     151 |         unsigned long last_pfn = pfn - 1;
         |         ^~~~~~~~


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
