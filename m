Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC422AB2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5DN+taU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698180630; x=1729716630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ugljFmA9Vf3yTTRXjCL29mLiWDNhpQBbCkAK6VnGok=;
  b=j5DN+taUdV9Zzob6Sa4z9CG9Mblcnx29mON9ox6vJTE6aKxMJbBaI//e
   ls3SmJtYRhhAyKvUkE+2r/dZeyoAsu+ETqFi5NpybFI6nsEpbVOWLvjie
   KbWMfXkt4Be5nWt2F9GfUxsA4BHVgMM62MhkO/ZrANB8YBF1xP2IsWH8W
   IKKOjoRRC2v2v6b5EB8S0O2wM+7AVeATokhYICzFwQo2wumQI30ReHrJ3
   +OELwm/aq7mJoy5PuZzQBCVbeibdiIpNWUFldxr47dmDARSoDyhmptYlh
   05AvU3DmCPOSjhLBQd+cD3uPOL/e0JPpTlnc5U7a6fvRbkub90H/LV6OH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377538853"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="377538853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 13:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824431713"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="824431713"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2023 13:50:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvOM3-0008HM-2i;
	Tue, 24 Oct 2023 20:50:23 +0000
Date: Wed, 25 Oct 2023 04:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4454/15770]
 drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared;
 did you mean 'BTF_TYPE_TAG'?
Message-ID: <202310250404.3hQY3wRj-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 4b883ce5099a8f46512c2901dd0c6600674bb4f6 [4454/15770] soc: fsl: dpio: change CENA regs to be cacheable
config: x86_64-buildonly-randconfig-003-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250404.3hQY3wRj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250404.3hQY3wRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250404.3hQY3wRj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
   drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function '__ioremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                         ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/paravirt_types.h:39,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/soc/fsl/dpio/dpio-driver.c:10:
>> drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'BTF_TYPE_TAG'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:177:48: note: in definition of macro '__pgprot'
     177 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 drivers/soc/fsl/dpio/dpio-driver.c

  > 10	#include <linux/module.h>
    11	#include <linux/platform_device.h>
    12	#include <linux/interrupt.h>
    13	#include <linux/msi.h>
    14	#include <linux/dma-mapping.h>
    15	#include <linux/delay.h>
    16	#include <linux/io.h>
    17	#include <linux/sys_soc.h>
    18	
    19	#include <linux/fsl/mc.h>
    20	#include <soc/fsl/dpaa2-io.h>
    21	
    22	#include "qbman-portal.h"
    23	#include "dpio.h"
    24	#include "dpio-cmd.h"
    25	
    26	MODULE_LICENSE("Dual BSD/GPL");
    27	MODULE_AUTHOR("Freescale Semiconductor, Inc");
    28	MODULE_DESCRIPTION("DPIO Driver");
    29	
  > 30	#define PROT_NORMAL_NS		(PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
    31	
  > 32	#define ioremap_cache_ns(addr, size)	__ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
    33	
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
