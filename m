Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A36FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 23:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693439353; x=1724975353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoah5mjCqbEcgxq3Iicb3hC7nOicKx35CJs2LAttdBQ=;
  b=gklE6F69CEvmQ2KoyKJbBb/vY8e+D9PhZWIsqRBfC7PMtL6AEKOmGwFD
   6Z9ZvSFkqwM85znbi4FxFrNkiquVB8VISl3SjPGbo9GC9DhRJGI+0xSYa
   tYEE5OgLv/DC41u+UVu0UEv3mUity253pHgHzmpCHVL3e0zmfBSn/7T0p
   51hc/H7jb7HDTCm4JiZddCz2iZ0Srsmf6m7cBpf23DAaTdaTKSlIqTOhf
   I2K2j106qAsZgoIoBRbOnueBL7nhhhZXv0kVKOxc6908u471xSGZn6VcH
   GGpDsqsKHLvh7SjPXSE3SVVftia5qQzT1CCz7QCeyuwPtAO6DBhySvuPF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355275481"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355275481"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 16:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862817169"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="862817169"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 16:49:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbUvu-000AMj-0k;
	Wed, 30 Aug 2023 23:49:10 +0000
Date: Thu, 31 Aug 2023 07:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 11/24603]
 drivers/iio/adc/imx8qxp_adc.c:669:12: warning: 'imx8qxp_adc_runtime_resume'
 defined but not used
Message-ID: <202308310738.zdd0bIAW-lkp@intel.com>
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
commit: ccbb6aa6401a61cdb5f3741b9eb66d2d0656ecdf [11/24603] iio: adc: Add imx8qxp adc driver support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310738.zdd0bIAW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310738.zdd0bIAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310738.zdd0bIAW-lkp@intel.com/

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
