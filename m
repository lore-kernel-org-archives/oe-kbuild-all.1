Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE60430F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIZnEjmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697580038; x=1729116038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDDNFfFJ6wl7ZsDmG++0eUUqkRuBz3G5Ku9xK09UmIg=;
  b=EIZnEjmhLjrc4QHu6bfvb3HvnJxYZrsvS2jHMiVHho527gfFy2JYcvdf
   oBVjHQmsWBWek6+KDuMcMRAI+J5Mc7moJ4A/2yu3nbnQ+ZGj5ikWVI4bo
   dLekrSWE2eztk4NSurarXTwDCfbQJE/2MeqaGv/XooA8Q0Omqttxv/zfK
   D5Ij410TcLvX7rumppZfanT5C2IklJgjGVT4eUS2DA6RejpK8/bYrUpNq
   WIezRZ8vLe+v5MGwB4Kl5WtB4GNTHNGXIH8lhxesgRA1/7Boj4UwEGgLH
   3YtlMO2uVoR4bzlSRuh+VQDXDIIH3gaRrd+hApDM3HVofmacE9XB1QJL8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370951231"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="370951231"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 15:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826620464"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="826620464"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2023 15:00:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qss77-000A8R-02;
	Tue, 17 Oct 2023 22:00:33 +0000
Date: Wed, 18 Oct 2023 06:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 4/64]
 drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous
 declaration for 'ks_pcie_irq_eoi'
Message-ID: <202310180542.8tUmvP1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   935755bd826501606ac1e109d26cd5931a59145d
commit: 6aed116cd98bebc49ae9b7b6df299ca7a4da91f8 [4/64] PCI: keystone: Convert to using hierarchy domain for legacy interrupts
config: x86_64-buildonly-randconfig-006-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180542.8tUmvP1J-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180542.8tUmvP1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180542.8tUmvP1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-keystone.c:292:6: warning: no previous declaration for 'ks_pcie_irq_eoi' [-Wmissing-declarations]
    void ks_pcie_irq_eoi(struct irq_data *data)
         ^~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:301:6: warning: no previous declaration for 'ks_pcie_irq_enable' [-Wmissing-declarations]
    void ks_pcie_irq_enable(struct irq_data *data)
         ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-keystone.c:310:6: warning: no previous declaration for 'ks_pcie_irq_disable' [-Wmissing-declarations]
    void ks_pcie_irq_disable(struct irq_data *data)
         ^~~~~~~~~~~~~~~~~~~


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
