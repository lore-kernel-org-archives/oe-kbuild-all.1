Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89227F6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 01:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686188175; x=1717724175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ji4qTxz9N4YVkU7ZnZcldAO2Ps/D8tGsmAjPjPbe1/M=;
  b=NTrZivylzIzwvokOBFhDe1aG7lpi8bh44tYx/ZtRnonHqIqk2hoWi10v
   N+i0MKBQe7yqFF2vmxGDTnIPJamMknjsze/gQbGd5VyS+t+HTzmnR991x
   1i42myWo8jlApLbRTyQA7bvfQusvXhT/VUZluJ99YZc6gfTRUWco6WkRo
   VB21Yacw4sUHxg50DIKFGVDqjYoeaiojza9XndLJuswREj7EeB3fudSiV
   Da1VWwxIoe5WoEZQpsdhVgAFGya9kihKURvfwO0oN+zkloxOYX/ZAnASH
   KckYxRLq1iv2iDtuUav6P6zC8FpZ0Aii64ZrOeu643aDL132lA/GYXv2+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="341822933"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="341822933"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687205164"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="687205164"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 18:36:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74ZO-00076B-0H;
	Thu, 08 Jun 2023 01:36:10 +0000
Date: Thu, 8 Jun 2023 09:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:syscache-upstream-hint 3/17]
 drivers/iommu/qcom-iommu-debug.c:67:18: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202306080940.fyuTRhIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git syscache-upstream-hint
head:   1e7686e782bc1f22bb94e9b01b1f6ea4e2b24a6e
commit: cefc5e18c7bb7c68548fdeb25647dd94360a2c18 [3/17] iommu: Add qcom-iommu-debug
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080940.fyuTRhIN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=cefc5e18c7bb7c68548fdeb25647dd94360a2c18
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc syscache-upstream-hint
        git checkout cefc5e18c7bb7c68548fdeb25647dd94360a2c18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080940.fyuTRhIN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/qcom-iommu-debug.c: In function 'iommu_debug_check_mapping_flags':
>> drivers/iommu/qcom-iommu-debug.c:67:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      67 |         txn.id = FIELD_GET(ARM_SMMU_SMR_ID, (fwspec->ids[0]));
         |                  ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_dma_atos_read':
>> drivers/iommu/qcom-iommu-debug-user.c:53:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      53 |         txn.id = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[0]);
         |                  ^~~~~~~~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_dma_map_write':
   drivers/iommu/qcom-iommu-debug-user.c:270:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     270 |         int ret;
         |             ^~~
   drivers/iommu/qcom-iommu-debug-user.c: At top level:
   drivers/iommu/qcom-iommu-debug-user.c:728:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     728 | static const char * const _size_to_string(unsigned long size)
         |        ^~~~~
   drivers/iommu/qcom-iommu-debug-user.c: In function '__tlb_stress_sweep':
   drivers/iommu/qcom-iommu-debug-user.c:885:21: warning: variable 'phys' set but not used [-Wunused-but-set-variable]
     885 |         phys_addr_t phys;
         |                     ^~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +67 drivers/iommu/qcom-iommu-debug.c

    41	
    42	DEFINE_DEBUGFS_ATTRIBUTE(iommu_debug_nr_iters_fops,
    43				 iommu_debug_nr_iters_get,
    44				 iommu_debug_nr_iters_set,
    45				 "%llu\n");
    46	
    47	int iommu_debug_check_mapping_flags(struct device *dev, dma_addr_t iova, size_t size,
    48					    phys_addr_t expected_pa, u32 flags)
    49	{
    50		struct qcom_iommu_atos_txn txn;
    51		struct iommu_fwspec *fwspec;
    52		struct iommu_domain *domain;
    53	
    54		domain = iommu_get_domain_for_dev(dev);
    55		if (!domain) {
    56			dev_err(dev, "iommu_get_domain_for_dev() failed\n");
    57			return -EINVAL;
    58		}
    59	
    60		fwspec = dev_iommu_fwspec_get(dev);
    61		if (!fwspec) {
    62			dev_err(dev, "dev_iommu_fwspec_get() failed\n");
    63			return -EINVAL;
    64		}
    65	
    66		txn.addr = iova;
  > 67		txn.id = FIELD_GET(ARM_SMMU_SMR_ID, (fwspec->ids[0]));
    68		txn.flags = flags;
    69	
    70		size = PAGE_ALIGN(size);
    71		while (size) {
    72			phys_addr_t walk_pa, atos_pa;
    73	
    74			atos_pa = qcom_iommu_iova_to_phys_hard(domain, &txn);
    75			walk_pa = iommu_iova_to_phys(domain, iova);
    76	
    77			if (expected_pa != atos_pa || expected_pa != walk_pa) {
    78				dev_err_ratelimited(dev,
    79					"Bad translation for %pad! Expected: %pa Got: %pa (ATOS) %pa (Table Walk) sid=%08x\n",
    80					&iova, &expected_pa, &atos_pa, &walk_pa, txn.id);
    81				return -EINVAL;
    82			}
    83	
    84			size -= PAGE_SIZE;
    85			iova += PAGE_SIZE;
    86			expected_pa += PAGE_SIZE;
    87		}
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
