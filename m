Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4417DFFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727525119; cv=none; b=HOcS5EP2Hu2K46hTb1UpyMztBMXDIcryPz7zG8vK4ZOYFmNWBq9YnxYsYIDsfkad+C8OLAvp4/7EoOjWCkVa362rte1a12Hl+CAdv92NdmyamCMa1HadCUcvDgu7dRqo2LHvVRsnfi2zOMy+qIMC9CBjgT1+8wRMtwSajIv97gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727525119; c=relaxed/simple;
	bh=tzZ21by9VpFpYgV3NUeuCQGCLypablKPJN69MVcqGAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZnU8muIoXG2+uyz61RUazZdpSnzz44FuUDOIrsEYdgarRO4kCXNlbbC6h/LM3Fw1iI5aqai7swTr0nZCF0IyAmb0+X7yP82el9fph9KW5iZ1aGH3/ZEthoZG9tH3LtiU9Zw73cWHxa/ZLE5FzZ5VPiMcCy+npCjo2NlH0FgfsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5Fb87uW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5Fb87uW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727525117; x=1759061117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tzZ21by9VpFpYgV3NUeuCQGCLypablKPJN69MVcqGAQ=;
  b=L5Fb87uW6W4IEWVAnGDs3RkyRO/dxRUlzrap5QYFC47+HfSh1n16L318
   LGpF55xrVo7EbqNMhtfP86wKSO6ABwG35j/5P7CHc77v06OfWswC6K3nS
   vtEaJwH70xAGH7Dkg6wJyVcXaYws/MygGMaTDHX6hH0xyyFsUsaBGf4oz
   PEoVQjWOXqRTS3yizkZ9nJUFr651/lX9vnUyG1d5dP98zNcmwKv4EZ68B
   cUlLPDsARJuJ1lgHyz9y+/UadR27HJO1dg/evfwUOpZkywW6edOQuZZZv
   WV8uqdOS/pxbWOk/PfgLlg2Vu/DZfTFPUO7wcW68HfU+usnl6e+Qtu9aY
   A==;
X-CSE-ConnectionGUID: 57nr6rr/QsG43XNZEIdgsw==
X-CSE-MsgGUID: KdlG7Wg+QH6uO2afDok/dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="14284082"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="14284082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:05:15 -0700
X-CSE-ConnectionGUID: OPxIV2C0RPq8awb6UqvzxQ==
X-CSE-MsgGUID: jgixonfJTmSS0Cr3OsI5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72958052"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 05:05:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWCF-000NEk-2S;
	Sat, 28 Sep 2024 12:05:11 +0000
Date: Sat, 28 Sep 2024 20:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5893/16788]
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2933:12: warning:
 'gpmi_runtime_resume' defined but not used
Message-ID: <202409281932.1o1kc3sH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: bbb403e4c650bb36d1e013e7093f158495bdb22f [5893/16788] Merge branch 'nand/next' into next
config: powerpc-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281932.1o1kc3sH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281932.1o1kc3sH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281932.1o1kc3sH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:736:5: warning: no previous prototype for 'bch_create_debugfs' [-Wmissing-prototypes]
     736 | int bch_create_debugfs(struct gpmi_nand_data *this)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2933:12: warning: 'gpmi_runtime_resume' defined but not used [-Wunused-function]
    2933 | static int gpmi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2922:12: warning: 'gpmi_runtime_suspend' defined but not used [-Wunused-function]
    2922 | static int gpmi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/gpmi_runtime_resume +2933 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c

597502d5a55455 Han Xu       2019-11-08  2921  
597502d5a55455 Han Xu       2019-11-08 @2922  static int gpmi_runtime_suspend(struct device *dev)
041414682b0daa Sascha Hauer 2019-05-21  2923  {
041414682b0daa Sascha Hauer 2019-05-21  2924  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
041414682b0daa Sascha Hauer 2019-05-21  2925  
597502d5a55455 Han Xu       2019-11-08  2926  	gpmi_disable_clk(this);
597502d5a55455 Han Xu       2019-11-08  2927  	release_bus_freq(BUS_FREQ_HIGH);
597502d5a55455 Han Xu       2019-11-08  2928  	release_dma_channels(this);
597502d5a55455 Han Xu       2019-11-08  2929  
597502d5a55455 Han Xu       2019-11-08  2930  	return 0;
041414682b0daa Sascha Hauer 2019-05-21  2931  }
041414682b0daa Sascha Hauer 2019-05-21  2932  
597502d5a55455 Han Xu       2019-11-08 @2933  static int gpmi_runtime_resume(struct device *dev)
041414682b0daa Sascha Hauer 2019-05-21  2934  {
041414682b0daa Sascha Hauer 2019-05-21  2935  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
597502d5a55455 Han Xu       2019-11-08  2936  	int ret;
597502d5a55455 Han Xu       2019-11-08  2937  
597502d5a55455 Han Xu       2019-11-08  2938  	ret = gpmi_enable_clk(this);
597502d5a55455 Han Xu       2019-11-08  2939  	if (ret)
597502d5a55455 Han Xu       2019-11-08  2940  		return ret;
597502d5a55455 Han Xu       2019-11-08  2941  
597502d5a55455 Han Xu       2019-11-08  2942  	request_bus_freq(BUS_FREQ_HIGH);
597502d5a55455 Han Xu       2019-11-08  2943  
597502d5a55455 Han Xu       2019-11-08  2944  	ret = acquire_dma_channels(this);
597502d5a55455 Han Xu       2019-11-08  2945  	if (ret < 0)
597502d5a55455 Han Xu       2019-11-08  2946  		return ret;
597502d5a55455 Han Xu       2019-11-08  2947  
597502d5a55455 Han Xu       2019-11-08  2948  	return 0;
041414682b0daa Sascha Hauer 2019-05-21  2949  

:::::: The code at line 2933 was first introduced by commit
:::::: 597502d5a55455da1af39b8c140fcf7d16c7fc28 mtd: nand: raw: gpmi-nand: fix the suspend/resume issue

:::::: TO: Han Xu <han.xu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
