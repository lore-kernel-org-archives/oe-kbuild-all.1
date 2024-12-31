Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD819BBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735658177; cv=none; b=MOzqC8Q5xTP/LrsTiPCCowfNEGTr7680LHMAtTN/RdbDvHXtKO1OnOXY6lwpjmhOCcMitcpG/G8uKJVyL69VtejCpwIabHrcV1gxdbe8JEBpCto+mEyqpIHmF7S5u+pAezW6HrjP6HTNWp8Gx6wg6XN02WeGa9wPjHcGX1xKtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735658177; c=relaxed/simple;
	bh=KvhF2S6lSq+O8dv4B/dJTFEQ0K9a94DdUAH0K1ugvYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbJdoSA6dvTdgg1nFVQoKx1rR2dJR43Ox0P1sigrf/XcS0g2WoM3ML+O/gRezTuCKFWtEpD+Xl1jjYLUVdnGhE7Bcph+jP8Wp5JPGk3vOCLxB/kwKDcNTazNPJcw82tc8WmXi+5ydlB1K6spJjNDRyIhbNOYxx2Kxa2iRJ3y55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crOnKb5v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crOnKb5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735658174; x=1767194174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KvhF2S6lSq+O8dv4B/dJTFEQ0K9a94DdUAH0K1ugvYA=;
  b=crOnKb5vN5ZxhNxOTqn0DNMZ8N9ycAmd9eviJaNfyOulE18eBI8H6RZM
   ZMv5jj3yC6dMfH4Bdh5o+JZM4OSzZvilaRs+cp91izwlPyq9rBpDi7e5M
   3egA9ibIYRYBXnmfkaINxNeHVZAFFh1x1HRGAbW+TiurZVZE3N1F595pr
   WpxtkjJtRS7fcv5Osnu/vGkAPmETUMnHE5JbbbA+285ITc5Ys9dO4H78P
   whYgG4mD/FpNJZtxKtd05EjVRzgE0Yr1aaNjn+UYtpHkhNI3xm6sLYeIV
   C0uH90jnpoS4vN9RD1MKwBUZNyUmbxJA+c5uUnP+mikQ0Zn6ZzqGCNY8l
   A==;
X-CSE-ConnectionGUID: 5dDr0MlARfC8fzRHptTjmg==
X-CSE-MsgGUID: hiPWgHIsQ26ij0ikpGc5GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35187806"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="35187806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 07:16:13 -0800
X-CSE-ConnectionGUID: j2JvMkXqS3+dzA8v8bT80A==
X-CSE-MsgGUID: xU87LkTzRy24HnTecXQH+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="100833926"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Dec 2024 07:16:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSdyb-0007CN-1Q;
	Tue, 31 Dec 2024 15:16:09 +0000
Date: Tue, 31 Dec 2024 23:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: drivers/pci/controller/dwc/pcie-dw-rockchip.c:454:2-9: line 454 is
 redundant because platform_get_irq() already prints an error
Message-ID: <202412312343.najrW1Db-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 84e30b878aed9353d74904d72cba9f968ae5675b PCI: dw-rockchip: Use pci_epc_init_notify() directly
date:   6 months ago
config: alpha-randconfig-r054-20241231 (https://download.01.org/0day-ci/archive/20241231/202412312343.najrW1Db-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412312343.najrW1Db-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-dw-rockchip.c:454:2-9: line 454 is redundant because platform_get_irq() already prints an error

vim +454 drivers/pci/controller/dwc/pcie-dw-rockchip.c

49a0925d173324 Niklas Cassel 2024-06-07  441  
e242f26f6320e3 Niklas Cassel 2024-06-07  442  static int rockchip_pcie_configure_ep(struct platform_device *pdev,
e242f26f6320e3 Niklas Cassel 2024-06-07  443  				      struct rockchip_pcie *rockchip)
e242f26f6320e3 Niklas Cassel 2024-06-07  444  {
e242f26f6320e3 Niklas Cassel 2024-06-07  445  	struct device *dev = &pdev->dev;
e242f26f6320e3 Niklas Cassel 2024-06-07  446  	int irq, ret;
e242f26f6320e3 Niklas Cassel 2024-06-07  447  	u32 val;
e242f26f6320e3 Niklas Cassel 2024-06-07  448  
e242f26f6320e3 Niklas Cassel 2024-06-07  449  	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_EP))
e242f26f6320e3 Niklas Cassel 2024-06-07  450  		return -ENODEV;
e242f26f6320e3 Niklas Cassel 2024-06-07  451  
e242f26f6320e3 Niklas Cassel 2024-06-07  452  	irq = platform_get_irq_byname(pdev, "sys");
e242f26f6320e3 Niklas Cassel 2024-06-07  453  	if (irq < 0) {
e242f26f6320e3 Niklas Cassel 2024-06-07 @454  		dev_err(dev, "missing sys IRQ resource\n");
e242f26f6320e3 Niklas Cassel 2024-06-07  455  		return irq;
e242f26f6320e3 Niklas Cassel 2024-06-07  456  	}
e242f26f6320e3 Niklas Cassel 2024-06-07  457  
e242f26f6320e3 Niklas Cassel 2024-06-07  458  	ret = devm_request_threaded_irq(dev, irq, NULL,
e242f26f6320e3 Niklas Cassel 2024-06-07  459  					rockchip_pcie_ep_sys_irq_thread,
e242f26f6320e3 Niklas Cassel 2024-06-07  460  					IRQF_ONESHOT, "pcie-sys", rockchip);
e242f26f6320e3 Niklas Cassel 2024-06-07  461  	if (ret) {
e242f26f6320e3 Niklas Cassel 2024-06-07  462  		dev_err(dev, "failed to request PCIe sys IRQ\n");
e242f26f6320e3 Niklas Cassel 2024-06-07  463  		return ret;
e242f26f6320e3 Niklas Cassel 2024-06-07  464  	}
e242f26f6320e3 Niklas Cassel 2024-06-07  465  
e242f26f6320e3 Niklas Cassel 2024-06-07  466  	/* LTSSM enable control mode */
e242f26f6320e3 Niklas Cassel 2024-06-07  467  	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
e242f26f6320e3 Niklas Cassel 2024-06-07  468  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
e242f26f6320e3 Niklas Cassel 2024-06-07  469  
e242f26f6320e3 Niklas Cassel 2024-06-07  470  	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
e242f26f6320e3 Niklas Cassel 2024-06-07  471  				 PCIE_CLIENT_GENERAL_CONTROL);
e242f26f6320e3 Niklas Cassel 2024-06-07  472  
e242f26f6320e3 Niklas Cassel 2024-06-07  473  	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
e242f26f6320e3 Niklas Cassel 2024-06-07  474  	rockchip->pci.ep.page_size = SZ_64K;
e242f26f6320e3 Niklas Cassel 2024-06-07  475  
e242f26f6320e3 Niklas Cassel 2024-06-07  476  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
e242f26f6320e3 Niklas Cassel 2024-06-07  477  
e242f26f6320e3 Niklas Cassel 2024-06-07  478  	ret = dw_pcie_ep_init(&rockchip->pci.ep);
e242f26f6320e3 Niklas Cassel 2024-06-07  479  	if (ret) {
e242f26f6320e3 Niklas Cassel 2024-06-07  480  		dev_err(dev, "failed to initialize endpoint\n");
e242f26f6320e3 Niklas Cassel 2024-06-07  481  		return ret;
e242f26f6320e3 Niklas Cassel 2024-06-07  482  	}
e242f26f6320e3 Niklas Cassel 2024-06-07  483  
e242f26f6320e3 Niklas Cassel 2024-06-07  484  	ret = dw_pcie_ep_init_registers(&rockchip->pci.ep);
e242f26f6320e3 Niklas Cassel 2024-06-07  485  	if (ret) {
e242f26f6320e3 Niklas Cassel 2024-06-07  486  		dev_err(dev, "failed to initialize DWC endpoint registers\n");
e242f26f6320e3 Niklas Cassel 2024-06-07  487  		dw_pcie_ep_deinit(&rockchip->pci.ep);
e242f26f6320e3 Niklas Cassel 2024-06-07  488  		return ret;
e242f26f6320e3 Niklas Cassel 2024-06-07  489  	}
e242f26f6320e3 Niklas Cassel 2024-06-07  490  
84e30b878aed93 Niklas Cassel 2024-06-22  491  	pci_epc_init_notify(rockchip->pci.ep.epc);
e242f26f6320e3 Niklas Cassel 2024-06-07  492  
e242f26f6320e3 Niklas Cassel 2024-06-07  493  	/* unmask DLL up/down indicator and hot reset/link-down reset */
e242f26f6320e3 Niklas Cassel 2024-06-07  494  	rockchip_pcie_writel_apb(rockchip, 0x60000, PCIE_CLIENT_INTR_MASK_MISC);
e242f26f6320e3 Niklas Cassel 2024-06-07  495  
e242f26f6320e3 Niklas Cassel 2024-06-07  496  	return ret;
e242f26f6320e3 Niklas Cassel 2024-06-07  497  }
e242f26f6320e3 Niklas Cassel 2024-06-07  498  

:::::: The code at line 454 was first introduced by commit
:::::: e242f26f6320e30e77e0455473a9d7f037ddb8a0 PCI: dw-rockchip: Add endpoint mode support

:::::: TO: Niklas Cassel <cassel@kernel.org>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
