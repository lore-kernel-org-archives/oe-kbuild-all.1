Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C776171A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtLYP1BS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819411; x=1732355411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3rk1JQQ9EhrQ0QIqdnu1wJCLBR6nn1nH2hTvzpQOD0=;
  b=MtLYP1BSAKLOMGhhNWoFCJXaoKhYlCMY7KbkK/uuDEsOUWMuPrfbfVc3
   WetBC2G3YpDsKGPoo7MCf7btNdLpfEwybRF+8VhoHP2CBnekiDs9ggPKS
   8JsY2zK1JQAEo2dmFfBxzXnZ0KpQ9GVO5sVZxNQYu3cB1CocaYGteFWER
   nTi52+i9F+CxOGQnh4XwsI+NX5TAQvWf96Q3jzHx65drVBYSqNZ0UdXjp
   AYKIQWmJnyk0i86TjePWrlcqAUngFMmkp+n+jho60vP3cbwXKWE3ysQ02
   zTYOEkqfr30509tvoCScXN4Uwzn9n9LdgKcBxy2xArgS0LdDHkyXm+9SG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392165188"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392165188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8921116"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 01:50:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp4-0002LI-2O;
	Fri, 24 Nov 2023 09:50:06 +0000
Date: Fri, 24 Nov 2023 17:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 9/9]
 arch/powerpc/kernel/pci-common.c:1063:11: error: no member named 'dma_ops'
 in 'struct device'
Message-ID: <202311241331.m4YvoMja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   3536ad27b3a4cdde682df59f907e91bde768c3ab
commit: 3536ad27b3a4cdde682df59f907e91bde768c3ab [9/9] dma-mapping: remove set_dma_ops
config: powerpc-randconfig-002-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241331.m4YvoMja-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241331.m4YvoMja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241331.m4YvoMja-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/pci-common.c:1063:11: error: no member named 'dma_ops' in 'struct device'
    1063 |         dev->dev.dma_ops = pci_dma_ops;
         |         ~~~~~~~~ ^
   1 error generated.


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
