Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637D5CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 21:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692998999; x=1724534999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lD01Gyc0bg0kjGhC5mp4RkAIQULNGRvHnvKMKG07ibw=;
  b=lb0sUd+pHt37VksvuBS4hO0rphfC2Sm1jM5Q9ydgISrWriF5chtR82De
   U5ly5P0xvGtSxpmF+j4ZXjDIZm+bBzfxwUs0aG/IlGZ3v2/Jm3cEL/Vjl
   ZztiMwgW9OnSdTNhiGkQymekHQ7LpKFYqGVKV6NJdOl/buJMENVwPA50s
   NUWLaR4+l+8X30bocXt/OP28KfhO5lKwjNRXGvAlmE230coy8721sfZs9
   leL1fJTLh+D12AowndxY8+C40QW8RJ8fMO7GiPNWaM/tYUpJpV4ZDqqEm
   tgw/ndWRCs4qJV4pKfOv+5irUyB0tSnlNXQdeh70oslphr6rRWcz64fI8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372207352"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372207352"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911405570"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="911405570"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 14:29:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZeNO-000415-1G;
	Fri, 25 Aug 2023 21:29:54 +0000
Date: Sat, 26 Aug 2023 05:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: [esmil:jh7110 77/80]
 drivers/pci/controller/plda/pcie-starfive.c:82:5: warning: no previous
 prototype for 'starfive_pcie_config_write'
Message-ID: <202308260504.hPPyOXSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7110
head:   6a2688d7878cc6ba3ca037cac91659a45c1f3c0e
commit: 8488a30a1e791dfc7ace565a53d033e43ffc2ec2 [77/80] PCI: starfive: Add JH7110 PCIe controller
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260504.hPPyOXSK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260504.hPPyOXSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260504.hPPyOXSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/plda/pcie-starfive.c:82:5: warning: no previous prototype for 'starfive_pcie_config_write' [-Wmissing-prototypes]
      82 | int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/plda/pcie-starfive.c:91:5: warning: no previous prototype for 'starfive_pcie_config_read' [-Wmissing-prototypes]
      91 | int starfive_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/plda/pcie-starfive.c:221:5: warning: no previous prototype for 'starfive_pcie_enable_phy' [-Wmissing-prototypes]
     221 | int starfive_pcie_enable_phy(struct device *dev, struct plda_pcie_rp *pcie)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/plda/pcie-starfive.c:252:6: warning: no previous prototype for 'starfive_pcie_disable_phy' [-Wmissing-prototypes]
     252 | void starfive_pcie_disable_phy(struct plda_pcie_rp *pcie)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/plda/pcie-starfive.c:435:32: warning: 'starfive_pcie_pm_ops' defined but not used [-Wunused-const-variable=]
     435 | static const struct dev_pm_ops starfive_pcie_pm_ops = {
         |                                ^~~~~~~~~~~~~~~~~~~~


vim +/starfive_pcie_config_write +82 drivers/pci/controller/plda/pcie-starfive.c

    81	
  > 82	int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
    83				       int where, int size, u32 value)
    84	{
    85		if (starfive_pcie_hide_rc_bar(bus, devfn, where))
    86			return PCIBIOS_BAD_REGISTER_NUMBER;
    87	
    88		return pci_generic_config_write(bus, devfn, where, size, value);
    89	}
    90	
  > 91	int starfive_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
    92				      int where, int size, u32 *value)
    93	{
    94		if (starfive_pcie_hide_rc_bar(bus, devfn, where))
    95			return PCIBIOS_BAD_REGISTER_NUMBER;
    96	
    97		return pci_generic_config_read(bus, devfn, where, size, value);
    98	}
    99	
   100	static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie, struct device *dev)
   101	{
   102		int pcie_id, stg_pcie_base;
   103	
   104		pcie->num_clks = devm_clk_bulk_get_all(dev, &pcie->clks);
   105		if (pcie->num_clks < 0)
   106			return dev_err_probe(dev, -ENODEV,
   107				"failed to get pcie clocks\n");
   108	
   109		pcie->resets = devm_reset_control_array_get_exclusive(dev);
   110		if (IS_ERR(pcie->resets))
   111			return dev_err_probe(dev, PTR_ERR(pcie->resets),
   112				"failed to get pcie resets");
   113	
   114		pcie->reg_syscon =
   115			syscon_regmap_lookup_by_phandle(dev->of_node,
   116							"starfive,stg-syscon");
   117	
   118		if (IS_ERR(pcie->reg_syscon))
   119			return dev_err_probe(dev, PTR_ERR(pcie->reg_syscon),
   120				"failed to parse starfive,stg-syscon\n");
   121	
   122		pcie_id = of_alias_get_id(dev->of_node, "pcie");
   123		if (pcie_id < 0 || pcie_id > 1)
   124			return dev_err_probe(dev, -ENODEV,
   125				"failed to get valid pcie id\n");
   126	
   127		if (pcie_id == 0)
   128			stg_pcie_base = STG_SYSCON_PCIE0_BASE;
   129		else
   130			stg_pcie_base = STG_SYSCON_PCIE1_BASE;
   131	
   132		pcie->stg_arfun = stg_pcie_base + STG_SYSCON_ARFUNC_OFFSET;
   133		pcie->stg_awfun = stg_pcie_base + STG_SYSCON_AWFUNC_OFFSET;
   134		pcie->stg_rp_nep = stg_pcie_base + STG_SYSCON_RP_NEP_OFFSET;
   135		pcie->stg_lnksta = stg_pcie_base + STG_SYSCON_LNKSTA_OFFSET;
   136	
   137		pcie->reset_gpio = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
   138		if (IS_ERR(pcie->reset_gpio)) {
   139			dev_warn(dev, "failed to get perst-gpio\n");
   140			return -EINVAL;
   141		}
   142	
   143		pcie->power_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
   144		if (IS_ERR(pcie->power_gpio)) {
   145			dev_warn(dev, "failed to get power-gpio\n");
   146			return -EINVAL;
   147		}
   148	
   149		return 0;
   150	}
   151	
   152	static struct pci_ops starfive_pcie_ops = {
   153		.map_bus	= plda_pcie_map_bus,
   154		.read           = starfive_pcie_config_read,
   155		.write          = starfive_pcie_config_write,
   156	};
   157	
   158	static int starfive_pcie_clk_rst_init(struct starfive_jh7110_pcie *pcie)
   159	{
   160		int ret;
   161		struct device *dev = pcie->plda.dev;
   162	
   163		ret = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
   164		if (ret) {
   165			dev_err(dev, "failed to enable clocks\n");
   166			return ret;
   167		}
   168	
   169		ret = reset_control_deassert(pcie->resets);
   170		if (ret) {
   171			clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
   172			dev_err(dev, "failed to resets\n");
   173		}
   174	
   175		return ret;
   176	}
   177	
   178	static void starfive_pcie_clk_rst_deinit(struct starfive_jh7110_pcie *pcie)
   179	{
   180		reset_control_assert(pcie->resets);
   181		clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
   182	}
   183	
   184	static bool starfive_pcie_link_up(struct plda_pcie_rp *plda)
   185	{
   186		struct starfive_jh7110_pcie *pcie =
   187			container_of(plda, struct starfive_jh7110_pcie, plda);
   188		struct device *dev = pcie->plda.dev;
   189		int ret;
   190		u32 stg_reg_val;
   191	
   192		ret = regmap_read(pcie->reg_syscon, pcie->stg_lnksta, &stg_reg_val);
   193		if (ret) {
   194			dev_err(dev, "failed to read link status\n");
   195			return false;
   196		}
   197	
   198		if (stg_reg_val & DATA_LINK_ACTIVE)
   199			return true;
   200	
   201		return false;
   202	}
   203	
   204	static int starfive_pcie_host_wait_for_link(struct starfive_jh7110_pcie *pcie)
   205	{
   206		struct device *dev = pcie->plda.dev;
   207		int retries;
   208	
   209		/* Check if the link is up or not */
   210		for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
   211			if (starfive_pcie_link_up(&pcie->plda)) {
   212				dev_info(dev, "port link up\n");
   213				return 0;
   214			}
   215			usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
   216		}
   217	
   218		return -ETIMEDOUT;
   219	}
   220	
 > 221	int starfive_pcie_enable_phy(struct device *dev, struct plda_pcie_rp *pcie)
   222	{
   223		int ret;
   224	
   225		if (!pcie->phy)
   226			return 0;
   227	
   228		ret = phy_init(pcie->phy);
   229		if (ret)
   230			return dev_err_probe(dev, ret,
   231				"failed to initialize pcie phy\n");
   232	
   233		ret = phy_set_mode(pcie->phy, PHY_MODE_PCIE);
   234		if (ret) {
   235			dev_err(dev, "failed to set pcie mode\n");
   236			goto err_phy_on;
   237		}
   238	
   239		ret = phy_power_on(pcie->phy);
   240		if (ret) {
   241			dev_err(dev, "failed to power on pcie phy\n");
   242			goto err_phy_on;
   243		}
   244	
   245		return 0;
   246	
   247	err_phy_on:
   248		phy_exit(pcie->phy);
   249		return ret;
   250	}
   251	
 > 252	void starfive_pcie_disable_phy(struct plda_pcie_rp *pcie)
   253	{
   254		phy_power_off(pcie->phy);
   255		phy_exit(pcie->phy);
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
