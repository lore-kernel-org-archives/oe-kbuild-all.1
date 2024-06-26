Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5C0195976
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438393; cv=none; b=jkrOz4Vau+43om/AxOd0ZGvx/Tcp/+HQwAhqvRoxmU2K0kGr4p3kQtVJgGA05ujp7jxQAvZ9JbDGgj2q7OZE3SshYHOeggFi5LQ3tRuvE/ww0DNCTTKIkRYWVlQWGaXT+t2F2ZvxDf6r7m8pzA3TsLGk78fG9yj7gYnIwX9QwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438393; c=relaxed/simple;
	bh=81oms+lpYn+SS5fAp0mxS69HQxieEDCB98sXW5l+Ges=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItIUiNE8nTxq5erpG6II1h8SPj2w/qvsf9CHYjiwcLaWXVFCuOko6aNPp+9EGc2BIlL+DNR3QUXd5FVGU+i8XMCeV8tMP9RDwUKhFSx0N20EEJy7ieexbeGDID9k7YLBY1si7+g+mCwDGCSl98afEWpKWmIYyjehoriMMe98+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9n03iBB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9n03iBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719438391; x=1750974391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=81oms+lpYn+SS5fAp0mxS69HQxieEDCB98sXW5l+Ges=;
  b=i9n03iBBOAwdWD7EMDe1uNIsVXegD9kArpaIaAEvYbCnaGrVw21yfPdY
   QDMRUgLee2IoqwdGp6bFefsQrDI7CivlCgcRtR8ebDeTfRR3Yuh9uBEeS
   nWG/uBH0wNQZEdTn8nZgV6SPi+pPT+p6FLo828+g/ZdZWK84MVjUxheKP
   n9q/qhi3R9inFTrKmiI1LvXXF7x9fB+1ZaC2wo0mrWqX/Nv6qjQrei93x
   IisY+Z/vL1wqc5kk/Rvn507scXir390MpEYZPdeX7mYv5e/FMEygBLtb6
   ranquC4JrRjUXFgvd3QUTmSj5b+RcY/tbwHDrvkRJmlUZY6ZtYLmtSjZw
   Q==;
X-CSE-ConnectionGUID: so0r4FLvRgWRfN7IIZ6ylA==
X-CSE-MsgGUID: JoogPRsYReKzsCBFMTKgdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19428919"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="19428919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 14:46:30 -0700
X-CSE-ConnectionGUID: isus6aUlRdSYlX17LvZxpw==
X-CSE-MsgGUID: fI+ALK7lSw6QZwx5RqGreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="81692448"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2024 14:46:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMaTC-000FaU-3C;
	Wed, 26 Jun 2024 21:46:26 +0000
Date: Thu, 27 Jun 2024 05:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <202406270503.ZMuH0eTS-lkp@intel.com>
References: <20240621112915.3434402-3-daire.mcnamara@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621112915.3434402-3-daire.mcnamara@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/daire-mcnamara-microchip-com/PCI-microchip-Fix-outbound-address-translation-tables/20240625-161731
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240621112915.3434402-3-daire.mcnamara%40microchip.com
patch subject: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation tables
config: mips-randconfig-r123-20240626 (https://download.01.org/0day-ci/archive/20240627/202406270503.ZMuH0eTS-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406270503.ZMuH0eTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270503.ZMuH0eTS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-microchip-host.c:1000:60: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)

vim +1000 drivers/pci/controller/pcie-microchip-host.c

   961	
   962	static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev, struct mc_pcie *port)
   963	{
   964		struct device *dev = &pdev->dev;
   965		struct device_node *dn = dev->of_node;
   966		struct of_range_parser parser;
   967		struct of_range range;
   968		int atr_index = 0;
   969	
   970		/*
   971		 * MPFS PCIe root port is 32-bit only, behind a Fabric Interface
   972		 * Controller FPGA logic block which contains the AXI-S interface.
   973		 *
   974		 * From the point of view of the PCIe root port, There are only
   975		 * two supported Root Port configurations
   976		 *
   977		 * Configuration 1: for use with fully coherent designs; supports a
   978		 * window from 0x0 (CPU space) to specified PCIe space.
   979		 *
   980		 * Configuration 2: for use with non-coherent designs; supports two
   981		 * 1 Gb wide windows to CPU space; one mapping cpu space 0 to pcie
   982		 * space 0x80000000 and mapping cpu space 0x40000000 to pcie
   983		 * space 0xc0000000. This cfg needs two windows because of how
   984		 * the MSI space is allocated in the AXI-S range on MPFS.
   985		 *
   986		 * The FIC interface outside the PCIe block *must* complete the inbound
   987		 * address translation as per MCHP MPFS FPGA design guidelines.
   988		 */
   989		if (device_property_read_bool(dev, "dma-noncoherent")) {
   990			/*
   991			 * Always need same two tables in this case.  Need two tables
   992			 * due to hardware interactions between address and size.
   993			 */
   994			mc_pcie_setup_inbound_atr(0, 0, MPFS_NC_BOUNCE_ADDR, SZ_1G);
   995			mc_pcie_setup_inbound_atr(1, SZ_1G, MPFS_NC_BOUNCE_ADDR + SZ_1G, SZ_1G);
   996		} else {
   997			/* Find any dma-ranges */
   998			if (of_pci_dma_range_parser_init(&parser, dn)) {
   999				/* No dma-range property - setup default */
> 1000				mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
  1001				return 0;
  1002			}
  1003	
  1004			for_each_of_range(&parser, &range) {
  1005				if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
  1006					dev_err(dev, "too many inbound ranges; %d available tables\n",
  1007						MC_MAX_NUM_INBOUND_WINDOWS);
  1008					return -EINVAL;
  1009				}
  1010				mc_pcie_setup_inbound_atr(atr_index, 0, range.pci_addr, range.size);
  1011				atr_index++;
  1012			}
  1013		}
  1014	
  1015		return 0;
  1016	}
  1017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
