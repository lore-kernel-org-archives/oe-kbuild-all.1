Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19482D6E4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754866; cv=none; b=Fv11lVW4wO9iV89f1h7cZDtfFdCOtmYHB5qg45H2ZguP6GcfXAxfmMu+/jzFGtcBnu46j5AHzc+MxU7T56THlkgwjLMWYPKOD6jx2G4RSJezrMFXkEFuBj408qYgT1hVGxBIMBN0SBg8o/sm12ygLK47KUaXmaEbOsNInRkP4DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754866; c=relaxed/simple;
	bh=g5fv3xWA5KLF3ATUInIOWX3SWapCC6JCi/RfBcm1NkY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LE6Zbog4lZeq7vPIzryLfG5AxxdtzSBgk8DuiCIgkSfMES+W5PrCL8xloQQcnr3cK1GyJkAKCPy0SVzXY3DLwxjMIlJZsss8Y3e6KAj5OLmuqurN8DcBgWCwLZiGZllOINY/2gmYoan1KRt52Vj0SWzYUl+pKR4mXxyIVvIB1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6admmRO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6admmRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773754865; x=1805290865;
  h=date:from:to:cc:subject:message-id;
  bh=g5fv3xWA5KLF3ATUInIOWX3SWapCC6JCi/RfBcm1NkY=;
  b=m6admmROaSUTRwsKc1xH4k9UeLJCaMytaEH5oIziIv35koZbKFRW7jMY
   T8T7WI9dHIXm5BTfc16iJjNujMPPLZte7rztrfXLoStgE91R46dMy4oLx
   mhZ66XtJGv0wNYr/RQsEBJD8Iq6Zclm8tcr5tEQxVMxxAaiMYIA2J2rul
   kjn2mqYcA7pwAjb7IJCmAy7YEXlC2HyJGjvbs1lMFTdfaghPlEYclgyLY
   tS6vr7cqnSjfO5o5qw8qlkaYpfk6QT+djGIU2xy+yGhVLjNxz9ME3SIeU
   MjD8AV5v2ZV+v3JZd/pOcL6OjaKvTSP8WIR54zQS4fmyZVNu1V1KATk7V
   A==;
X-CSE-ConnectionGUID: BEXKDZNATiuo3cDLAdzWPw==
X-CSE-MsgGUID: FqrfogsxQaqP6J5Jl6f1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="62352033"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62352033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:41:04 -0700
X-CSE-ConnectionGUID: S4nrMOr3QGqGuOx4f7ov3A==
X-CSE-MsgGUID: Wl9bZ3nUQ9a0rFnO/BJoGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221317443"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2026 06:41:03 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2UfL-000000000Tp-3tcj;
	Tue, 17 Mar 2026 13:40:59 +0000
Date: Tue, 17 Mar 2026 21:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma_test/cma_alloc_test_drv.c:75:12: error: incompatible function
 pointer types initializing 'int (*)(struct platform_device *)' with an
 expression of type 'void (struct platform_device *)'
Message-ID: <202603172157.TOR1ZHZ8-lkp@intel.com>
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
commit: 15432ccf862045408c00db1c2d0ee04fdc415ac6 [30/30] ANDROID: cma: Skeleton for CMA alloc test driver
config: x86_64-buildonly-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260317/202603172157.TOR1ZHZ8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172157.TOR1ZHZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172157.TOR1ZHZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/cma_test/cma_alloc_test_drv.c:75:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
      75 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   1 warning and 1 error generated.


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
