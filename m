Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90C1F3D54
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627859; cv=none; b=I8IDOcKlFRu51v1iREMutDaLWhanL4BqDtUP44vUhNVQJwO455skYYOQZ7Ey9tnCnARaKHfS90gmCN9WyJQM+gJX38ikAq+bmAjLbVhTwkGl9gvlxPCNb+julabQIPTVEtc0yKK+sy6oF+Hyv3iUshHk4MnZ0JtqfCRxEXRtiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627859; c=relaxed/simple;
	bh=Iig3nvdbxbktalmY/99XOoIUYZNs/mxEx5+qvonN4YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+g2yMSUbYMOX1f1ZVaRUkI2fqkWma/VwiQS+G35G7/gLqvwtIW7xpzVwung9pOHqrvkfngqKmwsg5ehZDx2rbqMli7uBW0bXqXtMMlXgp66fuaeXtcZgBZA1FRSQ7rX7iwVf9yRL0DfX9J8WTVg3M5w4i1yLc33skSnO/YF0l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qhz37Mmq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qhz37Mmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743627858; x=1775163858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iig3nvdbxbktalmY/99XOoIUYZNs/mxEx5+qvonN4YE=;
  b=Qhz37MmqTFz/K14pargz3Q7hHRB2pSt6VZQ2nj/kuyPfoPWZWyyQT6Fe
   T8sZ7s6EtFV2SOwbpGXDsm0jog1HAQuL9eeDp5elshHw6Jb5JDaN2JmO+
   mAVTtpz89pMIik/xTA2PnyBmr/MgYAt2U+4UC4FG5+2pKwq5XcyMyshV/
   S4EhEZjbzCg8ePdllS8XobqztBfH0NNWHtJpLKhHBQYzsLL3pQPM+j8B8
   w63UoE42PPMxxTmHyIKKbgoUCXp8WH85EFP+MckZFrbmlFewjw+3bdTEy
   W7bAWWhODSMZ9hrUuVVBttj7XQqtVxvtOKx3kUAGkxH/b8mK3tmehPLKb
   A==;
X-CSE-ConnectionGUID: 6axVvTBOQ6SDPN7/JkIEFg==
X-CSE-MsgGUID: j34C8e/TT4aUmGKNVn+Eyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48679818"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="48679818"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:04:18 -0700
X-CSE-ConnectionGUID: OARyMvl3SfGinRvgeg6dlQ==
X-CSE-MsgGUID: A+rU4MRyTbusOwKrjPTS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="127323452"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Apr 2025 14:04:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u05Fp-000B1C-17;
	Wed, 02 Apr 2025 21:04:13 +0000
Date: Thu, 3 Apr 2025 05:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/cma_test/cma_alloc_test_drv.c:75:12: error: initialization of 'int
 (*)(struct platform_device *)' from incompatible pointer type 'void
 (*)(struct platform_device *)'
Message-ID: <202504030426.j35d0NtO-lkp@intel.com>
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
commit: 15432ccf862045408c00db1c2d0ee04fdc415ac6 [17/17] ANDROID: cma: Skeleton for CMA alloc test driver
config: arm-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030426.j35d0NtO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030426.j35d0NtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030426.j35d0NtO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cma_test/cma_alloc_test_drv.c:75:12: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     .remove = cma_test_remove,
               ^~~~~~~~~~~~~~~
   drivers/cma_test/cma_alloc_test_drv.c:75:12: note: (near initialization for 'cma_test_driver.remove')
   cc1: some warnings being treated as errors


vim +75 drivers/cma_test/cma_alloc_test_drv.c

    67	
    68	static struct platform_driver cma_test_driver = {
    69		.driver = {
    70			.name = "cma_alloc_test",
    71			.owner = THIS_MODULE,
    72			.of_match_table = of_match_ptr(cma_test_dt_ids),
    73		},
    74		.probe = cma_test_probe,
  > 75		.remove = cma_test_remove,
    76		.suspend = cma_test_suspend,
    77		.shutdown = cma_test_shutdown,
    78		.resume = cma_test_resume,
    79		.id_table = cma_test_id_table,
    80	};
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
