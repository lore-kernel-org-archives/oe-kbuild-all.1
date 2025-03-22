Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69042B9AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742615038; cv=none; b=NUldDeWdo86KZOA6qQtSdCcJpik45WRuciVJ4BB4Bjdfc8l7phipX0ar8GvtmeUNwOak1nxGJre+3YCcxTtyP5ef5CbCE4rblCNZ5h92wtrq5ZTVrYsKNzMl3N1uEpE3vItBeXg2+lQA780WYBOO8JGBCi/2D6vj4189Fzc8lXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742615038; c=relaxed/simple;
	bh=+Xm4tlSMtMO60gV3x8fi5XUT7H975ov/B5iwJWBR6wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5aZoblm1iMJdmpI0TTNYbmEI8MuYgtrvLMJPhMKwfpTSlbd0Z9y+ijEbQRclAwVf+4DSPu0VsmTgGHHulmcf5Lq20ux8rg3ZQ9z/WEpEJ0fef4KniFbE9QZ7FQcPLwNzm498gFjGRw7OGIQ4zz1bGiukGnkV0Tw3GoDB9Tc100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QId0zSAO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QId0zSAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742615037; x=1774151037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Xm4tlSMtMO60gV3x8fi5XUT7H975ov/B5iwJWBR6wo=;
  b=QId0zSAOcGFtM3n1TxFlLAdXs1VUt3FBNVWq85ApGt9IjSe4K4eGLozV
   OEhpjtyvyl87jGsY40sv+ixa5O6Udtr+FKy3be1j42bRpIAB+odRJoEAu
   8ZEQQwQJyTora001MuFhKEOWds65Evm2SgZLl55AgBasf/YbMPgfuQE91
   KXp1wf3pneUrgd/IqC3nwXy458urOlDgic847DhjvjNotFdCRQ8HgNDDE
   GITW5vVJSDRUqQAMb7FtsDHswuJ3fHy5JOvYahFmz+6LlT1x3S3skHbf7
   kqr57mnsQJADyOpODke/5pFy5odxg8C2GJeJ/HOPUmmdvUsTDRtTnlFMU
   g==;
X-CSE-ConnectionGUID: 09My1DeUQSmojt+jM9WYRw==
X-CSE-MsgGUID: 570HkV/+SuScQ5nnMR6YXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66352146"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66352146"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 20:43:56 -0700
X-CSE-ConnectionGUID: zrb3K/ueTo6o1R4CxBZKgQ==
X-CSE-MsgGUID: voPuKtqzQ4eQEFf0TYHb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123275185"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2025 20:43:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvpm4-0001uZ-12;
	Sat, 22 Mar 2025 03:43:52 +0000
Date: Sat, 22 Mar 2025 11:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [arm-platforms:arm64/tlbi-range-hacks 12/17]
 drivers/pci/controller/pcie-apple.c:460:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202503221117.9esJe5iq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git arm64/tlbi-range-hacks
head:   89a08aa9682594d44c11df1b6e168e38bdb7f0c3
commit: b2817638e680079b58e1bf67c6d9fa1d5f48b636 [12/17] PCI: apple: Add T602x PCIe support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20250322/202503221117.9esJe5iq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221117.9esJe5iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221117.9esJe5iq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_port_setup_irq':
>> drivers/pci/controller/pcie-apple.c:460:40: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     460 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^~~~~~~~~~


vim +/FIELD_PREP +460 drivers/pci/controller/pcie-apple.c

   423	
   424	static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
   425	{
   426		struct fwnode_handle *fwnode = &port->np->fwnode;
   427		struct apple_pcie *pcie = port->pcie;
   428		unsigned int irq;
   429		u32 val = 0;
   430	
   431		/* FIXME: consider moving each interrupt under each port */
   432		irq = irq_of_parse_and_map(to_of_node(dev_fwnode(port->pcie->dev)),
   433					   port->idx);
   434		if (!irq)
   435			return -ENXIO;
   436	
   437		port->domain = irq_domain_create_linear(fwnode, 32,
   438							&apple_port_irq_domain_ops,
   439							port);
   440		if (!port->domain)
   441			return -ENOMEM;
   442	
   443		/* Disable all interrupts */
   444		writel_relaxed(~0, port->base + PORT_INTMSK);
   445		writel_relaxed(~0, port->base + PORT_INTSTAT);
   446		writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
   447	
   448		irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
   449	
   450		/* Configure MSI base address */
   451		BUILD_BUG_ON(upper_32_bits(DOORBELL_ADDR));
   452		writel_relaxed(lower_32_bits(DOORBELL_ADDR),
   453			       port->base + pcie->hw->port_msiaddr);
   454		if (pcie->hw->port_msiaddr_hi)
   455			writel_relaxed(0, port->base + pcie->hw->port_msiaddr_hi);
   456	
   457		/* Enable MSIs, shared between all ports */
   458		if (pcie->hw->port_msimap) {
   459			for (int i = 0; i < pcie->nvecs; i++)
 > 460				writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
   461					       PORT_MSIMAP_ENABLE,
   462					       port->base + pcie->hw->port_msimap + 4 * i);
   463		} else {
   464			writel_relaxed(0, port->base + PORT_MSIBASE);
   465			val = ilog2(pcie->nvecs) << PORT_MSICFG_L2MSINUM_SHIFT;
   466		}
   467	
   468		writel_relaxed(val | PORT_MSICFG_EN, port->base + PORT_MSICFG);
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
