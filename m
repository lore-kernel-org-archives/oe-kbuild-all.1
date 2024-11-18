Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B6139D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 03:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731899347; cv=none; b=bYUzhRbMENGh2N/7kBRMLm1XPT3feirAGrF7DQTzfx2MMKRkgAD2qzJQsV0qsRSC+bYO9LBlxoejlcnz4X7Exj/yJUeWWk0KElsqzMBNp07L/sk5RVPfEnRCQ7WS0QX36PGONeZKrINuttV5YNiZIHnGkGf8/jCEPy2cc5Jlqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731899347; c=relaxed/simple;
	bh=SINaCOQVIzT292t1L5T5LRCaaF70cG4gAySzjUN4ZSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=St+wjNO2tX9QHWODyrnUzGbEi3OoeVJAPAPL4QLZwutzyjdHXqflK1pM5rsIdzK4j0cDUrYmaMZArlG+C3+S14gK2wlOPRio3tRDAJ1MZSYYXLPFJp9kI+nmNrke1qnGxv+Lfdr3NtjROOakMbsxr/0XtlDDmMRRZzkxt0vPS00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sx9HoLkW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sx9HoLkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731899345; x=1763435345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SINaCOQVIzT292t1L5T5LRCaaF70cG4gAySzjUN4ZSY=;
  b=Sx9HoLkWIcIGq6AIjfWjr5d+AI9tJ7OkLpLbBnjj3pEUZMX9KO0vitnR
   zty5StOVbxoqYECGgg1yvMP6MbSCkxSoe91eDP9jw5K6/Xp9hdedEm0wz
   CUJqHuUCyA8gk92AmMwVeROyfT2rLIEwHCyd9Kwn3Crrg0DkjpFpIx8fQ
   N/q/7kYiiTESZFQ9q+x6uSKZKEK1y6CNq4QfNd7ErFUV8fP97I6rI/Jy5
   FOlCN31E/aA7p8m5XJP+XIsHI5jB6nWJAQOtHJ3kL97Cz8eTMCPPIV1JM
   dFl4jlKjtWQ0PO/fRTXMIjpvZHkELrxHZf8deXpCDzfAoy/M8LW8DyN6W
   g==;
X-CSE-ConnectionGUID: cSDPslIITNy9pcZDBvih4Q==
X-CSE-MsgGUID: vzQF7mKhRPigg2HktSSfww==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31246705"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31246705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:09:04 -0800
X-CSE-ConnectionGUID: 76b9Xhu+Sn6KzH1T7kdB1g==
X-CSE-MsgGUID: gVMKujLDSxG8szhkM4ERtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="94025081"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 19:09:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCs8K-0002Ed-27;
	Mon, 18 Nov 2024 03:09:00 +0000
Date: Mon, 18 Nov 2024 11:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/140-pci 9/18]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202411181123.IYIayz2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   73bb6449a37320b5aceab5c4617e39c1530da64e
commit: 0b35e060bbac4d17e2f6cf63ed39675f350de4fb [9/18] PCIE: apple: Add T602x PCIe support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181123.IYIayz2e-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181123.IYIayz2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181123.IYIayz2e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_port_setup_irq':
>> drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     468 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^~~~~~~~~~


vim +/FIELD_PREP +468 drivers/pci/controller/pcie-apple.c

   430	
   431	static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
   432	{
   433		struct fwnode_handle *fwnode = &port->np->fwnode;
   434		struct apple_pcie *pcie = port->pcie;
   435		unsigned int irq;
   436	
   437		/* FIXME: consider moving each interrupt under each port */
   438		irq = irq_of_parse_and_map(to_of_node(dev_fwnode(port->pcie->dev)),
   439					   port->idx);
   440		if (!irq)
   441			return -ENXIO;
   442	
   443		port->domain = irq_domain_create_linear(fwnode, 32,
   444							&apple_port_irq_domain_ops,
   445							port);
   446		if (!port->domain)
   447			return -ENOMEM;
   448	
   449		/* Disable all interrupts */
   450		writel_relaxed(~0, port->base + PORT_INTMSK);
   451		writel_relaxed(~0, port->base + PORT_INTSTAT);
   452		writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
   453	
   454		irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
   455	
   456		/* Configure MSI base address */
   457		BUG_ON(upper_32_bits(DOORBELL_ADDR));
   458		writel_relaxed(lower_32_bits(DOORBELL_ADDR),
   459			       port->base + pcie->hw->port_msiaddr);
   460		if (pcie->hw->port_msiaddr_hi)
   461			writel_relaxed(0, port->base + pcie->hw->port_msiaddr_hi);
   462	
   463		/* Enable MSIs, shared between all ports */
   464		if (pcie->hw->port_msimap) {
   465			int i;
   466	
   467			for (i = 0; i < pcie->nvecs; i++) {
 > 468				writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
   469					       PORT_MSIMAP_ENABLE,
   470					       port->base + pcie->hw->port_msimap + 4 * i);
   471			}
   472	
   473			writel_relaxed(PORT_MSICFG_EN, port->base + PORT_MSICFG);
   474		} else {
   475			writel_relaxed(0, port->base + PORT_MSIBASE);
   476			writel_relaxed((ilog2(pcie->nvecs) << PORT_MSICFG_L2MSINUM_SHIFT) |
   477				PORT_MSICFG_EN, port->base + PORT_MSICFG);
   478		}
   479	
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
