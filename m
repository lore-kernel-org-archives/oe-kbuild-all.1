Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9517BB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714379859; cv=none; b=ZSyFVYB/v7q0GVx159M6QZaPFFYNmTJg7TrJb+J3zsE5V/6MXm2ztfAEmPcFS5ZGdwKpSIaAtTEA2hUR9OZqiuNjm9WZESWks5X8Oj6kZjS/yDtqnX4Uu4q8OC67xpLArxKy+5mUbVX5aPYV7dHF8xkBQDMaYyMO1DrMMAxK/a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714379859; c=relaxed/simple;
	bh=XMbalx+UTd6RAcUMga9l2jM6+4NaDXuRIQqgVTeZI6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4wAfecKXZNFwfyV/80eKuF8R2XRVjshay+3Y7DpaXN4wU1bVhwxhg1n5lKmmlfEAQi1ql1pfyQLoKE3WdbtUZPer3QN5q65Q0hwxc+aVeVGr7WKbGNrsIJ8h0skOjWeSPu1ZU9d5vIi5dxLD5tZWtTTa6oUqX/4z0J2R6TaJoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPzqQXiU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPzqQXiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714379857; x=1745915857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMbalx+UTd6RAcUMga9l2jM6+4NaDXuRIQqgVTeZI6k=;
  b=OPzqQXiUJbFnNtP6fKUmICBHjBBWYdV66ajyol7RSBr6p0f42jpPzcnU
   H3x7pmh1Mi9/ODsLICJagCtx7/fvlF+rIjdflV67GA6w7wJx7RDSjDOUi
   6vXfgTqqds/QIlKhRUbYzuagpf+7bEu9asfK9HXmv7pazopTt4CBpMA/g
   2jLJirJjY5LQnDtFAvttXtoT1QZglhkMRJ1zqKT2W9zS7b+ct7C0KUNH5
   sU38+azurg5bnoCnTmA0AoMkGd6xMLB0H8Uph99oCZa2WiBRxXV/lIOPx
   M9ou4FuzbfMUs8Zaf0NZLfGoJ1bTJw9Dtyu9FMrHVr93+zAYa8dGek8Iu
   A==;
X-CSE-ConnectionGUID: iuFtZdhHSyiR5facOUwmuA==
X-CSE-MsgGUID: xC1VxO9XRm2XJ7B4/Nz51w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21182417"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="21182417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:37:35 -0700
X-CSE-ConnectionGUID: 273TDQzQRoapoUATb03Whw==
X-CSE-MsgGUID: erS6P+2QTX6OAr9gKjSljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25919241"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 01:37:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1MVv-00073z-16;
	Mon, 29 Apr 2024 08:37:31 +0000
Date: Mon, 29 Apr 2024 16:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3829/29983]
 drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of
 function '__ioremap'; did you mean 'ioremap'?
Message-ID: <202404291646.xCBDx6TC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haiying,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: e621849d1464f98a17ed9a39307cc14fc210e8d3 [3829/29983] soc: fsl: dpio: change CENA regs to be cacheable
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404291646.xCBDx6TC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291646.xCBDx6TC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291646.xCBDx6TC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
>> drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function '__ioremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                         ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/paravirt_types.h:39,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/soc/fsl/dpio/dpio-driver.c:10:
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'PAGE_TYPE_BASE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:175:48: note: in definition of macro '__pgprot'
     175 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~


vim +32 drivers/soc/fsl/dpio/dpio-driver.c

    31	
  > 32	#define ioremap_cache_ns(addr, size)	__ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
    33	
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
