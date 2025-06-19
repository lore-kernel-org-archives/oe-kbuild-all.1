Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D32045B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328325; cv=none; b=shgx7v+9SUo+tStPFZxDfRS8LyS8BzY6maq+nA2JKPK7AxS9zjMVmTnk15XIJ/l3A52GEMH/bwSMhw94PjdKGTNaBprvxMP1iNeLx2EELRb/mroUYiR5tXzaSdXpEBK5EWJCXCA47mWKGzLo1gstF0slweEPeTo1YSqHtKk9s3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328325; c=relaxed/simple;
	bh=SUmF8fyssGxq5hXME18qvwT40jpgGc1hJtPipqGMuHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8PRiQ3aEHL8jObM6Ra/gMpfGdkQLdytEgYCnNJsdUturpLHU7UVmEjt7Oxjjmo3J8TJ4JaFNwby1T5++G1Rh93HRZuuCtudX7Ewn+BFzCMiBbDmm4hFaBdniLzoxcolHLhmke41An8RZki5ONg/ywc3eLnLoxN4HII3+lEKW70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeRlVGkt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeRlVGkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750328324; x=1781864324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUmF8fyssGxq5hXME18qvwT40jpgGc1hJtPipqGMuHU=;
  b=EeRlVGktlLU13Te/gXZmCVJqwqj/fBvDkvtAyQKA4Sk+sQW+wYir79X7
   4/Bjrhi+VRBzkcDnBJDLhKkciyoOuUPZtUMhb6P6fGKporGmTJ2xiju65
   1/FQwcBMwfVUIe03OFc4hSfNtABS9E1gIKbvLrQ5yQqLULCb60mGhq4RE
   bia78hEdlN7YY96mJEL6UkP8Xc4ZQEDXYmd/y5dLAsp8K/rrB3HDCYKFu
   KpktadET9smyJPLcZqW6otulQ/sH0X0sWDmi3vjEOfH3ZTB0s1RNmGOtD
   0DTHULigiIFHPZg5BXm3JbtJCB3VpY1I/w9afiQcVugj915qkRqRA8xL8
   g==;
X-CSE-ConnectionGUID: swHfYn7ETduApVBfwP14JQ==
X-CSE-MsgGUID: 2nXve6trQ/+uYHhXqfrB6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63618133"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="63618133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:18:42 -0700
X-CSE-ConnectionGUID: RR0ns9LcRQatLG1lmliAOA==
X-CSE-MsgGUID: LXwlgmXHTdaI6hrfDKflVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151273882"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2025 03:18:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSCLu-000Ke2-2X;
	Thu, 19 Jun 2025 10:18:38 +0000
Date: Thu, 19 Jun 2025 18:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 31/42]
 drivers/iommu/riscv/iommu-platform.c:87:9: error: implicit declaration of
 function 'platform_device_msi_init_and_alloc_irqs'; did you mean
 'platform_device_add_resources'?
Message-ID: <202506191740.xbEZ4Cs8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   4245120afe2501de333527c4d900356914995527
commit: 0e4b88c34d96463fa8a36c1408dbe535ef01e8c2 [31/42] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
config: alpha-randconfig-r054-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191740.xbEZ4Cs8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191740.xbEZ4Cs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191740.xbEZ4Cs8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu-platform.c: In function 'riscv_iommu_platform_probe':
>> drivers/iommu/riscv/iommu-platform.c:87:9: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs'; did you mean 'platform_device_add_resources'? [-Werror=implicit-function-declaration]
      ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            platform_device_add_resources
   drivers/iommu/riscv/iommu-platform.c: In function 'riscv_iommu_platform_remove':
>> drivers/iommu/riscv/iommu-platform.c:140:3: error: implicit declaration of function 'platform_device_msi_free_irqs_all'; did you mean 'platform_device_add_resources'? [-Werror=implicit-function-declaration]
      platform_device_msi_free_irqs_all(&pdev->dev);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      platform_device_add_resources
   cc1: some warnings being treated as errors


vim +87 drivers/iommu/riscv/iommu-platform.c

d5f88acdd6ff84 Andrew Jones   2024-11-12   43  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   44  static int riscv_iommu_platform_probe(struct platform_device *pdev)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   45  {
d5f88acdd6ff84 Andrew Jones   2024-11-12   46  	enum riscv_iommu_igs_settings igs;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   47  	struct device *dev = &pdev->dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   48  	struct riscv_iommu_device *iommu = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   49  	struct resource *res = NULL;
d5f88acdd6ff84 Andrew Jones   2024-11-12   50  	int vec, ret;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   51  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   52  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   53  	if (!iommu)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   54  		return -ENOMEM;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   55  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   56  	iommu->dev = dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   57  	iommu->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   58  	if (IS_ERR(iommu->reg))
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   59  		return dev_err_probe(dev, PTR_ERR(iommu->reg),
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   60  				     "could not map register region\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   61  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   62  	dev_set_drvdata(dev, iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   63  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   64  	/* Check device reported capabilities / features. */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   65  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   66  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   67  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   68  	iommu->irqs_count = platform_irq_count(pdev);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   69  	if (iommu->irqs_count <= 0)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   70  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   71  				     "no IRQ resources provided\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   72  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   73  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15   74  
d5f88acdd6ff84 Andrew Jones   2024-11-12   75  	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
d5f88acdd6ff84 Andrew Jones   2024-11-12   76  	switch (igs) {
d5f88acdd6ff84 Andrew Jones   2024-11-12   77  	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
d5f88acdd6ff84 Andrew Jones   2024-11-12   78  	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
d5f88acdd6ff84 Andrew Jones   2024-11-12   79  		if (is_of_node(dev->fwnode))
d5f88acdd6ff84 Andrew Jones   2024-11-12   80  			of_msi_configure(dev, to_of_node(dev->fwnode));
d5f88acdd6ff84 Andrew Jones   2024-11-12   81  
d5f88acdd6ff84 Andrew Jones   2024-11-12   82  		if (!dev_get_msi_domain(dev)) {
d5f88acdd6ff84 Andrew Jones   2024-11-12   83  			dev_warn(dev, "failed to find an MSI domain\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12   84  			goto msi_fail;
d5f88acdd6ff84 Andrew Jones   2024-11-12   85  		}
d5f88acdd6ff84 Andrew Jones   2024-11-12   86  
d5f88acdd6ff84 Andrew Jones   2024-11-12  @87  		ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
d5f88acdd6ff84 Andrew Jones   2024-11-12   88  							      riscv_iommu_write_msi_msg);
d5f88acdd6ff84 Andrew Jones   2024-11-12   89  		if (ret) {
d5f88acdd6ff84 Andrew Jones   2024-11-12   90  			dev_warn(dev, "failed to allocate MSIs\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12   91  			goto msi_fail;
d5f88acdd6ff84 Andrew Jones   2024-11-12   92  		}
d5f88acdd6ff84 Andrew Jones   2024-11-12   93  
d5f88acdd6ff84 Andrew Jones   2024-11-12   94  		for (vec = 0; vec < iommu->irqs_count; vec++)
d5f88acdd6ff84 Andrew Jones   2024-11-12   95  			iommu->irqs[vec] = msi_get_virq(dev, vec);
d5f88acdd6ff84 Andrew Jones   2024-11-12   96  
d5f88acdd6ff84 Andrew Jones   2024-11-12   97  		/* Enable message-signaled interrupts, fctl.WSI */
d5f88acdd6ff84 Andrew Jones   2024-11-12   98  		if (iommu->fctl & RISCV_IOMMU_FCTL_WSI) {
d5f88acdd6ff84 Andrew Jones   2024-11-12   99  			iommu->fctl ^= RISCV_IOMMU_FCTL_WSI;
d5f88acdd6ff84 Andrew Jones   2024-11-12  100  			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
d5f88acdd6ff84 Andrew Jones   2024-11-12  101  		}
d5f88acdd6ff84 Andrew Jones   2024-11-12  102  
d5f88acdd6ff84 Andrew Jones   2024-11-12  103  		dev_info(dev, "using MSIs\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12  104  		break;
d5f88acdd6ff84 Andrew Jones   2024-11-12  105  
d5f88acdd6ff84 Andrew Jones   2024-11-12  106  msi_fail:
d5f88acdd6ff84 Andrew Jones   2024-11-12  107  		if (igs != RISCV_IOMMU_CAPABILITIES_IGS_BOTH) {
d5f88acdd6ff84 Andrew Jones   2024-11-12  108  			return dev_err_probe(dev, -ENODEV,
d5f88acdd6ff84 Andrew Jones   2024-11-12  109  					     "unable to use wire-signaled interrupts\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12  110  		}
d5f88acdd6ff84 Andrew Jones   2024-11-12  111  
d5f88acdd6ff84 Andrew Jones   2024-11-12  112  		fallthrough;
d5f88acdd6ff84 Andrew Jones   2024-11-12  113  
d5f88acdd6ff84 Andrew Jones   2024-11-12  114  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  115  		for (vec = 0; vec < iommu->irqs_count; vec++)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  116  			iommu->irqs[vec] = platform_get_irq(pdev, vec);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  117  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  118  		/* Enable wire-signaled interrupts, fctl.WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  119  		if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  120  			iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  121  			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  122  		}
d5f88acdd6ff84 Andrew Jones   2024-11-12  123  		dev_info(dev, "using wire-signaled interrupts\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12  124  		break;
d5f88acdd6ff84 Andrew Jones   2024-11-12  125  	default:
d5f88acdd6ff84 Andrew Jones   2024-11-12  126  		return dev_err_probe(dev, -ENODEV, "invalid IGS\n");
d5f88acdd6ff84 Andrew Jones   2024-11-12  127  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  128  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  129  	return riscv_iommu_init(iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  130  };
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  131  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  132  static void riscv_iommu_platform_remove(struct platform_device *pdev)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  133  {
d5f88acdd6ff84 Andrew Jones   2024-11-12  134  	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
d5f88acdd6ff84 Andrew Jones   2024-11-12  135  	bool msi = !(iommu->fctl & RISCV_IOMMU_FCTL_WSI);
d5f88acdd6ff84 Andrew Jones   2024-11-12  136  
d5f88acdd6ff84 Andrew Jones   2024-11-12  137  	riscv_iommu_remove(iommu);
d5f88acdd6ff84 Andrew Jones   2024-11-12  138  
d5f88acdd6ff84 Andrew Jones   2024-11-12  139  	if (msi)
d5f88acdd6ff84 Andrew Jones   2024-11-12 @140  		platform_device_msi_free_irqs_all(&pdev->dev);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  141  };
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  142  

:::::: The code at line 87 was first introduced by commit
:::::: d5f88acdd6ff84607043a6845b81e4be148f9fd9 iommu/riscv: Add support for platform msi

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
