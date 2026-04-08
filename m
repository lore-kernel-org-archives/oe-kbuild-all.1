Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8426AC3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 03:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775618932; cv=none; b=ehA/QpaU5TUtbtxNXJ5Oetzhq9kx0XQ3ixJhD/wycJbn+Jz7ZlFFAYMjBDSmROirlFI4SFpNJRHXmmwHJd94YCb/n28gN3auatoF351mmeYBt1BBw0V6K1SNEBmPOjFFCnoWtet7gjIAIEsk3Aj0uCqhy2T7+kabd51iwt5aPBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775618932; c=relaxed/simple;
	bh=34hYoFvZu5YHZ4u6eED/9O/XIcP6GsbRgvm9/ZcZ4QY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZqXphDC3i6B95GQnGVHsgs9vrSm44WzPQSyaN2r9fbZXB1MNNO1Mza1AHZB8JvPpsIqS5I5bZEmTL9Ljd68CX/eCfQQlLfNuRAsuR679Dz4jw5Ray145xssQfqB1iVRogKIGgC/KAOHq9qXCXHhDATj2e6rWGbGip61VATwC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1VMNzDV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1VMNzDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775618930; x=1807154930;
  h=date:from:to:cc:subject:message-id;
  bh=34hYoFvZu5YHZ4u6eED/9O/XIcP6GsbRgvm9/ZcZ4QY=;
  b=K1VMNzDVOhnl1fjaTaepNslmrqUsdCNZX920epYzisYr9kNzvicyzUZb
   P0NIXisKNGcuEqZMBWp6klkr8/+ijOqjRz3+/FeRMEXZO7+dgFDD1meWm
   iQxpnV3eoz+hYu+sp+EHQDW8Uxq9K6T1Rh5QcsZskFLfOdEh70LuFoE26
   Ux2EVJ83FaPtOXC8oDrwjH/DAAGc0hr9bjwi1nXLLIA4vzHDiaLouzaUx
   EWkBErhBzeIkmWTzGGOdH92N1RiacjV/NHGVoWalcZGnrc7vUyRRaA8hf
   J6R2BOd8JgHZOfwZcVqhZypGjI0IOhu/dzyV3NZjCT43NVO91qNSmrzRC
   w==;
X-CSE-ConnectionGUID: gLvel0khSh6BDEtlTg2KDw==
X-CSE-MsgGUID: GyyxKQDfS1SvuDaVXlumww==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76557841"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76557841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 20:28:49 -0700
X-CSE-ConnectionGUID: X/ee8laERx+8rzfQB+igLQ==
X-CSE-MsgGUID: Z+ECw6t0RmOtv10MbhgB9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="230018143"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2026 20:28:48 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAJaw-000000001Nr-06j8;
	Wed, 08 Apr 2026 03:28:46 +0000
Date: Wed, 08 Apr 2026 11:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 20/22]
 drivers/virtio/virtio_msg_amp_sapphire.c:147:28: sparse: sparse: dereference
 of noderef expression
Message-ID: <202604081135.MWgsqagH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   b382c54fa38099ef72901ecdd4e3edd3e3998d5a
commit: 9611632e8db76949a73dd21597ccefd2fafb1b49 [20/22] virtio: msg: Add Sapphire PCI transport driver for virtio-msg AMP
config: sparc64-randconfig-r123-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081135.MWgsqagH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081135.MWgsqagH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081135.MWgsqagH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast to restricted __le16
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast from restricted __le32
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast to restricted __le16
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast from restricted __le32
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast to restricted __le16
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast from restricted __le32
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast to restricted __le16
>> drivers/virtio/virtio_msg_amp.c:299:55: sparse: sparse: cast from restricted __le32
--
>> drivers/virtio/virtio_msg_amp_sapphire.c:147:28: sparse: sparse: dereference of noderef expression
   drivers/virtio/virtio_msg_amp_sapphire.c:148:28: sparse: sparse: dereference of noderef expression
   drivers/virtio/virtio_msg_amp_sapphire.c:150:28: sparse: sparse: dereference of noderef expression

vim +147 drivers/virtio/virtio_msg_amp_sapphire.c

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
 > 147		vmamp_sap->cfg_bram[0x4000 / 4 + 1] = vmamp_sap->shmem_dma;
   148		vmamp_sap->cfg_bram[0x4000 / 4 + 2] = vmamp_sap->shmem_dma >> 32;
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
