Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BDD18BC27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731540175; cv=none; b=V0+JX+vNkIb17OcKpn4bRaU6d/LzquauYo+5c+BwJZHhQmF+7OvRX8FVmTjZdzsu07yiA2skCWkyAFsrjJZVhktOFsKsMCYRUyqioem5fHdaF4V9MR5ck1xq61GejVH2AKGmuLysP9iPEO88nTpRqrR9lG8wYNYWLjDfUcuQqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731540175; c=relaxed/simple;
	bh=NDIHwi5GzKyeq7m+/WrxwFBQ1FcKFjFc+kPw2EMDT2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbNon186Gw5Mu5htK6XLwQH0E0K7ErepgrFj/1z7RnUlteEWuhRfg9EQbBSJed21fYk8f/WEblf2OyYSUFyC6EHz57OXO4ztfwzo61n3HHoG+d/6EkyA5RNlO4tbZCrSZHFgm7OLFRQoU4Thq9pD4J1gU5SWK6YqPF/Tes865xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwSvoJHZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwSvoJHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731540173; x=1763076173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDIHwi5GzKyeq7m+/WrxwFBQ1FcKFjFc+kPw2EMDT2g=;
  b=dwSvoJHZcOK2jlaNVJ5RjUV++rzXoA9UCbhrOyGP+DUT3bUePTCqRmsL
   p6K3ElRqo7x1jn+YNzyYECVF6zIfaYKLNRt5FQak+8etB8cojkeBl4C1e
   +RnYQtP9O1oeOWyh2N8YFF/1qvFr4KwBSUqz837mYAizwbBJBR+Fr7/pv
   5N7TiS5Cn7QnquK/tWkEdpbl+PpwlVV4Jm+BdZNBHF47+iHlviy8/DTnL
   c8X4Kb3D00ap8GjABpDUniexIj9Ld2K++n/t7Xp8y1mkCTmfjM2Lty1Z/
   NCdqAtWhpAMRhhef6gCNHjwapgtQIPuPMDdbzJlAexKjSsoWSDgFDvlFN
   Q==;
X-CSE-ConnectionGUID: 4UKHFskHQkOQTTy8c0et+w==
X-CSE-MsgGUID: mfBs1i//Q2mq4i9fOWxbgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31614525"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31614525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:22:50 -0800
X-CSE-ConnectionGUID: Igbzo4R0SUaasmjO77l4WQ==
X-CSE-MsgGUID: bf79RiN6Q0K+skBEsokkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="118955822"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2024 15:22:48 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMhC-0000qZ-0h;
	Wed, 13 Nov 2024 23:22:46 +0000
Date: Thu, 14 Nov 2024 07:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/iommu/arm-smmu-v3.c:211:55: error: 'CONFIG_CMA_ALIGNMENT'
 undeclared; did you mean 'CONFIG_CMDLINE'?
Message-ID: <202411140740.ZYUgkfnW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 3e8f9682bfad48236b3a76f113cbd5270102e745 [1291/1291] iommu/arm-smmu-v3: Increase maximum size of queues
config: arm64-randconfig-r063-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140740.ZYUgkfnW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140740.ZYUgkfnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140740.ZYUgkfnW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from drivers/iommu/arm-smmu-v3.c:23:
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_device_hw_probe':
>> drivers/iommu/arm-smmu-v3.c:211:55: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function); did you mean 'CONFIG_CMDLINE'?
     211 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:847:36: note: in definition of macro '__typecheck'
     847 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:871:31: note: in expansion of macro '__safe_cmp'
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
   drivers/iommu/arm-smmu-v3.c:278:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     278 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:47: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                               ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:211:55: note: each undeclared identifier is reported only once for each function it appears in
     211 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:847:36: note: in definition of macro '__typecheck'
     847 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:871:31: note: in expansion of macro '__safe_cmp'
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
   drivers/iommu/arm-smmu-v3.c:278:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     278 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:47: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                               ^~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3566:36: note: in expansion of macro 'min_t'
    3566 |         smmu->evtq.q.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3568:36: note: in expansion of macro 'min_t'
    3568 |         smmu->priq.q.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
         |                                    ^~~~~


vim +211 drivers/iommu/arm-smmu-v3.c

  > 23	#include <linux/acpi.h>
    24	#include <linux/acpi_iort.h>
    25	#include <linux/bitfield.h>
    26	#include <linux/bitops.h>
    27	#include <linux/cpufeature.h>
    28	#include <linux/crash_dump.h>
    29	#include <linux/delay.h>
    30	#include <linux/dma-iommu.h>
    31	#include <linux/err.h>
    32	#include <linux/interrupt.h>
    33	#include <linux/io-pgtable.h>
    34	#include <linux/iommu.h>
    35	#include <linux/iopoll.h>
    36	#include <linux/mmu_context.h>
    37	#include <linux/module.h>
    38	#include <linux/msi.h>
    39	#include <linux/of.h>
    40	#include <linux/of_address.h>
    41	#include <linux/of_iommu.h>
    42	#include <linux/of_platform.h>
    43	#include <linux/pci.h>
    44	#include <linux/platform_device.h>
    45	#include <linux/sched/mm.h>
    46	
    47	#include <linux/irq.h>
    48	#include <linux/amba/bus.h>
    49	
    50	#include "iommu-pasid-table.h"
    51	
    52	/* MMIO registers */
    53	#define ARM_SMMU_IDR0			0x0
    54	#define IDR0_ST_LVL			GENMASK(28, 27)
    55	#define IDR0_ST_LVL_2LVL		1
    56	#define IDR0_STALL_MODEL		GENMASK(25, 24)
    57	#define IDR0_STALL_MODEL_STALL		0
    58	#define IDR0_STALL_MODEL_FORCE		2
    59	#define IDR0_TTENDIAN			GENMASK(22, 21)
    60	#define IDR0_TTENDIAN_MIXED		0
    61	#define IDR0_TTENDIAN_LE		2
    62	#define IDR0_TTENDIAN_BE		3
    63	#define IDR0_CD2L			(1 << 19)
    64	#define IDR0_VMID16			(1 << 18)
    65	#define IDR0_PRI			(1 << 16)
    66	#define IDR0_SEV			(1 << 14)
    67	#define IDR0_MSI			(1 << 13)
    68	#define IDR0_ASID16			(1 << 12)
    69	#define IDR0_ATS			(1 << 10)
    70	#define IDR0_HYP			(1 << 9)
    71	#define IDR0_HD				(1 << 7)
    72	#define IDR0_HA				(1 << 6)
    73	#define IDR0_BTM			(1 << 5)
    74	#define IDR0_COHACC			(1 << 4)
    75	#define IDR0_TTF			GENMASK(3, 2)
    76	#define IDR0_TTF_AARCH64		2
    77	#define IDR0_TTF_AARCH32_64		3
    78	#define IDR0_S1P			(1 << 1)
    79	#define IDR0_S2P			(1 << 0)
    80	
    81	#define ARM_SMMU_IDR1			0x4
    82	#define IDR1_TABLES_PRESET		(1 << 30)
    83	#define IDR1_QUEUES_PRESET		(1 << 29)
    84	#define IDR1_REL			(1 << 28)
    85	#define IDR1_CMDQS			GENMASK(25, 21)
    86	#define IDR1_EVTQS			GENMASK(20, 16)
    87	#define IDR1_PRIQS			GENMASK(15, 11)
    88	#define IDR1_SSIDSIZE			GENMASK(10, 6)
    89	#define IDR1_SIDSIZE			GENMASK(5, 0)
    90	
    91	#define ARM_SMMU_IDR5			0x14
    92	#define IDR5_STALL_MAX			GENMASK(31, 16)
    93	#define IDR5_GRAN64K			(1 << 6)
    94	#define IDR5_GRAN16K			(1 << 5)
    95	#define IDR5_GRAN4K			(1 << 4)
    96	#define IDR5_OAS			GENMASK(2, 0)
    97	#define IDR5_OAS_32_BIT			0
    98	#define IDR5_OAS_36_BIT			1
    99	#define IDR5_OAS_40_BIT			2
   100	#define IDR5_OAS_42_BIT			3
   101	#define IDR5_OAS_44_BIT			4
   102	#define IDR5_OAS_48_BIT			5
   103	#define IDR5_OAS_52_BIT			6
   104	#define IDR5_VAX			GENMASK(11, 10)
   105	#define IDR5_VAX_52_BIT			1
   106	
   107	#define ARM_SMMU_CR0			0x20
   108	#define CR0_CMDQEN			(1 << 3)
   109	#define CR0_EVTQEN			(1 << 2)
   110	#define CR0_PRIQEN			(1 << 1)
   111	#define CR0_SMMUEN			(1 << 0)
   112	
   113	#define ARM_SMMU_CR0ACK			0x24
   114	
   115	#define ARM_SMMU_CR1			0x28
   116	#define CR1_TABLE_SH			GENMASK(11, 10)
   117	#define CR1_TABLE_OC			GENMASK(9, 8)
   118	#define CR1_TABLE_IC			GENMASK(7, 6)
   119	#define CR1_QUEUE_SH			GENMASK(5, 4)
   120	#define CR1_QUEUE_OC			GENMASK(3, 2)
   121	#define CR1_QUEUE_IC			GENMASK(1, 0)
   122	/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
   123	#define CR1_CACHE_NC			0
   124	#define CR1_CACHE_WB			1
   125	#define CR1_CACHE_WT			2
   126	
   127	#define ARM_SMMU_CR2			0x2c
   128	#define CR2_PTM				(1 << 2)
   129	#define CR2_RECINVSID			(1 << 1)
   130	#define CR2_E2H				(1 << 0)
   131	
   132	#define ARM_SMMU_GBPA			0x44
   133	#define GBPA_UPDATE			(1 << 31)
   134	#define GBPA_ABORT			(1 << 20)
   135	
   136	#define ARM_SMMU_IRQ_CTRL		0x50
   137	#define IRQ_CTRL_EVTQ_IRQEN		(1 << 2)
   138	#define IRQ_CTRL_PRIQ_IRQEN		(1 << 1)
   139	#define IRQ_CTRL_GERROR_IRQEN		(1 << 0)
   140	
   141	#define ARM_SMMU_IRQ_CTRLACK		0x54
   142	
   143	#define ARM_SMMU_GERROR			0x60
   144	#define GERROR_SFM_ERR			(1 << 8)
   145	#define GERROR_MSI_GERROR_ABT_ERR	(1 << 7)
   146	#define GERROR_MSI_PRIQ_ABT_ERR		(1 << 6)
   147	#define GERROR_MSI_EVTQ_ABT_ERR		(1 << 5)
   148	#define GERROR_MSI_CMDQ_ABT_ERR		(1 << 4)
   149	#define GERROR_PRIQ_ABT_ERR		(1 << 3)
   150	#define GERROR_EVTQ_ABT_ERR		(1 << 2)
   151	#define GERROR_CMDQ_ERR			(1 << 0)
   152	#define GERROR_ERR_MASK			0xfd
   153	
   154	#define ARM_SMMU_GERRORN		0x64
   155	
   156	#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
   157	#define ARM_SMMU_GERROR_IRQ_CFG1	0x70
   158	#define ARM_SMMU_GERROR_IRQ_CFG2	0x74
   159	
   160	#define ARM_SMMU_STRTAB_BASE		0x80
   161	#define STRTAB_BASE_RA			(1UL << 62)
   162	#define STRTAB_BASE_ADDR_MASK		GENMASK_ULL(51, 6)
   163	
   164	#define ARM_SMMU_STRTAB_BASE_CFG	0x88
   165	#define STRTAB_BASE_CFG_FMT		GENMASK(17, 16)
   166	#define STRTAB_BASE_CFG_FMT_LINEAR	0
   167	#define STRTAB_BASE_CFG_FMT_2LVL	1
   168	#define STRTAB_BASE_CFG_SPLIT		GENMASK(10, 6)
   169	#define STRTAB_BASE_CFG_LOG2SIZE	GENMASK(5, 0)
   170	
   171	#define ARM_SMMU_CMDQ_BASE		0x90
   172	#define ARM_SMMU_CMDQ_PROD		0x98
   173	#define ARM_SMMU_CMDQ_CONS		0x9c
   174	
   175	#define ARM_SMMU_EVTQ_BASE		0xa0
   176	#define ARM_SMMU_EVTQ_PROD		0x100a8
   177	#define ARM_SMMU_EVTQ_CONS		0x100ac
   178	#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
   179	#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
   180	#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
   181	
   182	#define ARM_SMMU_PRIQ_BASE		0xc0
   183	#define ARM_SMMU_PRIQ_PROD		0x100c8
   184	#define ARM_SMMU_PRIQ_CONS		0x100cc
   185	#define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
   186	#define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
   187	#define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
   188	
   189	/* Common MSI config fields */
   190	#define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
   191	#define MSI_CFG2_SH			GENMASK(5, 4)
   192	#define MSI_CFG2_MEMATTR		GENMASK(3, 0)
   193	
   194	/* Common memory attribute values */
   195	#define ARM_SMMU_SH_NSH			0
   196	#define ARM_SMMU_SH_OSH			2
   197	#define ARM_SMMU_SH_ISH			3
   198	#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
   199	#define ARM_SMMU_MEMATTR_OIWB		0xf
   200	
   201	#define Q_IDX(q, p)			((p) & ((1 << (q)->max_n_shift) - 1))
   202	#define Q_WRP(q, p)			((p) & (1 << (q)->max_n_shift))
   203	#define Q_OVERFLOW_FLAG			(1 << 31)
   204	#define Q_OVF(q, p)			((p) & Q_OVERFLOW_FLAG)
   205	#define Q_ENT(q, p)			((q)->base +			\
   206						 Q_IDX(q, p) * (q)->ent_dwords)
   207	
   208	#define Q_BASE_RWA			(1UL << 62)
   209	#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
   210	#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
 > 211	#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
