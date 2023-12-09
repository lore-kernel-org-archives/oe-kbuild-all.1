Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9117F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Orj32nB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702103082; x=1733639082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNB6b/M57px8o5ziP42gtE2rU7ZpP+HT0VHm/EYm4ZI=;
  b=Orj32nB+s6ripKmwFUB3E8//VA4lqrv8cCN1M42CXtU6caO+kbKS2jLG
   9Z2TX428NCnm8+8mhQE3Y129VmfufsYkHbZWQLemmiR+c12U7Jl3ax1q6
   Cl8RbrXqetp0jSwGY3Yj12y25dc+MDtXJ702BmTRdd2UAtKtNy5mmttoQ
   eNNiyIl4hqNbguC38cUE982MdCGDNyzYWGtnCoOqxqwr0imSBnczdvUtc
   vOFIj4SMRVKOw0qMBicKpfsyxtG9pY6z4SF6wJ8Uk+oDMYuVZoQwdCZuZ
   y/ffhxFZN7StTLo0eLP6lyJnrUuYMV9PjkzBHP1K3VbqMFhT3cIR02up/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1371178"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1371178"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 22:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="765728238"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="765728238"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Dec 2023 22:24:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBqjn-000EvN-0F;
	Sat, 09 Dec 2023 06:24:02 +0000
Date: Sat, 9 Dec 2023 14:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/phy/marvell/phy-mmp3-hsic.c:61:31: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202312091417.wmY8IiVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 0347c69214f4b600f40c0dc58945dc2798e2b3d9 phy: Add USB HSIC PHY driver for Marvell MMP3 SoC
date:   3 years, 1 month ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231209/202312091417.wmY8IiVm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091417.wmY8IiVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091417.wmY8IiVm-lkp@intel.com/

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
