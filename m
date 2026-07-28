Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9793C585C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229497; cv=none; b=o6ZxIiaOcR80FfoKPOHXC+n5KM+G0hMO3TfcdOMn33zY+fBHu4BuIPGX+eVF9Ru8jBVUmyLT4/24IS1+UW2gDLdZPfpAti7HesmtAm5FLUJTrx50Ggwv9MnmKiRwLFaBvcpLAburc6jBwj3SeK/l1LEMArFpF6EBSUu5wDVWWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229497; c=relaxed/simple;
	bh=lYJ8XhxuUDYXL3/k3xNY7Hi/b5Ng7VPe9ZNvs9wQIYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oYJgETpkule+fV33hcAm/qEpRUzVZUisEWXtXVJEu+z7Uw9b2bLvVogStJLYg4TQgBaOFSZ2fQc9NUAyC6sbsfr4bwvcM6yb+5AuQV/HQhBg7RQli1NlddCNckRqmzsPru9TjPCxymfWZZ8CyE4YCjqRKAHdJSrHIVVl+/99dCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHxs3sx4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHxs3sx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785229496; x=1816765496;
  h=date:from:to:cc:subject:message-id;
  bh=lYJ8XhxuUDYXL3/k3xNY7Hi/b5Ng7VPe9ZNvs9wQIYA=;
  b=XHxs3sx4bZwnH5yZt6N7ZUkcg6Weco8XfRwI279WX2Q9q4kzu6W8RnRR
   3kAtBXcGT53p3if5Zlky+hh7n2WD4DbyXy5viFcFcMlQJWWuqWshXEApg
   +ewqMw/dim3Wki5IpArPKs7SgMXb9cWymPDoNsHDGcaXYd8fJLoOl4hS/
   zXDyMMsIW5n4xzJ/WXZn/Zc5pssQVSF3MJyeEcVcH5mzwik++L5EJM6n4
   aUubD+AHNtIpDaKxIgKv0yUD+32jKHdv3W2NQqKveaYvyqRAvUMCD4dpv
   CUsmSElPjWpLfm8XcLV8Fw97weR8ruUUHrvY/uHiQl5TezEUX3fjSrrqA
   w==;
X-CSE-ConnectionGUID: 6yJAKxYQS0Wxe3MVNwMPbw==
X-CSE-MsgGUID: tnbbRZgNSImIY+4dudKDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85847523"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85847523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:04:55 -0700
X-CSE-ConnectionGUID: FHc+3j+PTA+bge2W2mbQoQ==
X-CSE-MsgGUID: C9PNX0D2SL+1z2Pu7vNpeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257847957"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2026 02:04:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wodk3-00000000eAV-3mul;
	Tue, 28 Jul 2026 09:04:51 +0000
Date: Tue, 28 Jul 2026 17:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 35/35]
 drivers/cma_test/cma_alloc_test_drv.c:75:19: error: initialization of 'int
 (*)(struct platform_device *)' from incompatible pointer type 'void
 (*)(struct platform_device *)'
Message-ID: <202607281609.k0wXqFZO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   d0ed0375a65ca817f907805e163e103822348f02
commit: 15432ccf862045408c00db1c2d0ee04fdc415ac6 [35/35] ANDROID: cma: Skeleton for CMA alloc test driver
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260728/202607281609.k0wXqFZO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281609.k0wXqFZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281609.k0wXqFZO-lkp@intel.com/

Note: the android-common/main-16k-gs-shusky-5.15 HEAD d0ed0375a65ca817f907805e163e103822348f02 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/cma_test/cma_alloc_test_drv.c:75:19: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
      75 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   drivers/cma_test/cma_alloc_test_drv.c:75:19: note: (near initialization for 'cma_test_driver.remove')
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
