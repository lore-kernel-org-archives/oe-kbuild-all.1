Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98AE7E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flzXe93C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702773368; x=1734309368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAgb6c6+Evtxy0lIP/zeFweUqIaMCB0NELsqtubZla8=;
  b=flzXe93CigCi4Nkf8KmbtKhyVCnOhvSuC9BUrz8AZDkDp8Pi2si1mTGJ
   pfjTQ8nS7i/jm/vyMrbYYCWhZCavANjpiNai0AAOChKWiH5lmBGyaz+OZ
   qiULSKwAIEGg5k6HH1xAaW4xS9Af03AAyjCwg/o9RViWyFKzjeVkEwqQR
   Itv2NJlU2OsPBYhi+odYcr1ch16ThFw2TDWV1Q56u8fWRnklvBiNWR48+
   AZxJ7VPfmqytm+vWK3XVjaY+76NssbB5FmG7NpcjnLM1b5ZfMEYzsSPHn
   NnSSll68y96WvodhrIx0c24ZhpbcS2q/yY5liELZcWWiK+yMv1xi/OlOk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426525727"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426525727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 16:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="23289679"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2023 16:36:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEf8W-0002OW-1C;
	Sun, 17 Dec 2023 00:36:04 +0000
Date: Sun, 17 Dec 2023 08:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 13657/16025]
 include/linux/phy/phy-xgkr.h:146:1: warning: 'inline' is not at beginning of
 declaration
Message-ID: <202312170802.LEsLxWBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 1b08357f03ae12925b35002d4efbca79e0662af6 [13657/16025] phy: xgkr: add configuration interface for copper backplane Ethernet PHYs
config: i386-randconfig-013-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170802.LEsLxWBA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170802.LEsLxWBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170802.LEsLxWBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/phy/phy.h:22,
                    from include/linux/usb/otg.h:13,
                    from include/linux/mfd/palmas.h:14,
                    from drivers/mfd/palmas.c:20:
>> include/linux/phy/phy-xgkr.h:146:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     146 | static void inline c72_coef_update_print(const struct c72_coef_update *update,
         | ^~~~~~


vim +/inline +146 include/linux/phy/phy-xgkr.h

   145	
 > 146	static void inline c72_coef_update_print(const struct c72_coef_update *update,
   147						 char buf[C72_COEF_UPDATE_BUFSIZ])
   148	{
   149		sprintf(buf, "INIT %d, PRESET %d, C(-1) %s, C(0) %s, C(+1) %s",
   150			update->init, update->preset,
   151			coef_update_to_string(update->com1),
   152			coef_update_to_string(update->coz),
   153			coef_update_to_string(update->cop1));
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
