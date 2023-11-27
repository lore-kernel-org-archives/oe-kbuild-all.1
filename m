Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6D63B8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4tkVPOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701064711; x=1732600711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJqnUtPwVRSsEKNNRvIXz056ABPHeo8YMTXk2lNpZA4=;
  b=k4tkVPOrweVmgNkKSW/SUHXQNZv0Y5v/iL0SJGH0CHPuwpEaA6+tRrMX
   RbAHvf7R0SpbHriF8SQhUH1UAirR/X8WIhtQpwUd78/3GaFB4DEPAqHqs
   7NdkHMWB3F7GUPLf8gtrGcU5hzMMmDz4x+1M0O1IulobL6/cD4Y1LlD6H
   fgLcQ6/f3bimk5U0IZQPrGNSjAhxE4KEESNjfHVogFLvJDJCuKX/pKIs1
   LPPsY1WWHmTk8Layglu+jFsy9Nn/qoT5UWmN1bv5UOkxDfuXyXBSgETGw
   FdW7nxYiTX/LqKhXTFtXI2/dqYoFdWzzJKnrp5dvlNd8ygvJq50We1h7/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5824461"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5824461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 21:58:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="834224091"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="834224091"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2023 21:58:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7UdR-0005rz-0L;
	Mon, 27 Nov 2023 05:58:21 +0000
Date: Mon, 27 Nov 2023 13:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 39/42] include/linux/iommu-driver.h:242:9:
 error: expected ';' before '}' token
Message-ID: <202311271338.MKlKP7xV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   9624604aaaa41adf3cb018da14da2744b69a5eee
commit: 6b52c2ea5f140f23a5fa75f1fe32b595d170c27f [39/42] iommu/arm-smmu: Move to iommu_of_xlate()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231127/202311271338.MKlKP7xV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271338.MKlKP7xV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271338.MKlKP7xV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:37:
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_probe_new_master':
>> include/linux/iommu-driver.h:242:9: error: expected ';' before '}' token
     242 |         })
         |         ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1314:16: note: in expansion of macro 'iommu_iort_get_single_iommu'
    1314 |         smmu = iommu_iort_get_single_iommu(pinf, &arm_smmu_ops, &flags,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +242 include/linux/iommu-driver.h

682d61a577200c Jason Gunthorpe 2023-11-23  195  
788da91799fbcc Jason Gunthorpe 2023-11-23  196  #define __iommu_first(a, b)                              \
788da91799fbcc Jason Gunthorpe 2023-11-23  197  	({                                               \
788da91799fbcc Jason Gunthorpe 2023-11-23  198  		struct iommu_device *a_dev = a;          \
788da91799fbcc Jason Gunthorpe 2023-11-23  199  		a_dev != ERR_PTR(-ENODEV) ? a_dev : (b); \
788da91799fbcc Jason Gunthorpe 2023-11-23  200  	})
788da91799fbcc Jason Gunthorpe 2023-11-23  201  
788da91799fbcc Jason Gunthorpe 2023-11-23  202  #if IS_ENABLED(CONFIG_ACPI_VIOT)
788da91799fbcc Jason Gunthorpe 2023-11-23  203  struct iommu_device *
788da91799fbcc Jason Gunthorpe 2023-11-23  204  __iommu_viot_get_single_iommu(struct iommu_probe_info *pinf,
788da91799fbcc Jason Gunthorpe 2023-11-23  205  			      const struct iommu_ops *ops);
788da91799fbcc Jason Gunthorpe 2023-11-23  206  #else
788da91799fbcc Jason Gunthorpe 2023-11-23  207  static inline struct iommu_device *
788da91799fbcc Jason Gunthorpe 2023-11-23  208  __iommu_viot_get_single_iommu(struct iommu_probe_info *pinf,
788da91799fbcc Jason Gunthorpe 2023-11-23  209  			      const struct iommu_ops *ops)
788da91799fbcc Jason Gunthorpe 2023-11-23  210  {
788da91799fbcc Jason Gunthorpe 2023-11-23  211  	return ERR_PTR(-ENODEV);
788da91799fbcc Jason Gunthorpe 2023-11-23  212  }
788da91799fbcc Jason Gunthorpe 2023-11-23  213  #endif
788da91799fbcc Jason Gunthorpe 2023-11-23  214  #define iommu_viot_get_single_iommu(pinf, ops, drv_struct, member)         \
788da91799fbcc Jason Gunthorpe 2023-11-23  215  	container_of_err(                                                  \
788da91799fbcc Jason Gunthorpe 2023-11-23  216  		__iommu_first(__iommu_viot_get_single_iommu(pinf, ops),    \
788da91799fbcc Jason Gunthorpe 2023-11-23  217  			      __iommu_of_get_single_iommu(pinf, ops, -1)), \
788da91799fbcc Jason Gunthorpe 2023-11-23  218  		drv_struct, member)
788da91799fbcc Jason Gunthorpe 2023-11-23  219  
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  220  #if IS_ENABLED(CONFIG_ACPI_IORT)
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  221  struct iommu_device *
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  222  __iommu_iort_get_single_iommu(struct iommu_probe_info *pinf,
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  223  			      const struct iommu_ops *ops,
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  224  			      unsigned int *fw_flags);
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  225  #else
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  226  static inline struct iommu_device *
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  227  __iommu_iort_get_single_iommu(struct iommu_probe_info *pinf,
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  228  			      const struct iommu_ops *ops,
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  229  			      unsigned int *fw_flags)
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  230  {
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  231  	return ERR_PTR(-ENODEV);
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  232  }
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  233  #endif
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  234  #define iommu_iort_get_single_iommu(pinf, ops, fw_flags, drv_struct, member)  \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  235  	({                                                                    \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  236  		*(fw_flags) = 0;                                              \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  237  		container_of_err(__iommu_first(__iommu_iort_get_single_iommu( \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  238  						       pinf, ops, fw_flags),  \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  239  					       __iommu_of_get_single_iommu(   \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  240  						       pinf, ops, -1)),       \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24  241  				 drv_struct, member)                          \
49e3aa39dc0edc Jason Gunthorpe 2023-11-24 @242  	})

:::::: The code at line 242 was first introduced by commit
:::::: 49e3aa39dc0edc8ba021f24922bb01540cd134b1 iommu/iort: Add iommu_iort_get_single_iommu()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
