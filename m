Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56971B4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186907; cv=none; b=UfyfEQeDlFI0DDnBZUWNEtnlwFhMHRyafeW15BUHbNORuuyHmk+vCQdufpXLPWl9Y9G3dG5cKHG4Ql0znB1BB3S82fTXE00DiIANq8vtbgmv53kj8TCp7rRofZo7s2VKZoaF8LxFGJbLatYPt5RBMHLxRiV4JmWFEnTPTo1XvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186907; c=relaxed/simple;
	bh=xINijl06MVc2f3Y0xsZFGQ8cII4V9PXtjxmd3cHX198=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aW3M1H/rC80a0S8DXTPdz5CagprNse+7vu06FskZf1X4dsfAGeKUYfy2IZGcrW14JlRItKingGqZuBhRvk9LRqGup3ZdD62QqRWM6w+fApYnop4Yr81cAq6Z2P5/lDmrkMC90EQwDHR9dhCVHuthJ/VnHfr4H/QbxFlEOADtx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbOwCCnM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbOwCCnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713186905; x=1744722905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xINijl06MVc2f3Y0xsZFGQ8cII4V9PXtjxmd3cHX198=;
  b=FbOwCCnM3UF+AivO8byQb/NdsLskuK4uaoU4auQxEgdju0Jn98fIjYze
   I7BQ9m/MMQxJ599azugNsnGcA4thhFAiyAAM/WiOjZSqT1X3e195QTQXi
   yrTfmNZAJW6u2l68klCgd+xxmNTITZxHN4+w/a6OkL3OG9oFltgyb7Y/K
   leC9iABBsmEqxsV2hGb/U9yLbvVCNttbDN2gam6VBSP+Ym512XUjusr9R
   1U/+AXxVFSizq3V7i08JhzO+fKL4lvFin7hCaYlRcp72USIfIw4DohI1n
   aInu5/Yt4NgU3Ij0p8IwK38Ul7TnXspUCHu9kIdW3yBKOPFiTEaQ9ol+O
   g==;
X-CSE-ConnectionGUID: HYkhj2NwSBCQZ5vZeezHPA==
X-CSE-MsgGUID: QpPghw+eSzaJfAdtn1BTew==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9126726"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="9126726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 06:15:04 -0700
X-CSE-ConnectionGUID: T30kZUT3Qfy1Dnn26qssLw==
X-CSE-MsgGUID: sbtT4xx4S8SRxRJHrx1k7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22383654"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2024 06:15:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwMAm-0004Be-0S;
	Mon, 15 Apr 2024 13:15:00 +0000
Date: Mon, 15 Apr 2024 21:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: [morimoto:gen5-VDK-3.1-2024-04-15 28/43]
 drivers/net/can/rcar/rcar_canfd.c:1882:51: warning: '%d' directive output
 may be truncated writing between 1 and 11 bytes into a region of size 3
Message-ID: <202404152129.pITUXhGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux gen5-VDK-3.1-2024-04-15
head:   68db9a43e8e40242400f5b9e19824f0efb20db38
commit: 4cdb5f565ea7ee01981561ad699b3598c045418e [28/43] can: rcar: Add R-Car Gen5 X5H support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404152129.pITUXhGT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404152129.pITUXhGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404152129.pITUXhGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/rcar/rcar_canfd.c: In function 'rcar_canfd_probe':
>> drivers/net/can/rcar/rcar_canfd.c:1882:51: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Wformat-truncation=]
    1882 |                 snprintf(name, NAME_SIZE, "channel%d", i);
         |                                                   ^~
   drivers/net/can/rcar/rcar_canfd.c:1882:43: note: directive argument in the range [-2147483643, 254]
    1882 |                 snprintf(name, NAME_SIZE, "channel%d", i);
         |                                           ^~~~~~~~~~~
   drivers/net/can/rcar/rcar_canfd.c:1882:17: note: 'snprintf' output between 9 and 19 bytes into a destination of size 10
    1882 |                 snprintf(name, NAME_SIZE, "channel%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1882 drivers/net/can/rcar/rcar_canfd.c

  1858	
  1859	#define NAME_SIZE 10
  1860	static int rcar_canfd_probe(struct platform_device *pdev)
  1861	{
  1862		struct phy *transceivers[RCANFD_NUM_CHANNELS] = { NULL, };
  1863		const struct rcar_canfd_hw_info *info;
  1864		struct device *dev = &pdev->dev;
  1865		void __iomem *addr;
  1866		u32 sts, ch, fcan_freq;
  1867		struct rcar_canfd_global *gpriv;
  1868		struct device_node *of_child;
  1869		unsigned long channels_mask = 0;
  1870		int err, ch_irq, g_irq;
  1871		int g_err_irq, g_recc_irq;
  1872		bool fdmode = true;			/* CAN FD only mode - default */
  1873		char name[NAME_SIZE];
  1874		int i;
  1875	
  1876		info = of_device_get_match_data(dev);
  1877	
  1878		if (of_property_read_bool(dev->of_node, "renesas,no-can-fd"))
  1879			fdmode = false;			/* Classical CAN only mode */
  1880	
  1881		for (i = 0; i < info->max_channels; ++i) {
> 1882			snprintf(name, NAME_SIZE, "channel%d", i);
  1883			of_child = of_get_child_by_name(dev->of_node, name);
  1884			if (of_child && of_device_is_available(of_child)) {
  1885				channels_mask |= BIT(i);
  1886				transceivers[i] = devm_of_phy_optional_get(dev,
  1887								of_child, NULL);
  1888			}
  1889			of_node_put(of_child);
  1890			if (IS_ERR(transceivers[i]))
  1891				return PTR_ERR(transceivers[i]);
  1892		}
  1893	
  1894		if (info->shared_global_irqs) {
  1895			ch_irq = platform_get_irq_byname_optional(pdev, "ch_int");
  1896			if (ch_irq < 0) {
  1897				/* For backward compatibility get irq by index */
  1898				ch_irq = platform_get_irq(pdev, 0);
  1899				if (ch_irq < 0)
  1900					return ch_irq;
  1901			}
  1902	
  1903			g_irq = platform_get_irq_byname_optional(pdev, "g_int");
  1904			if (g_irq < 0) {
  1905				/* For backward compatibility get irq by index */
  1906				g_irq = platform_get_irq(pdev, 1);
  1907				if (g_irq < 0)
  1908					return g_irq;
  1909			}
  1910		} else {
  1911			g_err_irq = platform_get_irq_byname(pdev, "g_err");
  1912			if (g_err_irq < 0)
  1913				return g_err_irq;
  1914	
  1915			g_recc_irq = platform_get_irq_byname(pdev, "g_recc");
  1916			if (g_recc_irq < 0)
  1917				return g_recc_irq;
  1918		}
  1919	
  1920		/* Global controller context */
  1921		gpriv = devm_kzalloc(dev, sizeof(*gpriv), GFP_KERNEL);
  1922		if (!gpriv)
  1923			return -ENOMEM;
  1924	
  1925		gpriv->pdev = pdev;
  1926		gpriv->channels_mask = channels_mask;
  1927		gpriv->fdmode = fdmode;
  1928		gpriv->info = info;
  1929	
  1930		gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
  1931		if (IS_ERR(gpriv->rstc1))
  1932			return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
  1933					     "failed to get rstp_n\n");
  1934	
  1935		gpriv->rstc2 = devm_reset_control_get_optional_exclusive(dev, "rstc_n");
  1936		if (IS_ERR(gpriv->rstc2))
  1937			return dev_err_probe(dev, PTR_ERR(gpriv->rstc2),
  1938					     "failed to get rstc_n\n");
  1939	
  1940		/* Peripheral clock */
  1941		gpriv->clkp = devm_clk_get(dev, "fck");
  1942		if (IS_ERR(gpriv->clkp))
  1943			return dev_err_probe(dev, PTR_ERR(gpriv->clkp),
  1944					     "cannot get peripheral clock\n");
  1945	
  1946		/* fCAN clock: Pick External clock. If not available fallback to
  1947		 * CANFD clock
  1948		 */
  1949		gpriv->can_clk = devm_clk_get(dev, "can_clk");
  1950		if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
  1951			gpriv->can_clk = devm_clk_get(dev, "canfd");
  1952			if (IS_ERR(gpriv->can_clk))
  1953				return dev_err_probe(dev, PTR_ERR(gpriv->can_clk),
  1954						     "cannot get canfd clock\n");
  1955	
  1956			gpriv->fcan = RCANFD_CANFDCLK;
  1957	
  1958		} else {
  1959			gpriv->fcan = RCANFD_EXTCLK;
  1960		}
  1961		fcan_freq = clk_get_rate(gpriv->can_clk);
  1962	
  1963		if (gpriv->fcan == RCANFD_CANFDCLK)
  1964			/* CANFD clock is further divided by (1/2) within the IP */
  1965			fcan_freq /= info->postdiv;
  1966	
  1967		addr = devm_platform_ioremap_resource(pdev, 0);
  1968		if (IS_ERR(addr)) {
  1969			err = PTR_ERR(addr);
  1970			goto fail_dev;
  1971		}
  1972		gpriv->base = addr;
  1973	
  1974		/* Request IRQ that's common for both channels */
  1975		if (info->shared_global_irqs) {
  1976			err = devm_request_irq(dev, ch_irq,
  1977					       rcar_canfd_channel_interrupt, 0,
  1978					       "canfd.ch_int", gpriv);
  1979			if (err) {
  1980				dev_err(dev, "devm_request_irq %d failed: %pe\n",
  1981					ch_irq, ERR_PTR(err));
  1982				goto fail_dev;
  1983			}
  1984	
  1985			err = devm_request_irq(dev, g_irq, rcar_canfd_global_interrupt,
  1986					       0, "canfd.g_int", gpriv);
  1987			if (err) {
  1988				dev_err(dev, "devm_request_irq %d failed: %pe\n",
  1989					g_irq, ERR_PTR(err));
  1990				goto fail_dev;
  1991			}
  1992		} else {
  1993			err = devm_request_irq(dev, g_recc_irq,
  1994					       rcar_canfd_global_receive_fifo_interrupt, 0,
  1995					       "canfd.g_recc", gpriv);
  1996	
  1997			if (err) {
  1998				dev_err(dev, "devm_request_irq %d failed: %pe\n",
  1999					g_recc_irq, ERR_PTR(err));
  2000				goto fail_dev;
  2001			}
  2002	
  2003			err = devm_request_irq(dev, g_err_irq,
  2004					       rcar_canfd_global_err_interrupt, 0,
  2005					       "canfd.g_err", gpriv);
  2006			if (err) {
  2007				dev_err(dev, "devm_request_irq %d failed: %pe\n",
  2008					g_err_irq, ERR_PTR(err));
  2009				goto fail_dev;
  2010			}
  2011		}
  2012	
  2013		err = reset_control_reset(gpriv->rstc1);
  2014		if (err)
  2015			goto fail_dev;
  2016		err = reset_control_reset(gpriv->rstc2);
  2017		if (err) {
  2018			reset_control_assert(gpriv->rstc1);
  2019			goto fail_dev;
  2020		}
  2021	
  2022		/* Enable peripheral clock for register access */
  2023		err = clk_prepare_enable(gpriv->clkp);
  2024		if (err) {
  2025			dev_err(dev, "failed to enable peripheral clock: %pe\n",
  2026				ERR_PTR(err));
  2027			goto fail_reset;
  2028		}
  2029	
  2030		err = rcar_canfd_reset_controller(gpriv);
  2031		if (err) {
  2032			dev_err(dev, "reset controller failed: %pe\n", ERR_PTR(err));
  2033			goto fail_clk;
  2034		}
  2035	
  2036		/* Controller in Global reset & Channel reset mode */
  2037		rcar_canfd_configure_controller(gpriv);
  2038	
  2039		/* Configure per channel attributes */
  2040		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2041			/* Configure Channel's Rx fifo */
  2042			rcar_canfd_configure_rx(gpriv, ch);
  2043	
  2044			/* Configure Channel's Tx (Common) fifo */
  2045			rcar_canfd_configure_tx(gpriv, ch);
  2046	
  2047			/* Configure receive rules */
  2048			rcar_canfd_configure_afl_rules(gpriv, ch);
  2049		}
  2050	
  2051		/* Configure common interrupts */
  2052		rcar_canfd_enable_global_interrupts(gpriv);
  2053	
  2054		/* Start Global operation mode */
  2055		rcar_canfd_update_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GMDC_MASK,
  2056				      RCANFD_GCTR_GMDC_GOPM);
  2057	
  2058		/* Verify mode change */
  2059		err = readl_poll_timeout((gpriv->base + RCANFD_GSTS), sts,
  2060					 !(sts & RCANFD_GSTS_GNOPM), 2, 500000);
  2061		if (err) {
  2062			dev_err(dev, "global operational mode failed\n");
  2063			goto fail_mode;
  2064		}
  2065	
  2066		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2067			err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
  2068						       transceivers[ch]);
  2069			if (err)
  2070				goto fail_channel;
  2071		}
  2072	
  2073		platform_set_drvdata(pdev, gpriv);
  2074		dev_info(dev, "global operational state (clk %d, fdmode %d)\n",
  2075			 gpriv->fcan, gpriv->fdmode);
  2076		return 0;
  2077	
  2078	fail_channel:
  2079		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels)
  2080			rcar_canfd_channel_remove(gpriv, ch);
  2081	fail_mode:
  2082		rcar_canfd_disable_global_interrupts(gpriv);
  2083	fail_clk:
  2084		clk_disable_unprepare(gpriv->clkp);
  2085	fail_reset:
  2086		reset_control_assert(gpriv->rstc1);
  2087		reset_control_assert(gpriv->rstc2);
  2088	fail_dev:
  2089		return err;
  2090	}
  2091	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
