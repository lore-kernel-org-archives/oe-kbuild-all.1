Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63A6FCC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebr/3Tep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701812817; x=1733348817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xAJSw1WXF0kbDXMV6TA+P/0fIU+HMuwiL+rhoG/mlU=;
  b=ebr/3Tep/iuHW1bzgaSW/M5yMjZZad+7XcrFmHFxrLRtem4SB4thDxG1
   mJwH6tw+Yd2GpGoPR+CDk6EY9XHlXHrWufj9vwrPJ/tzM8p8wwLVSQvyA
   IEjjk8QkKYWMemxw+p/wG2REcQXv0AVXvjRFg4xTXXKiESYJ8VgJLqYXP
   g3fasEegYIuCOy46rGwZW6nZnEGtcu+pQ73IucJ8uXg9badqHEbAwWXhI
   pJtGm3j4Qn4mffnxLIdyFTZlaEbn4mE9dDO0PHSWdv+XEvOZa6F+iVvQm
   aYvoDVMH1GHosh/GiDdkWLK+NdUhkmlzmi1IzRY3tYbk7Pd/F09qiqY8G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396754048"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396754048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="19110304"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 13:46:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdFj-0009m2-2H;
	Tue, 05 Dec 2023 21:46:51 +0000
Date: Wed, 6 Dec 2023 05:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-02 2/4]
 arch/arm64/mm/dma-mapping-noalias.c:562:33: error: 'arm64_iommu_ops'
 undeclared; did you mean 'arm64_noalias_ops'?
Message-ID: <202312060505.zzdiKjAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-02
head:   11518ebf9bcc5beef148d8016900a407ea88dbda
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [2/4] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-r131-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060505.zzdiKjAG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060505.zzdiKjAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060505.zzdiKjAG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/dma-mapping-noalias.c: In function 'arm64_noalias_setup_dma_ops':
>> arch/arm64/mm/dma-mapping-noalias.c:562:33: error: 'arm64_iommu_ops' undeclared (first use in this function); did you mean 'arm64_noalias_ops'?
     562 |                 dev->dma_ops = &arm64_iommu_ops;
         |                                 ^~~~~~~~~~~~~~~
         |                                 arm64_noalias_ops
   arch/arm64/mm/dma-mapping-noalias.c:562:33: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/dma-mapping-noalias.c:563:21: error: 'iommu_dma_ops' undeclared (first use in this function); did you mean 'iommu_map'?
     563 |                 if (iommu_dma_ops)
         |                     ^~~~~~~~~~~~~
         |                     iommu_map

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]


vim +562 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)
   551	{
   552		if (dev_is_dma_coherent(dev))
   553			return;
   554	
   555		dev_info(dev, "applying no-alias DMA workaround\n");
   556		if (!dev->dma_ops) {
   557			dev->dma_ops = &arm64_noalias_ops;
   558			goto done;
   559		}
   560	
   561		if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
 > 562			dev->dma_ops = &arm64_iommu_ops;
 > 563			if (iommu_dma_ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
