Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E33714C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYmzhD+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697133459; x=1728669459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjeXPMBtDTazU+XrSW3mb+AlVcpufg2Lj617CjPG1zw=;
  b=fYmzhD+xC7UjlSTPQjhV4Ywt5+DRFSNXwNXhZbBMBCy1n1DUasgCcUaF
   TgYZ3GkzNLkvIKBXTStz9u9R/WpSO2TTu3rjapY4hps8g2QFrrFMCgVNz
   PQvn+BG8yKV6VRtVpBCEtOyv2rCokUImNbOFgVjpGQehm9itliLZp+whM
   QneyEyvel0Nr2fGHq7NQHAtGGvTQS+qqH/v31h6GcQ8N7PhHj2YjtCJAQ
   Fgiq/wRkLox/uAjFvpFlsZjk3xV1ToR8F4P7WNfZAvWEBcblw5+GoNhjY
   TKNm8i1PnSjCpKxZtzCPUlEWeOR8tjAPBIXMLzgUDT4sXGSK3zxgaT/yd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365260499"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365260499"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 10:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783797212"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783797212"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 10:57:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqzvv-0003iH-0F;
	Thu, 12 Oct 2023 17:57:15 +0000
Date: Fri, 13 Oct 2023 01:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3979/15768]
 drivers/base/power/domain.c:260:6: warning: no previous prototype for
 'pm_genpd_disable_clks'
Message-ID: <202310130125.oc6jSdWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 01a19a7ad755e54def65a81ac23b93fa5a77cc4d [3979/15768] LF-4713-1 PM: domains: add pm domain clocks support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130125.oc6jSdWh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130125.oc6jSdWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130125.oc6jSdWh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:260:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     260 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/power/domain.c:266:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     266 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/base/power/domain.c:1147: warning: Function parameter or member 'need_disable_clk' not described in 'genpd_sync_power_off'
>> drivers/base/power/domain.c:1213: warning: Function parameter or member 'pd_was_on' not described in 'genpd_sync_power_on'


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
