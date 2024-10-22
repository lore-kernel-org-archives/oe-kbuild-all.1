Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC922083
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587696; cv=none; b=eeCnqUjyIfR9sHjKrqHYwbQrJbPAHodZn2eI4Y3fo4S4MYBSGCPTreckDvwDIaOpUi24I/u8ijmkONQNaSwTZc76LyhFvbw/OsVG7ZQMD44EPTn4mThd3+SkD8t554OmdcLnsO3rqZaY04Q5HhfIk03HeTrWIdBCU5cyP+Fdw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587696; c=relaxed/simple;
	bh=4MR9JVswqd8GjaY+AVVm995ktqlSfN3gdjNgBa3Ckb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXV3ZNznhdXlL3Zyaeg5ReGoT4Pi1GPp9hj2bX/Ka7JpA7IzVeA1BC3y+ug1nGqlwR7gGNz1D8hnReK/Sx+Xs8sSbbFCv7p8oje1QsvJsuRm8iWpeEMFp5CxwbAxIK7ZTY1BR+JFGyDwoz6MoICmlZROldUgUrLs4Jejqogqm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL6BsHKk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL6BsHKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729587694; x=1761123694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MR9JVswqd8GjaY+AVVm995ktqlSfN3gdjNgBa3Ckb8=;
  b=eL6BsHKk7XlLrhpa6tzzMxHhKD/3i0wlRA94E83m0oyLfSWBfNwSYpyq
   fzcb5hnwKAWel+rW7JKr8z6cKdgmtr0D3xE/69Re+e3rFI65ZFViEkiML
   0iCDIwO9mFz7L4Mxd/qJAEJZn/QxR4Z0R0O5JDc8H+oad/G3eeipVXy8J
   g5M24StEWCdQI77mEzB0iGmLYXRx9DAF+PFvowpdXlab1FagQllKKMBMc
   scY47xgIPdpuwjQcEzU8p3hcwW+b7ig0IPEU+tkB/8ILiXwrkLhg/6R+Z
   Jy6Zbzag6dphDd0dEiviWoVBJIhkNraKXYjNVV7l5sNg8nv1mh3B2Z6uR
   Q==;
X-CSE-ConnectionGUID: XO8UcBEOQGqBTw0UlO2Pdg==
X-CSE-MsgGUID: EKtJ3bXQTcqeYVaA5y2TyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40495089"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="40495089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:01:31 -0700
X-CSE-ConnectionGUID: XwcddtemQ3StZuuKfPyMRw==
X-CSE-MsgGUID: R5GmT0+tR36CegPr9MkG8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="80608511"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 02:01:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3AlZ-000TMD-0l;
	Tue, 22 Oct 2024 09:01:25 +0000
Date: Tue, 22 Oct 2024 17:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 227/2444]
 arch/x86/include/asm/pci.h:133:16: error: implicit declaration of function
 'to_pci_sysdata'
Message-ID: <202410221651.jZxi0clr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: fc44080b66a3ac9b116095ee90038760588c21a9 [227/2444] x86/PCI: Add to_pci_sysdata() helper
config: x86_64-buildonly-randconfig-002-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221651.jZxi0clr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221651.jZxi0clr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221651.jZxi0clr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pci.h:1810,
                    from arch/x86/mm/init_64.c:26:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
>> arch/x86/include/asm/pci.h:133:16: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     133 |         return to_pci_sysdata(bus)->node;
         |                ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:133:35: error: invalid type argument of '->' (have 'int')
     133 |         return to_pci_sysdata(bus)->node;
         |                                   ^~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pci.h:1810,
                    from arch/x86/mm/pageattr.c:16:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
>> arch/x86/include/asm/pci.h:133:16: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     133 |         return to_pci_sysdata(bus)->node;
         |                ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:133:35: error: invalid type argument of '->' (have 'int')
     133 |         return to_pci_sysdata(bus)->node;
         |                                   ^~
   arch/x86/mm/pageattr.c: At top level:
   arch/x86/mm/pageattr.c:308:6: warning: no previous prototype for 'arch_invalidate_pmem' [-Wmissing-prototypes]
     308 | void arch_invalidate_pmem(void *addr, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pageattr.c:335:6: warning: no previous prototype for '__cpa_flush_tlb' [-Wmissing-prototypes]
     335 | void __cpa_flush_tlb(void *data)
         |      ^~~~~~~~~~~~~~~
   arch/x86/mm/pageattr.c:1931:5: warning: no previous prototype for 'set_memory_nonglobal' [-Wmissing-prototypes]
    1931 | int set_memory_nonglobal(unsigned long addr, int numpages)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pageattr.c:1937:5: warning: no previous prototype for 'set_memory_global' [-Wmissing-prototypes]
    1937 | int set_memory_global(unsigned long addr, int numpages)
         |     ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pci.h:1810,
                    from include/linux/bcma/bcma.h:5,
                    from drivers/bcma/bcma_private.h:9,
                    from drivers/bcma/scan.c:9:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
>> arch/x86/include/asm/pci.h:133:16: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     133 |         return to_pci_sysdata(bus)->node;
         |                ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:133:35: error: invalid type argument of '->' (have 'int')
     133 |         return to_pci_sysdata(bus)->node;
         |                                   ^~
   drivers/bcma/scan.c: In function 'bcma_erom_get_addr_desc':
   drivers/bcma/scan.c:222:34: warning: variable 'sizeh' set but not used [-Wunused-but-set-variable]
     222 |         u32 addrl, addrh, sizel, sizeh = 0;
         |                                  ^~~~~
   drivers/bcma/scan.c:222:27: warning: variable 'sizel' set but not used [-Wunused-but-set-variable]
     222 |         u32 addrl, addrh, sizel, sizeh = 0;
         |                           ^~~~~
   drivers/bcma/scan.c:222:20: warning: variable 'addrh' set but not used [-Wunused-but-set-variable]
     222 |         u32 addrl, addrh, sizel, sizeh = 0;
         |                    ^~~~~
   cc1: some warnings being treated as errors


vim +/to_pci_sysdata +133 arch/x86/include/asm/pci.h

   128	
   129	#ifdef CONFIG_NUMA
   130	/* Returns the node based on pci bus */
   131	static inline int __pcibus_to_node(const struct pci_bus *bus)
   132	{
 > 133		return to_pci_sysdata(bus)->node;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
