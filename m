Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E95664
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLRG9Qnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702535277; x=1734071277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnt4ShB7sJlrsi3Gep06qOPlNIxUffbwnSVOyIYRG7s=;
  b=eLRG9QnqgRB83DMzD8Q40JzEV3RKFg2/xhnCzmYmkkOKyBVPpWO8gxrb
   YewDyfmx/+VgnCvO80U+s3CIKqJ3NpX6T0ePhTF7xh501ENihWYQTIL7m
   pvySRqGZUjfOIkCd9teYpGvsUwmKGBoBk4Lkj5q1HPB1ppukARG9h0Hz9
   LQGSvXE26KpNOoheizY1A1l1xuQjPqRJXgVfNy+XV7eOLjCeelc72/9k5
   J3WzazUrNPrXkyA/zZqrFdc/ApFuHxBqBzaLTiUTdQoUeFNaBm174/OPC
   7fz8r3HAE7N5VCZ8uarlQbTw5CDdc+kxCo3UseXg9IrzuSfSxzBWQauld
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8437761"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8437761"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 22:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1021401267"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1021401267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2023 22:27:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDfCL-000Lh1-0H;
	Thu, 14 Dec 2023 06:27:53 +0000
Date: Thu, 14 Dec 2023 14:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 12979/27478]
 drivers/mmc/core/mmc.c:978:6: error: no previous prototype for
 'mmc_set_bus_speed'
Message-ID: <202312141425.XklUYcaT-lkp@intel.com>
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
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141425.XklUYcaT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141425.XklUYcaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141425.XklUYcaT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:978:6: error: no previous prototype for 'mmc_set_bus_speed' [-Werror=missing-prototypes]
     978 | void mmc_set_bus_speed(struct mmc_card *card)
         |      ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
