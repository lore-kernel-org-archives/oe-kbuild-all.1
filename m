Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8219DF77
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244982; cv=none; b=hXeW1O+uabWUDhFZvhhZV6tDSYpMHjuG5Ljt1WpHHQnwHGx6eVa9+96ewOQa4XNbnjKmXi1NLZwX9Cha3xtMiXZ1uUS2uCj9ukGWsmtsqx0F6sdvDnpG9V52HsNvkA8ftuCO0k6f6Bgdib0Wk+nx/x/FC0Z+wYR21XLdwv0lH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244982; c=relaxed/simple;
	bh=7e7U1KbMQtputvIJAFu0ItZP6r/0pqVj1S99IL8+2Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6gnvl0tdySCoBVUaNxS4hu3BCEYOhwy2sE9J8RxwI1kE052BUr1NDA84X0sXeDnhJFXztT8fkI2cxBNYpuFAxSBBGw0fjwGoI+6rGMGFNkYs6ouFA8nxH2+NMcOxkIGBprDrIDY1D7p3iiewXtO54sI5qctYOWmH3BiyhUnXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0vEDJCE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0vEDJCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741244981; x=1772780981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7e7U1KbMQtputvIJAFu0ItZP6r/0pqVj1S99IL8+2Mc=;
  b=J0vEDJCElSxRDE/kTEVpPC+JVxYm+6Zr5gOC5Ly/TF2U20A43B6j+W/t
   KYWOV7OYkdI0BT+DHhPizKnRwKx/w6RdLmFkWRCSpLysZPf8f5xqAruPo
   rje88WvRfHZj2QiU0HRqXfJsORUd1T+9ehwSnLznBUmMBWcp7piMa0SXa
   bJTZ+h4/KdHPYe09yxaRHLjnKOe7vMNC7O5eERCfgb5IeGUN7BOkPNP8w
   03WyOcCuSlg80po5hDNWKv5KydDU9pMh0Furlwp69JQ9+Y5fhaWhkEf9e
   3fpCZTIB/H7b0xLCoRKEJyOnmLCPkLJq5fG+E/XefItRz4LnxJtJIz7R4
   g==;
X-CSE-ConnectionGUID: zSnl3MxEQQOskmOs3L1GaA==
X-CSE-MsgGUID: isQPYEsFSgCTgZQpFrvGQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42153964"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42153964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 23:09:40 -0800
X-CSE-ConnectionGUID: eyTv7P6JQ5ODyL4Xc3UnDg==
X-CSE-MsgGUID: +6OaCnq4Sni0GTTlH18gnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="118739831"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 23:09:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq5Lg-000Mgi-0X;
	Thu, 06 Mar 2025 07:08:53 +0000
Date: Thu, 6 Mar 2025 15:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 57/88]
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:464:29: warning: unused
 variable 'node'
Message-ID: <202503061509.sAnJT1zk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   321d82b640b78daba94d863283761c8fe95d17d7
commit: 505ebb6c678da81ddfd70e83f369ddcaca832d86 [57/88] drop irq_domain_add_linear
config: x86_64-buildonly-randconfig-001-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061509.sAnJT1zk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061509.sAnJT1zk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061509.sAnJT1zk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/mobiveil/pcie-mobiveil-host.c: In function 'mobiveil_pcie_init_irq_domain':
>> drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:464:29: warning: unused variable 'node' [-Wunused-variable]
     464 |         struct device_node *node = dev->of_node;
         |                             ^~~~


vim +/node +464 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c

1e913e58335fbc drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  460  
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  461  static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  462  {
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  463  	struct device *dev = &pcie->pdev->dev;
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30 @464  	struct device_node *node = dev->of_node;
1f442218d657b1 drivers/pci/controller/pcie-mobiveil.c               Hou Zhiqiang         2020-02-13  465  	struct mobiveil_root_port *rp = &pcie->rp;
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  466  
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  467  	/* setup INTx */
505ebb6c678da8 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c Jiri Slaby (SUSE     2025-02-28  468) 	rp->intx_domain = irq_domain_create_linear(of_fwnode_handle(node), PCI_NUM_INTX,
e369faf6255df5 drivers/pci/controller/pcie-mobiveil.c               Hou Zhiqiang         2019-07-05  469  						   &intx_domain_ops, pcie);
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  470  
1f442218d657b1 drivers/pci/controller/pcie-mobiveil.c               Hou Zhiqiang         2020-02-13  471  	if (!rp->intx_domain) {
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  472  		dev_err(dev, "Failed to get a INTx IRQ domain\n");
e0a7e56368a4a5 drivers/pci/controller/pcie-mobiveil.c               Hou Zhiqiang         2019-07-05  473  		return -ENOMEM;
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  474  	}
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  475  
1f442218d657b1 drivers/pci/controller/pcie-mobiveil.c               Hou Zhiqiang         2020-02-13  476  	raw_spin_lock_init(&rp->intx_mask_lock);
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  477  
1e913e58335fbc drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  478  	/* setup MSI */
df7fc05561126f drivers/pci/controller/mobiveil/pcie-mobiveil-host.c Liu Shixin           2020-09-21  479  	return mobiveil_allocate_msi_domains(pcie);
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  480  }
9af6bcb11e1217 drivers/pci/host/pcie-mobiveil.c                     Subrahmanya Lingappa 2018-05-30  481  

:::::: The code at line 464 was first introduced by commit
:::::: 9af6bcb11e121701509ce6a2d03fac5c694bd9fb PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver

:::::: TO: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
