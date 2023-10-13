Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9226E03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjpM4yZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697233075; x=1728769075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAKwgNs43BI70Ym7sP6xu/BARW+UkCzMJpz2dMkDWpo=;
  b=GjpM4yZI8+HPwJlhi9JNgNKH3i7PVA1fklXy/FT4Q8gggtG0HlDfaljd
   JFeymlHZHhwZK+IVTtn1vuaFGqdAUg1vykDIXyC6JrIg3PExuTdtvFrBB
   1bJX/EK+TLODNFoegpJ2BEO0Hd5KucEBXRyyhwZEOD3k0kqIk/jlyxBnH
   UC6hE607B7SPGuRYHha0v2I03xsxvuVp4qfDqQahiZJ73R655Gee0o9wM
   WwP6lIdsOMRScvaiWx1aodYU/bTIuNtmFwExlciChoXy2vuZfU7KA5cmH
   ZOhqi5Uggw29CXYv6gnwCAeMn8yGtg56uRuiTx6Xau/7E4VLv9yhNTV/s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388122845"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388122845"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758630177"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="758630177"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 14:37:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPqv-0005QG-17;
	Fri, 13 Oct 2023 21:37:49 +0000
Date: Sat, 14 Oct 2023 05:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4474/15768]
 drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of
 function 'ioremap_prot'; did you mean 'ioremap_wt'?
Message-ID: <202310140533.D307ipcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: d55a1f8a47f2d73634aaa26728dab2f280a2fb52 [4474/15768] soc: fsl: dpio: use new ioremap_prot API
config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140533.D307ipcs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140533.D307ipcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140533.D307ipcs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
>> drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_wt'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                         ^~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'PTE_TYPE_LARGE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'L_PTE_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:32:70: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +32 drivers/soc/fsl/dpio/dpio-driver.c

    31	
  > 32	#define ioremap_cache_ns(addr, size)	ioremap_prot((addr), (size), PROT_NORMAL_NS)
    33	
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
