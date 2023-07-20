Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB0A31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689814028; x=1721350028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nNXSeKgw76qXuwAzEUUl8ZKx4DDCXp+E+pBfBjFIA0=;
  b=NGSTmCuFpjfcWw36ni+aYtkz9LOqy0WzftfTz3ME9pMk114EaYMeJvkn
   J1txflyCjKlKX5P20s5Jx3AvneLEsOsRoqACEp+iYW4tHfHGB8VWba01I
   ogdt3evK3YBZdA5qlwGV2NUkyWxhNVaLhAJmSJug0eUDHxza0Ueh+CahI
   eSOLxXL/BQv/XfkAHsEfz55AtMQ5QP+dicpQjHuhWmg5eb4cgaYDmJEb+
   I28IubHaZOL/3e/qw+deejwJVxJ5uH6k+UMHIhbLSBIUI7YCOKTl4WcLE
   Q+GZc0Sr9PkwkXV5J22RcWlc38ueQ8hDG1V91axDNKWs+JJUz86Nm4Qun
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397473220"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397473220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727498131"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727498131"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 17:47:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMHow-0005d7-1P;
	Thu, 20 Jul 2023 00:47:06 +0000
Date: Thu, 20 Jul 2023 08:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 3301/12470]
 drivers/mxc/sim/imx_sim.c:1750:62: warning: cast from pointer to integer of
 different size
Message-ID: <202307200845.Oxo3U7BH-lkp@intel.com>
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
commit: 29b4956e9a625fc3b70a1fdb105a0fac7dbcdd06 [3301/12470] MLK-10600-1: mxc: sim: Add SIM IP driver support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200845.Oxo3U7BH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200845.Oxo3U7BH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200845.Oxo3U7BH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mxc/sim/imx_sim.c:1285:6: warning: no previous prototype for 'sim_clear_rx_buf' [-Wmissing-prototypes]
    1285 | void sim_clear_rx_buf(struct sim_t *sim)
         |      ^~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:20,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/mxc/sim/imx_sim.c:19:
   drivers/mxc/sim/imx_sim.c: In function 'sim_probe':
>> drivers/mxc/sim/imx_sim.c:1750:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1750 |         dev_dbg(&pdev->dev, "mapped base address: 0x%08x\n", (u32)sim->ioaddr);
         |                                                              ^
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/mxc/sim/imx_sim.c:1750:9: note: in expansion of macro 'dev_dbg'
    1750 |         dev_dbg(&pdev->dev, "mapped base address: 0x%08x\n", (u32)sim->ioaddr);
         |         ^~~~~~~


vim +1750 drivers/mxc/sim/imx_sim.c

  1721	
  1722	static int sim_probe(struct platform_device *pdev)
  1723	{
  1724		int ret = 0;
  1725		const struct of_device_id *of_id;
  1726		struct sim_t *sim = NULL;
  1727		struct device_node *of_node = pdev->dev.of_node;
  1728	
  1729		sim = devm_kzalloc(&pdev->dev, sizeof(struct sim_t),
  1730					GFP_KERNEL);
  1731		if (!sim) {
  1732			dev_err(&pdev->dev, "can't allocate enough memory\n");
  1733			return -ENOMEM;
  1734		}
  1735	
  1736		of_id = of_match_device(sim_imx_dt_ids, &pdev->dev);
  1737		if (of_id)
  1738			pdev->id_entry = of_id->data;
  1739		else
  1740			return -EINVAL;
  1741	
  1742		sim->clk_rate = FCLK_FREQ;
  1743	
  1744		sim->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1745		if (!sim->res) {
  1746			pr_err("Can't get the MEMORY\n");
  1747			return -ENOMEM;
  1748		}
  1749		sim->ioaddr = devm_ioremap_resource(&pdev->dev, sim->res);
> 1750		dev_dbg(&pdev->dev, "mapped base address: 0x%08x\n", (u32)sim->ioaddr);
  1751		if (IS_ERR(sim->ioaddr)) {
  1752			dev_err(&pdev->dev,
  1753				"failed to get ioremap base\n");
  1754			ret = PTR_ERR(sim->ioaddr);
  1755			return ret;
  1756		}
  1757	
  1758		/* request the sim clk and sim_serial_clk */
  1759		sim->clk = devm_clk_get(&pdev->dev, "sim");
  1760		if (IS_ERR(sim->clk)) {
  1761			ret = PTR_ERR(sim->clk);
  1762			pr_err("Get CLK ERROR !\n");
  1763			return ret;
  1764		}
  1765		pr_debug("sim clock:%lu\n", clk_get_rate(sim->clk));
  1766	
  1767		sim->ipb_irq = platform_get_irq(pdev, 0);
  1768		if (sim->ipb_irq < 0) {
  1769			dev_err(&pdev->dev, "No ipb irq line provided\n");
  1770			return -ENOENT;
  1771		}
  1772		if (devm_request_irq(&pdev->dev, sim->ipb_irq, sim_irq_handler,
  1773					0, "mxc_sim_ipb", sim)) {
  1774			dev_err(&pdev->dev, "can't claim irq %d\n", sim->ipb_irq);
  1775			return -ENOENT;
  1776		}
  1777	
  1778		sim->sven_low_active = of_property_read_bool(of_node,
  1779							"sven_low_active");
  1780	
  1781		ret = of_property_read_u32(of_node, "port", &sim->port_index);
  1782		if (ret)
  1783			sim->port_index = 0;
  1784		sim->port_ctrl_reg = (sim->port_index == 0) ?
  1785					PORT0_CNTL : PORT1_CNTL;
  1786		sim->port_detect_reg = (sim->port_index == 0) ?
  1787					PORT0_DETECT : PORT1_DETECT;
  1788		sim->quirks = pdev->id_entry->driver_data;
  1789	
  1790		platform_set_drvdata(pdev, sim);
  1791	
  1792		/*
  1793		 *@todo: Need to figure a better way if possible.
  1794		 */
  1795		sim_dev.parent = &(pdev->dev);
  1796	
  1797		pm_runtime_get_noresume(&pdev->dev);
  1798		pm_runtime_set_active(&pdev->dev);
  1799		pm_runtime_enable(&pdev->dev);
  1800	
  1801		sim->open_cnt = 1;
  1802		ret = clk_prepare_enable(sim->clk);
  1803		if (ret)
  1804			return ret;
  1805		/* Let pm_runtime_put_snyc() disable the clock.
  1806		 * If CONFIG_PM is not enabled, the clock will stay powered.
  1807		 */
  1808		pm_runtime_put_sync(&pdev->dev);
  1809		sim->open_cnt = 0;
  1810	
  1811		misc_register(&sim_dev);
  1812	
  1813		return 0;
  1814	}
  1815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
