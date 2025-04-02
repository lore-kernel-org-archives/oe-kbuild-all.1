Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7426AFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636656; cv=none; b=u1YjK/RcQ5gT8o2xGAOrfONY4nTECqtyAk6f6qe/28IV3wWMJm4YMlV59j0qj6Qefs4U6xxHQai+BU/Zdq9aCw8Ex9tAOnXlq232BbTuUdqEY3GU2Y0Q8Nf3hdR9lRz5aIsTvzOLZk62Rs1HwCIJHDI3wzwLZadK2DYOdZ+4Ycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636656; c=relaxed/simple;
	bh=EiJNr93OAYEfKUp2nWIuForUgpmPtbOgPRI5EAFQ+wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrFaPT3SjMrb2tok3Pf/H5EYqRqWx9ZGfQ/LuJXufCRexg+FMNoxpXyo32Pvz5b0Ze4+/s6VwXeTLNXOEvXVum/YprBB6wlKvb0XIhswC3R61c+ymPBtAd9kBHXHgZP8rNqZk2gx46N+OmEO7W2C+yuwZ5OMXC09OmxatPTB7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwrNgyF2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwrNgyF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743636654; x=1775172654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiJNr93OAYEfKUp2nWIuForUgpmPtbOgPRI5EAFQ+wc=;
  b=SwrNgyF2bM4X59IFShNBBEll8JGBmGiRQSuurHLHcwmZrmc8eyjLuDn2
   3HUzuNoE88gHO9IdzGLWuMqQ1HAVe06mZVmQqmWW0SWG9pzIlfqcYk1rp
   0Jo7rPL7C8rSOk9znF5NQsGWHoS/HUQDSzRswhV9/szBl9iRrhHe6rUao
   FtaCQ0p4XAFjkg300tTBOASyv/yDjcUPtfblCNymtEoUabsbgXoJi98ES
   ii2ln/hPyGBF2VZ52xFGan3YR3EqT8cQvuDYF3Y6uVAsvs4RTKCunwEqa
   0HLhqmfRhTD6AiJ92DkKxVFpgmU/I0RkmKAcsI7zPtnQ7wm/c9/CZHgKu
   w==;
X-CSE-ConnectionGUID: tYQmbqtaS/m67afUvBqNTA==
X-CSE-MsgGUID: e7TFJEwqRwWWxbyeJ8S0hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55692621"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="55692621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 16:30:54 -0700
X-CSE-ConnectionGUID: k9BaD65LRZuC6OgCXfUBrA==
X-CSE-MsgGUID: eJ1+V/DZRra9NFbkZB/6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="150045039"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2025 16:30:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u07Xn-000B6Q-07;
	Wed, 02 Apr 2025 23:30:51 +0000
Date: Thu, 3 Apr 2025 07:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:93:24: error: 'struct device' has no
 member named 'cma_area'; did you mean 'dma_parms'?
Message-ID: <202504030743.46QxRGS4-lkp@intel.com>
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
commit: f13d84382b42c33d4a27e09136721a997da6b225 [17/17] ANDROID: cma: Init the CMA reserved memory during probing
config: arm-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030743.46QxRGS4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030743.46QxRGS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030743.46QxRGS4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma_test/cma_alloc_test_drv.c: In function 'cma_test_probe':
>> drivers/cma_test/cma_alloc_test_drv.c:93:24: error: 'struct device' has no member named 'cma_area'; did you mean 'dma_parms'?
     if (ret || !pdev->dev.cma_area) {
                           ^~~~~~~~
                           dma_parms
   drivers/cma_test/cma_alloc_test_drv.c: At top level:
   drivers/cma_test/cma_alloc_test_drv.c:140:12: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     .remove = cma_test_remove,
               ^~~~~~~~~~~~~~~
   drivers/cma_test/cma_alloc_test_drv.c:140:12: note: (near initialization for 'cma_test_driver.remove')
   cc1: some warnings being treated as errors


vim +93 drivers/cma_test/cma_alloc_test_drv.c

    78	
    79	static int cma_test_probe(struct platform_device *pdev)
    80	{
    81		int ret;
    82		const struct of_device_id *of_id;
    83	
    84		pr_info("Probing device");
    85	
    86		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    87		if (!of_id) {
    88			pr_info("The node was not found in DTB");
    89			return -ENODEV;
    90		}
    91	
    92		ret = of_reserved_mem_device_init(&pdev->dev);
  > 93		if (ret || !pdev->dev.cma_area) {
    94			dev_err(&pdev->dev,
    95				"The CMA reserved area is not assigned (ret %d)\n",
    96				ret);
    97			return -EINVAL;
    98		}
    99	
   100		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   101		if (ret) {
   102			of_reserved_mem_device_release(&pdev->dev);
   103			return ret;
   104		}
   105	
   106		return 0;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
