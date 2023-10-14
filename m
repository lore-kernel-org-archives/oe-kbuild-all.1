Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AEF4F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/f26o/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697319817; x=1728855817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0S0EPfhmhIp6MGZKQQ2501UBTey/K7Xln5jzeMeXFCc=;
  b=n/f26o/TvtTA3bYMJ+foJmrHjOusoT5fkKMc00bBzuOU4bLn8DkwmhKm
   YDzGo19VebEoSs7IUgIfgzJ2NHiAm0YebutvQXpzE+lmv7JlBVvwjJe28
   CgA60rS9DDgxwH6qIjX9I2vkvMI2c3hp+albziVYGA8ys8rJQf/SQT9xE
   s/CZt2oVopC3u/mqRxVuuQh8ave2ksPBq4ujpof0ChL8leU85GbWBpWf4
   jOvy9qEjy8jSeIXxn3auLEg5BvpLMFo3+8n/rloZHmDRchVLaQiLdPYsH
   z0qjINNSMgOcC6Pv+/iO4kuL0jiZj95Xzh11qFJtJPSEN39I/L/eDqDAu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6914892"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6914892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 14:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002399468"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002399468"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 14:43:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrmQ1-0006hj-0c;
	Sat, 14 Oct 2023 21:43:33 +0000
Date: Sun, 15 Oct 2023 05:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4251/24603]
 drivers/tty/serial/fsl_lpuart.c:3133:12: warning: 'lpuart_resume_noirq'
 defined but not used
Message-ID: <202310150547.53OMHtJF-lkp@intel.com>
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
commit: 06b1854a6e7b9b45cd2536884b26246a0f72f5b1 [4251/24603] tty: serial: lpuart: enable wakeup source for lpuart
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150547.53OMHtJF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150547.53OMHtJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150547.53OMHtJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_lpuart.c:3133:12: warning: 'lpuart_resume_noirq' defined but not used [-Wunused-function]
    3133 | static int lpuart_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/fsl_lpuart.c:3120:12: warning: 'lpuart_suspend_noirq' defined but not used [-Wunused-function]
    3120 | static int lpuart_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/lpuart_resume_noirq +3133 drivers/tty/serial/fsl_lpuart.c

  3119	
> 3120	static int lpuart_suspend_noirq(struct device *dev)
  3121	{
  3122		struct lpuart_port *sport = dev_get_drvdata(dev);
  3123		bool irq_wake = irqd_is_wakeup_set(irq_get_irq_data(sport->port.irq));
  3124	
  3125		if (lpuart_uport_is_active(sport))
  3126			serial_lpuart_enable_wakeup(sport, !!irq_wake);
  3127	
  3128		pinctrl_pm_select_sleep_state(dev);
  3129	
  3130		return 0;
  3131	}
  3132	
> 3133	static int lpuart_resume_noirq(struct device *dev)
  3134	{
  3135		struct lpuart_port *sport = dev_get_drvdata(dev);
  3136		unsigned int val;
  3137	
  3138		pinctrl_pm_select_default_state(dev);
  3139	
  3140		if (lpuart_uport_is_active(sport)) {
  3141			serial_lpuart_enable_wakeup(sport, false);
  3142	
  3143			/* clear the wakeup flags */
  3144			if (lpuart_is_32(sport)) {
  3145				val = lpuart32_read(&sport->port, UARTSTAT);
  3146				lpuart32_write(&sport->port, val, UARTSTAT);
  3147			}
  3148		}
  3149	
  3150		return 0;
  3151	}
  3152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
