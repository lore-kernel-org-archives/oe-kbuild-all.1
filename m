Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78B7E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681656792; x=1713192792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jnum7q1PdRCzaLTK64TF0wHJBCrtNsck4JaJqKSKrjM=;
  b=ZH85c8BvdnVbTXZc7nUALJ/mYAPq+ASpYxSOy1D1zpyRQZQQggUndms2
   BKwHEDAyuOo3L9Zvpw5V93BgSVn01J2raQc3Hpby/L5UiclssMnrPyeko
   TlgX2pfPgVBZm/uGKXWMg9OWpFYyhwe4fHhA9I72/TXEk/uG7HruB4sPJ
   JoyzsAG+RrqBnFJPeSbZhVlNdISCBICE+jDxTEBjEtzsu5WspttqFCE52
   dMg+0A/NQ/+FYSK4IOKmShh4VeusMaohvPpXS/mERif2bFsRdGtp2dxCw
   ElXbpMj/msc+87PYYQODlYWPcgFhYE+eeHRNj3m/n32JIQ7Zqs8SbZVdP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="409949293"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="409949293"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 07:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="690388345"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="690388345"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Apr 2023 07:53:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po3kb-000bip-1v;
	Sun, 16 Apr 2023 14:53:09 +0000
Date: Sun, 16 Apr 2023 22:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:t602x/bringup 127/152]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202304162210.Di7pzD2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux t602x/bringup
head:   ea40aa13292f59a90688955bee581dbc3037fdd0
commit: 33680a713291ebc4d379818d65af88b0b47ea6dc [127/152] PCIE: apple: Add T602x PCIe support
config: csky-randconfig-r012-20230416 (https://download.01.org/0day-ci/archive/20230416/202304162210.Di7pzD2w-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/33680a713291ebc4d379818d65af88b0b47ea6dc
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux t602x/bringup
        git checkout 33680a713291ebc4d379818d65af88b0b47ea6dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162210.Di7pzD2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_port_setup_irq':
>> drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     468 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


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
https://github.com/intel/lkp-tests
