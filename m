Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137F366DDD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216005; cv=none; b=NNr6raGEag5q0NWhx5qNmuBr7QBylb8oimwMPPosEMtktpkkopq8nWvoJ+/4/vN9bCI3atEO/g5mjJ5FDX01Ynz8U/eXXO47u68nDoppGJX6rXnYnzt3jcT4whM/iZme2sVRM86eFCXOTw6ez99xqoHTcZKhk146Q/gu/fdcmPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216005; c=relaxed/simple;
	bh=mP9lvGNll0jVJrIX3wAI29LKpAqoWYvScX/D3KilueY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPQsUZgAEHs/acfggQ+qqH1fYT6Rj9DG605rYaFq52+yWOfmEstJSi75vgN++25UkKKIjQZr9UN0ncn8nU5BrRX+R6ljIOnb+Vc4t6r16gU3ih5UQe9zLCi6P/dTu3RSjSzzy2wHlKCUkNTpyKiccw+EsltnNHZyQf1Cz7A5n6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y415UwH+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y415UwH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772216004; x=1803752004;
  h=date:from:to:cc:subject:message-id;
  bh=mP9lvGNll0jVJrIX3wAI29LKpAqoWYvScX/D3KilueY=;
  b=Y415UwH+fKA+mgTn9mLTk783aECuZB0iECWK0feCCyMKZR6XW66z63Ga
   PGP/UwIoF7k1lgyTnwWZZYj382A34SrW+/JVDlbm9h38yedvEIFb2aJ7M
   PXTBq7NAPvVm1xYp+onRsjU6cc0vH9LNv+Cf7KGgWXhz6m7tBywe/+qNI
   8JhNcqRmT1lVAaXKcy2YY/o3cidH1Bx7G22sSkjPbtcsUtVs5MA87qWwX
   lv4CCu1KYT3N3QhY4O9yrAERIP24BqZ8vASlY/jjL8BLT9CyRLSo4VhUw
   ibRgYwN/mj/u2LYAa4kqFF889TIYhsnf0o2A005lZ4VNxLPSoIPmcLoFe
   Q==;
X-CSE-ConnectionGUID: WyBArPdnRTCYbm6aM4WNvg==
X-CSE-MsgGUID: J89Mv1+dTo27QxLbGoxZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95924300"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="95924300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 10:13:24 -0800
X-CSE-ConnectionGUID: o60kTJ3bSGKsp/uIpFnxTQ==
X-CSE-MsgGUID: 4lvQABufSU6SbyFMBKM5Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216100104"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2026 10:13:22 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw2L1-00000000At3-47DE;
	Fri, 27 Feb 2026 18:13:19 +0000
Date: Sat, 28 Feb 2026 02:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:tegra264-pcie 13/14]
 drivers/pci/controller/pcie-tegra264.c:171:32: warning: left shift count >=
 width of type
Message-ID: <202602280225.AxmjuLvr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thierryreding/linux tegra264-pcie
head:   069190c04b3bd60de4804e75e86379734ea834b5
commit: ab00a73bda15095be5b828130c4ae4f3ed7e8947 [13/14] WIP: pcie: XAL debug
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260228/202602280225.AxmjuLvr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280225.AxmjuLvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280225.AxmjuLvr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-tegra264.c: In function 'tegra264_pcie_init':
>> drivers/pci/controller/pcie-tegra264.c:171:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     171 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:177:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     177 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:183:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     183 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:189:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     189 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:195:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     195 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:201:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     201 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c:207:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     207 |         phys = (phys_addr_t)hi << 32 | lo;
         |                                ^~
   drivers/pci/controller/pcie-tegra264.c: In function 'tegra264_pcie_probe':
   drivers/pci/controller/pcie-tegra264.c:328:30: error: implicit declaration of function 'tegra_bpmp_get_with_id'; did you mean 'tegra_bpmp_get'? [-Wimplicit-function-declaration]
     328 |                 pcie->bpmp = tegra_bpmp_get_with_id(dev, &pcie->ctl_id);
         |                              ^~~~~~~~~~~~~~~~~~~~~~
         |                              tegra_bpmp_get
   drivers/pci/controller/pcie-tegra264.c:328:28: error: assignment to 'struct tegra_bpmp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     328 |                 pcie->bpmp = tegra_bpmp_get_with_id(dev, &pcie->ctl_id);
         |                            ^


vim +171 drivers/pci/controller/pcie-tegra264.c

   161	
   162	static void tegra264_pcie_init(struct tegra264_pcie *pcie)
   163	{
   164		u32 value, hi, lo;
   165		phys_addr_t phys;
   166	
   167		dev_info(pcie->dev, "> %s()\n", __func__);
   168	
   169		hi = readl(pcie->xal + XAL_RC_ECAM_BASE_HI);
   170		lo = readl(pcie->xal + XAL_RC_ECAM_BASE_LO);
 > 171		phys = (phys_addr_t)hi << 32 | lo;
   172		dev_info(pcie->dev, "  ECAM:      %pap\n", &phys);
   173		msleep(100);
   174	
   175		hi = readl(pcie->xal + XAL_RC_IO_BASE_HI);
   176		lo = readl(pcie->xal + XAL_RC_IO_BASE_LO);
   177		phys = (phys_addr_t)hi << 32 | lo;
   178		dev_info(pcie->dev, "  IO:        %pap\n", &phys);
   179		msleep(100);
   180	
   181		hi = readl(pcie->xal + XAL_RC_IO_LIMIT_HI);
   182		lo = readl(pcie->xal + XAL_RC_IO_LIMIT_LO);
   183		phys = (phys_addr_t)hi << 32 | lo;
   184		dev_info(pcie->dev, "    limit:   %pap\n", &phys);
   185		msleep(100);
   186	
   187		hi = readl(pcie->xal + XAL_RC_MEM_32BIT_BASE_HI);
   188		lo = readl(pcie->xal + XAL_RC_MEM_32BIT_BASE_LO);
   189		phys = (phys_addr_t)hi << 32 | lo;
   190		dev_info(pcie->dev, "  MEM32:     %pap\n", &phys);
   191		msleep(100);
   192	
   193		hi = readl(pcie->xal + XAL_RC_MEM_32BIT_LIMIT_HI);
   194		lo = readl(pcie->xal + XAL_RC_MEM_32BIT_LIMIT_LO);
   195		phys = (phys_addr_t)hi << 32 | lo;
   196		dev_info(pcie->dev, "    limit:   %pap\n", &phys);
   197		msleep(100);
   198	
   199		hi = readl(pcie->xal + XAL_RC_MEM_64BIT_BASE_HI);
   200		lo = readl(pcie->xal + XAL_RC_MEM_64BIT_BASE_LO);
   201		phys = (phys_addr_t)hi << 32 | lo;
   202		dev_info(pcie->dev, "  MEM64:     %pap\n", &phys);
   203		msleep(100);
   204	
   205		hi = readl(pcie->xal + XAL_RC_MEM_64BIT_LIMIT_HI);
   206		lo = readl(pcie->xal + XAL_RC_MEM_64BIT_LIMIT_LO);
   207		phys = (phys_addr_t)hi << 32 | lo;
   208		dev_info(pcie->dev, "    limit:   %pap\n", &phys);
   209		msleep(100);
   210	
   211		if (!tegra_is_silicon()) {
   212			dev_info(pcie->dev,
   213				 "skipping link state for PCIe #%u in simulation\n",
   214				 pcie->ctl_id);
   215			pcie->link_state = true;
   216			return;
   217		}
   218	
   219		/* Poll every 10 msec for 1 sec to link up */
   220		readl_poll_timeout(pcie->ecam + XTL_RC_PCIE_CFG_LINK_CONTROL_STATUS,
   221			value, value & XTL_RC_PCIE_CFG_LINK_CONTROL_STATUS_DLL_ACTIVE,
   222			PCIE_LINK_UP_DELAY, PCIE_LINK_UP_TIMEOUT);
   223	
   224		if (value & XTL_RC_PCIE_CFG_LINK_CONTROL_STATUS_DLL_ACTIVE) {
   225			/* Per PCIe r5.0, 6.6.1 wait for 100ms after DLL up */
   226			msleep(100);
   227			dev_info(pcie->dev, "PCIe #%u link is up (speed: %d)\n",
   228				 pcie->ctl_id, (value & 0xf0000) >> 16);
   229			pcie->link_state = true;
   230			tegra264_pcie_icc_set(pcie);
   231		} else {
   232			dev_info(pcie->dev, "PCIe #%u link is down\n", pcie->ctl_id);
   233	
   234			value = readl(pcie->xtl + XTL_RC_MGMT_CLOCK_CONTROL);
   235	
   236			/** Set link state only when link fails and no hot-plug feature is present */
   237			if ((value & XTL_RC_MGMT_CLOCK_CONTROL_PEX_CLKREQ_I_N_PIN_USE_CONV_TO_PRSNT) == 0) {
   238				dev_info(pcie->dev,
   239					 "PCIe #%u link is down and not hotplug-capable, turning off\n",
   240					 pcie->ctl_id);
   241				tegra264_pcie_bpmp_set_rp_state(pcie);
   242				pcie->link_state = false;
   243			} else {
   244				pcie->link_state = true;
   245			}
   246		}
   247	
   248		dev_info(pcie->dev, "< %s()\n", __func__);
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
