Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C963CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDFs53SM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700529848; x=1732065848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+JH3dhmS08b0ahNmZoNl08KmLYwfu+iR0aJ+FPy794=;
  b=kDFs53SMrhUXQbCRtnFZku4dB7NHtPlM6I15yenavz2uqS2xjIH/SFW/
   aSh/T0H/EsYQFEQ/ftb8dLo8QWzhafdw/R1xajNc/XFFNkPDcDn83HlxJ
   x2pgEWFXNdvsWwxceuhOaK6COP3zbXPJRPAZs+QmNxRV/faoP2yidUojv
   s3jIDW1GUmUuQ4PtgUpAR2BH8buZ2r1JfOjZvE7tRdz3qQbZClXBKkVeb
   qQF15GfaCJOUENdwz6spZ8FYbxy4riqWiOp75ZJnr74rVMQ9uNYZ0KJOe
   EYAS+heqpVKX9Bmh5PEjjOYf5gdZpyCYaWs3/FTvTTHJOT3fano4uCC86
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="395668830"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="395668830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939949039"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939949039"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 17:24:06 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5FUb-00078v-0F;
	Tue, 21 Nov 2023 01:23:59 +0000
Date: Tue, 21 Nov 2023 09:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:clearfog 8/14] drivers/pci/pcie/portdrv.c:338
 pcie_port_device_register() warn: inconsistent indenting
Message-ID: <202311210920.VUR04wmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   6e698f0cba45822ace8be2c02bcd3d74f9c6b5db
commit: 1a5858413e0f2032495106017dd329c79e389107 [8/14] mvebu/clearfog pcie updates
config: x86_64-randconfig-161-20231120 (https://download.01.org/0day-ci/archive/20231121/202311210920.VUR04wmZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210920.VUR04wmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210920.VUR04wmZ-lkp@intel.com/

New smatch warnings:
drivers/pci/pcie/portdrv.c:338 pcie_port_device_register() warn: inconsistent indenting

Old smatch warnings:
drivers/pci/pcie/portdrv.c:351 pcie_port_device_register() warn: inconsistent indenting

vim +338 drivers/pci/pcie/portdrv.c

   318	
   319	/**
   320	 * pcie_port_device_register - register PCI Express port
   321	 * @dev: PCI Express port to register
   322	 *
   323	 * Allocate the port extension structure and register services associated with
   324	 * the port.
   325	 */
   326	static int pcie_port_device_register(struct pci_dev *dev)
   327	{
   328		int status, capabilities, i, nr_service;
   329		int irqs[PCIE_PORT_DEVICE_MAXSERVICES];
   330	
   331		/* Enable PCI Express port device */
   332		status = pci_enable_device(dev);
   333		if (status)
   334			return status;
   335	
   336		/* Get and check PCI Express port services */
   337		capabilities = get_port_device_capability(dev);
 > 338	dev_info(&dev->dev, "PCIe capabilities: 0x%x\n", capabilities);
   339		if (!capabilities)
   340			return 0;
   341	
   342		pci_set_master(dev);
   343		/*
   344		 * Initialize service irqs. Don't use service devices that
   345		 * require interrupts if there is no way to generate them.
   346		 * However, some drivers may have a polling mode (e.g. pciehp_poll_mode)
   347		 * that can be used in the absence of irqs.  Allow them to determine
   348		 * if that is to be used.
   349		 */
   350		status = pcie_init_service_irqs(dev, irqs, capabilities);
   351	dev_info(&dev->dev, "init_service_irqs: %d\n", status);
   352		if (status) {
   353			capabilities &= PCIE_PORT_SERVICE_HP;
   354			if (!capabilities)
   355				goto error_disable;
   356		}
   357	
   358		/* Allocate child services if any */
   359		status = -ENODEV;
   360		nr_service = 0;
   361		for (i = 0; i < PCIE_PORT_DEVICE_MAXSERVICES; i++) {
   362			int service = 1 << i;
   363			if (!(capabilities & service))
   364				continue;
   365			if (!pcie_device_init(dev, service, irqs[i]))
   366				nr_service++;
   367		}
   368		if (!nr_service)
   369			goto error_cleanup_irqs;
   370	
   371		return 0;
   372	
   373	error_cleanup_irqs:
   374		pci_free_irq_vectors(dev);
   375	error_disable:
   376		pci_disable_device(dev);
   377		return status;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
