Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7781E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 00:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixmTBg7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700871587; x=1732407587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4Ad16Pk/O7NZMJPOJJwTgjgsidZFq7EVcZ/Osog7Q4=;
  b=ixmTBg7nh23APbbhZ0OF4knkhh6mMDf8/FCl0pBjTrX5q/Pbx6GQFq75
   31JECwa5JKwi6MZhCTZlgWnktXaU3NgdR4NVe9jNNnb1+oMD8EtOjFMub
   Aj7ynWzJx3pCk6Ge3BzrZ+kpxu3DEtHJwmARLAaZRki2yf5T/hoyrm7Vf
   GphvMrX7raPGoBZPpeUgf3cDC4hCqWgB6jWALAd89yqxBir3xxzfyvafo
   kyxQt5y8+bOSc2gvp4UktdrdbJ/9LhoKGj8amKZbAikBXIDf4F+m8vAs3
   3j8IMBWm2nOF5WAf+ZH0JhQOPpE3LYFaPyUW8OZCmZNUidKsZJpW3s3Ql
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350885"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391350885"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 16:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858483141"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858483141"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2023 16:19:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6gOW-0003Qn-2l;
	Sat, 25 Nov 2023 00:19:36 +0000
Date: Sat, 25 Nov 2023 08:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/11] drivers/phy/apple/atc.c:1908:32:
 sparse: sparse: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it
 be static?
Message-ID: <202311250640.HeZL0jI6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3b2571b8e8064a73eca2cec23cf86cfe7f7050f5 [3/11] WIP: phy: apple: Add Apple Type-C PHY
config: sparc-randconfig-r111-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250640.HeZL0jI6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250640.HeZL0jI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250640.HeZL0jI6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:1908:32: sparse: sparse: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?
>> drivers/phy/apple/atc.c:2104:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/phy/apple/atc.c:2104:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/phy/apple/atc.c:2104:44: sparse:     got restricted __le32 const [usertype] *p
>> drivers/phy/apple/atc.c:2104:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/phy/apple/atc.c:2104:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/phy/apple/atc.c:2104:19: sparse:     got restricted __be32 const [usertype] *
   drivers/phy/apple/atc.c:2105:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/phy/apple/atc.c:2105:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/phy/apple/atc.c:2105:44: sparse:     got restricted __le32 const [usertype] *p
   drivers/phy/apple/atc.c:2105:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/phy/apple/atc.c:2105:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/phy/apple/atc.c:2105:19: sparse:     got restricted __be32 const [usertype] *
   drivers/phy/apple/atc.c:2106:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/phy/apple/atc.c:2106:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/phy/apple/atc.c:2106:44: sparse:     got restricted __le32 const [usertype] *p
   drivers/phy/apple/atc.c:2106:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/phy/apple/atc.c:2106:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/phy/apple/atc.c:2106:19: sparse:     got restricted __be32 const [usertype] *

vim +/atcphy_dwc3_reset_ops +1908 drivers/phy/apple/atc.c

  1907	
> 1908	const struct reset_control_ops atcphy_dwc3_reset_ops = {
  1909		.assert = atcphy_dwc3_reset_assert,
  1910		.deassert = atcphy_dwc3_reset_deassert,
  1911	};
  1912	
  1913	static int atcphy_reset_xlate(struct reset_controller_dev *rcdev,
  1914				      const struct of_phandle_args *reset_spec)
  1915	{
  1916		return 0;
  1917	}
  1918	
  1919	static int atcphy_probe_rcdev(struct apple_atcphy *atcphy)
  1920	{
  1921		atcphy->rcdev.owner = THIS_MODULE;
  1922		atcphy->rcdev.nr_resets = 1;
  1923		atcphy->rcdev.ops = &atcphy_dwc3_reset_ops;
  1924		atcphy->rcdev.of_node = atcphy->dev->of_node;
  1925		atcphy->rcdev.of_reset_n_cells = 0;
  1926		atcphy->rcdev.of_xlate = atcphy_reset_xlate;
  1927	
  1928		return devm_reset_controller_register(atcphy->dev, &atcphy->rcdev);
  1929	}
  1930	
  1931	static int atcphy_sw_set(struct typec_switch_dev *sw,
  1932				 enum typec_orientation orientation)
  1933	{
  1934		struct apple_atcphy *atcphy = typec_switch_get_drvdata(sw);
  1935	
  1936		trace_atcphy_sw_set(orientation);
  1937	
  1938		mutex_lock(&atcphy->lock);
  1939		switch (orientation) {
  1940		case TYPEC_ORIENTATION_NONE:
  1941			break;
  1942		case TYPEC_ORIENTATION_NORMAL:
  1943			atcphy->swap_lanes = false;
  1944			break;
  1945		case TYPEC_ORIENTATION_REVERSE:
  1946			atcphy->swap_lanes = true;
  1947			break;
  1948		}
  1949		mutex_unlock(&atcphy->lock);
  1950	
  1951		return 0;
  1952	}
  1953	
  1954	static int atcphy_probe_switch(struct apple_atcphy *atcphy)
  1955	{
  1956		struct typec_switch_desc sw_desc = {
  1957			.drvdata = atcphy,
  1958			.fwnode = atcphy->dev->fwnode,
  1959			.set = atcphy_sw_set,
  1960		};
  1961	
  1962		return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
  1963	}
  1964	
  1965	static void atcphy_mux_set_work(struct work_struct *work)
  1966	{
  1967		struct apple_atcphy *atcphy = container_of(work, struct apple_atcphy, mux_set_work);
  1968	
  1969		mutex_lock(&atcphy->lock);
  1970		/*
  1971		 * If we're transitiong to TYPEC_STATE_SAFE dwc3 will have gotten
  1972		 * a usb-role-switch event to ROLE_NONE which is deferred to a work
  1973		 * queue. dwc3 will try to switch the pipehandler mux to USB2 and
  1974		 * we have to make sure that has happened before we disable ATCPHY.
  1975		 * If we instead disable ATCPHY first dwc3 will get stuck and the
  1976		 * port won't work anymore until a full SoC reset.
  1977		 * We're guaranteed that no other role switch event will be generated
  1978		 * before we return because the mux_set callback runs in the same
  1979		 * thread that generates these. We can thus unlock the mutex, wait
  1980		 * for dwc3_shutdown_event from the usb3 phy's power_off callback after
  1981		 * it has taken the mutex and the lock again.
  1982		 */
  1983		if (atcphy->dwc3_online && atcphy->target_mode == APPLE_ATCPHY_MODE_OFF) {
  1984			reinit_completion(&atcphy->dwc3_shutdown_event);
  1985			mutex_unlock(&atcphy->lock);
  1986			wait_for_completion_timeout(&atcphy->dwc3_shutdown_event,
  1987						    msecs_to_jiffies(1000));
  1988			mutex_lock(&atcphy->lock);
  1989			WARN_ON(atcphy->dwc3_online);
  1990		}
  1991	
  1992		switch (atcphy->target_mode) {
  1993		case APPLE_ATCPHY_MODE_DP:
  1994		case APPLE_ATCPHY_MODE_USB3_DP:
  1995		case APPLE_ATCPHY_MODE_USB3:
  1996		case APPLE_ATCPHY_MODE_USB4:
  1997			atcphy_cio_configure(atcphy, atcphy->target_mode);
  1998			break;
  1999		default:
  2000			dev_warn(atcphy->dev, "Unknown mode %d in atcphy_mux_set\n",
  2001				 atcphy->target_mode);
  2002			fallthrough;
  2003		case APPLE_ATCPHY_MODE_USB2:
  2004		case APPLE_ATCPHY_MODE_OFF:
  2005			atcphy->mode = APPLE_ATCPHY_MODE_OFF;
  2006			atcphy_disable_dp_aux(atcphy);
  2007			atcphy_cio_power_off(atcphy);
  2008		}
  2009	
  2010		complete(&atcphy->atcphy_online_event);
  2011		mutex_unlock(&atcphy->lock);
  2012	}
  2013	
  2014	static int atcphy_mux_set(struct typec_mux_dev *mux,
  2015				  struct typec_mux_state *state)
  2016	{
  2017		struct apple_atcphy *atcphy = typec_mux_get_drvdata(mux);
  2018	
  2019		// TODO: 
  2020		flush_work(&atcphy->mux_set_work);
  2021	
  2022		mutex_lock(&atcphy->lock);
  2023		trace_atcphy_mux_set(state);
  2024	
  2025		if (state->mode == TYPEC_STATE_SAFE) {
  2026			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
  2027		} else if (state->mode == TYPEC_STATE_USB) {
  2028			atcphy->target_mode = APPLE_ATCPHY_MODE_USB3;
  2029		} else if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
  2030			switch (state->mode) {
  2031			case TYPEC_DP_STATE_C:
  2032			case TYPEC_DP_STATE_E:
  2033				atcphy->target_mode = APPLE_ATCPHY_MODE_DP;
  2034				break;
  2035			case TYPEC_DP_STATE_D:
  2036				atcphy->target_mode = APPLE_ATCPHY_MODE_USB3_DP;
  2037				break;
  2038			default:
  2039				dev_err(atcphy->dev,
  2040					"Unsupported DP pin assignment: 0x%lx.\n",
  2041					state->mode);
  2042				atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
  2043			}
  2044		} else if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
  2045			dev_err(atcphy->dev, "USB4/TBT mode is not supported yet.\n");
  2046			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
  2047		} else if (state->alt) {
  2048			dev_err(atcphy->dev, "Unknown alternate mode SVID: 0x%x\n",
  2049				state->alt->svid);
  2050			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
  2051		} else {
  2052			dev_err(atcphy->dev, "Unknown mode: 0x%lx\n", state->mode);
  2053			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
  2054		}
  2055	
  2056		if (atcphy->mode != atcphy->target_mode)
  2057			WARN_ON(!schedule_work(&atcphy->mux_set_work));
  2058	
  2059		mutex_unlock(&atcphy->lock);
  2060	
  2061		return 0;
  2062	}
  2063	
  2064	static int atcphy_probe_mux(struct apple_atcphy *atcphy)
  2065	{
  2066		struct typec_mux_desc mux_desc = {
  2067			.drvdata = atcphy,
  2068			.fwnode = atcphy->dev->fwnode,
  2069			.set = atcphy_mux_set,
  2070		};
  2071	
  2072		return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
  2073	}
  2074	
  2075	static int atcphy_parse_legacy_tunable(struct apple_atcphy *atcphy,
  2076					       struct atcphy_tunable *tunable,
  2077					       const char *name)
  2078	{
  2079		struct property *prop;
  2080		const __le32 *p = NULL;
  2081		int i;
  2082	
  2083	#if 0
  2084		WARN_TAINT_ONCE(1, TAINT_FIRMWARE_WORKAROUND,
  2085				"parsing legacy tunable; please update m1n1");
  2086	#endif
  2087	
  2088		prop = of_find_property(atcphy->np, name, NULL);
  2089		if (!prop) {
  2090			dev_err(atcphy->dev, "tunable %s not found\n", name);
  2091			return -ENOENT;
  2092		}
  2093	
  2094		if (prop->length % (3 * sizeof(u32)))
  2095			return -EINVAL;
  2096	
  2097		tunable->sz = prop->length / (3 * sizeof(u32));
  2098		tunable->values = devm_kcalloc(atcphy->dev, tunable->sz,
  2099					       sizeof(*tunable->values), GFP_KERNEL);
  2100		if (!tunable->values)
  2101			return -ENOMEM;
  2102	
  2103		for (i = 0; i < tunable->sz; ++i) {
> 2104			p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
  2105			p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
  2106			p = of_prop_next_u32(prop, p, &tunable->values[i].value);
  2107		}
  2108	
  2109		trace_atcphy_parsed_tunable(name, tunable);
  2110	
  2111		return 0;
  2112	}
  2113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
