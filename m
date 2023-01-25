Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8FEA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674628488; x=1706164488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+1dpLog87XG3OdejFtVYXucAewwZk48FfxpCdQe1Ckg=;
  b=UWAPEI93FCBUEtK3aXdMwTiWwfSMBUSiK+7JVXoB3Rw15jwzKmdhJii/
   nI454e8RnRR57y9JU8t/w6TZC5V8xiJ8hpwQA/8INlUUskGnZUlp5huII
   9YfrzXVDwR9jjWDaHjvv2NslINvcgtjejSW3/KVcZ5UqDlDQgPlDxUkqC
   VK54oqm8uzoDQrzcKszw11KpAQFpMfkc+q3rWxWqR8yNIYDCoIVQUVwt5
   MJ2u5BeffIrQTQ3yNyj72t0rzFeHcY7c4ESkow5kKaceZuiF0xQSglAz8
   7iVobqZM/IK6ux539iX/oxmZY0leUolXAUfLjjBRiTH/Lys6Fr585pplc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328579443"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="328579443"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 22:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991162165"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="991162165"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 22:34:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKZMr-000772-1g;
	Wed, 25 Jan 2023 06:34:45 +0000
Date: Wed, 25 Jan 2023 14:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/12] can: rcar_canfd: Add transceiver support
Message-ID: <202301251409.gmw3J0Da-lkp@intel.com>
References: <e825b50a843ffe40e33f34e4d858c07c1b2ff259.1674499048.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e825b50a843ffe40e33f34e4d858c07c1b2ff259.1674499048.git.geert+renesas@glider.be>

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.2-rc5 next-20230124]
[cannot apply to mkl-can-next/testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/dt-bindings-can-renesas-rcar-canfd-R-Car-V3U-is-R-Car-Gen4/20230124-030354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/e825b50a843ffe40e33f34e4d858c07c1b2ff259.1674499048.git.geert%2Brenesas%40glider.be
patch subject: [PATCH 12/12] can: rcar_canfd: Add transceiver support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301251409.gmw3J0Da-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2ab7bc9940c2cb09888ee0f253ca39cadccbc60
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/dt-bindings-can-renesas-rcar-canfd-R-Car-V3U-is-R-Car-Gen4/20230124-030354
        git checkout d2ab7bc9940c2cb09888ee0f253ca39cadccbc60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/can/rcar/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/net/can/rcar/rcar_canfd.c: In function 'rcar_canfd_probe':
>> drivers/net/can/rcar/rcar_canfd.c:1876:43: error: implicit declaration of function 'devm_of_phy_optional_get'; did you mean 'devm_phy_optional_get'? [-Werror=implicit-function-declaration]
    1876 |                         transceivers[i] = devm_of_phy_optional_get(dev,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           devm_phy_optional_get
>> drivers/net/can/rcar/rcar_canfd.c:1876:41: warning: assignment to 'struct phy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1876 |                         transceivers[i] = devm_of_phy_optional_get(dev,
         |                                         ^
   cc1: some warnings being treated as errors


vim +1876 drivers/net/can/rcar/rcar_canfd.c

  1849	
  1850	static int rcar_canfd_probe(struct platform_device *pdev)
  1851	{
  1852		struct phy *transceivers[RCANFD_NUM_CHANNELS] = { 0, };
  1853		const struct rcar_canfd_hw_info *info;
  1854		struct device *dev = &pdev->dev;
  1855		void __iomem *addr;
  1856		u32 sts, ch, fcan_freq;
  1857		struct rcar_canfd_global *gpriv;
  1858		struct device_node *of_child;
  1859		unsigned long channels_mask = 0;
  1860		int err, ch_irq, g_irq;
  1861		int g_err_irq, g_recc_irq;
  1862		bool fdmode = true;			/* CAN FD only mode - default */
  1863		char name[9] = "channelX";
  1864		int i;
  1865	
  1866		info = of_device_get_match_data(dev);
  1867	
  1868		if (of_property_read_bool(dev->of_node, "renesas,no-can-fd"))
  1869			fdmode = false;			/* Classical CAN only mode */
  1870	
  1871		for (i = 0; i < info->max_channels; ++i) {
  1872			name[7] = '0' + i;
  1873			of_child = of_get_child_by_name(dev->of_node, name);
  1874			if (of_child && of_device_is_available(of_child)) {
  1875				channels_mask |= BIT(i);
> 1876				transceivers[i] = devm_of_phy_optional_get(dev,
  1877								of_child, NULL);
  1878			}
  1879			of_node_put(of_child);
  1880			if (IS_ERR(transceivers[i]))
  1881				return PTR_ERR(transceivers[i]);
  1882		}
  1883	
  1884		if (info->shared_global_irqs) {
  1885			ch_irq = platform_get_irq_byname_optional(pdev, "ch_int");
  1886			if (ch_irq < 0) {
  1887				/* For backward compatibility get irq by index */
  1888				ch_irq = platform_get_irq(pdev, 0);
  1889				if (ch_irq < 0)
  1890					return ch_irq;
  1891			}
  1892	
  1893			g_irq = platform_get_irq_byname_optional(pdev, "g_int");
  1894			if (g_irq < 0) {
  1895				/* For backward compatibility get irq by index */
  1896				g_irq = platform_get_irq(pdev, 1);
  1897				if (g_irq < 0)
  1898					return g_irq;
  1899			}
  1900		} else {
  1901			g_err_irq = platform_get_irq_byname(pdev, "g_err");
  1902			if (g_err_irq < 0)
  1903				return g_err_irq;
  1904	
  1905			g_recc_irq = platform_get_irq_byname(pdev, "g_recc");
  1906			if (g_recc_irq < 0)
  1907				return g_recc_irq;
  1908		}
  1909	
  1910		/* Global controller context */
  1911		gpriv = devm_kzalloc(dev, sizeof(*gpriv), GFP_KERNEL);
  1912		if (!gpriv)
  1913			return -ENOMEM;
  1914	
  1915		gpriv->pdev = pdev;
  1916		gpriv->channels_mask = channels_mask;
  1917		gpriv->fdmode = fdmode;
  1918		gpriv->info = info;
  1919	
  1920		gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
  1921		if (IS_ERR(gpriv->rstc1))
  1922			return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
  1923					     "failed to get rstp_n\n");
  1924	
  1925		gpriv->rstc2 = devm_reset_control_get_optional_exclusive(dev, "rstc_n");
  1926		if (IS_ERR(gpriv->rstc2))
  1927			return dev_err_probe(dev, PTR_ERR(gpriv->rstc2),
  1928					     "failed to get rstc_n\n");
  1929	
  1930		/* Peripheral clock */
  1931		gpriv->clkp = devm_clk_get(dev, "fck");
  1932		if (IS_ERR(gpriv->clkp))
  1933			return dev_err_probe(dev, PTR_ERR(gpriv->clkp),
  1934					     "cannot get peripheral clock\n");
  1935	
  1936		/* fCAN clock: Pick External clock. If not available fallback to
  1937		 * CANFD clock
  1938		 */
  1939		gpriv->can_clk = devm_clk_get(dev, "can_clk");
  1940		if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
  1941			gpriv->can_clk = devm_clk_get(dev, "canfd");
  1942			if (IS_ERR(gpriv->can_clk))
  1943				return dev_err_probe(dev, PTR_ERR(gpriv->can_clk),
  1944						     "cannot get canfd clock\n");
  1945	
  1946			gpriv->fcan = RCANFD_CANFDCLK;
  1947	
  1948		} else {
  1949			gpriv->fcan = RCANFD_EXTCLK;
  1950		}
  1951		fcan_freq = clk_get_rate(gpriv->can_clk);
  1952	
  1953		if (gpriv->fcan == RCANFD_CANFDCLK)
  1954			/* CANFD clock is further divided by (1/2) within the IP */
  1955			fcan_freq /= info->postdiv;
  1956	
  1957		addr = devm_platform_ioremap_resource(pdev, 0);
  1958		if (IS_ERR(addr)) {
  1959			err = PTR_ERR(addr);
  1960			goto fail_dev;
  1961		}
  1962		gpriv->base = addr;
  1963	
  1964		/* Request IRQ that's common for both channels */
  1965		if (info->shared_global_irqs) {
  1966			err = devm_request_irq(dev, ch_irq,
  1967					       rcar_canfd_channel_interrupt, 0,
  1968					       "canfd.ch_int", gpriv);
  1969			if (err) {
  1970				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1971					ch_irq, err);
  1972				goto fail_dev;
  1973			}
  1974	
  1975			err = devm_request_irq(dev, g_irq, rcar_canfd_global_interrupt,
  1976					       0, "canfd.g_int", gpriv);
  1977			if (err) {
  1978				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1979					g_irq, err);
  1980				goto fail_dev;
  1981			}
  1982		} else {
  1983			err = devm_request_irq(dev, g_recc_irq,
  1984					       rcar_canfd_global_receive_fifo_interrupt, 0,
  1985					       "canfd.g_recc", gpriv);
  1986	
  1987			if (err) {
  1988				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1989					g_recc_irq, err);
  1990				goto fail_dev;
  1991			}
  1992	
  1993			err = devm_request_irq(dev, g_err_irq,
  1994					       rcar_canfd_global_err_interrupt, 0,
  1995					       "canfd.g_err", gpriv);
  1996			if (err) {
  1997				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1998					g_err_irq, err);
  1999				goto fail_dev;
  2000			}
  2001		}
  2002	
  2003		err = reset_control_reset(gpriv->rstc1);
  2004		if (err)
  2005			goto fail_dev;
  2006		err = reset_control_reset(gpriv->rstc2);
  2007		if (err) {
  2008			reset_control_assert(gpriv->rstc1);
  2009			goto fail_dev;
  2010		}
  2011	
  2012		/* Enable peripheral clock for register access */
  2013		err = clk_prepare_enable(gpriv->clkp);
  2014		if (err) {
  2015			dev_err(dev, "failed to enable peripheral clock, error %d\n",
  2016				err);
  2017			goto fail_reset;
  2018		}
  2019	
  2020		err = rcar_canfd_reset_controller(gpriv);
  2021		if (err) {
  2022			dev_err(dev, "reset controller failed\n");
  2023			goto fail_clk;
  2024		}
  2025	
  2026		/* Controller in Global reset & Channel reset mode */
  2027		rcar_canfd_configure_controller(gpriv);
  2028	
  2029		/* Configure per channel attributes */
  2030		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2031			/* Configure Channel's Rx fifo */
  2032			rcar_canfd_configure_rx(gpriv, ch);
  2033	
  2034			/* Configure Channel's Tx (Common) fifo */
  2035			rcar_canfd_configure_tx(gpriv, ch);
  2036	
  2037			/* Configure receive rules */
  2038			rcar_canfd_configure_afl_rules(gpriv, ch);
  2039		}
  2040	
  2041		/* Configure common interrupts */
  2042		rcar_canfd_enable_global_interrupts(gpriv);
  2043	
  2044		/* Start Global operation mode */
  2045		rcar_canfd_update_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GMDC_MASK,
  2046				      RCANFD_GCTR_GMDC_GOPM);
  2047	
  2048		/* Verify mode change */
  2049		err = readl_poll_timeout((gpriv->base + RCANFD_GSTS), sts,
  2050					 !(sts & RCANFD_GSTS_GNOPM), 2, 500000);
  2051		if (err) {
  2052			dev_err(dev, "global operational mode failed\n");
  2053			goto fail_mode;
  2054		}
  2055	
  2056		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2057			err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
  2058						       transceivers[ch]);
  2059			if (err)
  2060				goto fail_channel;
  2061		}
  2062	
  2063		platform_set_drvdata(pdev, gpriv);
  2064		dev_info(dev, "global operational state (clk %d, fdmode %d)\n",
  2065			 gpriv->fcan, gpriv->fdmode);
  2066		return 0;
  2067	
  2068	fail_channel:
  2069		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels)
  2070			rcar_canfd_channel_remove(gpriv, ch);
  2071	fail_mode:
  2072		rcar_canfd_disable_global_interrupts(gpriv);
  2073	fail_clk:
  2074		clk_disable_unprepare(gpriv->clkp);
  2075	fail_reset:
  2076		reset_control_assert(gpriv->rstc1);
  2077		reset_control_assert(gpriv->rstc2);
  2078	fail_dev:
  2079		return err;
  2080	}
  2081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
