Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C1171DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fo8ihx2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705097269; x=1736633269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7vfnXlMaJFLc6qX7I4gbpt2WcYS2P8IYRBQhh6KAEQ=;
  b=Fo8ihx2o5JTQyGeoG4qx7PzXmTdbVPH5RYua7psPklL3OJyfQdjyZSu3
   3gRZR22TzQ2vsjuE9HLwYdUIqGjjTxCT1vFDw3Veed91nIrBR7gIILlf3
   fRGsdvhgq4xxDVTbrE2888RUVmIzv0HaTZw7bWuX9yVDuBRukDZpEG0j+
   fNrVvWXXGR3ewDZKd3v/YD5x4Rl3atOmTkwO4szgh+oIC0HIkdVOSyMvc
   Cd8pqLG/XRbOIRJM0Ta2YaGnA2nEIAwBsfM+Z1dI0AQTQa9TYDuGgtwmH
   E5cAbReaZEpJ+pD5oz+u1cMkuBFXt9UkNDE7wG5MW0YJeU2P8icSUD8+l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403062792"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="403062792"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 14:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="956229518"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="956229518"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2024 14:07:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOPgm-0009r2-37;
	Fri, 12 Jan 2024 22:07:44 +0000
Date: Sat, 13 Jan 2024 06:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [morimoto:renesas-bsp/v6.1.71-2024-01-09-5 384/553]
 drivers/pci/controller/dwc/pcie-rcar-gen4.c:286:16: error:
 'PCIE_T_PVPERL_MS' undeclared
Message-ID: <202401130604.vRda6WOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.71-2024-01-09-5
head:   b58ff3ba1a4b3f885e550465849161f555b0a6b0
commit: de5097766b0cc54a70e18603d4d045a7e12b37a0 [384/553] PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode
config: i386-buildonly-randconfig-003-20240113 (https://download.01.org/0day-ci/archive/20240113/202401130604.vRda6WOZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130604.vRda6WOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130604.vRda6WOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-rcar-gen4.c: In function 'rcar_gen4_pcie_host_init':
>> drivers/pci/controller/dwc/pcie-rcar-gen4.c:286:16: error: 'PCIE_T_PVPERL_MS' undeclared (first use in this function)
     286 |         msleep(PCIE_T_PVPERL_MS);       /* pe_rst requires 100msec delay */
         |                ^~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-rcar-gen4.c:286:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/PCIE_T_PVPERL_MS +286 drivers/pci/controller/dwc/pcie-rcar-gen4.c

   257	
   258	/* Host mode */
   259	static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
   260	{
   261		struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
   262		struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
   263		int ret;
   264		u32 val;
   265	
   266		gpiod_set_value_cansleep(dw->pe_rst, 1);
   267	
   268		ret = rcar_gen4_pcie_common_init(rcar);
   269		if (ret)
   270			return ret;
   271	
   272		/*
   273		 * According to the section 3.5.7.2 "RC Mode" in DWC PCIe Dual Mode
   274		 * Rev.5.20a and 3.5.6.1 "RC mode" in DWC PCIe RC databook v5.20a, we
   275		 * should disable two BARs to avoid unnecessary memory assignment
   276		 * during device enumeration.
   277		 */
   278		dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
   279		dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
   280	
   281		/* Enable MSI interrupt signal */
   282		val = readl(rcar->base + PCIEINTSTS0EN);
   283		val |= MSI_CTRL_INT;
   284		writel(val, rcar->base + PCIEINTSTS0EN);
   285	
 > 286		msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
   287	
   288		gpiod_set_value_cansleep(dw->pe_rst, 0);
   289	
   290		return 0;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
