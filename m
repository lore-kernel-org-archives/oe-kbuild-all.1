Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117612B8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692273132; x=1723809132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+GWN3mKhBySeeySzunhwWZDv1uD5lqQCv8O4GuVqeg=;
  b=I/VRle714Ea74ghM8upkGJS8MCz8zPow4970MfFUgjNFwyUxMr9ePKeO
   b0Dpog8hJcjKsXrxdyKa98fxhvLxCEcrYDZvxwE2fveFJxVDez3fZAuo/
   WYtfxq+2OUpJreKy3HPQ9v2rvz6msYFGic4DVNYO+Rg4+dAyO/ZEtWRa7
   /53XTnOz5T2EczRle7BAKBpsz1e4NucdkhF77hq8XBl/L7r3j9Sd0BG+3
   JG+nDkdXRvKPYhOfO/IJWHgg1TmW7yuJTo5RvJ8vnZbWyZO3bk2Z2jJUj
   25nVPp1GthuBFih3emqsfa4OLgFP26t1t8lJzIARgDEdZ358zphFiykCt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371691370"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371691370"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="800026916"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="800026916"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 04:52:10 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWbXt-00016P-2D;
	Thu, 17 Aug 2023 11:52:09 +0000
Date: Thu, 17 Aug 2023 19:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] drivers/mmc/core/mmc.c:978:6:
 warning: no previous declaration for 'mmc_set_bus_speed'
Message-ID: <202308171901.0T8z89Fw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b9b42d6732eadcfa713c54e0c6e3d98741a08432
commit: 5bcf8db7706a21860890cfe88688e002ccd76352 [1/1] ANDROID: mmc: core: Export core functions required for clk scaling
config: x86_64-buildonly-randconfig-r003-20230816 (https://download.01.org/0day-ci/archive/20230817/202308171901.0T8z89Fw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171901.0T8z89Fw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171901.0T8z89Fw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:978:6: warning: no previous declaration for 'mmc_set_bus_speed' [-Wmissing-declarations]
    void mmc_set_bus_speed(struct mmc_card *card)
         ^~~~~~~~~~~~~~~~~


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
