Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820CD5C09F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfSfpPBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702566877; x=1734102877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ntf9g9HO+9QBPgACd+9n5jdAjpksLNxJRSoU6IH9ORc=;
  b=cfSfpPBx6bRipBQ8ZKmSv9z3hyXtRFF92N4HKiLbionblJpKW1KyQlkD
   mijSEAyNEARcsLhbrKEjQ33AFZiJ/zPHaxMw+lgiyJ1WU3bxYiOshmlwz
   FGdEFVgF50JymcI11Qe3RWZ1xtxq7yeXFB8JsNtguDtqaF4gnHQcrW9Lo
   S+uWB0nnx6EY0NDVchnjUTjXSd/vDMfuNXUIhDPu2+wl7nGo2rQt6pkaM
   TZQ4yBSkAXIo7tfkmydTWetNsMpmr3lshueMonChQQer0m7ihKwRpUZI5
   VrJin8SBPXysEfPcp4DhGcmwsbN0JP9n3+ABVXYL0kku6uVIMDiM3X4o9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397915477"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="397915477"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="865041036"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="865041036"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2023 07:14:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDnQ1-000MD6-1M;
	Thu, 14 Dec 2023 15:14:33 +0000
Date: Thu, 14 Dec 2023 23:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 12979/27478]
 drivers/mmc/core/mmc.c:978:6: error: no previous prototype for function
 'mmc_set_bus_speed'
Message-ID: <202312142332.OVLkYNmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   5feaf92b247cfa3dd98eefa2915dfb3b305ac2d2
commit: 8756995a20526ccbdca3dbbe1c79f9a9df25690c [12979/27478] ANDROID: mmc: core: Export core functions required for clk scaling
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231214/202312142332.OVLkYNmp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142332.OVLkYNmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142332.OVLkYNmp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:978:6: error: no previous prototype for function 'mmc_set_bus_speed' [-Werror,-Wmissing-prototypes]
   void mmc_set_bus_speed(struct mmc_card *card)
        ^
   drivers/mmc/core/mmc.c:978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_set_bus_speed(struct mmc_card *card)
   ^
   static 
   1 error generated.


vim +/mmc_set_bus_speed +978 drivers/mmc/core/mmc.c

   974	
   975	/*
   976	 * Set the bus speed for the selected speed mode.
   977	 */
 > 978	void mmc_set_bus_speed(struct mmc_card *card)
   979	{
   980		unsigned int max_dtr = (unsigned int)-1;
   981	
   982		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   983		     max_dtr > card->ext_csd.hs200_max_dtr)
   984			max_dtr = card->ext_csd.hs200_max_dtr;
   985		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   986			max_dtr = card->ext_csd.hs_max_dtr;
   987		else if (max_dtr > card->csd.max_dtr)
   988			max_dtr = card->csd.max_dtr;
   989	
   990		mmc_set_clock(card->host, max_dtr);
   991	}
   992	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
