Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E5101F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+4kjt3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697186823; x=1728722823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhecjm+r37U6NiXThOSq7fM/FvRzbSvd+QTOtmGwEVw=;
  b=j+4kjt3GJkufWJlxDYr/ib8QHKySp6IJY6LXLhLLqgHGbWuIheVygl0J
   6gkvbJjy0ymO4ZFadJuH5hayBJqan+w4oL6HBF83dBk9ttpxiPTTlzNd3
   nUKEwFQu4nx4jBYU+pRzVRRqzG0Nnw+8c3ddz0ACIZeCK/SncNcfDZCp4
   Od+EvZzT3DQ/8GLn7WxOLG9Carp+WDD0DdjFgShtK7GJPRFwLik7685bG
   KYvajEijM6jqa0uKBwVfomM9wPkS3/jq0htQWBEBL86sbrZIMgiADtkZb
   q/ukN8xkpX1VqTVaGJYw7o6BqXHgVZDE87pWu+ANjb0h5/mb6JPIz4GUu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387985630"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387985630"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928335355"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928335355"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:46:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDou-0004XF-07;
	Fri, 13 Oct 2023 08:46:56 +0000
Date: Fri, 13 Oct 2023 16:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 264/15768]
 drivers/staging/media/imx/dwc-mipi-csi2.c:1348:12: warning:
 'dwc_mipi_csis_runtime_resume' defined but not used
Message-ID: <202310131627.ZF6czMfR-lkp@intel.com>
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
commit: 9246fa49e5692703f7a7fc654053bd5f7a6feca7 [264/15768] LF-6257-09: media: imx: add Synopsys DWC MIPI CSI2 driver support for iMX93
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131627.ZF6czMfR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131627.ZF6czMfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131627.ZF6czMfR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/dwc-mipi-csi2.c:1348:12: warning: 'dwc_mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1348 | static int dwc_mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1339:12: warning: 'dwc_mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1339 | static int dwc_mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1326:12: warning: 'dwc_mipi_csis_system_resume' defined but not used [-Wunused-function]
    1326 | static int dwc_mipi_csis_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/dwc-mipi-csi2.c:1321:12: warning: 'dwc_mipi_csis_system_suspend' defined but not used [-Wunused-function]
    1321 | static int dwc_mipi_csis_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dwc_mipi_csis_runtime_resume +1348 drivers/staging/media/imx/dwc-mipi-csi2.c

  1320	
> 1321	static int dwc_mipi_csis_system_suspend(struct device *dev)
  1322	{
  1323		return pm_runtime_force_suspend(dev);;
  1324	}
  1325	
> 1326	static int dwc_mipi_csis_system_resume(struct device *dev)
  1327	{
  1328		int ret;
  1329	
  1330		ret = pm_runtime_force_resume(dev);
  1331		if (ret < 0) {
  1332			dev_err(dev, "force resume %s failed!\n", dev_name(dev));
  1333			return ret;
  1334		}
  1335	
  1336		return 0;
  1337	}
  1338	
> 1339	static int dwc_mipi_csis_runtime_suspend(struct device *dev)
  1340	{
  1341		struct dwc_mipi_csi2_host *csi2h = dev_get_drvdata(dev);
  1342	
  1343		dwc_mipi_csi2_clk_disable(csi2h);
  1344	
  1345		return 0;
  1346	}
  1347	
> 1348	static int dwc_mipi_csis_runtime_resume(struct device *dev)
  1349	{
  1350		struct dwc_mipi_csi2_host *csi2h = dev_get_drvdata(dev);
  1351		int ret;
  1352	
  1353		ret = dwc_mipi_csi2_clk_enable(csi2h);
  1354		if (ret < 0)
  1355			return ret;
  1356	
  1357		return 0;
  1358	}
  1359	static const struct dev_pm_ops dwc_mipi_csi2_host_pm_ops = {
  1360		SET_SYSTEM_SLEEP_PM_OPS(dwc_mipi_csis_system_suspend,
  1361					dwc_mipi_csis_system_resume)
  1362		SET_RUNTIME_PM_OPS(dwc_mipi_csis_runtime_suspend,
  1363				   dwc_mipi_csis_runtime_resume,
  1364				   NULL)
  1365	};
  1366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
