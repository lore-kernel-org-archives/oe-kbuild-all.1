Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359596AA3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693417402; x=1724953402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lgmFHIVDIXwBy8GWQplJzc2mVClROvZnERmq1eoZsY=;
  b=aCYgPXy9K41+sdqQvffzxYdI6WuGeSYeC3gCBFDkGwZrgnMlswOYjN2h
   /4G5w99GrNhnIht6uB4kMXRwb2oM6aaQPz0KupB4tTnyxftlkHupaby2x
   gxzuYCbk8yMts5OYCAGexk+JJyj2i4xf2u04Uvr71cdfd96Y14/5bFxZV
   3CpMIROeqU4P6IdNw2Du5dz/cGUQ/Gk0Y5WkaApvaZ+KAV8u0VAfWZo2k
   cUb4sQsu+5Nwd5ahKt90W9tx8eJMfdSbvpvSQGkwjqDiLHqCNK+NaQWxe
   VrD3AuqU+Xvuf07/gv/hrVgcyPmQO/XbaoLpPgoSa4mtNlGg4WRtc1X5W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356026676"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="356026676"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 10:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739170565"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="739170565"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 10:43:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbPDs-000A55-1F;
	Wed, 30 Aug 2023 17:43:20 +0000
Date: Thu, 31 Aug 2023 01:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 6099/9113] drivers/spi/spi-aspeed-smc.c:741:8:
 error: incompatible function pointer types initializing 'ssize_t (*)(struct
 device *, struct device_attribute *, char *)' (aka 'long (*)(struct device
 *, struct device_attribute *, char *)') with an expression of type '...
Message-ID: <202308310151.ZDWtYCix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux spb1-hacking
head:   b3de99e1aeeeae3e96ffc4c34afae3d2ef4c8175
commit: 513a18e0c4a1ca860a5863e4d7d09941da423dea [6099/9113] spi: aspeed: Introduce a "windows" device attribute
config: x86_64-buildonly-randconfig-005-20230829 (https://download.01.org/0day-ci/archive/20230831/202308310151.ZDWtYCix-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310151.ZDWtYCix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310151.ZDWtYCix-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-aspeed-smc.c:741:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
   static DEVICE_ATTR_RO(windows);
          ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:136:45: note: expanded from macro 'DEVICE_ATTR_RO'
           struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
                                                      ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
           .show   = _name##_show,                                         \
                     ^~~~~~~~~~~~
   <scratch space>:14:1: note: expanded from here
   windows_show
   ^~~~~~~~~~~~
   1 error generated.


vim +741 drivers/spi/spi-aspeed-smc.c

   740	
 > 741	static DEVICE_ATTR_RO(windows);
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
