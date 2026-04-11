Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC36238C1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869486; cv=none; b=bcbe/KLh1tg9cApx1NPLCSEQUuUWfwrl2piTjCbGMk2aXX1u+HTUU3VtXp2reCABqs/y5qBFKrEI9DmNt1bY6nNlY7jmYA55piJxTGjt93g0+TL9smG7V3TgWzbZHXgozk2D/h6UQF7q9aTUVZD/1fMJ+8dGDEj3vW+jG7U4PDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869486; c=relaxed/simple;
	bh=KYpX/v8PY1RlSTEuWSSRMBwX0Ty6oDA3fDgCZoV+OSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1wMG72IL97ccUBr0d82bSRHN+FcM1TntcWCNlCeL0oPXftMiSwyyWnewX7vrowLG2oR9X+HwhDRwSgN3fcFEdLXt8R13O4C9uxfides4Cvgp+lShuC4xqG8b7Ty/by7hwByPHFSjUs6wJfW4vlh50tLZSown+nm/6db6Q9FwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4KaEtPv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4KaEtPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775869485; x=1807405485;
  h=date:from:to:cc:subject:message-id;
  bh=KYpX/v8PY1RlSTEuWSSRMBwX0Ty6oDA3fDgCZoV+OSU=;
  b=n4KaEtPv++cvX/J4NcPSISyQRZjIZm2+OJaWUBXk+jvO8RclMoGVeQEj
   T98AgjGs3bHUY/era970gFA39xPK6V2ARu9A7WCf/3xn6Ylc+ja/zzWQE
   NKrJe/b3yAJ0E15HxcvgYQA0Nszycub0wR2EyN/iUj7zs+eFNzOS1oFZL
   9yxSZRnTDI8OHRCtWEqUYbReM7lWljJACr/JiZF/5QFTfCAOcxTq4afPk
   UGUrZmlUy6srIsShUAPLSdEI0EAq32gqayXC3ZvVaI52m79bLm9Nxcn6z
   f3SAEsdZKh8dupAY+zZZedr1Nk8DWEcsY9V2Ym53awugTZtCSZXhVCxQM
   A==;
X-CSE-ConnectionGUID: Xm2dZigzQMSHyfiK2v7nZw==
X-CSE-MsgGUID: uZa+vrFkTSOV2QaQkZ7HEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79479663"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="79479663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:04:43 -0700
X-CSE-ConnectionGUID: TUMUyaRMRVeHwm9XFR/d2w==
X-CSE-MsgGUID: DUoKma5AQ7usxSW9yyvlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259715565"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 18:04:41 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMm7-000000000Yx-1GMi;
	Sat, 11 Apr 2026 01:04:39 +0000
Date: Sat, 11 Apr 2026 09:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 20/22]
 drivers/virtio/virtio_msg_amp_sapphire.c:114:32: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202604110813.ywMRZQy4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   75bc54f772e3ac32677414b0f929df9ca6c2ed28
commit: bf020aa56228ee365f1cc6c430e9d32f6947a63c [20/22] virtio: msg: Add Sapphire PCI transport driver for virtio-msg AMP
config: um-randconfig-r133-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110813.ywMRZQy4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110813.ywMRZQy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110813.ywMRZQy4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_amp_sapphire.c:114:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *shmem @@     got void * @@
   drivers/virtio/virtio_msg_amp_sapphire.c:114:32: sparse:     expected void [noderef] __iomem *shmem
   drivers/virtio/virtio_msg_amp_sapphire.c:114:32: sparse:     got void *
>> drivers/virtio/virtio_msg_amp_sapphire.c:134:43: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] __iomem *shmem @@
   drivers/virtio/virtio_msg_amp_sapphire.c:134:43: sparse:     expected void *cpu_addr
   drivers/virtio/virtio_msg_amp_sapphire.c:134:43: sparse:     got void [noderef] __iomem *shmem
   drivers/virtio/virtio_msg_amp_sapphire.c:154:43: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] __iomem *shmem @@
   drivers/virtio/virtio_msg_amp_sapphire.c:154:43: sparse:     expected void *cpu_addr
   drivers/virtio/virtio_msg_amp_sapphire.c:154:43: sparse:     got void [noderef] __iomem *shmem

vim +114 drivers/virtio/virtio_msg_amp_sapphire.c

    47	
    48	static int vmamp_sap_probe(struct pci_dev *pdev, const struct pci_device_id *id)
    49	{
    50		struct vmamp_sap *vmamp_sap;
    51		void __iomem * const *bar;
    52		resource_size_t	size;
    53		u8 __iomem *cfg_bram;
    54		phys_addr_t addr;
    55		int ret, i;
    56	
    57		vmamp_sap = devm_kzalloc(&pdev->dev, sizeof(struct vmamp_sap),
    58					 GFP_KERNEL);
    59		if (!vmamp_sap) {
    60			ret = -ENOMEM;
    61			goto error;
    62		}
    63	
    64		ret = pcim_enable_device(pdev);
    65		if (ret)
    66			goto error;
    67	
    68		ret = pcim_iomap_regions(pdev, BIT(0) | BIT(1), dev_name(&pdev->dev));
    69		if (ret)
    70			goto error;
    71	
    72		for (i = 0; i < 2; i++) {
    73			addr = pci_resource_start(pdev, i);
    74			size = pci_resource_len(pdev, i);
    75			dev_dbg(&pdev->dev, "msix (BAR%d) at %pa, size %pr\n", i, &addr,
    76				&size);
    77		}
    78	
    79		bar = pcim_iomap_table(pdev);
    80		if (!bar) {
    81			ret = -ENOMEM;
    82			goto error;
    83		}
    84	
    85		cfg_bram = bar[1];
    86		vmamp_sap->regs = (void __iomem *)(cfg_bram + 0x50000);
    87	
    88		/*
    89		 * Grab all vectors although we can only coalesce them into a single
    90		 * notifier. This avoids missing any event.
    91		 */
    92		vmamp_sap->vectors = pci_msix_vec_count(pdev);
    93		if (vmamp_sap->vectors < 0)
    94			vmamp_sap->vectors = 1;
    95	
    96		ret = pci_alloc_irq_vectors(pdev, vmamp_sap->vectors,
    97					    vmamp_sap->vectors,
    98					    PCI_IRQ_INTX | PCI_IRQ_MSIX);
    99		if (ret < 0)
   100			goto error;
   101	
   102		for (i = 0; i < vmamp_sap->vectors; i++) {
   103			ret = request_irq(pci_irq_vector(pdev, i), irq_handler,
   104					  IRQF_SHARED, dev_name(&pdev->dev), vmamp_sap);
   105			if (ret)
   106				goto free_irq;
   107		}
   108	
   109		vmamp_sap->vmamp.dev = &pdev->dev;
   110		vmamp_sap->vmamp.ops = &vmamp_sap_ops;
   111		pci_set_drvdata(pdev, vmamp_sap);
   112		pci_set_master(pdev);
   113	
 > 114		vmamp_sap->vmamp.shmem = dma_alloc_coherent(&pdev->dev,
   115							    VIRTIO_MSG_AMP_PAGE_SIZE * 2,
   116							    &vmamp_sap->shmem_dma,
   117							    GFP_KERNEL);
   118		if (!vmamp_sap->vmamp.shmem) {
   119			ret = -ENOMEM;
   120			goto clear_master;
   121		}
   122	
   123		ret = virtio_msg_amp_register(&vmamp_sap->vmamp);
   124		if (ret)
   125			goto free_shmem;
   126	
   127		writel(vmamp_sap->shmem_dma, &cfg_bram[0x4000 + 1]);
   128		writel(vmamp_sap->shmem_dma >> 32, &cfg_bram[0x4000 + 2]);
   129		writel(1, &cfg_bram[0x4000 + 0]);
   130		return 0;
   131	
   132	free_shmem:
   133		dma_free_coherent(&pdev->dev, VIRTIO_MSG_AMP_PAGE_SIZE * 2,
 > 134				  vmamp_sap->vmamp.shmem, vmamp_sap->shmem_dma);
   135	clear_master:
   136		pci_clear_master(pdev);
   137	free_irq:
   138		while (--i >= 0)
   139			free_irq(pci_irq_vector(pdev, i), vmamp_sap);
   140		pci_free_irq_vectors(pdev);
   141	
   142	error:
   143		dev_info(&pdev->dev, "probe failed: %d\n", ret);
   144		return ret;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
