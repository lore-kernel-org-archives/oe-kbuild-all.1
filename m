Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357E3A0E93
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548093; cv=none; b=UGI4Hl1drCkp9SLjGM4piLbQP7ulwJDaC5O8+A7M0KZL3XMD3fKr9I5jLQxwtva8pLNJZY1ZMjGJFGF/UEIpA8y5W76VntFSfKseXI4vnxI6fH8FZ/MxbLRsy5mm/J4JGksMaByXTZ3WNRK+qUT71Em51pL/sBZ0f9YsN4335ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548093; c=relaxed/simple;
	bh=3a9WzPaIoYPwObLUKCZsWn4LWGzLuMfGUO4KrKj5IHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GBwsyXCRfr/yhzqLVqEx6RleSByYI8YjfoUEobnATCS+DflS23HeyJN9EISGOgCunFQuUnzkx1lRyjKt5Ur8bFUAyZ8oP7/6LjEC2XJd7km2xWyD6mdvihV3J5sgkMZx1myNnb12RIgHsp3bzVXxMOV1JL4cnyyImYPhZLBj4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isjGDWiv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isjGDWiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775548092; x=1807084092;
  h=date:from:to:cc:subject:message-id;
  bh=3a9WzPaIoYPwObLUKCZsWn4LWGzLuMfGUO4KrKj5IHE=;
  b=isjGDWivnpF2Ng5mQSLrFYQk8yX9yQDMCEAaReksRa56RGa/YebbjQFX
   l9TpgNH8kjZh7xz8NSdS3T830tTS+/jpJfyoiHJRhYncly/lo/wkEuLHi
   SoIy2cJQwX/JBTEOqoIjZZRQ0caYZvMqLdWpe1sVS/COW3O9Hp08s4sgq
   Jjo0vL80WlKZilI2eC1dbqHsJVLrsnejNKtKu6KqgS0ayWkGPj+1ymNpp
   I2IL5iFlCfiLPrxYE1ArgXqIGfF4NgEEykaOl4I4QTGHged4+p0QCSDnC
   IbRxf3YngBbiwTsrDM1THF2zUjOFat3RttMP+HV5gWNdZDU2cHj5xxyal
   w==;
X-CSE-ConnectionGUID: pToPj7hCSRqfoOd47m1JZA==
X-CSE-MsgGUID: BlZA1nagQK2ASvcQt/LpCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76400633"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76400633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:48:12 -0700
X-CSE-ConnectionGUID: zjaTjNBoTB2fW6jnYOzW0w==
X-CSE-MsgGUID: uq6WkyVdQCSYSWk2/hmSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232506646"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2026 00:48:11 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA1AN-000000000K9-40mX;
	Tue, 07 Apr 2026 07:48:07 +0000
Date: Tue, 07 Apr 2026 15:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 19/22]
 drivers/virtio/virtio_msg_amp_sapphire.c:148:68: warning: right shift count
 >= width of type
Message-ID: <202604071503.P9DtQ1Ps-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   c94ce1567e36856cc5599c0cf2f1c7d75dcc3624
commit: 2072a647262622503b0540c495939b216bba8bf9 [19/22] virtio: msg: Add Sapphire PCI transport driver for virtio-msg AMP
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071503.P9DtQ1Ps-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071503.P9DtQ1Ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071503.P9DtQ1Ps-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_msg_amp_sapphire.c: In function 'vmamp_sap_probe':
>> drivers/virtio/virtio_msg_amp_sapphire.c:148:68: warning: right shift count >= width of type [-Wshift-count-overflow]
     148 |         vmamp_sap->cfg_bram[0x4000 / 4 + 2] = vmamp_sap->shmem_dma >> 32;
         |                                                                    ^~


vim +148 drivers/virtio/virtio_msg_amp_sapphire.c

    59	
    60	static int vmamp_sap_probe(struct pci_dev *pdev, const struct pci_device_id *id)
    61	{
    62		struct vmamp_sap *vmamp_sap;
    63		resource_size_t	size;
    64		void __iomem * const *bar;
    65		phys_addr_t addr;
    66		int ret, i;
    67	
    68		vmamp_sap = devm_kzalloc(&pdev->dev, sizeof(struct vmamp_sap),
    69					 GFP_KERNEL);
    70		if (!vmamp_sap) {
    71			ret = -ENOMEM;
    72			goto error;
    73		}
    74	
    75		ret = pcim_enable_device(pdev);
    76		if (ret)
    77			goto error;
    78	
    79		ret = pcim_iomap_regions(pdev, BIT(0) | BIT(1), dev_name(&pdev->dev));
    80		if (ret)
    81			goto error;
    82	
    83		for (i = 0; i < 2; i++) {
    84			addr = pci_resource_start(pdev, i);
    85			size = pci_resource_len(pdev, i);
    86			dev_dbg(&pdev->dev, "msix (BAR%d) at %pa, size %pr\n", i, &addr,
    87				&size);
    88		}
    89	
    90		bar = pcim_iomap_table(pdev);
    91		if (!bar) {
    92			ret = -ENOMEM;
    93			goto error;
    94		}
    95	
    96		vmamp_sap->cfg_bram = bar[1];
    97		vmamp_sap->regs = (void __iomem *)((u8 __iomem *)bar[1] + 0x50000);
    98	
    99		/*
   100		 * Grab all vectors although we can only coalesce them into a single
   101		 * notifier. This avoids missing any event.
   102		 */
   103		vmamp_sap->vectors = pci_msix_vec_count(pdev);
   104		if (vmamp_sap->vectors < 0)
   105			vmamp_sap->vectors = 1;
   106	
   107		ret = pci_alloc_irq_vectors(pdev, vmamp_sap->vectors,
   108					    vmamp_sap->vectors,
   109					    PCI_IRQ_INTX | PCI_IRQ_MSIX);
   110		if (ret < 0)
   111			goto error;
   112	
   113		for (i = 0; i < vmamp_sap->vectors; i++) {
   114			ret = request_irq(pci_irq_vector(pdev, i), irq_handler,
   115					  IRQF_SHARED, dev_name(&pdev->dev), vmamp_sap);
   116			if (ret)
   117				goto free_irq;
   118		}
   119	
   120		vmamp_sap->vmamp.dev = &pdev->dev;
   121		vmamp_sap->vmamp.ops = &vmamp_sap_ops;
   122		pci_set_drvdata(pdev, vmamp_sap);
   123		pci_set_master(pdev);
   124	
   125		vmamp_sap->vmamp.shmem_size = 8 * 1024;
   126		vmamp_sap->vmamp.shmem = dma_alloc_coherent(&pdev->dev,
   127							    vmamp_sap->vmamp.shmem_size,
   128							    &vmamp_sap->shmem_dma,
   129							    GFP_KERNEL);
   130		if (!vmamp_sap->vmamp.shmem) {
   131			ret = -ENOMEM;
   132			goto clear_master;
   133		}
   134	
   135		memset(vmamp_sap->vmamp.shmem, 0, vmamp_sap->vmamp.shmem_size);
   136	
   137		hrtimer_setup(&vmamp_sap->poll, &poll_timer_expired, CLOCK_MONOTONIC,
   138			      HRTIMER_MODE_REL);
   139		// hrtimer_start(&vmamp_sap->poll, ms_to_ktime(50), HRTIMER_MODE_REL);
   140	
   141		ret = virtio_msg_amp_register(&vmamp_sap->vmamp);
   142		if (ret)
   143			goto free_shmem;
   144	
   145		// hrtimer_cancel(&vmamp_sap->poll);
   146	
   147		vmamp_sap->cfg_bram[0x4000 / 4 + 1] = vmamp_sap->shmem_dma;
 > 148		vmamp_sap->cfg_bram[0x4000 / 4 + 2] = vmamp_sap->shmem_dma >> 32;
   149		smp_wmb();
   150		vmamp_sap->cfg_bram[0x4000 / 4 + 0] = 1;
   151	
   152		return 0;
   153	
   154	free_shmem:
   155		dma_free_coherent(&pdev->dev, vmamp_sap->vmamp.shmem_size,
   156				  vmamp_sap->vmamp.shmem, vmamp_sap->shmem_dma);
   157	clear_master:
   158		pci_clear_master(pdev);
   159	free_irq:
   160		while (--i >= 0)
   161			free_irq(pci_irq_vector(pdev, i), vmamp_sap);
   162		pci_free_irq_vectors(pdev);
   163	
   164	error:
   165		dev_info(&pdev->dev, "probe failed: %d\n", ret);
   166		return ret;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
