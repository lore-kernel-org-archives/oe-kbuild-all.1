Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050161CCB9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691825288; x=1723361288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVrC8deac5ZS5ENqsdzYDnZBheoYKYjtrHfK97NoE9s=;
  b=bpqFue9A2Ug1g9jLLCRXjf+Bg/zXCQgdFzxqcf6hotuHHCQSuzrx9D0F
   2UwdU95p843Ybiq5eD7xY8FIZGBcm9wCevkzrbs6J7N79ukN0tYgI9QQv
   RQGYdAPwix7dRYeaLQwQzOGowrZP3fUec+HAlw9TjFqbJj3bcClT3iELA
   OThsXjVQPgBn6sEi6Kf9GX4E9WpbhJYzkzVFTe9sx/9U93i/WqFPNdOzC
   FVPNmmA88PiGeOPKb9Ui3R9cHjGZPJHMM6jD3wtmpWvT1WN0+Vt/Plvvf
   fats3oHz/qsNaIczTc7AxSVWNqR4u6KKYZJWEyoOXs78uj4jbHzPvlewy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435704382"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="435704382"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 00:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979432714"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="979432714"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2023 00:28:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUj2b-0008My-2T;
	Sat, 12 Aug 2023 07:28:05 +0000
Date: Sat, 12 Aug 2023 15:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7940/8003]
 drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for
 'en8811h_phy_driver_register'
Message-ID: <202308121550.URZUer2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: 73ffee4d2ac27d75a0a809c5ce6fd6e08ea1c5f2 [7940/8003] net: phy: add driver for Airoha EN8811 2.5G PHY
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308121550.URZUer2G-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121550.URZUer2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121550.URZUer2G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for 'en8811h_phy_driver_register' [-Wmissing-prototypes]
     681 | int __init en8811h_phy_driver_register(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/air_en8811h.c:696:13: warning: no previous prototype for 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
     696 | void __exit en8811h_phy_driver_unregister(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/en8811h_phy_driver_register +681 drivers/net/phy/air_en8811h.c

   680	
 > 681	int __init en8811h_phy_driver_register(void)
   682	{
   683	    int ret;
   684	#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))
   685	    ret = phy_driver_register(en8811h_driver);
   686	#else
   687	    ret = phy_driver_register(en8811h_driver, THIS_MODULE);
   688	#endif
   689	    if (!ret)
   690	        return 0;
   691	
   692	    phy_driver_unregister(en8811h_driver);
   693	    return ret;
   694	}
   695	
 > 696	void __exit en8811h_phy_driver_unregister(void)
   697	{
   698	    phy_driver_unregister(en8811h_driver);
   699	}
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
