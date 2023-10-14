Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA51B1774A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkxjMPxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697314660; x=1728850660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2K6GAFk+VA7i5f3Z5yiUQAFw6ufq6PdDQLqrRot6iU=;
  b=IkxjMPxqUCb64KkAdf10ekSEUyR2AJNehwzkmwARXAAiYjzL5bTdanmM
   Aab9odPvIZB9ltAflAaaHHZyOrXVTGzs3hMb/g47ZYciPV5DkukWXo2hv
   1f4N7SdGW80ZAcFuWylvTzVQJG+5Y28WLf3JpBh2BunOQIUpO30MYBcN7
   xkY/l4OKWWWyGzTUW6vWnwivdDlunCSvPV2hOfYCjh3jpCBiIGH/c0A4k
   XjXfCsW2rkMjse7jAtgp94K0qvyawu655vXpkmBQoXAh+hgGEGIZfMePg
   OvqyHmuPWEoYwI94Cjy2wGG59PLs6I6RDeVaomEFjwBBHCwP3wK0tUi6n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385186131"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385186131"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="898953021"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898953021"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 13:15:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrl4q-0006br-2S;
	Sat, 14 Oct 2023 20:17:36 +0000
Date: Sun, 15 Oct 2023 04:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3576/15768]
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c:1113:12: warning:
 'samsung_hdmi_phy_resume' defined but not used
Message-ID: <202310150420.7cXmgyZG-lkp@intel.com>
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
commit: a12a9083b9986693563bd56821c707efe0be7c3a [3576/15768] LF-6082-2: phy: samsung_hdmi: Add suspend/resume function
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310150420.7cXmgyZG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150420.7cXmgyZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150420.7cXmgyZG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:1113:12: warning: 'samsung_hdmi_phy_resume' defined but not used [-Wunused-function]
    1113 | static int samsung_hdmi_phy_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:1104:12: warning: 'samsung_hdmi_phy_suspend' defined but not used [-Wunused-function]
    1104 | static int samsung_hdmi_phy_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/samsung_hdmi_phy_resume +1113 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

  1102	
  1103	#ifdef CONFIG_PM
> 1104	static int samsung_hdmi_phy_suspend(struct device *dev)
  1105	{
  1106		struct samsung_hdmi_phy *samsung = dev_get_drvdata(dev);
  1107	
  1108		clk_disable_unprepare(samsung->apbclk);
  1109	
  1110		return 0;
  1111	}
  1112	
> 1113	static int samsung_hdmi_phy_resume(struct device *dev)
  1114	{
  1115		struct samsung_hdmi_phy *samsung = dev_get_drvdata(dev);
  1116		int i, ret = 0;
  1117	
  1118		ret = clk_prepare_enable(samsung->apbclk);
  1119		if (ret) {
  1120			dev_err(samsung->dev, "failed to enable apbclk\n");
  1121			return ret;
  1122		}
  1123	
  1124		if (samsung->cur_cfg) {
  1125			writeb(FIX_DA, samsung->regs + PHY_REGS_84);
  1126	
  1127			for (i = 0; i < PHY_PLL_REGS_NUM; i++)
  1128				writeb(samsung->cur_cfg->regs[i], samsung->regs + i * 4);
  1129	
  1130			writeb(FIX_DA | MODE_SET_DONE, samsung->regs + PHY_REGS_84);
  1131		}
  1132	
  1133		return ret;
  1134	}
  1135	#endif
  1136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
