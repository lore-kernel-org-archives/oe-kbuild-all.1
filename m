Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42435EDB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 17:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694020904; x=1725556904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUTAiYqs40R8vmF1aAAn5e/0arEfFD3fT5cDoDpS3QI=;
  b=IQVCTdHl1Nuqu4v9jLxjVZSt2VI3k+/T6mcroQX/UlgDJhknKOlTi2Lm
   6k5RGYbmRyyZiv2+V18GcMSvIvoTgWiWS82y06unOqFcmOV9PiojnxneO
   InZKgB7xhXE64VpuvNFgJDAO00tOKxZdDkcgV2IowMGV+mTp0LeHaeO/W
   Z5vbGKVDbjQe6c2Tiiz/s1jaCcYNz1w8hQTd3vsYBxk5AoI4KuG430Z1T
   D51OQOlisn2sSvR3FOYHMzOFKklAkm+C6Fpi2+gxYGeXIJFWnUunuN+pm
   I8/yspPJhsDzNjDB2Ebh6jlQ9kfsv0RbI4PlGzaxpT+Agm0HkqYzT8+5G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441109667"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="441109667"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741640213"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741640213"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 10:21:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdwDk-0000R5-01;
	Wed, 06 Sep 2023 17:21:40 +0000
Date: Thu, 7 Sep 2023 01:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 15326/24604]
 drivers/leds/leds-pca995x.c:280:34: warning: 'of_pca995x_match' defined but
 not used
Message-ID: <202309070106.sAD2CnSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: 8d95b5f8d03c993efd374d585823eefe84138d2c [15326/24604] LF-6247-3: driver: leds: pca995x: Add support for PCA995X chips
config: x86_64-randconfig-016-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070106.sAD2CnSF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070106.sAD2CnSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070106.sAD2CnSF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca995x.c:280:34: warning: 'of_pca995x_match' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id of_pca995x_match[] = {
                                     ^~~~~~~~~~~~~~~~


vim +/of_pca995x_match +280 drivers/leds/leds-pca995x.c

   279	
 > 280	static const struct of_device_id of_pca995x_match[] = {
   281		{.compatible = "nxp,pca9955btw", .data = (void *) pca9955btw},
   282		{.compatible = "nxp,pca995xtw",  .data = (void *) pca995xtw},
   283		{},
   284	};
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
