Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6418BE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 23:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690327482; x=1721863482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRjdqVCpiC95LYlQktQOEiyKOp9rGRxAwApcsaoJ16c=;
  b=LiFsHIicJZW/ek5VdPEwRzKGFNHCzSyqOGH85DOqH+mVAa5m0MUVAt+l
   gXlh6koKbz9Ircr2YhjrCKifwG1/SnabAtlV9NVJncQz3R9c77htmTCGq
   6ZmK/xIf1s2MkmTD5JgAcvPtkbwoZau3KGmSIGnQqVex1KyAgbtflL92Z
   60XXYvWhN0zT2W+hXEuljcpBA5n0GU6oBppq4iMbMEiIi2NmCK+8sJqgk
   8A3Vb5fo2paIlbBdbmpDaOFAuxbwwuOIMt1dZhtqGYLrTNiJA59wVZxKI
   x8CrvFN1VY+sWu3KTQ97PyZS0DZP0DoEarTKrb0s+uQhLGnuvrDLM4eBx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371476283"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371476283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 16:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726271866"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="726271866"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 16:24:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOROR-0000QT-1y;
	Tue, 25 Jul 2023 23:24:39 +0000
Date: Wed, 26 Jul 2023 07:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 6/13]
 drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous
 prototype for 'ks_pcie_irq_eoi'
Message-ID: <202307260715.N08IttNu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6f3ee6fcd1f316038e9cb9505c72a15b019f3c7d
commit: 6aed116cd98bebc49ae9b7b6df299ca7a4da91f8 [6/13] PCI: keystone: Convert to using hierarchy domain for legacy interrupts
config: arm64-randconfig-r013-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260715.N08IttNu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260715.N08IttNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260715.N08IttNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous prototype for 'ks_pcie_irq_eoi' [-Wmissing-prototypes]
     292 | void ks_pcie_irq_eoi(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:301:6: warning: no previous prototype for 'ks_pcie_irq_enable' [-Wmissing-prototypes]
     301 | void ks_pcie_irq_enable(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:310:6: warning: no previous prototype for 'ks_pcie_irq_disable' [-Wmissing-prototypes]
     310 | void ks_pcie_irq_disable(struct irq_data *data)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/ks_pcie_irq_eoi +292 drivers/pci/controller/dwc/pci-keystone.c

   291	
 > 292	void ks_pcie_irq_eoi(struct irq_data *data)
   293	{
   294		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   295		irq_hw_number_t hwirq = data->hwirq;
   296	
   297		ks_pcie_app_writel(ks_pcie, IRQ_EOI, hwirq);
   298		irq_chip_eoi_parent(data);
   299	}
   300	
 > 301	void ks_pcie_irq_enable(struct irq_data *data)
   302	{
   303		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   304		irq_hw_number_t hwirq = data->hwirq;
   305	
   306		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_SET(hwirq), INTx_EN);
   307		irq_chip_enable_parent(data);
   308	}
   309	
 > 310	void ks_pcie_irq_disable(struct irq_data *data)
   311	{
   312		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   313		irq_hw_number_t hwirq = data->hwirq;
   314	
   315		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_CLR(hwirq), INTx_EN);
   316		irq_chip_disable_parent(data);
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
