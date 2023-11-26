Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CF8D26E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frvxUPZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701017308; x=1732553308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LS08hU2mINbDq9V5/tdVP8JlRk1VBbU5jsMOKwMC58A=;
  b=frvxUPZvEkyYqBF5BW4plzfI4sTa6enby00oNN+J6H7omXFUDxVQv8D7
   EQNey9CV410aeCxOutF+5IADPBFWx9QndqU29dYRJmpSeWgG3uuq4F1jL
   bNUHFQ91jYlkptKhWJmCIl+xqtpLMyiOaeQXI9Zv1UkuPpPfO4kuyAqIv
   ROSRUnr25LcOqOb/N4kjGzUPg6QjvV0fTeqkbXTNNKgWncL3hc8Z2s2Y6
   5uEEEL7J/5knKmjwA7TbijfP0fIWq3LVCtlyWnq6pMvw287LZE097Huzy
   Y+V7uecVVttERPm/pKUT+zzWlK6m+EggQW2iBSkeWPFZCVjaRSW0rhTog
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14142676"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="14142676"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:48:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761406422"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="761406422"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Nov 2023 08:48:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7IIw-0005Jp-2r;
	Sun, 26 Nov 2023 16:48:22 +0000
Date: Mon, 27 Nov 2023 00:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 4/64]
 drivers/pci/controller/dwc/pci-keystone.c:292:6: sparse: sparse: symbol
 'ks_pcie_irq_eoi' was not declared. Should it be static?
Message-ID: <202311262318.Gbf4OPXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   07cbd0efc06ffff69b2b0c3d7d607b35829340c3
commit: 6aed116cd98bebc49ae9b7b6df299ca7a4da91f8 [4/64] PCI: keystone: Convert to using hierarchy domain for legacy interrupts
config: alpha-randconfig-r121-20231126 (https://download.01.org/0day-ci/archive/20231126/202311262318.Gbf4OPXP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311262318.Gbf4OPXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311262318.Gbf4OPXP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pci-keystone.c:292:6: sparse: sparse: symbol 'ks_pcie_irq_eoi' was not declared. Should it be static?
>> drivers/pci/controller/dwc/pci-keystone.c:301:6: sparse: sparse: symbol 'ks_pcie_irq_enable' was not declared. Should it be static?
>> drivers/pci/controller/dwc/pci-keystone.c:310:6: sparse: sparse: symbol 'ks_pcie_irq_disable' was not declared. Should it be static?

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
