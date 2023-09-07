Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88D13AD7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694120436; x=1725656436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1FpT78k6xgY/uOgiMnxdxsTzTmW5bGKNNTn6E0p9Po=;
  b=b3zb0kUDUodCXkdVBHBdaGEtg/q5YIE8WafZGBpDSZ4oMAlMw8iTqH6c
   /asnsb5ufm+c2Q5Ni3X9iWYUc6L8x6aRTszPKfJfEXIHHhVvb15BjWE3F
   pWMGU4VB9aIyLrMvCUeHHOV5BuabqvM0LYzxlKh2HnTQpQ8ILwngJoYdA
   M6t2W/txU+nYhX9UQ5x9rnRgIhxky0dL7+/6hnIObRm79jPCT9HaBmGns
   agYzeJm0fqZJP+flKBP7UT4oaBQo6rKJtn1OJzQGMTBqrRjwvDS9gVUBB
   HrOJFqAzlP4/7wK085sABKm/vUb1qHF/dJ0J61rrjJuAyu+fh1D4qsK81
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408467357"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="408467357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 14:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1073005447"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="1073005447"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2023 14:00:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeM74-0001aJ-1Y;
	Thu, 07 Sep 2023 21:00:30 +0000
Date: Fri, 8 Sep 2023 05:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 109/132]
 drivers/media/platform/apple/isp/isp-fw.c:580:5: warning: no previous
 prototype for 'apple_isp_firmware_boot'
Message-ID: <202309080457.tGC3SrCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   d5548fd857a3ca9087e974c8e73d6f487b11c94b
commit: 4d8c45047d73f6f6d25ffe8c6abcf58c5d4b97a4 [109/132] media: apple: Add Apple ISP driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080457.tGC3SrCy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080457.tGC3SrCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080457.tGC3SrCy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-fw.c:580:5: warning: no previous prototype for 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     580 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/apple/isp/isp-fw.c:601:6: warning: no previous prototype for 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     601 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/apple_isp_firmware_boot +580 drivers/media/platform/apple/isp/isp-fw.c

   579	
 > 580	int apple_isp_firmware_boot(struct apple_isp *isp)
   581	{
   582		int err;
   583	
   584		/* Needs to be power cycled for IOMMU to behave correctly */
   585		err = pm_runtime_resume_and_get(isp->dev);
   586		if (err < 0) {
   587			dev_err(isp->dev, "failed to enable power: %d\n", err);
   588			return err;
   589		}
   590	
   591		err = isp_firmware_boot(isp);
   592		if (err) {
   593			dev_err(isp->dev, "failed to boot firmware: %d\n", err);
   594			pm_runtime_put_sync(isp->dev);
   595			return err;
   596		}
   597	
   598		return 0;
   599	}
   600	
 > 601	void apple_isp_firmware_shutdown(struct apple_isp *isp)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
