Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A00A1A27F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFdvJ2+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700561229; x=1732097229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zneeNPLnQ2B8jY1YxFAMnsrKvh8DUs427iketKvQ9Qw=;
  b=eFdvJ2+Vh3a87Y7Kl66uRhwAgOIGvB5rw4lks94ZCx49ZgVCb8voNHqw
   eenrxnxf7nT2r1hvBjYIsUbWM2o2AmbdeQNJNPfmKPHqm6dl/JAW6/acD
   4BU28eYFxn+xkm+jrm5i7s/8e6Z5MGD7OEfpM1yCcVQG08jdJdtcgrhth
   oP3CB6moOOwCgnsHusPk/ElUzw3cjthV5QE+2saFVz5JcjUSaowL3+T2I
   ZSPeD/9yGHYyeQfkLxG+UB9bPGfmX7jda8mpumgGgRYsZPm4aUf3SdIQs
   qSN1cxNEuhqyT7tppXK647ppPaPNWXnz5VaIRrd9Nbcyj9ZjssW9Mc+Cq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13350583"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="13350583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="884156153"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884156153"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 02:07:06 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5NeK-0007fy-0w;
	Tue, 21 Nov 2023 10:06:47 +0000
Date: Tue, 21 Nov 2023 18:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 9/9]
 arch/powerpc/kernel/pci-common.c:1063:17: error: 'struct device' has no
 member named 'dma_ops'
Message-ID: <202311211757.aMw7djh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   d8fcdc454323681baeaac55ec59813cf5cfeacd1
commit: d8fcdc454323681baeaac55ec59813cf5cfeacd1 [9/9] dma-mapping: remove set_dma_ops
config: powerpc-randconfig-002-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211757.aMw7djh1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211757.aMw7djh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211757.aMw7djh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/pci-common.c: In function 'pcibios_bus_add_device':
>> arch/powerpc/kernel/pci-common.c:1063:17: error: 'struct device' has no member named 'dma_ops'
    1063 |         dev->dev.dma_ops = pci_dma_ops;
         |                 ^


vim +1063 arch/powerpc/kernel/pci-common.c

  1053	
  1054	void pcibios_bus_add_device(struct pci_dev *dev)
  1055	{
  1056		struct pci_controller *phb;
  1057		/* Fixup NUMA node as it may not be setup yet by the generic
  1058		 * code and is needed by the DMA init
  1059		 */
  1060		set_dev_node(&dev->dev, pcibus_to_node(dev->bus));
  1061	
  1062		/* Hook up default DMA ops */
> 1063		dev->dev.dma_ops = pci_dma_ops;
  1064		dev->dev.archdata.dma_offset = PCI_DRAM_OFFSET;
  1065	
  1066		/* Additional platform DMA/iommu setup */
  1067		phb = pci_bus_to_host(dev->bus);
  1068		if (phb->controller_ops.dma_dev_setup)
  1069			phb->controller_ops.dma_dev_setup(dev);
  1070	
  1071		/* Read default IRQs and fixup if necessary */
  1072		pci_read_irq_line(dev);
  1073		if (ppc_md.pci_irq_fixup)
  1074			ppc_md.pci_irq_fixup(dev);
  1075	
  1076		if (ppc_md.pcibios_bus_add_device)
  1077			ppc_md.pcibios_bus_add_device(dev);
  1078	}
  1079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
