Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE07C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 00:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690505556; x=1722041556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6TDDIpK/6eGhakcq0q2KGpTUq5IhOZE35rsHiARiA0=;
  b=BsdWD4GJUdmPWTROc5hPG/4KMH1FS4eZGU7wQiAGqZQktZpAznhvDnyZ
   B4cqdroq7rzza0sQcOpCDUi/MSZr3j7+zRgJOBoe9FGPNzVpYZQEIp0ua
   qsO55jmHFZwJ7SjgKWgSJ3hGmWzMzF+WGtnx8QF38vOAKDKkF10DI1GWi
   1niQUstnVcKGloGuytMGtI83qfw7eCZaKjVMzZLrYnWcbM9oz7AzFrFcE
   zNADXZphu5KZQDp7MivD8eR5w2BFfE2EWO+KMUOdeQeWPSj1ISmhtdAG7
   rWzTg0R4vmhh2z75+YgVzItRr6INiQKWpveibGhyEs/pa0E3yVA0ShVyg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399409335"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="399409335"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870651201"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 17:52:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPBi7-0002jT-0o;
	Fri, 28 Jul 2023 00:52:33 +0000
Date: Fri, 28 Jul 2023 08:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 10/15]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202307280816.rY6C5dfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   924aefff015d104293101a46281fca901e2ccd3f
commit: f5cbf03cdd67d8c68765cde5f8de62feac0230de [10/15] PCIE: apple: Add T602x PCIe support
config: powerpc-randconfig-r013-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280816.rY6C5dfe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280816.rY6C5dfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280816.rY6C5dfe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/iopoll.h:14,
                    from drivers/pci/controller/pcie-apple.c:23:
   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_port_setup_irq':
>> drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     468 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^~~~~~~~~~
   arch/powerpc/include/asm/io.h:695:40: note: in definition of macro 'writel_relaxed'
     695 | #define writel_relaxed(v, addr) writel(v, addr)
         |                                        ^
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
https://github.com/intel/lkp-tests/wiki
