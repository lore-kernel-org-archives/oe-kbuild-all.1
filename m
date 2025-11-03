Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CBB1339B1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 03:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762142113; cv=none; b=iHKlaRtDdtVrLcD6YBEbO1d6cLk9t1FEvvOnp8G+sn7xMdp24b0Xzh4oJQL83xbFClst2yRNijU4LRifHTlECdLXWIw1jzskyKQMqX+Sa1SQs5Pw9U3serUZw5kzXAsqoZFhGurEUqXhSXHuyfqZeFllVwBjLtlpw13gCTkZMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762142113; c=relaxed/simple;
	bh=IYqTlC3BYTctRBz2+QFLXwUPdzevfK7sPvuItOEFI7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0Kt0UPVgfUjaGiwGA4/1GfMM1kTTlItK6qzDYwFpVhtrG3kDM6ZverIFibvIg6Gh1lhMEqdHyAu6HiEkQrQX0L3+VguRIrPrz/mL19mLCwRzWE5Q/uJrS2g9JBh8rQPeqzG/7B6dfpfD62DUryftXCBFp2YRhA0A8FN4tZ9/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMm5RY8p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMm5RY8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762142111; x=1793678111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYqTlC3BYTctRBz2+QFLXwUPdzevfK7sPvuItOEFI7s=;
  b=XMm5RY8ppb8DcjB7t8GYsCdtYdB4Pc4ZwAX8DBLKWjVTYelCfF3fUP9b
   t/OwPxc2yj12ZPKHYicdkMThGLJMPJPF7aJV+8JmLk3tSRguqQI3EcO+a
   ok0ukbB/3IdUSIeD4AHtb+aEKMIInL+JB9hJU5WGNIQcFX/NcEJNyPl3v
   HSERXV/hgFKApdQoC0eXLHoucu0rdTS1lGFz2dMj0/2pRy4M7SL3/EMbG
   FGqiHamvBfW6mXEE4Jou72DY9WEOOtLAEvx/1zLRBF2oRS77cwT2ShcFd
   VvE1nZa49KnOxbg2Ha7Jp5YoAlPW2EO8yTW1dU42cicE+TSSEqJiPmo7d
   A==;
X-CSE-ConnectionGUID: UxEq6DDDSdeRPtvpDqd5Ag==
X-CSE-MsgGUID: uiobA5tITH2pUW00TozGCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75323995"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75323995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 19:55:09 -0800
X-CSE-ConnectionGUID: LwM0sOGXQ4W+PdzclpYXFg==
X-CSE-MsgGUID: oC16aFuuTLGO7mbn2aFKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="190850399"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2025 19:55:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFles-000PoK-0I;
	Mon, 03 Nov 2025 03:55:06 +0000
Date: Mon, 3 Nov 2025 11:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083]
 drivers/gpu/drm/phytium/phytium_platform.c:348:34: warning: unused variable
 'display_of_match'
Message-ID: <202511031139.BP8204ku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xuyan,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   923d7e38d0e74b4ae16ccb56d089c2210d2ea5d3
commit: 3b4a5906fa714bdc9a15fc04374942888737eb4c [3083/3083] drm/phytium: Fix Phytium DRM build fail
config: x86_64-randconfig-123-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031139.BP8204ku-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031139.BP8204ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031139.BP8204ku-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_platform.c:22:5: warning: no previous prototype for function 'phytium_platform_carveout_mem_init' [-Wmissing-prototypes]
      22 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         |     ^
   drivers/gpu/drm/phytium/phytium_platform.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | int phytium_platform_carveout_mem_init(struct platform_device *pdev,
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_platform.c:63:6: warning: no previous prototype for function 'phytium_platform_carveout_mem_fini' [-Wmissing-prototypes]
      63 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         |      ^
   drivers/gpu/drm/phytium/phytium_platform.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | void phytium_platform_carveout_mem_fini(struct platform_device *pdev,
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_platform.c:348:34: warning: unused variable 'display_of_match' [-Wunused-const-variable]
     348 | static const struct of_device_id display_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/display_of_match +348 drivers/gpu/drm/phytium/phytium_platform.c

b80df10f845813 lishuo 2024-01-31  347  
b80df10f845813 lishuo 2024-01-31 @348  static const struct of_device_id display_of_match[] = {
b80df10f845813 lishuo 2024-01-31  349  	{
b80df10f845813 lishuo 2024-01-31  350  		.compatible = "phytium,dc",
b80df10f845813 lishuo 2024-01-31  351  		.data = &pe220x_info,
b80df10f845813 lishuo 2024-01-31  352  	},
b80df10f845813 lishuo 2024-01-31  353  	{ }
b80df10f845813 lishuo 2024-01-31  354  };
e2cdf30a3e12bb XuYan  2025-04-09  355  MODULE_DEVICE_TABLE(of, display_of_match);
b80df10f845813 lishuo 2024-01-31  356  

:::::: The code at line 348 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
