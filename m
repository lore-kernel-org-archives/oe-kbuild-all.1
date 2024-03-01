Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8647F54
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709265860; cv=none; b=lp2Bg/Fdd5hexVbDPOpTmJc+d1qZVrXFxIYhvZQIsnddbBKtIdzyG9/cz3RA21raXe6rpHkODSGXczkNujCLlfAsRGjAN5JHnwb0Ubf01JHnmbFJvpXGsOVZ9tGD1gtN6Klu7m3Fy8qKAYV9B9LCYc2HNxJfeiTZBvL33HKxfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709265860; c=relaxed/simple;
	bh=FFSsgxnc9t/gZl5yciCiBvDAI6xfbRL9h8qy5KtljBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mi3fE1VSZcTDO7JZbzVwHYbdrzsRivM6ckkyM6Vk+OA3ToyVldLc2ZopFzthUggjU8CJTj4+fl6VMQbQZbfZqwYeGCxTFhOnqw+InE//CquNGnA2zv5ReNbW6f4KnF2J1lJ2WO1I9mlYathGN/LaSW6mMVcR7naWtHD69xfiDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8UxlJWq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8UxlJWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709265858; x=1740801858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFSsgxnc9t/gZl5yciCiBvDAI6xfbRL9h8qy5KtljBM=;
  b=S8UxlJWq93rLiViYNunW4LqmtUpeB6bo94k/TjrB86O9xtFQ53v+uhff
   JsITp1TXp94yOFzyTA5lQr4WVMo7UNKt/e1CyA5SOF7ubXvEAOBeP0U3h
   6C+SvybW4l6hJVaKQGX2VEfx5zVv9tt0YNuXcBjFDA6Pe1AE4q99ntI0K
   rkscRRU3gMFJac/BqUYGnQBpSdbmjR0zn3cHHXhrik/N+MaR31QBAJb4q
   /KAIHeUOfb98rTkxJ+rTt0Bh5AYgfR/dqmi0lL3zo7Uoab9gRsAnNBxGD
   mHVHAniv5Y0bdORB5BycspJPT7zUAg7cIJSIGy2j8fxmbkknR6r2SbfrG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7609807"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="7609807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 20:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="12746012"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Feb 2024 20:04:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfu85-000DWQ-2A;
	Fri, 01 Mar 2024 04:04:13 +0000
Date: Fri, 1 Mar 2024 12:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dongxu Sun <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28950/30000] drivers/misc/virt_plat_dev.c:37:43:
 error: implicit declaration of function 'vp_get_irq_domain'; did you mean
 'dev_get_msi_domain'?
Message-ID: <202403011204.70tyD7AH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ebba55154f6b47b476dbcd26c12f31ead8bcd4c6
commit: e4c0f18287a89cbdf34dffd6ac672d89e8add238 [28950/30000] virt_plat_dev: Register the virt platform device driver
config: arm64-randconfig-001-20240301 (https://download.01.org/0day-ci/archive/20240301/202403011204.70tyD7AH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011204.70tyD7AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011204.70tyD7AH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/misc/virt_plat_dev.c: In function 'virt_device_probe':
>> drivers/misc/virt_plat_dev.c:37:43: error: implicit declaration of function 'vp_get_irq_domain'; did you mean 'dev_get_msi_domain'? [-Werror=implicit-function-declaration]
      37 |         struct irq_domain *vp_irqdomain = vp_get_irq_domain();
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           dev_get_msi_domain
>> drivers/misc/virt_plat_dev.c:37:43: warning: initialization of 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +37 drivers/misc/virt_plat_dev.c

    31	
    32	static int virt_device_probe(struct platform_device *pdev)
    33	{
    34		struct msi_desc *desc;
    35		unsigned int *drvdata = dev_get_drvdata(&pdev->dev);
    36		unsigned int nvec = *drvdata;
  > 37		struct irq_domain *vp_irqdomain = vp_get_irq_domain();
    38		int ret;
    39	
    40		if (!vp_irqdomain)
    41			return -ENXIO;
    42	
    43		virtdev_info("Allocate platform msi irqs nvecs: %d\n", nvec);
    44		dev_set_msi_domain(&pdev->dev, vp_irqdomain);
    45	
    46		ret = platform_msi_domain_alloc_irqs(&pdev->dev, nvec,
    47						     virt_write_msi_msg);
    48		if (ret) {
    49			pr_err("Allocate platform msi irqs failed %d\n", ret);
    50			goto error;
    51		}
    52	
    53		virtdev_info("Allocate platform msi irqs succeed\n");
    54		for_each_msi_entry(desc, &pdev->dev) {
    55			virtdev_info("Request irq %d\n", desc->irq);
    56			ret = request_irq(desc->irq, virt_irq_handle, 0,
    57					  "virt_dev_host", pdev);
    58			if (ret) {
    59				pr_err("Request irq %d failed %d\n", desc->irq, ret);
    60				goto error_free_irqs;
    61			}
    62		}
    63	
    64		virtdev_info("Init virtual platform device driver successfully.\n");
    65		return 0;
    66	
    67	error_free_irqs:
    68		for_each_msi_entry(desc, &pdev->dev)
    69			free_irq(desc->irq, pdev);
    70	
    71		platform_msi_domain_free_irqs(&pdev->dev);
    72	error:
    73		return ret;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
