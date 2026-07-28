Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE044BC9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270489; cv=none; b=IdgPDonS7TA0SiEG+3s8yxiQrQ7EUI9G8U1/5ITAJE4h9pMIFfZ46fqOuzG4TNpxXVoqZw97cPpH9RBxc/63hz/SLAx7xW9j8aieWKsM9LRyTs3LdnWCgU9QH1EuONQ/jLQRrpDN3+EnyqxoF7iTLgNsFbbFGYrI+b0AeOtxQVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270489; c=relaxed/simple;
	bh=UehfeGSumhp6ZB507kjm3Z6IlLnUKGbA3mV81IcCfw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uj99v7qOfTAVHJcK9nIm8fl8/cD41UdqBvtdJEI1f3IuhFW+RPzynFD7Wy3g2Hw5AAkE1IlVBwZItMm6KGCOiF4esiog2F50RnXpHyKB0+T4XU5JecTqDHywM3Q8VXJ4yQe258qPA03e2COwCFgdqQPbfuDD/rJWcL5ugbzdT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amHdnRtv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amHdnRtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785270487; x=1816806487;
  h=date:from:to:cc:subject:message-id;
  bh=UehfeGSumhp6ZB507kjm3Z6IlLnUKGbA3mV81IcCfw4=;
  b=amHdnRtvVz+IZvdiCnzaOY+tx4aMVu6UB37mtfRV7HOeYZRAJG+0ur/+
   UOnHqRk/9IL2AxgK1ANYlwK0L84EKbY4xfcc1U9bviH45rtVzlM5/TDfz
   HiCK5nIl8NT4XcF3TTYg5Rb0GtfhWov6PuWvDXmska2Hj76yUENO0hsN3
   FN+f6kmwcU2NbSEvMiXEQApWO6s5GjiacxdoWOSBJXbFbdHsGxDag+uCM
   FoOAr0LS8Q4Ksa4j0Z2Kfosck/9zw4En0Ap4oUl9vf5Dl1HszG9cRcTE+
   I9dCU9jkCcAIFAyzaw0owYd/V5EIdepS511A2xmGinowpTvIJR4oK0hh0
   A==;
X-CSE-ConnectionGUID: rFhb6wBBSFe6/gs0iKwtgw==
X-CSE-MsgGUID: G31i/hhuReSOed+9jgr4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89691348"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="89691348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:28:07 -0700
X-CSE-ConnectionGUID: 8xOOq6yTQ/i1aS0HeN+jDA==
X-CSE-MsgGUID: hLpD7tIMTiGJ4DPAL7WO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="298027701"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 13:28:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wooPD-00000000el5-1Nos;
	Tue, 28 Jul 2026 20:28:03 +0000
Date: Wed, 29 Jul 2026 04:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma/mm/mem_phys_layout.c:151:16: warning: mixing declarations and
 code is a C99 extension
Message-ID: <202607290450.JmyQtPQt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: b6f7366938c4d377ba5179501f82eea795a17bc2 [35/35] ANDROID: mm: Calculate struct page address given the PFN and vemmap
config: x86_64-randconfig-161-20260728 (https://download.01.org/0day-ci/archive/20260729/202607290450.JmyQtPQt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290450.JmyQtPQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290450.JmyQtPQt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:356:9: note: previous definition is here
     356 | #define __SANITIZE_ADDRESS__ 1
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
