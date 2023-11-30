Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE53C695
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiaVNey7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701350303; x=1732886303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qlRR7N0+2e0S8xGouwc9AZ2fQrA04FeYYpEN5AtZY4=;
  b=RiaVNey71IhraiBdQga3wr4Jm6oUy/6bMT0yeqDaaULn608c3zzJD38W
   FwFVU3wqhHmys8OFezlwqpi6DJLO5Bw6A9TJq5ks4ZS6/Cr7e54QD2VvY
   GTEf2wD3ay+gNH9Au0sTUxWJlBkbVvvwOyL58HoxGNbTF2VGow2j8NETD
   MyoZVgSRi8N1fb94GzyoZ/pFk8VOpDSxQ6dvj8lqddYsydq1icK1xuglq
   FzB6TyiI/TQVhAlKwyIBQDCgl9LQvwhEmjdbjYn71i9BZnHC3Hl8G+/4g
   iRknmFRo8M2I6nQqL4Q8oQmOK/dLqGrwFOJKm1WJpSf+Nit5lzkg8BUHq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="201546"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="201546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="17396274"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 05:18:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gvn-00020f-2O;
	Thu, 30 Nov 2023 13:18:16 +0000
Date: Thu, 30 Nov 2023 21:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 38/42]
 arch/sparc/include/asm/string.h:18:29: warning: argument 1 null where
 non-null expected
Message-ID: <202311302155.gbhJkaJb-lkp@intel.com>
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
config: sparc64-randconfig-002-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302155.gbhJkaJb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302155.gbhJkaJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302155.gbhJkaJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/iommu/arm/arm-smmu/arm-smmu.c:20:
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_probe_new_master':
>> arch/sparc/include/asm/string.h:18:29: warning: argument 1 null where non-null expected [-Wnonnull]
      18 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~
   include/linux/iommu-driver.h:250:17: note: in expansion of macro 'memset'
     250 |                 memset(params, 0, sizeof(*(params)));                         \
         |                 ^~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1313:16: note: in expansion of macro 'iommu_iort_get_single_iommu'
    1313 |         smmu = iommu_iort_get_single_iommu(pinf, &arm_smmu_ops, NULL,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   <built-in>: note: in a call to function '__builtin_memset' declared 'nonnull'


vim +18 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  16  
70a6fcf3283a0a Al Viro 2016-01-17  17  #define __HAVE_ARCH_MEMSET
70a6fcf3283a0a Al Viro 2016-01-17 @18  #define memset(s, c, count) __builtin_memset(s, c, count)
70a6fcf3283a0a Al Viro 2016-01-17  19  

:::::: The code at line 18 was first introduced by commit
:::::: 70a6fcf3283a0ac1e11737c6d90c0753f9824e9d [sparc] unify 32bit and 64bit string.h

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
