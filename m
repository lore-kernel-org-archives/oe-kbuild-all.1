Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41EA53
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 22:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688424808; x=1719960808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9zvfJDIKk64JOIeP3L1ICtqDN/n/MKg1MNq9TbTgbU=;
  b=WUfO2fji2ol7Pj0xkqcZv1OcJ9aO51UjVNlzFKllvIEUpKAwU/Ybg+jY
   ai8d/7etonW4F0RpIDb2Jao+ZvLX2gmMHxqroXGiQt7DCh5HFOQFgo68b
   enQfKwZ7t1TOswtnPGYM4OjfptvSYhm/0Nba7C2yRmFY0R39zx9D1dp9m
   tafNyciT+kll+UitFsgQF1gfxaG4eOrooKbtbVNLwTOy8W75NNeuKyxGU
   LR6V1rZLq+D1M8zblGRXbh6gHu6bnP+blQEqk5VR3QF53lZcVTwb6OAbU
   /0nNnjBA6ZlM0cY6lZ1jKBEHK1mLXjrxaQgt1Zjvndz7iKqTgh5VDwlDE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365551080"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="365551080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 15:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="831951024"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="831951024"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 15:53:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGSQ8-000Hgt-36;
	Mon, 03 Jul 2023 22:53:24 +0000
Date: Tue, 4 Jul 2023 06:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 51/65]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2037:18: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202307040613.q7u7KNVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: b76fa5f68ff99978842e71b9f821ed1302c6add9 [51/65] iommu/arm-smmu-v3: Add arm_smmu_hw_info
config: arm64-randconfig-r081-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040613.q7u7KNVb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040613.q7u7KNVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040613.q7u7KNVb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2037:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base_idr @@     got void [noderef] __iomem * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2037:18: sparse:     expected void *base_idr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2037:18: sparse:     got void [noderef] __iomem *
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2039:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2039:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2039:55: sparse:     got void *
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +2037 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2022	
  2023	static void *arm_smmu_hw_info(struct device *dev, u32 *length)
  2024	{
  2025		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2026		struct iommu_hw_info_smmuv3 *info;
  2027		void *base_idr;
  2028		int i;
  2029	
  2030		if (!master || !master->smmu)
  2031			return ERR_PTR(-ENODEV);
  2032	
  2033		info = kzalloc(sizeof(*info), GFP_KERNEL);
  2034		if (!info)
  2035			return ERR_PTR(-ENOMEM);
  2036	
> 2037		base_idr = master->smmu->base + ARM_SMMU_IDR0;
  2038		for (i = 0; i <= 5; i++)
> 2039			info->idr[i] = readl_relaxed(base_idr + 0x4 * i);
  2040	
  2041		*length = sizeof(*info);
  2042	
  2043		return info;
  2044	}
  2045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
