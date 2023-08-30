Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B667E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 01:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693357732; x=1724893732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIOC47zuy8NVKBDa6aXuWr+VBwcsklegfP/zRAf67R0=;
  b=E5YUNRoQIoczQHIOZbrPSdhfSEwG3p52ucCYPQUjjSydIGkTcLhTlO1I
   HI+RzzWf0SuuXSP6CNOTEKn9MdWabnuTvI625hdBZgw4cJs27z+559IqC
   EN+zvCeOtusGQqxLAXaf6qKvidAB8r264KXb8UbmCPmrHZroJYZm2J3WL
   hVRYH1Syw+sVue7DXybYPWYrzM7BYUTwS4XoA4d/DkprHAx7evqMUBVVQ
   srPjQryLfELMZxDNQ4jYdNBL0aT/F0GnvHe/ybwQ8zYdW6kpoUSEBoH2f
   J6HMS0neX+h5wX3ntseMfsEZcaIDWR/t6uCg6ga4H+E/ovTlpEcgpBY75
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406516067"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406516067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 18:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742039935"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="742039935"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 18:08:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb9hR-0009Gd-0r;
	Wed, 30 Aug 2023 01:08:49 +0000
Date: Wed, 30 Aug 2023 09:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:spb1-hacking 6099/9113] drivers/spi/spi-aspeed-smc.c:741:23:
 error: initialization of 'ssize_t (*)(struct device *, struct
 device_attribute *, char *)' {aka 'long int (*)(struct device *, struct
 device_attribute *, char *)'} from incompatible pointer type 'int (*)(struct
 device ...
Message-ID: <202308300950.8J9XMDyX-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300950.8J9XMDyX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300950.8J9XMDyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300950.8J9XMDyX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from drivers/spi/spi-aspeed-smc.c:10:
>> drivers/spi/spi-aspeed-smc.c:741:23: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'int (*)(struct device *, struct device_attribute *, char *)' [-Werror=incompatible-pointer-types]
     741 | static DEVICE_ATTR_RO(windows);
         |                       ^~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/spi/spi-aspeed-smc.c:741:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     741 | static DEVICE_ATTR_RO(windows);
         |        ^~~~~~~~~~~~~~
   drivers/spi/spi-aspeed-smc.c:741:23: note: (near initialization for 'dev_attr_windows.show')
     741 | static DEVICE_ATTR_RO(windows);
         |                       ^~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/spi/spi-aspeed-smc.c:741:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     741 | static DEVICE_ATTR_RO(windows);
         |        ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +741 drivers/spi/spi-aspeed-smc.c

   740	
 > 741	static DEVICE_ATTR_RO(windows);
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
