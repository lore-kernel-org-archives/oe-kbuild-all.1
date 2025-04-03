Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E72DDA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743640413; cv=none; b=kyUGSH2BfHUSqZT72NmrLuw8v0jHyh8R93HwiksXGQl2bLXuaXpAbWItlC4ZrmsyxyoaT1E5D05YGov+NCeczYzZvWYPDe+agLGb1BtPFQlTCl3jvDd9VEwdqbvSovp8ilM+ulTBy7N/D2VmDRQB9YM7REzpnK3T+I0GIMgq8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743640413; c=relaxed/simple;
	bh=bTRXaZLZ/8rFCaDWYqf1Tn3ZPSIor5uoGZpwuVvgRsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPGXhH/SagB1oQ86tDu4A+yBEJaNw+WC6FJmVJsbFmfFukJX5M44bB3p5b9CapEyC6x4VDm6eIa6LphbhAVfzdza0PyMP4V5Hh1HdtS83EQtfRj/EZ4SqkK5vYd8G1/BCo651wM8Yyk4rjkXTfsKKU8J+UC/yYVJH9IAGuyAK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6xlFo8/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6xlFo8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743640410; x=1775176410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTRXaZLZ/8rFCaDWYqf1Tn3ZPSIor5uoGZpwuVvgRsQ=;
  b=g6xlFo8/TMl3gkyml22pMxDbz/VUedbmegE7bHUlt/phHCtKsxH62sbp
   MN0oI9G6LIDATTRw0I2aLbyXQQfyE0f4QtBNCZJHUIdChDo5Cwx1DZ8H3
   k5u7lkuOaTOhPoKEsjyKi7yPfSP9Dl4g159C2Z8gHEn5eC0fdYnhN8V+2
   9/RLOjH8GpPZlhyzrTa+9wYBIZEjGf8xMC3cBokLjq5/T7DUWcp6V9G3E
   spPlntkvwT62QSI4wQfXnVtb4Ril1KGheBtDfzc5rDSXxNllHebflmtaz
   Tvg3291Zj/CJ3Z09vjOhFen0RP/LqqLCJRXycJxTZDlXkvydbiQx1x40S
   g==;
X-CSE-ConnectionGUID: 9NS2QT+fQ66m2iQaIyhwUA==
X-CSE-MsgGUID: w4dFTZ4URyGVy9ZN8FZm3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62432762"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="62432762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 17:33:29 -0700
X-CSE-ConnectionGUID: SHoXwqLGQpuVTnbeArKGww==
X-CSE-MsgGUID: vPtkDwPuQ86KrZcsLQttyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="130980354"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2025 17:33:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u08WL-000B7y-37;
	Thu, 03 Apr 2025 00:33:25 +0000
Date: Thu, 3 Apr 2025 08:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:122:3: error: 'for' loop initial
 declarations are only allowed in C99 or C11 mode
Message-ID: <202504030800.EtHpXF4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   f344ab3d86fe50dc56c87b7a96c07b8210635ec5
commit: 43b8bd1b3be373d3fd2e20886db6cb08d4081ad5 [17/17] ANDROID: cma: Allocate CMA memory at probing time
config: arm-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030800.EtHpXF4e-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030800.EtHpXF4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030800.EtHpXF4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma_test/cma_alloc_test_drv.c: In function 'cma_test_probe':
   drivers/cma_test/cma_alloc_test_drv.c:104:24: error: 'struct device' has no member named 'cma_area'; did you mean 'dma_parms'?
     if (ret || !pdev->dev.cma_area) {
                           ^~~~~~~~
                           dma_parms
   drivers/cma_test/cma_alloc_test_drv.c:117:22: error: 'struct device' has no member named 'cma_area'; did you mean 'dma_parms'?
     cma_ptr = pdev->dev.cma_area;
                         ^~~~~~~~
                         dma_parms
>> drivers/cma_test/cma_alloc_test_drv.c:122:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
      for (int i = 0; i < nr_pages; i++) {
      ^~~
   drivers/cma_test/cma_alloc_test_drv.c:122:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
   drivers/cma_test/cma_alloc_test_drv.c: At top level:
   drivers/cma_test/cma_alloc_test_drv.c:167:12: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     .remove = cma_test_remove,
               ^~~~~~~~~~~~~~~
   drivers/cma_test/cma_alloc_test_drv.c:167:12: note: (near initialization for 'cma_test_driver.remove')
   cc1: some warnings being treated as errors


vim +/for +122 drivers/cma_test/cma_alloc_test_drv.c

    88	
    89	static int cma_test_probe(struct platform_device *pdev)
    90	{
    91		int ret;
    92		const struct of_device_id *of_id;
    93	
    94		pr_info("Probing device");
    95	
    96		buffer = NULL;
    97		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    98		if (!of_id) {
    99			pr_info("The node was not found in DTB");
   100			return -ENODEV;
   101		}
   102	
   103		ret = of_reserved_mem_device_init(&pdev->dev);
 > 104		if (ret || !pdev->dev.cma_area) {
   105			dev_err(&pdev->dev,
   106				"The CMA reserved area is not assigned (ret %d)\n",
   107				ret);
   108			return -EINVAL;
   109		}
   110	
   111		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   112		if (ret) {
   113			of_reserved_mem_device_release(&pdev->dev);
   114			return ret;
   115		}
   116	
   117		cma_ptr = pdev->dev.cma_area;
   118		pages = cma_alloc(cma_ptr, nr_pages, get_order(PAGE_SIZE), false);
   119		if (pages) {
   120			pr_info("CMA allocation of %d pages was successful", nr_pages);
   121			buffer = kmap_local_page(pages);
 > 122			for (int i = 0; i < nr_pages; i++) {
   123				// Write one byte of every page.
   124				buffer[i * PAGE_SIZE] = 'A';
   125			}
   126	
   127		}
   128	
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
