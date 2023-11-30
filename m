Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B53D39D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHNczaEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345182; x=1732881182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXaKAqQSgOji/yUcRWUmbwrqsb82gz3o1OBbAGRUpHA=;
  b=kHNczaEuOg4j13DZETNX3hBAcvdq98c9XOEWPwP0IktB1qh+6r+olg4V
   4kLdSRjSt3EFqO2qesUKb7zZFD2vESzqplhezc8je5mEoKlEeHpzzo96t
   IzdU3CwBY5fdW47ZkITE9UClz4TtAFUxO3nTCI2jK5zseFT6b5NKwKR1o
   HndJE86eK18ptJoQbZ2CwWKn7fhQvdjC4PooPypQAwMrc0nDaQUEouf5J
   5WQ0WtM/dOWwQ3ucwR0kNNfoseViRcuR0UHdwVCtpDI4wn22zvzzf/MrM
   MZKyS0jSfEvEurIaukESYRb7sH/JywSm4grxAxvY9UVJfVIeRW/5TuMor
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372691989"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="372691989"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="719104971"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="719104971"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 03:52:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8fbE-0001o7-19;
	Thu, 30 Nov 2023 11:52:56 +0000
Date: Thu, 30 Nov 2023 19:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 38/42] include/linux/iommu-driver.h:250:17:
 warning: argument 1 null where non-null expected
Message-ID: <202311301910.MVTzrEVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   ce7d68fa9f538ed4b9c8097e7f1b822ff7301876
commit: f2b38914e20dbb088201ca774735be83294006bd [38/42] iommu/arm-smmu: Move to iommu_of_xlate()
config: x86_64-buildonly-randconfig-003-20231130 (https://download.01.org/0day-ci/archive/20231130/202311301910.MVTzrEVT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301910.MVTzrEVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301910.MVTzrEVT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:37:
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_probe_new_master':
>> include/linux/iommu-driver.h:250:17: warning: argument 1 null where non-null expected [-Wnonnull]
     250 |                 memset(params, 0, sizeof(*(params)));                         \
         |                 ^~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1313:16: note: in expansion of macro 'iommu_iort_get_single_iommu'
    1313 |         smmu = iommu_iort_get_single_iommu(pinf, &arm_smmu_ops, NULL,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/string.h:5,
                    from arch/x86/include/asm/cpuid.h:9,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/iommu/arm/arm-smmu/arm-smmu.c:20:
   arch/x86/include/asm/string_64.h:22:7: note: in a call to function 'memset' declared 'nonnull'
      22 | void *memset(void *s, int c, size_t n);
         |       ^~~~~~


vim +250 include/linux/iommu-driver.h

fffe0dd50c02d1 Jason Gunthorpe 2023-11-23  209  
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  210  #define __iommu_first(a, b)                              \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  211  	({                                               \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  212  		struct iommu_device *a_dev = a;          \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  213  		a_dev != ERR_PTR(-ENODEV) ? a_dev : (b); \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  214  	})
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  215  
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  216  #if IS_ENABLED(CONFIG_ACPI_VIOT)
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  217  struct iommu_device *
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  218  __iommu_viot_get_single_iommu(struct iommu_probe_info *pinf,
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  219  			      const struct iommu_ops *ops);
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  220  #else
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  221  static inline struct iommu_device *
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  222  __iommu_viot_get_single_iommu(struct iommu_probe_info *pinf,
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  223  			      const struct iommu_ops *ops)
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  224  {
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  225  	return ERR_PTR(-ENODEV);
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  226  }
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  227  #endif
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  228  #define iommu_viot_get_single_iommu(pinf, ops, drv_struct, member)         \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  229  	container_of_err(                                                  \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  230  		__iommu_first(__iommu_viot_get_single_iommu(pinf, ops),    \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  231  			      __iommu_of_get_single_iommu(pinf, ops, -1)), \
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  232  		drv_struct, member)
8c0cb0c6f13792 Jason Gunthorpe 2023-11-23  233  
eb6348b72e7452 Jason Gunthorpe 2023-11-24  234  #if IS_ENABLED(CONFIG_ACPI_IORT)
eb6348b72e7452 Jason Gunthorpe 2023-11-24  235  struct iommu_device *
eb6348b72e7452 Jason Gunthorpe 2023-11-24  236  __iommu_iort_get_single_iommu(struct iommu_probe_info *pinf,
eb6348b72e7452 Jason Gunthorpe 2023-11-24  237  			      const struct iommu_ops *ops,
eb6348b72e7452 Jason Gunthorpe 2023-11-24  238  			      struct iort_params *params);
eb6348b72e7452 Jason Gunthorpe 2023-11-24  239  #else
eb6348b72e7452 Jason Gunthorpe 2023-11-24  240  static inline struct iommu_device *
eb6348b72e7452 Jason Gunthorpe 2023-11-24  241  __iommu_iort_get_single_iommu(struct iommu_probe_info *pinf,
eb6348b72e7452 Jason Gunthorpe 2023-11-24  242  			      const struct iommu_ops *ops,
eb6348b72e7452 Jason Gunthorpe 2023-11-24  243  			      struct iort_params *params)
eb6348b72e7452 Jason Gunthorpe 2023-11-24  244  {
eb6348b72e7452 Jason Gunthorpe 2023-11-24  245  	return ERR_PTR(-ENODEV);
eb6348b72e7452 Jason Gunthorpe 2023-11-24  246  }
eb6348b72e7452 Jason Gunthorpe 2023-11-24  247  #endif
eb6348b72e7452 Jason Gunthorpe 2023-11-24  248  #define iommu_iort_get_single_iommu(pinf, ops, params, drv_struct, member)    \
eb6348b72e7452 Jason Gunthorpe 2023-11-24  249  	({                                                                    \
eb6348b72e7452 Jason Gunthorpe 2023-11-24 @250  		memset(params, 0, sizeof(*(params)));                         \

:::::: The code at line 250 was first introduced by commit
:::::: eb6348b72e74523d94a16048f46743207c995a5e iommu/iort: Add iommu_iort_get_single_iommu()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
