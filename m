Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00297485
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694290668; x=1725826668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJkWOEJVmJPuy4d0E5K+3Od1HISA9bjlKjDzzGKmq4c=;
  b=kzm91vvGUfnzz2rWw9LtwMA16vdL9zD0dMTutPIMtuS7jn2jjW+FfPOP
   DqgqpdH/xbQaratSP6JIoBnAIxElRt55iJWHtz5jJd/ndKCt/zDxmm9Wj
   YwrgTgggmAFwJGBEMmQa+qFNnq+5Kn9S2xOLLsucCSsc5yCgUU/gHwMld
   geTA/H3pNPSE6/1FKzrf1ZVzhOSUdmu3gwpTNR3KZIPWVZlUF+nSO9Gs/
   SGFoC9fXbqtXyuAIVfzl+MFzAWKCN27olGp4wgUFSMrYvext2kTSn107A
   Z442W7vn+vMdgUyD4uC4Tx+hdATq+CgKcNfRtKWxpPlQft6yRQZDmGEyg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441859309"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441859309"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 13:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736320785"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="736320785"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 13:17:46 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf4Om-0003sY-1t;
	Sat, 09 Sep 2023 20:17:44 +0000
Date: Sun, 10 Sep 2023 04:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3290/25020]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1609:17: error:
 implicit declaration of function 'mt_eint_unmask'
Message-ID: <202309100448.IlCm01dT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: f3e023ffe1da7261a8aba45f085b43150d1f87c2 [3290/25020] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: s390-randconfig-r021-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100448.IlCm01dT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100448.IlCm01dT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100448.IlCm01dT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:792:5: warning: no previous prototype for 'tpd_i2c_read_data' [-Wmissing-prototypes]
     792 | int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:911:5: warning: no previous prototype for 'tpd_i2c_write_data' [-Wmissing-prototypes]
     911 | int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: In function 'touch_event_handler':
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1609:17: error: implicit declaration of function 'mt_eint_unmask' [-Werror=implicit-function-declaration]
    1609 |                 mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
         |                 ^~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1609:32: error: 'CUST_EINT_TOUCH_PANEL_NUM' undeclared (first use in this function)
    1609 |                 mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1609:32: note: each undeclared identifier is reported only once for each function it appears in
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: In function 'synaptics_rmi4_irq_enable':
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1648:40: error: 'CUST_EINT_TOUCH_PANEL_NUM' undeclared (first use in this function)
    1648 |                         mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:1659:25: error: implicit declaration of function 'mt_eint_mask' [-Werror=implicit-function-declaration]
    1659 |                         mt_eint_mask(CUST_EINT_TOUCH_PANEL_NUM);
         |                         ^~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: In function 'synaptics_rmi4_probe':
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3287:9: error: 'touch_irq' undeclared (first use in this function); did you mean 'touch_atime'?
    3287 |         touch_irq = client->irq;
         |         ^~~~~~~~~
         |         touch_atime
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3194:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3194 |         int retval, ret;
         |                     ^~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: At top level:
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:175:27: warning: 'synaptics_rmi4_suspend' used but never defined
     175 | static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:177:27: warning: 'synaptics_rmi4_resume' used but never defined
     177 | static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mt_eint_unmask +1609 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c

  1586	
  1587	static int touch_event_handler(void *data)
  1588	{
  1589		struct synaptics_rmi4_data *rmi4_data = data;
  1590	
  1591		do {
  1592			set_current_state(TASK_INTERRUPTIBLE);
  1593	
  1594			while (tpd_halt) {
  1595				tpd_flag = 0;
  1596				msleep(20);
  1597			}
  1598	
  1599			wait_event_interruptible(waiter, tpd_flag != 0);
  1600	
  1601			tpd_flag = 0;
  1602			set_current_state(TASK_RUNNING);
  1603	
  1604			if (!rmi4_data->touch_stopped)
  1605				synaptics_rmi4_sensor_report(rmi4_data);
  1606	#ifdef CONFIG_OF_TOUCH
  1607			enable_irq(touch_irq);
  1608	#else
> 1609			mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
  1610	#endif
  1611	
  1612		} while (1);
  1613	
  1614		return 0;
  1615	}
  1616	
  1617	 /**
  1618	  * synaptics_rmi4_irq_enable()
  1619	  *
  1620	  * Called by synaptics_rmi4_probe() and the power management functions
  1621	  * in this driver and also exported to other expansion Function modules
  1622	  * such as rmi_dev.
  1623	  *
  1624	  * This function handles the enabling and disabling of the attention
  1625	  * irq including the setting up of the ISR thread.
  1626	  */
  1627	static int synaptics_rmi4_irq_enable(struct synaptics_rmi4_data *rmi4_data,
  1628			bool enable)
  1629	{
  1630		int retval = 0;
  1631		unsigned char intr_status[MAX_INTR_REGISTERS];
  1632	
  1633		if (enable) {
  1634	
  1635			/* Clear interrupts first */
  1636			retval = synaptics_rmi4_i2c_read(rmi4_data,
  1637					rmi4_data->f01_data_base_addr + 1,
  1638					intr_status,
  1639					rmi4_data->num_of_intr_regs);
  1640			if (retval < 0)
  1641				return retval;
  1642	
  1643			/* set up irq */
  1644			if (!rmi4_data->irq_enabled) {
  1645	#ifdef CONFIG_OF_TOUCH
  1646				enable_irq(touch_irq);
  1647	#else
  1648				mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
  1649	#endif
  1650				rmi4_data->irq_enabled = true;
  1651	
  1652			}
  1653	
  1654		} else {
  1655			if (rmi4_data->irq_enabled) {
  1656	#ifdef CONFIG_OF_TOUCH
  1657				disable_irq_nosync(touch_irq);
  1658	#else
> 1659				mt_eint_mask(CUST_EINT_TOUCH_PANEL_NUM);
  1660	#endif
  1661				rmi4_data->irq_enabled = false;
  1662			}
  1663		}
  1664	
  1665		return retval;
  1666	}
  1667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
