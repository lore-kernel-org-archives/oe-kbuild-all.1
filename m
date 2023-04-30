Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC63207
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682874642; x=1714410642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSKRY084N+emGVI+w+UoyYuHKMEhEaacA5Yy7EC8vsE=;
  b=YLx0Fi6acEtL6iNBz8wfv0ntztoAqjPyUASrSbrGE3EMllVSXS8vp8sL
   z4sz73+rB1+9ZM1eBDlaM3IgRrK5Upl5QApJVPLJe63GVRUB1459o5meQ
   USOc8agodLmN81TlVbEnbcmZTPDcsQiV31ZIP0d1tFjE3YoNxpD93KOAf
   3xghLDc87FrG8ysmHVjST59rfT7EFKHsk9IdknzJ4gshJe87qt5k+K1Tf
   4FJGstvdbe8E2zYGDLV/xmrIeuCYcitNyTH07nQbFEKMKgHJaCkVd3h7t
   9Lc97zs4IOcZB9H1LJMF3CsYUtqz7E38nHDqn6wJpgaGhXcUJ7GwEsrqy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="332385870"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="332385870"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="1025382298"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="1025382298"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Apr 2023 10:10:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptAZM-00003r-2S;
	Sun, 30 Apr 2023 17:10:40 +0000
Date: Mon, 1 May 2023 01:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 10/11]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202305010147.SIbWV081-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   7582f4b9e2fb4dd4384fda101d7b47bfb5ff21fc
commit: f5cbf03cdd67d8c68765cde5f8de62feac0230de [10/11] PCIE: apple: Add T602x PCIe support
config: ia64-randconfig-r015-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010147.SIbWV081-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f5cbf03cdd67d8c68765cde5f8de62feac0230de
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/140-pci
        git checkout f5cbf03cdd67d8c68765cde5f8de62feac0230de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010147.SIbWV081-lkp@intel.com/

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
