Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6E3F23AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766300; cv=none; b=cORFLROMqMmixwr0BU/peanhS7m5gR5uEHV7FuSPyp5TfQcOwux0mTmMH/2+ghq77IeSXiD4kSYb1siBCdPZuhXRFWON4s1mUZOoYFXxoGltifjrvFADJWywaYnd/Gu0yVVXvdlh7MPdJ7Uy/dafaGkeRZ4NcUV1k3BbI+2LnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766300; c=relaxed/simple;
	bh=0J9QJyuDHsmBwYpu/g2rfRU+fJfM6pgkcBctstZSFcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERUjOFc3a/HjJZygcossaXsj4t2E6B4cIY0wXcxa3Afi+FYLbk5R6M5yq3EQpJB7GggtjNcW0UJIHmw9b0uPObRiF2gLspX9CZgcxWaPHiuWvWJbf4zV9JW8uumnpY48mIBxKZx+Ma3dAX3jqnC+q7akE9XKqmsMT7vr320W0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b04sJeKE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b04sJeKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773766295; x=1805302295;
  h=date:from:to:cc:subject:message-id;
  bh=0J9QJyuDHsmBwYpu/g2rfRU+fJfM6pgkcBctstZSFcc=;
  b=b04sJeKEYGxy/Rh4UPCVswOL0qBQr+mjtd/Rhnw8XeQ6yYeQW0yeYCm/
   pdueH0pMw/vmm1qKEAJkoMplcNe4mgRnCHzQLNUE2604NAfedHTjOgX4/
   CCT4AuVBiwTUMUxoa6SSvKceZc+SjpLbWPRjJdFuZLQoYxvi/ROD/SGC0
   nYHzeAzDAX0vOWYEnJaG47gDt4MaJKUj4uNd3PuyKJEeMxymwyHaOuDDI
   AjIMINePlt6Si5DWB5A3upddoBSSJ+dOydgkcJSuNp+Y9pteaiqvJ01xP
   juKNZDiE50OMI/Ja+EokWT9CzynLv3EF4xwai/6v6ZDM4PiHQFswU2CvE
   w==;
X-CSE-ConnectionGUID: vW8AJbFWT12p70GvCFCMmA==
X-CSE-MsgGUID: OYLejJGqSDiW5Fs8bgBE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74926307"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74926307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:51:34 -0700
X-CSE-ConnectionGUID: aLNgWpLjT0KTTGaiQIDbOQ==
X-CSE-MsgGUID: 2+xU+PgzRBaStcA4ygpusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219822522"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 09:51:31 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Xdh-000000000yf-1Wxl;
	Tue, 17 Mar 2026 16:51:29 +0000
Date: Wed, 18 Mar 2026 00:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma_test/cma_alloc_test_drv.c:122:8: warning: GCC does not allow
 variable declarations in for loop initializers before C99
Message-ID: <202603180018.Af9ORmD0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: 43b8bd1b3be373d3fd2e20886db6cb08d4081ad5 [30/30] ANDROID: cma: Allocate CMA memory at probing time
config: x86_64-buildonly-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180018.Af9ORmD0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180018.Af9ORmD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180018.Af9ORmD0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/cma_test/cma_alloc_test_drv.c:104:24: error: no member named 'cma_area' in 'struct device'
     104 |         if (ret || !pdev->dev.cma_area) {
         |                     ~~~~~~~~~ ^
   drivers/cma_test/cma_alloc_test_drv.c:117:22: error: no member named 'cma_area' in 'struct device'
     117 |         cma_ptr = pdev->dev.cma_area;
         |                   ~~~~~~~~~ ^
>> drivers/cma_test/cma_alloc_test_drv.c:122:8: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
     122 |                 for (int i = 0; i < nr_pages; i++) {
         |                      ^
   drivers/cma_test/cma_alloc_test_drv.c:167:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
     167 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.


vim +122 drivers/cma_test/cma_alloc_test_drv.c

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
   104		if (ret || !pdev->dev.cma_area) {
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
