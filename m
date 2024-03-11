Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC08FC1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710141640; cv=none; b=iTF1H5pu6axfb4d5pJmNqImBBZtPqroVjHuHR8NrwuHdaSnZ++IG55MipjO/e62+FbdzDLLlAWaFdOnZfltGvuYJoRhtCIxsHYhq5eMkrwyKRHMVx+BALnhjF861DEPC6SG0fTx7Hqu6AL7yhmlsJ61gkvj+uT88TZcoyipMQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710141640; c=relaxed/simple;
	bh=aqhe5yeM1X+DcMzIDqjhoGwfTjAoptD6YoDR5q/Au50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YlGZaxPGGqL3iWdMiPaPBEbMgqFFGNPkXLYCOqZ68ovUkU1zXeTDVosoJBmEu80fSF4aSGFGAt+Em3n57wmucFdomPP6s4URCUl3s62MlwEzKrjIcOzwfeJ2505VhiSojJ3ee6KZZOeEHZ9nw0xJa2mc0WOiqdruMr1kyZC4Plk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=barvqIeR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="barvqIeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710141637; x=1741677637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqhe5yeM1X+DcMzIDqjhoGwfTjAoptD6YoDR5q/Au50=;
  b=barvqIeRO7iBy/NHFP+f36IFU8RkWBjKzLYrMORcAXs0Saeaa1/wV8gm
   Rk+ChaVHX3pT/4UeYIbLvnaxH/FqzaD1C8XXms9NQSY2FqhVcIsfk5xsr
   nzFBoExo0+AF0jpdS2g3Ry45WHOILyo9xiXMlKSMaNqQW0vNGWYEjzRm4
   OMxrvcxGOeMrt8qYFt0C3MMxqEG2t3sfAh2vZ01mZsBsD7kYwnaKPqunX
   X1Ir9tqaFamusrqkG5z7YPjpW43XYU6Y5UfM9kLeEWL7Yp9Xg8sZ42xsV
   yLA3JP7YabHr71z/xXD8uJJzzfv6/TEy6k324JvA7WTX7Wa8L3C9fhFlZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30230093"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="30230093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 00:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="10987070"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2024 00:20:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjZxZ-0008yt-2l;
	Mon, 11 Mar 2024 07:20:33 +0000
Date: Mon, 11 Mar 2024 15:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 9/14]
 drivers/pci/controller/pcie-apple.c:468:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202403111527.L2YieGnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   58cab72f915e70990f9e2c9836b7cb6e79a9db35
commit: 92dbf7fc980de7b1736db46f5a7a3b45330aae72 [9/14] PCIE: apple: Add T602x PCIe support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240311/202403111527.L2YieGnK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111527.L2YieGnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111527.L2YieGnK-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
