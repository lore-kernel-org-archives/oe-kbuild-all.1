Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B92E3372
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608310; cv=none; b=osOM2ZLc5D8+94QfiXR5DTUUfkAjPSQOv1wwFZ0xnu/OT5nJa5jhyOkjQ5tBzuzpsPQH5myPY2ePnK033k4VA0DpwKGyPpLJI9o4B39wg+mvm0I3TS0OiDzvNTBc31n5LfPKJYyLqv6tXY3Id6iAK2UAKYam83/oXS51h+u2tnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608310; c=relaxed/simple;
	bh=+/ghdSQ5sDfDEzexRkOA0bMOBuzY+i5IQhje7V5jj2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSlhWZdn+hSoo2tw8dTdijUhFzz53JIfy8GnDX3I/7cc9GRdMSea5MdIQoN1u7gzKFCNZMVvVmNoCB+q3sJ2PZHQFl4aqiWiwDRsZR3qf/2h7oPfd8JzGqFYvxYWJtgar09O545DW42abT38gABZFECpBMv9uV+bjEZsE/hVlkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbiKR2YB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbiKR2YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743608309; x=1775144309;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+/ghdSQ5sDfDEzexRkOA0bMOBuzY+i5IQhje7V5jj2M=;
  b=HbiKR2YBxZkRnCP4Bwh+IW+tDVaIzq8O1wEjKWnT1zOPgOVovp/VzLDf
   +dG4nOkkvA9Qh4mthONYs0uFVbO5ae29KMOjwH3/6Pi+64IlseQQgoUMn
   8JKnjFve5IKYGsX4BRZZdJTVsPgDvt4ijkK4r8CM4sZKOR1XlpHr91tYo
   FciZU32d/cSYDSoeSpp1RwIpTmQQ0fzm6eZxdQZ3tLBvfBHmUrZpn1sQu
   3wsXTOEzDJZbHMVrCTXPXAi4T+wXSnqQ8m9L1PclTt/l+xkYqhX5rKaeD
   1L+7iywPqPN/jxs6jXSxV7nPTI2jUSSXYGlALQ5v2CmQHet1sGw0k3gpM
   Q==;
X-CSE-ConnectionGUID: BrdsbNjnTLO77LJiediu+Q==
X-CSE-MsgGUID: ptxadAI3QUutmETJCZ/gEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70347137"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="70347137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 08:38:28 -0700
X-CSE-ConnectionGUID: nxYbH+fMSxWK4Mfir6TFSw==
X-CSE-MsgGUID: vIG13NZFRdyFHTj5E+95Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="131857489"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2025 08:38:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u00Aa-000Aqq-2Z;
	Wed, 02 Apr 2025 15:38:24 +0000
Date: Wed, 2 Apr 2025 23:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 40/75]
 drivers/pci/controller/dwc/pcie-amd-mdb.c:293:19: warning: assignment makes
 pointer from integer without a cast
Message-ID: <202504022334.fRQPXO1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   7d77c8dc7c794e0a773d0ccd0f1df3d5b8128f9e
commit: b29b100bb8a7529c896d630fdde4c77a87d3e584 [40/75] irqdomain: Drop irq_domain_add_*() functions
config: arm64-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022334.fRQPXO1O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022334.fRQPXO1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022334.fRQPXO1O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-amd-mdb.c: In function 'amd_mdb_pcie_init_irq_domains':
   drivers/pci/controller/dwc/pcie-amd-mdb.c:293:21: error: implicit declaration of function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'? [-Werror=implicit-function-declaration]
     pcie->mdb_domain = irq_domain_add_linear(pcie_intc_node, 32,
                        ^~~~~~~~~~~~~~~~~~~~~
                        irq_domain_create_linear
>> drivers/pci/controller/dwc/pcie-amd-mdb.c:293:19: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     pcie->mdb_domain = irq_domain_add_linear(pcie_intc_node, 32,
                      ^
   drivers/pci/controller/dwc/pcie-amd-mdb.c:303:20: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     pcie->intx_domain = irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
                       ^
   cc1: some warnings being treated as errors


vim +293 drivers/pci/controller/dwc/pcie-amd-mdb.c

5f3de23d858edf Thippeswamy Havalige 2025-02-28  269  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  270  /**
5f3de23d858edf Thippeswamy Havalige 2025-02-28  271   * amd_mdb_pcie_init_irq_domains - Initialize IRQ domain
5f3de23d858edf Thippeswamy Havalige 2025-02-28  272   * @pcie: PCIe port information
5f3de23d858edf Thippeswamy Havalige 2025-02-28  273   * @pdev: Platform device
5f3de23d858edf Thippeswamy Havalige 2025-02-28  274   *
5f3de23d858edf Thippeswamy Havalige 2025-02-28  275   * Return: Returns '0' on success and error value on failure.
5f3de23d858edf Thippeswamy Havalige 2025-02-28  276   */
5f3de23d858edf Thippeswamy Havalige 2025-02-28  277  static int amd_mdb_pcie_init_irq_domains(struct amd_mdb_pcie *pcie,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  278  					 struct platform_device *pdev)
5f3de23d858edf Thippeswamy Havalige 2025-02-28  279  {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  280  	struct dw_pcie *pci = &pcie->pci;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  281  	struct dw_pcie_rp *pp = &pci->pp;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  282  	struct device *dev = &pdev->dev;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  283  	struct device_node *node = dev->of_node;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  284  	struct device_node *pcie_intc_node;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  285  	int err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  286  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  287  	pcie_intc_node = of_get_next_child(node, NULL);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  288  	if (!pcie_intc_node) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  289  		dev_err(dev, "No PCIe Intc node found\n");
5f3de23d858edf Thippeswamy Havalige 2025-02-28  290  		return -ENODEV;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  291  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  292  
5f3de23d858edf Thippeswamy Havalige 2025-02-28 @293  	pcie->mdb_domain = irq_domain_add_linear(pcie_intc_node, 32,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  294  						 &event_domain_ops, pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  295  	if (!pcie->mdb_domain) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  296  		err = -ENOMEM;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  297  		dev_err(dev, "Failed to add MDB domain\n");
5f3de23d858edf Thippeswamy Havalige 2025-02-28  298  		goto out;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  299  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  300  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  301  	irq_domain_update_bus_token(pcie->mdb_domain, DOMAIN_BUS_NEXUS);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  302  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  303  	pcie->intx_domain = irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  304  						  &amd_intx_domain_ops, pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  305  	if (!pcie->intx_domain) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  306  		err = -ENOMEM;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  307  		dev_err(dev, "Failed to add INTx domain\n");
5f3de23d858edf Thippeswamy Havalige 2025-02-28  308  		goto mdb_out;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  309  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  310  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  311  	of_node_put(pcie_intc_node);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  312  	irq_domain_update_bus_token(pcie->intx_domain, DOMAIN_BUS_WIRED);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  313  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  314  	raw_spin_lock_init(&pp->lock);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  315  
5f3de23d858edf Thippeswamy Havalige 2025-02-28  316  	return 0;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  317  mdb_out:
5f3de23d858edf Thippeswamy Havalige 2025-02-28  318  	amd_mdb_pcie_free_irq_domains(pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  319  out:
5f3de23d858edf Thippeswamy Havalige 2025-02-28  320  	of_node_put(pcie_intc_node);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  321  	return err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  322  }
5f3de23d858edf Thippeswamy Havalige 2025-02-28  323  

:::::: The code at line 293 was first introduced by commit
:::::: 5f3de23d858edf5df89c397678ba492b96646df4 PCI: amd-mdb: Add AMD MDB Root Port driver

:::::: TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
:::::: CC: Krzysztof Wilczyński <kwilczynski@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
