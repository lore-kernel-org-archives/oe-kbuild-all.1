Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972D82488
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140551; cv=none; b=R9q0tERq4sXYFiVenyhqcKAIaCJPTzMC+pWSmZYoSqiZCzZjHe8BqRZ+UF4GqL7n3cKDwW0Qu32NV2elGtScQgfufM+NKmEhFLMol99Z8npdZRn4Kj3UvxHNQ4wZ3dTdXTEMhaAu1Ol1B4p2/UP2dHggfwOERP2iAQQAvemIrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140551; c=relaxed/simple;
	bh=QdJB9or4kik4snnsLsx+b7sB6Rx32ZwDt3kYCuwo6rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZJPc1+62ZUa9VF0g/vMNhcxpNPHRzVfGNyxK2Q1thhu+ielN939GA2qpSPoalhzFzUPx0RNwYI2lRv0kOAHb8UXnLjO+KYgwUwsroaiFWbS8NEKHZpmojusykBbMBmP6A/u0YAXTlqncxj57wHgnGe8046P52+2RtZSe+4UavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acoivhdQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acoivhdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739140550; x=1770676550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdJB9or4kik4snnsLsx+b7sB6Rx32ZwDt3kYCuwo6rM=;
  b=acoivhdQmRxbbHCjdhmqqj9BOb6lc/TTg8SCUoLgMYeKy7PA/KENIRfU
   f3sNLQpYyltwu3oBzl/BrcIWWPwSuSorXB2e7+bjlK8OyUzWoey9H5rkV
   ISpCT2Xd8R6YZvhdAFq7mLO3rAogkYXIotxH33aDpAZxAcneHuzkwYuXj
   qzId48z4qRhjOVTNPf80GwBMLdt48iEW/icN579mK2gsKbnNFZYLNxAcx
   kJ1lWWguHLnyqYC6FvvFBN80yaIQ95BT2qdP+XmEke2rdTSMs5b5Q0rqg
   3ZrIf+gDgjW6YpGCh0HP7vq56PkneLbV+zvbNBPzQaoMVuQX/S43IxYRw
   g==;
X-CSE-ConnectionGUID: +vPam0TAS6eZIb8eg1uo4Q==
X-CSE-MsgGUID: aZ6bA9IdSyOtjEbx4llyAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51105787"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="51105787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 14:35:50 -0800
X-CSE-ConnectionGUID: d6NizXqpTw2h0rNoSnk/Kg==
X-CSE-MsgGUID: ZJ7K3KRsT220wJrn9k5RtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149217694"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Feb 2025 14:35:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thFtx-0011zR-1T;
	Sun, 09 Feb 2025 22:35:45 +0000
Date: Mon, 10 Feb 2025 06:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/140-pci 10/17]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202502100615.C6Rxlr9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   9d296b7e379a016dc51fbbede6723d5cfcd2668f
commit: e48287a66bda144eb101e5550e7fbd17f6c128de [10/17] PCIE: apple: Add T602x PCIe support
config: sparc64-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250210/202502100615.C6Rxlr9K-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100615.C6Rxlr9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100615.C6Rxlr9K-lkp@intel.com/

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
