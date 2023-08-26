Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E3A53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693074934; x=1724610934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDsde6XAPnJb5N8xmTNJPHOyS8UdpirpqdEsT7oaVxU=;
  b=jP6UOzq6DmicOf22kv7fNXFwaeW21l9wH1lMUJHJW5MOSAnqH6wyP8xV
   7CuQZITBPEog6fDTwqTU1irKZF+YuqsjcnQFme/kkqnDG4HbJJMunP2he
   sMJ2+3ZSw80yW9VvDcH+KH802zmpA/QfTUkZvmdw3BZwe+NgCwMCQ/nOX
   kQUsTuCC5NVZhJo+D5xG+EwS+IhGbpdmEVOlIQC8RG20UfDMsyYP+NRrX
   iHngaxSH0gbeXd44Sp/HL+24SDIkk/ANnAKuTEjtmwNM3zwMbaYuGwvNA
   RrdSSqMYLUPh1SNyBcp6dGcCiJiB1iqiquZ7NaJyEOUl3Li/5W0d6sqKd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355224317"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="355224317"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 11:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="1068581865"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068581865"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 11:35:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZy85-0004z1-0b;
	Sat, 26 Aug 2023 18:35:26 +0000
Date: Sun, 27 Aug 2023 02:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11395/11474]
 drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for
 function 'en8811h_phy_driver_register'
Message-ID: <202308270215.86bXQcfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   9da4af54446a9e2a6f6e734ea33cff68ce412a6c
commit: 6cf062a531525db0c134c633d08dc9cd50746c62 [11395/11474] net: phy: add driver for Airoha EN8811 2.5G PHY
config: mips-randconfig-r003-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270215.86bXQcfe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270215.86bXQcfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270215.86bXQcfe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for function 'en8811h_phy_driver_register' [-Wmissing-prototypes]
     681 | int __init en8811h_phy_driver_register(void)
         |            ^
   drivers/net/phy/air_en8811h.c:681:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     681 | int __init en8811h_phy_driver_register(void)
         | ^
         | static 
>> drivers/net/phy/air_en8811h.c:696:13: warning: no previous prototype for function 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
     696 | void __exit en8811h_phy_driver_unregister(void)
         |             ^
   drivers/net/phy/air_en8811h.c:696:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     696 | void __exit en8811h_phy_driver_unregister(void)
         | ^
         | static 
   2 warnings generated.


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
