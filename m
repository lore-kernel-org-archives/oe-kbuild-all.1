Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FECA58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693054615; x=1724590615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWDQreH4Ce8mEwbvIkzRtJ1N5mBOjt0wPr24l1O7Rhs=;
  b=hiACx2DsZasuOejrAxsGIurm4ovP+6SmXV4jA/0z1y9ZwdE7v8YgGzBJ
   4aTviJQ1WCs5ibasIOAKFxcejKZ4SD+XfBT0/+HfGoH9beCU2kWBOEUtB
   9XmDYWi+xzmNqBDVwSn7EZtpIfK1sKNd3afJ/shBsHiJ3XaAHGDsNIYE7
   zFA7T0c5Ieg55v4w6qbj8/WQ7rceWYIhLRH4uIamMS42jgZ2l8+HqRubm
   b/HVBpX2R7Wrcu5ksW+YGdoZAzqE+6+Eios0zTiOcaB2oMozrUiIrUW7m
   nsfqiAm9hK6gGrAjapGkSsdFNgnsztpHY6Q2P4idcjVrgU/FDfWHV2o+p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355203880"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="355203880"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="827855416"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="827855416"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2023 05:56:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZsqT-0004il-1J;
	Sat, 26 Aug 2023 12:56:53 +0000
Date: Sat, 26 Aug 2023 20:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 3851/12470]
 drivers/tty/serial/fsl_lpuart.c:3104:12: warning: 'lpuart_resume_noirq'
 defined but not used
Message-ID: <202308262044.iUk0KIxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   b872b1170fc8843b55e9f8838dd373ff43bb7552
commit: 7e221e7441f180cd9454f006c1cdfbac487c08f0 [3851/12470] tty: serial: lpuart: enable wakeup source for lpuart
config: i386-buildonly-randconfig-r005-20230718 (https://download.01.org/0day-ci/archive/20230826/202308262044.iUk0KIxr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262044.iUk0KIxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262044.iUk0KIxr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_lpuart.c:3104:12: warning: 'lpuart_resume_noirq' defined but not used [-Wunused-function]
    3104 | static int lpuart_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/fsl_lpuart.c:3091:12: warning: 'lpuart_suspend_noirq' defined but not used [-Wunused-function]
    3091 | static int lpuart_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/lpuart_resume_noirq +3104 drivers/tty/serial/fsl_lpuart.c

  3090	
> 3091	static int lpuart_suspend_noirq(struct device *dev)
  3092	{
  3093		struct lpuart_port *sport = dev_get_drvdata(dev);
  3094		bool irq_wake = irqd_is_wakeup_set(irq_get_irq_data(sport->port.irq));
  3095	
  3096		if (lpuart_uport_is_active(sport))
  3097			serial_lpuart_enable_wakeup(sport, !!irq_wake);
  3098	
  3099		pinctrl_pm_select_sleep_state(dev);
  3100	
  3101		return 0;
  3102	}
  3103	
> 3104	static int lpuart_resume_noirq(struct device *dev)
  3105	{
  3106		struct lpuart_port *sport = dev_get_drvdata(dev);
  3107		unsigned int val;
  3108	
  3109		pinctrl_pm_select_default_state(dev);
  3110	
  3111		if (lpuart_uport_is_active(sport)) {
  3112			serial_lpuart_enable_wakeup(sport, false);
  3113	
  3114			/* clear the wakeup flags */
  3115			if (lpuart_is_32(sport)) {
  3116				val = lpuart32_read(&sport->port, UARTSTAT);
  3117				lpuart32_write(&sport->port, val, UARTSTAT);
  3118			}
  3119		}
  3120	
  3121		return 0;
  3122	}
  3123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
