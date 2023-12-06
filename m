Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20ED523
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 07:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfeleS8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701847703; x=1733383703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2BLxMeFCg26MvmvkQY1Eoek5zZc7iBvIKIQlKS+GRQ=;
  b=YfeleS8rDVcXf7oxmSS1LusZ1dIdU/oXVqJLp08or6es51hC6neiL6z+
   P2Hsozh/mOONqtbmlQaYudmIBJMmS9fjyKn5xrSflzHI8ryOLjejsTbA8
   lpIkV4TfvfsexSQ9R18wWhw3g6PJKBBDlouYxf9UC9ur5/Ijj4fpVmJy3
   u/DezWj8sbT8N4+ofCktHiWjxi81tJVynPds9jLdIyM8TXu7AD767fonP
   PLb+0DaxywKctPQj47bCEAkBAlqe4HbUjNaaMRowjWk9QQgEfRcBPmuvf
   byzl6bf92v7vOmk+RLpAr5JowQRuvC6VJg/AiAFrhC84wSdV6avjPj5Bt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391189447"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="391189447"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720987882"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="720987882"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 23:28:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAmKO-000ASw-13;
	Wed, 06 Dec 2023 07:28:16 +0000
Date: Wed, 6 Dec 2023 15:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/phy/marvell/phy-mmp3-hsic.c:61:31: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202312061540.CHjD764h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 0347c69214f4b600f40c0dc58945dc2798e2b3d9 phy: Add USB HSIC PHY driver for Marvell MMP3 SoC
date:   3 years, 1 month ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231206/202312061540.CHjD764h-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061540.CHjD764h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061540.CHjD764h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/marvell/phy-mmp3-hsic.c:61:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/phy/marvell/phy-mmp3-hsic.c: note: in included file (through arch/openrisc/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [usertype]

vim +/__iomem +61 drivers/phy/marvell/phy-mmp3-hsic.c

    39	
    40	static int mmp3_hsic_phy_probe(struct platform_device *pdev)
    41	{
    42		struct device *dev = &pdev->dev;
    43		struct phy_provider *provider;
    44		struct resource *resource;
    45		void __iomem *base;
    46		struct phy *phy;
    47	
    48		resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    49		base = devm_ioremap_resource(dev, resource);
    50		if (IS_ERR(base)) {
    51			dev_err(dev, "failed to remap PHY regs\n");
    52			return PTR_ERR(base);
    53		}
    54	
    55		phy = devm_phy_create(dev, NULL, &mmp3_hsic_phy_ops);
    56		if (IS_ERR(phy)) {
    57			dev_err(dev, "failed to create PHY\n");
    58			return PTR_ERR(phy);
    59		}
    60	
  > 61		phy_set_drvdata(phy, (void *)base);
    62		provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
    63		if (IS_ERR(provider)) {
    64			dev_err(dev, "failed to register PHY provider\n");
    65			return PTR_ERR(provider);
    66		}
    67	
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
