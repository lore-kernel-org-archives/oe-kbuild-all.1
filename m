Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD520B3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695656310; x=1727192310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2fP48KOD7s9FbYrp4K1BRpuDyW/jgD9PisGk1m1CJw=;
  b=jtgDUP4BjzbXMBmJYvDm+v1SOg0Sa8H+TBzEGf2IWhgxywEc/7zYPkkK
   GYqoHzEbIonkj0RB9U0Hbn+QN+PweuFU9dZgZo+FwA3cV3ztR35lXTWrd
   c0vb7vPLLWFG80f50sk/Euzqn5ytfbIsxvvywOiQWkiK24Vdj2LlbClSE
   XkmURDHW/gC+I6sQqUwS+TV1ZSsHs5FoDvt3dCObLXKuHrU/LcJKTKuWz
   BQZcrJfmH1n97Z5K9J9JhmXHqlmgc4zAwChcqDLmeXqA78jD0Nmpp7mR5
   JxgLSPU93AyDxrcMNr8CuC6zQmYIkDS5PwEOp1techeRK3NYubQqWV2aL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467570603"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="467570603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 08:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863949155"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="863949155"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2023 08:38:27 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qknfF-0001hP-30;
	Mon, 25 Sep 2023 15:38:25 +0000
Date: Mon, 25 Sep 2023 23:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:clearfog 8/14] drivers/pci/pcie/portdrv.c:338
 pcie_port_device_register() warn: inconsistent indenting
Message-ID: <202309252359.8patrSmi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   6a8f16d1a35202e04d77cbeb140e15cf46bb7c8a
commit: 47a39a39a76f08b270b0bddfc3c31aa77cff10b7 [8/14] mvebu/clearfog pcie updates
config: x86_64-randconfig-161-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252359.8patrSmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309252359.8patrSmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252359.8patrSmi-lkp@intel.com/

New smatch warnings:
drivers/pci/pcie/portdrv.c:338 pcie_port_device_register() warn: inconsistent indenting
drivers/pci/pcie/aspm.c:624 pcie_aspm_cap_init() warn: inconsistent indenting

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
