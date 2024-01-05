Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02FC360A3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClnkXoUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704496641; x=1736032641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E2UMzbxUX8erLp860lm7gUP0ywm2Akf0mJDok3HzoXk=;
  b=ClnkXoUv/A/SHaxOyxSUK1p5/GTAJcYH261MDUTlPZwTKsiDw1Ha3tIU
   DmwdPho4aZPKECPWYO5y2tHPAlij+YFHLAGdZJw5bwpX0fatJZfbVP3YQ
   QNFAGgAF9dj3qAWeModU6OBJn/nWmd6Zrq7RocNtKsw+RplxoIeO0+xm6
   tQuSvs2SEDcNwQdpsaLEsa6y7mjTayegBjcLmTJhzDkawvHkERmphJq3y
   MrzsvzCiDzxKEtM9q99YRMqnF8ffXfAwsLo49pVbJWlITOmzktOolPFLK
   blfhCn8IxDcDIge6KPPjflDxiqHEXRscLMYYI57UlVPAc7bwPCrtL5dEN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4365903"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="4365903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 15:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="15369613"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2024 15:15:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLtPs-0001nc-02;
	Fri, 05 Jan 2024 23:15:52 +0000
Date: Sat, 6 Jan 2024 07:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh7110 39/41]
 drivers/gpu/drm/verisilicon/starfive_hdmi.c:188:13: warning:
 'starfive_hdmi_disable_clk_assert_rst' defined but not used
Message-ID: <202401060747.837dGXb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7110
head:   bebe83d360486029c861b78d6f751aa6d857adf9
commit: a29e27fe692ac1dbf20cd96282ad0de037bf576f [39/41] drm/vs: Add hdmi driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240106/202401060747.837dGXb7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401060747.837dGXb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401060747.837dGXb7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/verisilicon/starfive_hdmi.c:188:13: warning: 'starfive_hdmi_disable_clk_assert_rst' defined but not used [-Wunused-function]
     188 | static void starfive_hdmi_disable_clk_assert_rst(struct device *dev, struct starfive_hdmi *hdmi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/verisilicon/starfive_hdmi.c:152:12: warning: 'starfive_hdmi_enable_clk_deassert_rst' defined but not used [-Wunused-function]
     152 | static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, struct starfive_hdmi *hdmi)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [y]:
   - DRM_VERISILICON [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +/starfive_hdmi_disable_clk_assert_rst +188 drivers/gpu/drm/verisilicon/starfive_hdmi.c

   151	
 > 152	static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, struct starfive_hdmi *hdmi)
   153	{
   154		int ret;
   155	
   156		ret = clk_prepare_enable(hdmi->sys_clk);
   157		if (ret) {
   158			dev_err(dev, "Cannot enable HDMI sys clock: %d\n", ret);
   159			return ret;
   160		}
   161	
   162		ret = clk_prepare_enable(hdmi->mclk);
   163		if (ret) {
   164			dev_err(dev, "Cannot enable HDMI mclk clock: %d\n", ret);
   165			goto err_mclk;
   166		}
   167		ret = clk_prepare_enable(hdmi->bclk);
   168		if (ret) {
   169			dev_err(dev, "Cannot enable HDMI bclk clock: %d\n", ret);
   170			goto err_bclk;
   171		}
   172		ret = reset_control_deassert(hdmi->tx_rst);
   173		if (ret < 0) {
   174			dev_err(dev, "failed to deassert tx_rst\n");
   175			goto err_rst;
   176		}
   177		return 0;
   178	
   179	err_rst:
   180		clk_disable_unprepare(hdmi->bclk);
   181	err_bclk:
   182		clk_disable_unprepare(hdmi->mclk);
   183	err_mclk:
   184		clk_disable_unprepare(hdmi->sys_clk);
   185		return ret;
   186	}
   187	
 > 188	static void starfive_hdmi_disable_clk_assert_rst(struct device *dev, struct starfive_hdmi *hdmi)
   189	{
   190		int ret;
   191	
   192		ret = reset_control_assert(hdmi->tx_rst);
   193		if (ret < 0)
   194			dev_err(dev, "failed to assert tx_rst\n");
   195	
   196		clk_disable_unprepare(hdmi->sys_clk);
   197		clk_disable_unprepare(hdmi->mclk);
   198		clk_disable_unprepare(hdmi->bclk);
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
