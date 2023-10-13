Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F622F1F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCRwk+cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697221032; x=1728757032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pC6tFbcrJaAfkBvB3/8zGuuXA5NDv7xJoCrS/riLOlY=;
  b=VCRwk+cNjl0i+vAkfO9tRzW1vCvXRbglHkUZywOA1ydxHALVn83Mbw+A
   Csv/pPIwicP/MteNQfmEuOij51QZF/xkmZ+yJ8I4a/0/BsOk7HyvsZtC6
   C1HFJqT6Hg3G9rtln3Cqkvoo7VS7yLZUeDrgouAZaly8vCpfqbzSu6dd3
   nd+mH3tE/p07Ef0u3DaKBPrHfwNg5PDHW7fZqDZTKh4boWxlmHNXuUnaO
   3IsuGGvNlUUtd3xhmJ5bnQDBxcIB01+4AiEBxrP9jF8BrAls+zI93b4pS
   l+W0RBI7Cz4GcaiJNjpbse1k8qgrJUsfqZ9TG9OkwaEMkMKdaGJ5YaDKv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370302503"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370302503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 11:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704738001"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704738001"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 11:17:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrMia-0005FF-0M;
	Fri, 13 Oct 2023 18:17:00 +0000
Date: Sat, 14 Oct 2023 02:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin2 10/10] drivers/iommu/iommufd/main.c:485:10:
 error: 'IOMMUFD_OBJ_HW_PAGETABLE' undeclared here (not in a function); did
 you mean 'IOMMUFD_OBJ_HWPT_PAGING'?
Message-ID: <202310140252.GWsWhiMh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin2
head:   8d234b4225ea7431b058eeb8eb3b92bbbdbdc6fd
commit: 8d234b4225ea7431b058eeb8eb3b92bbbdbdc6fd [10/10] give paging its own object type and protect the to_hwpt_pagings with a check
config: arc-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140252.GWsWhiMh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140252.GWsWhiMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140252.GWsWhiMh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/main.c:485:10: error: 'IOMMUFD_OBJ_HW_PAGETABLE' undeclared here (not in a function); did you mean 'IOMMUFD_OBJ_HWPT_PAGING'?
     485 |         [IOMMUFD_OBJ_HW_PAGETABLE] = {
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
         |          IOMMUFD_OBJ_HWPT_PAGING
>> drivers/iommu/iommufd/main.c:485:10: error: array index in initializer not of integer type
   drivers/iommu/iommufd/main.c:485:10: note: (near initialization for 'iommufd_object_ops')
   drivers/iommu/iommufd/main.c:485:38: warning: initialized field overwritten [-Woverride-init]
     485 |         [IOMMUFD_OBJ_HW_PAGETABLE] = {
         |                                      ^
   drivers/iommu/iommufd/main.c:485:38: note: (near initialization for 'iommufd_object_ops[4]')


vim +485 drivers/iommu/iommufd/main.c

2ff4bed7fee72b Jason Gunthorpe 2022-11-29  474  
2ff4bed7fee72b Jason Gunthorpe 2022-11-29  475  static const struct iommufd_object_ops iommufd_object_ops[] = {
8d40205f6093f1 Jason Gunthorpe 2022-11-29  476  	[IOMMUFD_OBJ_ACCESS] = {
8d40205f6093f1 Jason Gunthorpe 2022-11-29  477  		.destroy = iommufd_access_destroy_object,
8d40205f6093f1 Jason Gunthorpe 2022-11-29  478  	},
e8d57210035b63 Jason Gunthorpe 2022-11-29  479  	[IOMMUFD_OBJ_DEVICE] = {
e8d57210035b63 Jason Gunthorpe 2022-11-29  480  		.destroy = iommufd_device_destroy,
e8d57210035b63 Jason Gunthorpe 2022-11-29  481  	},
aad37e71d5c4dc Jason Gunthorpe 2022-11-29  482  	[IOMMUFD_OBJ_IOAS] = {
aad37e71d5c4dc Jason Gunthorpe 2022-11-29  483  		.destroy = iommufd_ioas_destroy,
aad37e71d5c4dc Jason Gunthorpe 2022-11-29  484  	},
ea4acfac57b9de Jason Gunthorpe 2022-11-29 @485  	[IOMMUFD_OBJ_HW_PAGETABLE] = {
ea4acfac57b9de Jason Gunthorpe 2022-11-29  486  		.destroy = iommufd_hw_pagetable_destroy,
70eadc7fc7ef29 Jason Gunthorpe 2023-07-17  487  		.abort = iommufd_hw_pagetable_abort,
ea4acfac57b9de Jason Gunthorpe 2022-11-29  488  	},
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  489  #ifdef CONFIG_IOMMUFD_TEST
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  490  	[IOMMUFD_OBJ_SELFTEST] = {
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  491  		.destroy = iommufd_selftest_destroy,
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  492  	},
f4b20bb34c83dc Jason Gunthorpe 2022-11-29  493  #endif
2ff4bed7fee72b Jason Gunthorpe 2022-11-29  494  };
2ff4bed7fee72b Jason Gunthorpe 2022-11-29  495  

:::::: The code at line 485 was first introduced by commit
:::::: ea4acfac57b9dee57a7d5840359a41cc3251de92 iommufd: Add a HW pagetable object

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
