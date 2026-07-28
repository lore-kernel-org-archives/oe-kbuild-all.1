Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6642FCAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243325; cv=none; b=GNG7uWJRUtYojALXJUzwU/02uY7jUe/6qZP6cX6uXUpb/IiqXRgHGwvfM82FO/S89/18FpYrq31zWl06+F+H2i+3UajT7bPMQs6BdpltcZbzvHp+ox5Zq0KmgI+42syZVcN1sVE6vXy0EG5rgAhGnq2SuD215w+jRC1CFl24pkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243325; c=relaxed/simple;
	bh=WjLDeMzhdZUxgnGo2yq9iZWhRRzDc//SV6ykYUYjazA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OmIOs0c8dJPAVK4LYR9MsEVwLb3RwesuRuWw+gtGwEJ9p0qEc+e33fuBV8DJoKIvvWyOcade6tbl8DCZomQXzGAuEZ/tsELHmDW9FVFhJDtSX3m9HOu0qNNiPbLCuMsp4+T8UYrgxk+o1aptWaFw4BXE80xBJNfrU8k/zexFJkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOHgkhlo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOHgkhlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785243323; x=1816779323;
  h=date:from:to:cc:subject:message-id;
  bh=WjLDeMzhdZUxgnGo2yq9iZWhRRzDc//SV6ykYUYjazA=;
  b=jOHgkhloMwx3C0viyPqciqJQ5gGA9PMlQriuNjiRBOGH/j5WzvXONHPS
   BQ+JNBR47Rlx+IjBnvqLafYZeglD8a9wPExLxpEDTtNfDGYoJiO9C6OJw
   Rrs8qgxqStuljhU47vPeL2w8hf2egwuOcR9y4AZa7v83/0WCS9owpWF+O
   a/ox+Qx7BRZbdECxODukPrx5Fdu2bHqd+wUNRf52kxQuGymL5O29JLECn
   1Uu3T7edYlFGc4N7YcgGp0quiG4SpOMLtPS1JMBvXevSTITf1Dn91Hwoq
   FY8ZvpAklatjYBQHBKrUu/d5vnchuEKobIKL4YhbbnkCtQNt74OIhD1eU
   Q==;
X-CSE-ConnectionGUID: 2sPFXgQmTkuo4ibVLcVtng==
X-CSE-MsgGUID: SYsQU+jCRsC5ZMn509+iDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103232559"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="103232559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:55:22 -0700
X-CSE-ConnectionGUID: Qq/3viS3QeiLQNOXn6h3Tg==
X-CSE-MsgGUID: jQDtoA9kSE6rQPmdFLqx1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="260343522"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 05:55:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wohL3-00000000eLX-400q;
	Tue, 28 Jul 2026 12:55:17 +0000
Date: Tue, 28 Jul 2026 20:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma_test/cma_alloc_test_drv.c:122:8: warning: GCC does not allow
 variable declarations in for loop initializers before C99
Message-ID: <202607282010.bVwVrzH4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: 43b8bd1b3be373d3fd2e20886db6cb08d4081ad5 [35/35] ANDROID: cma: Allocate CMA memory at probing time
config: x86_64-randconfig-161-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282010.bVwVrzH4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282010.bVwVrzH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282010.bVwVrzH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:356:9: note: previous definition is here
     356 | #define __SANITIZE_ADDRESS__ 1
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
