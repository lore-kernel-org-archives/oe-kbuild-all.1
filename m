Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445DF36B07
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XD9oEoyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702768085; x=1734304085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73lIBLPwuedvcj+iHU1ZEDddGnjJX1jEb6Z7yGtfO+c=;
  b=XD9oEoyRlUKVtF1gP/6VNflV01YiUieKlfrflli8IKVAYn+4bt1OPf3S
   oDfslYvNBlPl/Pn/bsV19CPncqYLhpcq/msBs0r85MxF/VqoRo/rbef1e
   jxQC9fwo/f8tc2qMU2ugbCSV+nEVu/Hw0k9IpCOvFK7Ef781dK6mXbmgL
   V/NYdnEfyoAO4AlGHtziwWSthvpiPvSWXYDWzFmzFm870SZaogolmuczp
   yGdJhobMBBHdMMqrvoocvap/Q6JHrZ2miSJxFHgqrUN/xri/rpxiN/6Cn
   /BDt2LIlVgGt2x/h6iv+0sOSOTSqifQe5D1ztQTYRH+DcTNVcngS7xoPt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="459717808"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="459717808"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778670433"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="778670433"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 15:08:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdlI-0002Je-39;
	Sat, 16 Dec 2023 23:08:00 +0000
Date: Sun, 17 Dec 2023 07:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3979/16025]
 drivers/base/power/domain.c:260:6: warning: no previous prototype for
 function 'pm_genpd_disable_clks'
Message-ID: <202312170633.2w2FNZc9-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 01a19a7ad755e54def65a81ac23b93fa5a77cc4d [3979/16025] LF-4713-1 PM: domains: add pm domain clocks support
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170633.2w2FNZc9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170633.2w2FNZc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170633.2w2FNZc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:260:6: warning: no previous prototype for function 'pm_genpd_disable_clks' [-Wmissing-prototypes]
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
        ^
   drivers/base/power/domain.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   ^
   static 
>> drivers/base/power/domain.c:266:5: warning: no previous prototype for function 'pm_genpd_enable_clks' [-Wmissing-prototypes]
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
       ^
   drivers/base/power/domain.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   ^
   static 
   2 warnings generated.


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
