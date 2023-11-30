Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CF14282
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 04:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e78bA0jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316988; x=1732852988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKHhqwS3mmBA8Y0FdVpxR06g+qa/ow+/aq6D0mhEFSg=;
  b=e78bA0jzAjScXfMMjHMuo0TTJkDbr2D7b1O9Qa1VHkf5IX+nRoEQcTky
   kGTetwnU0EbASeUmUa7ngaZrU0l0mIh3FWeUdVsDd1pAFyWT0butSbYI3
   BEeo4DfEJIv0566d6YY8cY0hHjlpxGVkdLVGYnmf2mM0gvPYtgy/BA/iy
   EhBE5d+hQjg5Fo1MP3yKsLf7gf07IjuxJfXtIlZUxVq8GIr+Gu0CFW7oh
   mP5N5FVu/18mNueqeDcaQVQGBfT7lcJR4CSkYrcu3NnJSnZWfim+SW6y8
   ecb/ZoaqyE769zchXuQTL8N5hED/u3q8kIbkF3B15JI03hv/cDSvAZb7r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393009055"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="393009055"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="913063265"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="913063265"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001Jq-08;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 11/24603]
 drivers/iio/adc/imx8qxp_adc.c:669:12: warning: 'imx8qxp_adc_runtime_resume'
 defined but not used
Message-ID: <202311301110.tXCe0zjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: ccbb6aa6401a61cdb5f3741b9eb66d2d0656ecdf [11/24603] iio: adc: Add imx8qxp adc driver support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301110.tXCe0zjt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301110.tXCe0zjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301110.tXCe0zjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/imx8qxp_adc.c:669:12: warning: 'imx8qxp_adc_runtime_resume' defined but not used [-Wunused-function]
     669 | static int imx8qxp_adc_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/imx8qxp_adc.c:655:12: warning: 'imx8qxp_adc_runtime_suspend' defined but not used [-Wunused-function]
     655 | static int imx8qxp_adc_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8qxp_adc_runtime_resume +669 drivers/iio/adc/imx8qxp_adc.c

   654	
 > 655	static int imx8qxp_adc_runtime_suspend(struct device *dev)
   656	{
   657		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   658		struct imx8qxp_adc *adc = iio_priv(indio_dev);
   659	
   660		imx8qxp_adc_disable(adc);
   661	
   662		clk_disable_unprepare(adc->clk);
   663		clk_disable_unprepare(adc->ipg_clk);
   664		regulator_disable(adc->vref);
   665	
   666		return 0;
   667	}
   668	
 > 669	static int imx8qxp_adc_runtime_resume(struct device *dev)
   670	{
   671		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   672		struct imx8qxp_adc *adc = iio_priv(indio_dev);
   673		int ret;
   674	
   675		ret = regulator_enable(adc->vref);
   676		if (ret) {
   677			dev_err(adc->dev,
   678				"Can't enable adc reference top voltage, err = %d\n",
   679				ret);
   680			return ret;
   681		}
   682	
   683		ret = clk_prepare_enable(adc->clk);
   684		if (ret) {
   685			dev_err(adc->dev,
   686				"Could not prepare or enable clock.\n");
   687			regulator_disable(adc->vref);
   688			return ret;
   689		}
   690	
   691		ret = clk_prepare_enable(adc->ipg_clk);
   692		if (ret) {
   693			dev_err(adc->dev,
   694				"Could not prepare or enable clock.\n");
   695			clk_disable_unprepare(adc->clk);
   696			regulator_disable(adc->vref);
   697			return ret;
   698		}
   699		imx8qxp_adc_reset(adc);
   700	
   701		return 0;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
