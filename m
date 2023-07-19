Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76692C8C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689752678; x=1721288678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSfyBnHS5b93A9zFULrQYo99krYXPE+GfNNzpBiamS4=;
  b=RW2ShtqoSf7T9vMG5mQxCZ9SHJKVjP/bUCKUCum3ISz62yJtMXH0Yt+T
   SbrO+Tw18IXbA5aapTshpJpu+DMbR4K3wtPazo120fXQV3bod3vVO3Neb
   cop7turrUPTa3/p+71j0/2UL9et5lcPWTCRQA/qeKni2+ln5KrRybRu0l
   /f1EhaBaQ/3XzTsFdUJ1n88rTeM9qOQtKaS9Kr+kwCiyaP6/y1VlVIC4m
   J8dCTMZ1zoNFFOUdu3duQNLyHr0eLezDH2RrR8SwuDrYjB282kFWK0Jom
   Gd3aIjwsUMLCg2azoEUnq5E+dRTyu9ALX8M6LfzO1TL+q3MRIEM8jnaAO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345986617"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="345986617"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727207911"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727207911"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 00:44:30 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM1rJ-0004Gv-0e;
	Wed, 19 Jul 2023 07:44:29 +0000
Date: Wed, 19 Jul 2023 15:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 3979/12467]
 drivers/base/power/domain.c:260:6: warning: no previous prototype for
 'pm_genpd_disable_clks'
Message-ID: <202307191550.w2y2DuqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: 01a19a7ad755e54def65a81ac23b93fa5a77cc4d [3979/12467] LF-4713-1 PM: domains: add pm domain clocks support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307191550.w2y2DuqR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191550.w2y2DuqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191550.w2y2DuqR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:260:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     260 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/power/domain.c:266:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     266 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/pm_genpd_disable_clks +260 drivers/base/power/domain.c

   259	
 > 260	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   261	{
   262		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   263			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   264	}
   265	
 > 266	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   267	{
   268		int ret;
   269	
   270		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   271			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   272			if (ret) {
   273				dev_err(&genpd->dev, "failed to enable clocks\n");
   274				return ret;
   275			}
   276		}
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
