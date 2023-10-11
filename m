Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E32B750
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxAqSt8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697068423; x=1728604423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+D5kEMkWUUjskJDdazffxSFvCPex+8WI9RQlymfOjs=;
  b=fxAqSt8gKQHzUO+kOYzrvkOOvxfUanEWBRYowmR/1kYfJX4C81ZaRrzX
   X+h44NUgvqPwSIV1GMKGNMSJE5PwiSKlz32LvX42t4jUR+JlGuw72kQch
   j7clrMc0q2Kn+eVxhWpd6vjMdGtsOvZ/ppoUfraE4DGEA7nXCJgiE/Ukz
   +qyfKLnY3Xa5pHSFjhTGtMNdLE+Knc9Iab+7dPazikHaEUpjIgy3FIs6Q
   Dt7XADL9MID3jx/ueGI736zvdkvDpVpreb4RM7CTMCFBiAIbE2E6JnTik
   zus3xHTXC8hbOOQGEf/SH3/Q8qT86pDJnKLnSVte+6ewvHaj+oMw+SNMp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382039751"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="382039751"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757775892"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="757775892"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2023 16:53:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqj1H-0002rf-2J;
	Wed, 11 Oct 2023 23:53:39 +0000
Date: Thu, 12 Oct 2023 07:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 8945/30000]
 drivers/mailbox/imx-mailbox.c:680:12: warning: 'imx_mu_runtime_resume'
 defined but not used
Message-ID: <202310120712.tTNUsuPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 8c2ae33a402c2c62892c2f85cf1812435a9258cd [8945/30000] MLK-23936 mailbox: imx: Add runtime PM callback to handle MU clocks
config: arc-randconfig-001-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120712.tTNUsuPz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120712.tTNUsuPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120712.tTNUsuPz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/firmware/imx/ipc.h:11,
                    from drivers/mailbox/imx-mailbox.c:7:
   drivers/mailbox/imx-mailbox.c: In function 'imx_mu_seco_tx':
   drivers/mailbox/imx-mailbox.c:233:33: warning: format '%li' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     233 |                                 "Exceed max msg size (%li) on TX, got: %i\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1658:22: note: in definition of macro 'dev_fmt'
    1658 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/mailbox/imx-mailbox.c:232:25: note: in expansion of macro 'dev_err'
     232 |                         dev_err(priv->dev,
         |                         ^~~~~~~
   drivers/mailbox/imx-mailbox.c:233:57: note: format string is defined here
     233 |                                 "Exceed max msg size (%li) on TX, got: %i\n",
         |                                                       ~~^
         |                                                         |
         |                                                         long int
         |                                                       %i
   drivers/mailbox/imx-mailbox.c: In function 'imx_mu_seco_rxdb':
   drivers/mailbox/imx-mailbox.c:294:36: warning: format '%li' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     294 |                 dev_err(priv->dev, "Exceed max msg size (%li) on RX, got: %i\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1658:22: note: in definition of macro 'dev_fmt'
    1658 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/mailbox/imx-mailbox.c:294:17: note: in expansion of macro 'dev_err'
     294 |                 dev_err(priv->dev, "Exceed max msg size (%li) on RX, got: %i\n",
         |                 ^~~~~~~
   drivers/mailbox/imx-mailbox.c:294:60: note: format string is defined here
     294 |                 dev_err(priv->dev, "Exceed max msg size (%li) on RX, got: %i\n",
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %i
   drivers/mailbox/imx-mailbox.c: At top level:
>> drivers/mailbox/imx-mailbox.c:680:12: warning: 'imx_mu_runtime_resume' defined but not used [-Wunused-function]
     680 | static int imx_mu_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/imx-mailbox.c:671:12: warning: 'imx_mu_runtime_suspend' defined but not used [-Wunused-function]
     671 | static int imx_mu_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:645:12: warning: 'imx_mu_resume_noirq' defined but not used [-Wunused-function]
     645 | static int imx_mu_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:628:12: warning: 'imx_mu_suspend_noirq' defined but not used [-Wunused-function]
     628 | static int imx_mu_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INPUT_POLLDEV
   Depends on [n]: !UML && INPUT [=n]
   Selected by [y]:
   - MXC_MMA8451 [=y] && HWMON [=y] && I2C [=y]


vim +/imx_mu_runtime_resume +680 drivers/mailbox/imx-mailbox.c

   670	
 > 671	static int imx_mu_runtime_suspend(struct device *dev)
   672	{
   673		struct imx_mu_priv *priv = dev_get_drvdata(dev);
   674	
   675		clk_disable_unprepare(priv->clk);
   676	
   677		return 0;
   678	}
   679	
 > 680	static int imx_mu_runtime_resume(struct device *dev)
   681	{
   682		struct imx_mu_priv *priv = dev_get_drvdata(dev);
   683		int ret;
   684	
   685		ret = clk_prepare_enable(priv->clk);
   686		if (ret)
   687			dev_err(dev, "failed to enable clock\n");
   688	
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
