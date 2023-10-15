Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EF1861
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 05:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw5eL8Cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697347839; x=1728883839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAemy8uL+T2a8STSyjIx/QCoyrzZ4CvlURIXGL3RK2k=;
  b=gw5eL8CsauxFlAzmoAsq9ihF+p5ZO5VHwiIAW1fOtLybPwbSpW6kLa9B
   1urfXQ7MMnL3DAmkW+67Pq50xs0jg23MmC7/d+nn+EIMZZBya8aKPIxwM
   NWu2bSNhm5AQXJWhfZXFPQlIHHuuJl3KPfGYsvKFifNuTW8jfy0xoATPx
   vb+sOzEscVpZjh4Zuac/PhNHzTXDQOIi3E1XWO/vlzFX9AMOvRuHM5nSV
   vequYHNmYQV6t4BaqFzj0nEtPGpj2PCgb0Vcay2S6W1ten1Hy7al4qaDX
   7+sSwZSy35bAPcDhhqCrPbt0TVaVmbZBIK0HROsAV8u2IdiMM9IhyKuUy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416431176"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="416431176"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748865007"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="748865007"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 22:30:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrthy-00074B-2c;
	Sun, 15 Oct 2023 05:30:34 +0000
Date: Sun, 15 Oct 2023 13:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 14895/24603]
 drivers/staging/media/imx/dwc-mipi-csi2.c:1347:12: warning:
 'dwc_mipi_csis_runtime_resume' defined but not used
Message-ID: <202310151335.b6UtDR7u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b54a390bab8d1cc8daf591ad9822db28dd5310a1 [14895/24603] LF-6257-09: media: imx: add Synopsys DWC MIPI CSI2 driver support for iMX93
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151335.b6UtDR7u-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151335.b6UtDR7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151335.b6UtDR7u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/dwc-mipi-csi2.c:1347:12: warning: 'dwc_mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1347 | static int dwc_mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1338:12: warning: 'dwc_mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1338 | static int dwc_mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1325:12: warning: 'dwc_mipi_csis_system_resume' defined but not used [-Wunused-function]
    1325 | static int dwc_mipi_csis_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1320:12: warning: 'dwc_mipi_csis_system_suspend' defined but not used [-Wunused-function]
    1320 | static int dwc_mipi_csis_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dwc_mipi_csis_runtime_resume +1347 drivers/staging/media/imx/dwc-mipi-csi2.c

  1319	
> 1320	static int dwc_mipi_csis_system_suspend(struct device *dev)
  1321	{
  1322		return pm_runtime_force_suspend(dev);;
  1323	}
  1324	
> 1325	static int dwc_mipi_csis_system_resume(struct device *dev)
  1326	{
  1327		int ret;
  1328	
  1329		ret = pm_runtime_force_resume(dev);
  1330		if (ret < 0) {
  1331			dev_err(dev, "force resume %s failed!\n", dev_name(dev));
  1332			return ret;
  1333		}
  1334	
  1335		return 0;
  1336	}
  1337	
> 1338	static int dwc_mipi_csis_runtime_suspend(struct device *dev)
  1339	{
  1340		struct dwc_mipi_csi2_host *csi2h = dev_get_drvdata(dev);
  1341	
  1342		dwc_mipi_csi2_clk_disable(csi2h);
  1343	
  1344		return 0;
  1345	}
  1346	
> 1347	static int dwc_mipi_csis_runtime_resume(struct device *dev)
  1348	{
  1349		struct dwc_mipi_csi2_host *csi2h = dev_get_drvdata(dev);
  1350		int ret;
  1351	
  1352		ret = dwc_mipi_csi2_clk_enable(csi2h);
  1353		if (ret < 0)
  1354			return ret;
  1355	
  1356		return 0;
  1357	}
  1358	static const struct dev_pm_ops dwc_mipi_csi2_host_pm_ops = {
  1359		SET_SYSTEM_SLEEP_PM_OPS(dwc_mipi_csis_system_suspend,
  1360					dwc_mipi_csis_system_resume)
  1361		SET_RUNTIME_PM_OPS(dwc_mipi_csis_runtime_suspend,
  1362				   dwc_mipi_csis_runtime_resume,
  1363				   NULL)
  1364	};
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
