Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B1F4CB2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgWDCnFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701321998; x=1732857998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1pfuaVaJXXHknOZUHqwXl7ka+grol/z6qZ6PMZFDF28=;
  b=fgWDCnFqNVoXLggVaGS9/uNJcI9Q0HHLgd9xb5YsiG9UC7P/3VWT1bto
   bTun2CHHDT7apTYcj51SBBUTin3zqrblyP9AECZPsWEW0cmUkJdFHepVg
   y92ctu9eQ/ecKDnIiKrius++C49Gg0MdNUEo7Omj2VXqI0C+OTMGJEwtn
   HCtIIVUts2w2f/zkx4yt7Grp5t3lnle1fEM8BLZoofjx5s9M9dVHtyKEI
   CHnCrXqGw8A+sW4o1iFd4s8SXzSrZf+CApGg2c1JLFtg/mSyWV2arQjU0
   XZtajlRQurWtSyVtxGYFztf1PKfPFJEeBIWBOhxyrGELlLxilT1L/LInk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459763414"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459763414"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 21:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839689041"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="839689041"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 21:26:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ZXm-0001PS-28;
	Thu, 30 Nov 2023 05:25:42 +0000
Date: Thu, 30 Nov 2023 13:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 7/7] dma-mapping: Simplify arch_setup_dma_ops()
Message-ID: <202311301328.28ULuBXT-lkp@intel.com>
References: <590a4a1b7d10fb9bb1c42ca6cd438e98e6cc94a7.1701268753.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <590a4a1b7d10fb9bb1c42ca6cd438e98e6cc94a7.1701268753.git.robin.murphy@arm.com>

Hi Robin,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.7-rc3 next-20231129]
[cannot apply to joro-iommu/next rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/OF-Simplify-DMA-range-calculations/20231130-024624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/590a4a1b7d10fb9bb1c42ca6cd438e98e6cc94a7.1701268753.git.robin.murphy%40arm.com
patch subject: [PATCH 7/7] dma-mapping: Simplify arch_setup_dma_ops()
config: arm-aspeed_g5_defconfig (https://download.01.org/0day-ci/archive/20231130/202311301328.28ULuBXT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301328.28ULuBXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301328.28ULuBXT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from arch/arm/mm/dma-mapping.c:9:
   include/linux/dma-direct.h: In function 'dma_range_map_min':
   include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^
   include/linux/dma-direct.h:54:26: note: in expansion of macro 'U64_MAX'
      54 |         dma_addr_t ret = U64_MAX;
         |                          ^~~~~~~
   arch/arm/mm/dma-mapping.c: In function 'arch_setup_dma_ops':
>> arch/arm/mm/dma-mapping.c:1784:17: error: too few arguments to function 'arm_setup_iommu_dma_ops'
    1784 |                 arm_setup_iommu_dma_ops(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/dma-mapping.c:1755:13: note: declared here
    1755 | static void arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/arm_setup_iommu_dma_ops +1784 arch/arm/mm/dma-mapping.c

  1763	
  1764	void arch_setup_dma_ops(struct device *dev, bool coherent)
  1765	{
  1766		/*
  1767		 * Due to legacy code that sets the ->dma_coherent flag from a bus
  1768		 * notifier we can't just assign coherent to the ->dma_coherent flag
  1769		 * here, but instead have to make sure we only set but never clear it
  1770		 * for now.
  1771		 */
  1772		if (coherent)
  1773			dev->dma_coherent = true;
  1774	
  1775		/*
  1776		 * Don't override the dma_ops if they have already been set. Ideally
  1777		 * this should be the only location where dma_ops are set, remove this
  1778		 * check when all other callers of set_dma_ops will have disappeared.
  1779		 */
  1780		if (dev->dma_ops)
  1781			return;
  1782	
  1783		if (device_iommu_mapped(dev))
> 1784			arm_setup_iommu_dma_ops(dev);
  1785	
  1786		xen_setup_dma_ops(dev);
  1787		dev->archdata.dma_ops_setup = true;
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
