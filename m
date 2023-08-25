Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE77E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 00:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692921731; x=1724457731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e1fRpwST1kUReshIan7LBvmwQFxrtowFfof3SmOOLkQ=;
  b=KxHS1fXdQknV18OZB9b/6L1CwCxBCbg5Ix4IDlTUEXq06tH+7EDNCl40
   TVtRir6dOh0jzzRdTTRWYCixmIOelmIPh4YkfCBTUyg3MOS4J6AEliNdc
   dX5YoUa7zUSU6DrBEwaUCackU/dhzsnmK7yTZ3vNAx6Oj+y6B76bW/xb+
   tFuC3a9OJ9XGCGikTkdMPTFBm+sS4yBRNUfXlR5pUWHSV66Kt6pSAZZma
   /Hw6128Y0Drv0TbUfKvpw5hhDlZZgbpBiBiFqKiGhUUfoqghzL6cf/aHd
   v/DS6yZ32hjF5JOuKficg/pfBzxKF+38nb7Xm5+8v6vE71T8EraaukXNE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364782056"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364782056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766755286"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766755286"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 17:02:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZKHA-00033e-2L;
	Fri, 25 Aug 2023 00:02:08 +0000
Date: Fri, 25 Aug 2023 08:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 111/120] test_set_error_stamp: rm
 /kbuild/obj/consumer/i386-buildonly-randconfig-002-20230825/.reduce_errors/drivers-iommu-io-pgtable-arm.c:warning:stack-frame-size-()-exceeds-limit-()-in-arm_lpae_do_selftests
Message-ID: <202308250718.O1QJ8KYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   71bedf9d9cd267b053b2789446fc73c2ee24c98d
commit: 8326170bb6a02c97289689a4efda7062e991285f [111/120] ANDROID: GKI: Add OEM data to mutex/rwsem
config: i386-buildonly-randconfig-002-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250718.O1QJ8KYB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250718.O1QJ8KYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250718.O1QJ8KYB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm.c:1287:19: warning: stack frame size (1028) exceeds limit (1024) in 'arm_lpae_do_selftests' [-Wframe-larger-than]
   static int __init arm_lpae_do_selftests(void)
                     ^
   24/1028 (2.33%) spills, 1004/1028 (97.67%) variables
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
