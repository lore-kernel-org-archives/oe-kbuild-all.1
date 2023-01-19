Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E417471
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674167488; x=1705703488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N27kszVBgrIFjWdikD7CpDrCfar/+4wI5n7FhTk08rI=;
  b=VUo5LdAOu1Z9RDAhCGudF7UfSo11jz9xEqW5Okw7mwEdR1D0A9oV/LJ1
   qgydDIWhCF6v29Kv07vbfQ8zoNzu2IVJPfFCAUE+uOFcqxNFmegayu2o1
   FRBNB6/OdHdU9RGCLAxD2g0b5S3JRjW5Q4Q4po7eC4TnJexHEafpgtFg3
   BxShumPj5DOozIRju9hsbifJ0JCMRlKcp6WwkQFdOST9jgK7gVxYt/Ljq
   ZIrGc8pEPl+Ewbg2LH059xL/9u4ITc6vA6S2E6tLOSq7s0PrC59MBrVf5
   NJm1QAgk7SyCTh4/n5mRNT/hcZXA/XcS+/IQdBI8y6GFY3WKJ26BlhkHE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387812494"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="387812494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 14:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690799916"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="690799916"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 14:31:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIdRN-0001uu-2Z;
	Thu, 19 Jan 2023 22:31:25 +0000
Date: Fri, 20 Jan 2023 06:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 48/81] drivers/iommu/dma-iommu.c:500:37:
 error: 'IOMMU_RESV_TRANSLATED' undeclared; did you mean
 'IOMMU_RESV_RESERVED'?
Message-ID: <202301200639.0Og5uuwq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   be63771800177191d2c5f7f31024cdb70671f710
commit: a0139ccbde88c52998b4268e14e01c68cdf49a49 [48/81] fixup! iommu: Parse translated reserved regions
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230120/202301200639.0Og5uuwq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/a0139ccbde88c52998b4268e14e01c68cdf49a49
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/200-dcp
        git checkout a0139ccbde88c52998b4268e14e01c68cdf49a49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function 'iova_reserve_iommu_regions':
>> drivers/iommu/dma-iommu.c:500:37: error: 'IOMMU_RESV_TRANSLATED' undeclared (first use in this function); did you mean 'IOMMU_RESV_RESERVED'?
     500 |                 if (region->type == IOMMU_RESV_TRANSLATED) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                     IOMMU_RESV_RESERVED
   drivers/iommu/dma-iommu.c:500:37: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/iommu/dma-iommu.c:501:52: error: 'struct iommu_resv_region' has no member named 'dva'
     501 |                         lo = iova_pfn(iovad, region->dva);
         |                                                    ^~
   drivers/iommu/dma-iommu.c:502:52: error: 'struct iommu_resv_region' has no member named 'dva'
     502 |                         hi = iova_pfn(iovad, region->dva + region->length - 1);
         |                                                    ^~


vim +500 drivers/iommu/dma-iommu.c

   476	
   477	static int iova_reserve_iommu_regions(struct device *dev,
   478			struct iommu_domain *domain)
   479	{
   480		struct iommu_dma_cookie *cookie = domain->iova_cookie;
   481		struct iova_domain *iovad = &cookie->iovad;
   482		struct iommu_resv_region *region;
   483		LIST_HEAD(resv_regions);
   484		int ret = 0;
   485	
   486		if (dev_is_pci(dev)) {
   487			ret = iova_reserve_pci_windows(to_pci_dev(dev), iovad);
   488			if (ret)
   489				return ret;
   490		}
   491	
   492		iommu_get_resv_regions(dev, &resv_regions);
   493		list_for_each_entry(region, &resv_regions, list) {
   494			unsigned long lo, hi;
   495	
   496			/* We ARE the software that manages these! */
   497			if (region->type == IOMMU_RESV_SW_MSI)
   498				continue;
   499	
 > 500			if (region->type == IOMMU_RESV_TRANSLATED) {
 > 501				lo = iova_pfn(iovad, region->dva);
   502				hi = iova_pfn(iovad, region->dva + region->length - 1);
   503			} else {
   504				lo = iova_pfn(iovad, region->start);
   505				hi = iova_pfn(iovad, region->start + region->length - 1);
   506			}
   507			reserve_iova(iovad, lo, hi);
   508	
   509			if (region->type == IOMMU_RESV_MSI)
   510				ret = cookie_init_hw_msi_region(cookie, region->start,
   511						region->start + region->length);
   512			if (ret)
   513				break;
   514		}
   515		iommu_put_resv_regions(dev, &resv_regions);
   516	
   517		return ret;
   518	}
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
