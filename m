Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084299476
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693560339; x=1725096339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYeiebBfVdtHmvqQAW43Gu60tfvFr+AcGHBE6xEcAiY=;
  b=YEEqc86csse5anQlgZ9yG5mG5BFysScbljNp3xo91mKKiap3/I/RrWZu
   po8Mfo+FgKF0iubMxWb80jZ2vhXcj7b4kcjHLITTkI9b/1MtkAzxDmqTw
   Ec/vOkJxazU0vRqrWe96BGmzI4JmRfqYcCaTY4RyJLtaorJ7T0OwzRAHV
   2fZrb2kJ57glhWvlpj3/88KZmJEIBwZE/vQD/TANRK0EaC/8fXTzLNzet
   uZsXfGoEOk/7dfpbN+WnvGvygeI3pBMqnM74ASlnMyCoVy3P5w45InHHi
   Ho1xff+nRAr+7OFEpjO+SIW45qJcZoO3vlcPSYgSkmr/tJZUOvYTBJr3M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356491020"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="356491020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830057958"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="830057958"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2023 02:25:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0PC-00018G-1m;
	Fri, 01 Sep 2023 09:25:30 +0000
Date: Fri, 1 Sep 2023 17:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3235/24603]
 drivers/i2c/busses/i2c-imx-lpi2c.c:671:12: warning: 'lpi2c_resume_noirq'
 defined but not used
Message-ID: <202309011704.VOhK2YOh-lkp@intel.com>
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
commit: 0158af3e517b96ef5a082edac1dbc11446d4a735 [3235/24603] MLK-16713 i2c: imx-lpi2c: add runtime pm support
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011704.VOhK2YOh-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011704.VOhK2YOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011704.VOhK2YOh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_runtime_suspend':
   drivers/i2c/busses/i2c-imx-lpi2c.c:630:40: error: 'struct lpi2c_imx_struct' has no member named 'clk_ipg'
     630 |         clk_disable_unprepare(lpi2c_imx->clk_ipg);
         |                                        ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:631:40: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     631 |         clk_disable_unprepare(lpi2c_imx->clk_per);
         |                                        ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_runtime_resume':
   drivers/i2c/busses/i2c-imx-lpi2c.c:643:43: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     643 |         ret = clk_prepare_enable(lpi2c_imx->clk_per);
         |                                           ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:649:43: error: 'struct lpi2c_imx_struct' has no member named 'clk_ipg'
     649 |         ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
         |                                           ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:651:48: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     651 |                 clk_disable_unprepare(lpi2c_imx->clk_per);
         |                                                ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c: At top level:
>> drivers/i2c/busses/i2c-imx-lpi2c.c:671:12: warning: 'lpi2c_resume_noirq' defined but not used [-Wunused-function]
     671 | static int lpi2c_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:658:12: warning: 'lpi2c_suspend_noirq' defined but not used [-Wunused-function]
     658 | static int lpi2c_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/lpi2c_resume_noirq +671 drivers/i2c/busses/i2c-imx-lpi2c.c

   636	
   637	static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
   638	{
   639		struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
   640		int ret;
   641	
   642		pinctrl_pm_select_default_state(dev);
   643		ret = clk_prepare_enable(lpi2c_imx->clk_per);
   644		if (ret) {
   645			dev_err(dev, "can't enable I2C per clock, ret=%d\n", ret);
   646			return ret;
   647		}
   648	
 > 649		ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
   650		if (ret) {
 > 651			clk_disable_unprepare(lpi2c_imx->clk_per);
   652			dev_err(dev, "can't enable I2C ipg clock, ret=%d\n", ret);
   653		}
   654	
   655		return ret;
   656	}
   657	
 > 658	static int lpi2c_suspend_noirq(struct device *dev)
   659	{
   660		int ret;
   661	
   662		ret = pm_runtime_force_suspend(dev);
   663		if (ret)
   664			return ret;
   665	
   666		pinctrl_pm_select_sleep_state(dev);
   667	
   668		return 0;
   669	}
   670	
 > 671	static int lpi2c_resume_noirq(struct device *dev)
   672	{
   673		return pm_runtime_force_resume(dev);
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
