Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923C395D9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217320; cv=none; b=Vq3mCVCmpxHpKFjcxpyENsZg4IEE4flXgouGH1RVV+6NwSwpe7eDEPzYtEPWuOvlXHmFRtblP+k8daf5EvLfEqmno3uVYIfK/KtW2QrU6oq/pPpMTf5I6Rb8SsmHtcZu9o4a9EtFvA8U+R7JSLpKCmI+98rPcgt7feZ1EhVJ9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217320; c=relaxed/simple;
	bh=um6i+UNNWvehNxZuAdLfi94bhTpfbq6UpssAgnH8N84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RlAEUmv8qlY2xv9rQIJGptWcrdNeepHSOrZEvB0wte7RMx3+X8gPXea97b5wueO7dd2jmtGDoVmYo9rz97VGMIU17mA8hLt8vUhos1NmPSi5ohyFz0MqhJyraJXJZmbZ3F0z0A/UeNovrrutxKTKcL8ZeC+CEb6n6H8tNBZfDBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMIp68ac; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMIp68ac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772217318; x=1803753318;
  h=date:from:to:cc:subject:message-id;
  bh=um6i+UNNWvehNxZuAdLfi94bhTpfbq6UpssAgnH8N84=;
  b=RMIp68acTk3LzMAOpZZUNVBwwKNbpXWUIoqWUhbPrYGd9XHGm7Cg9HGd
   H41h7TForQ9zOAcAH5j4du5HkPFrwRPNiFrhLZoR0B/VCZgFuqEUar9/F
   K9TZ3PvnlIFIuaPydmfLhwYX3hjBvTQWHZ2COFm4IR0PFwSY62EmFbYpd
   oF9MrTisF7+X+xhocqb7cUaIf3/xgI2OPAXTa3wPO8Qt9MsdsqwtysL4a
   w0rhSgRp3DUpZF0FiiOzvHSbFbIla1noAYc4J4r5c0ffVT5EkT69qD9hb
   QYI2PHJ+6mVxwXFipYDZPMg4I319aUKzH/IRC8Cn7ok42F8k4xTbIApzb
   g==;
X-CSE-ConnectionGUID: /zs1a2ytT9OkzfwpmB1GJw==
X-CSE-MsgGUID: /cO9E4TwQ/eDdCpcuB1Rmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77147980"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77147980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 10:35:17 -0800
X-CSE-ConnectionGUID: 1g+QuNPaR0WmFCMC7NTW8A==
X-CSE-MsgGUID: fLQgxpIOSU+Rnl3S9c4ygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="244310162"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 10:35:16 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw2gD-00000000Avh-2I3r;
	Fri, 27 Feb 2026 18:35:13 +0000
Date: Sat, 28 Feb 2026 02:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:tegra264-pcie 3/14]
 drivers/pci/controller/pcie-tegra264.c:252:14: warning: assignment to 'struct
 tegra_bpmp *' from 'int' makes pointer from integer without a cast
Message-ID: <202602280215.aqBgv5xw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thierryreding/linux tegra264-pcie
head:   069190c04b3bd60de4804e75e86379734ea834b5
commit: 528472699bb868fe4e0f07fac9b4215d68a8594c [3/14] PCI: tegra: Add Tegra264 support
config: sparc64-randconfig-002-20260228 (https://download.01.org/0day-ci/archive/20260228/202602280215.aqBgv5xw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280215.aqBgv5xw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280215.aqBgv5xw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-tegra264.c: In function 'tegra264_pcie_probe':
   drivers/pci/controller/pcie-tegra264.c:252:16: error: implicit declaration of function 'tegra_bpmp_get_with_id'; did you mean 'tegra_bpmp_get'? [-Werror=implicit-function-declaration]
     252 |   pcie->bpmp = tegra_bpmp_get_with_id(dev, &pcie->ctl_id);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                tegra_bpmp_get
>> drivers/pci/controller/pcie-tegra264.c:252:14: warning: assignment to 'struct tegra_bpmp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     252 |   pcie->bpmp = tegra_bpmp_get_with_id(dev, &pcie->ctl_id);
         |              ^
   cc1: some warnings being treated as errors


vim +252 drivers/pci/controller/pcie-tegra264.c

   181	
   182	static int tegra264_pcie_probe(struct platform_device *pdev)
   183	{
   184		struct device *dev = &pdev->dev;
   185		struct pci_host_bridge *bridge;
   186		struct tegra264_pcie *pcie;
   187		struct resource_entry *bus;
   188		struct resource *res;
   189		int ret;
   190	
   191		bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct tegra264_pcie));
   192		if (!bridge) {
   193			dev_err(dev, "failed to allocate host bridge\n");
   194			return -ENOMEM;
   195		}
   196	
   197		pcie = pci_host_bridge_priv(bridge);
   198		platform_set_drvdata(pdev, pcie);
   199		pcie->bridge = bridge;
   200		pcie->dev = dev;
   201	
   202		ret = pinctrl_pm_select_default_state(dev);
   203		if (ret < 0) {
   204			dev_err(dev, "failed to configure sideband pins: %d\n", ret);
   205			return ret;
   206		}
   207	
   208		ret = tegra264_pcie_parse_dt(pcie);
   209		if (ret < 0)
   210			return dev_err_probe(dev, ret, "failed to parse device tree");
   211	
   212		pcie->xtl = devm_platform_ioremap_resource_byname(pdev, "xtl-pri");
   213		if (IS_ERR(pcie->xtl)) {
   214			ret = PTR_ERR(pcie->xtl);
   215			dev_err(dev, "failed to map xtl-pri memory: %d\n", ret);
   216			return ret;
   217		}
   218	
   219		bus = resource_list_first_type(&bridge->windows, IORESOURCE_BUS);
   220		if (!bus) {
   221			dev_err(dev, "failed to get bus resource\n");
   222			return -ENODEV;
   223		}
   224	
   225		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ecam");
   226		if (!res) {
   227			dev_err(dev, "failed to get ECAM resource\n");
   228			return -ENXIO;
   229		}
   230	
   231		pcie->icc_path = devm_of_icc_get(&pdev->dev, "write");
   232		if (IS_ERR(pcie->icc_path))
   233			return dev_err_probe(&pdev->dev, PTR_ERR(pcie->icc_path),
   234					     "failed to get ICC");
   235	
   236		pcie->cfg = pci_ecam_create(dev, res, bus->res, &pci_generic_ecam_ops);
   237		if (IS_ERR(pcie->cfg)) {
   238			ret = PTR_ERR(pcie->cfg);
   239			dev_err(dev, "failed to create ECAM: %d\n", ret);
   240			goto put;
   241		}
   242	
   243		bridge->ops = (struct pci_ops *)&pci_generic_ecam_ops.pci_ops;
   244		bridge->sysdata = pcie->cfg;
   245		pcie->ecam = pcie->cfg->win;
   246	
   247		/*
   248		 * Parse BPMP property only for silicon, as interaction with BPMP is
   249		 * not needed for other platforms.
   250		 */
   251		if (tegra_is_silicon()) {
 > 252			pcie->bpmp = tegra_bpmp_get_with_id(dev, &pcie->ctl_id);
   253			if (IS_ERR(pcie->bpmp)) {
   254				ret = PTR_ERR(pcie->bpmp);
   255				dev_err(dev, "failed to get BPMP: %d\n", ret);
   256				goto free;
   257			}
   258		}
   259	
   260		pm_runtime_enable(dev);
   261		pm_runtime_get_sync(dev);
   262	
   263		tegra264_pcie_init(pcie);
   264	
   265		if (pcie->link_state == false)
   266			goto put;
   267	
   268		ret = pci_host_probe(bridge);
   269		if (ret < 0) {
   270			dev_err(dev, "failed to register host: %d\n", ret);
   271			goto put_pm;
   272		}
   273	
   274		return ret;
   275	
   276	put_pm:
   277		pm_runtime_put_sync(dev);
   278		pm_runtime_disable(dev);
   279	put:
   280		if (tegra_is_silicon())
   281			tegra_bpmp_put(pcie->bpmp);
   282	free:
   283		pci_ecam_free(pcie->cfg);
   284		return ret;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
