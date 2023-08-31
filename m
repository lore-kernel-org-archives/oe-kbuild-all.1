Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542415A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 04:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693454740; x=1724990740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4FF7pl4TfB1xNEU2rpGo4JpQyctrchW5NitLVSASid8=;
  b=QAxeavFTYknm2+ZMEytHIUzuA3X1t5R4HgDHsO0kDZiH+kOWJDS5DOrB
   pnB+jk8aBWS5xnk6GVCGJp6UmjhhLXVNmB8FQcu1pXErD4uk7dRaMlC+3
   fy2VmFC53iszdFIhAVeGFkGNWnMaYV/OZTPlWb7xz3TIzmU2aFovS6PIt
   Qr2csXNNhNRuiyT8pcEOZx0vB/fYkhvsbEI/B4J1uLHRYuEKxHaWdreYE
   Llhu8FxWa7L8mymfXyEiNhw1JjndFJLW9GVepGFMroorGo6+62wZnASpG
   /4/KG2rCY5KgpSR1A5FwZsxchE2zZYAh/ERXoAHFNFOC7zbOs4EmszSCa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439756778"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="439756778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 21:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716162645"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="716162645"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2023 21:05:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbYw6-000AaV-0q;
	Thu, 31 Aug 2023 04:05:38 +0000
Date: Thu, 31 Aug 2023 12:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6233/24603]
 drivers/base/power/domain.c:255:6: warning: no previous prototype for
 function 'pm_genpd_disable_clks'
Message-ID: <202308311206.F3mCDgWt-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: c85126180a10439a8c7db1800529b4857d91c609 [6233/24603] LF-4713-1 PM: domains: add pm domain clocks support
config: arm64-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311206.F3mCDgWt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311206.F3mCDgWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311206.F3mCDgWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:255:6: warning: no previous prototype for function 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     255 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^
   drivers/base/power/domain.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         | ^
         | static 
>> drivers/base/power/domain.c:261:5: warning: no previous prototype for function 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     261 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^
   drivers/base/power/domain.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     261 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         | ^
         | static 
   2 warnings generated.


vim +/pm_genpd_disable_clks +255 drivers/base/power/domain.c

   254	
 > 255	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   256	{
   257		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   258			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   259	}
   260	
 > 261	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   262	{
   263		int ret;
   264	
   265		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   266			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   267			if (ret) {
   268				dev_err(&genpd->dev, "failed to enable clocks\n");
   269				return ret;
   270			}
   271		}
   272	
   273		return 0;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
