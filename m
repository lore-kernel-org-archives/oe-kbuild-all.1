Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D898738C403
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551941; cv=none; b=pSi+5cJXeIYmg7XGqc6rYBry25qV7a9/KlJzNeUhNDt3wt3oXfwKux9u5Og7lmI+JytVbeRYfKyXhGwoSWFdrHHX7p8l5blBXY08zlzD/gUw3BrWBy47yYItWDiBKICUv8ut2ses9ARH0V0x/JJClDIMEs+kNTi4qFFHm+brFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551941; c=relaxed/simple;
	bh=0JoxjQPcItK2mBHDuckrdnk5ZRvuVy5SselGQOrJp34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FSUstTWGqiFaHRTLXjts0fK1Tc9J2QjnQxSr/enDDjlNPf2qDQ+rB38CQZEjrZB4FUKDE0/aIhF2vLv3JZ7ZI+yvUJ2M4vKSmxPqYrbYIK8RLx+Yr8pTph9Hpp0otUwYM1mPfyQFwSpnvWLfoeOxmR0WnDmIFB+KoFMeniUeCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeEBFOKf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeEBFOKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775551939; x=1807087939;
  h=date:from:to:cc:subject:message-id;
  bh=0JoxjQPcItK2mBHDuckrdnk5ZRvuVy5SselGQOrJp34=;
  b=IeEBFOKfQkLdjTBPHNoNyoHVTN/fWwUnz7cUvhmPfD+6qjdb+W496Y9Q
   hcyV49+C9mCx4oqhEfMTlOqcfaFFtlE2P7K0IIHhs5pI0pbER6A+i/S3g
   Rycf+cb8CB2b7o0bcFO7ctjXcy1EBxP+Auy7llicEp6t4sxJbav9H91hy
   kQbHQoHHZpofkmaVgG8JnIZzj4BiWwXC04abQXQnTnhG/cqo8rfiRyVFk
   0h/BYOvoB5iqY/UGgp7OJ8y9SzDGgLvWkCL3QJrVTdv5SZT9Yv8Gb1w3Z
   oY6znPIXkk/Z1oQ9s9G6Ohy9CJY9He1g4+aOgYhx0gKHrSft4+o8WlQWW
   g==;
X-CSE-ConnectionGUID: ySNf5nFTRnmNPpuUQkLMFw==
X-CSE-MsgGUID: Q+ZfjPC3Q3C+/+MaGZcoQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76522144"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76522144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:52:18 -0700
X-CSE-ConnectionGUID: zu/4UbjPQP6uU40b2ytNCQ==
X-CSE-MsgGUID: YXsfvlToQEO9zNEQYda5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228386850"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2026 01:52:17 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA2AQ-000000000Ob-3k8b;
	Tue, 07 Apr 2026 08:52:14 +0000
Date: Tue, 07 Apr 2026 16:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 20/22]
 drivers/virtio/virtio_msg_amp_pci.c:94:30: error: implicit declaration of
 function 'pci_msix_vec_count'
Message-ID: <202604071622.HEdTlo3h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   781a260a2b5802f6ac428e12ffe8a54d0c6330eb
commit: 47d31ad5e63c3d62a6b26136692b9b480bb11fb3 [20/22] virtio: msg: Add generic PCI transport driver for virtio-msg AMP
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071622.HEdTlo3h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071622.HEdTlo3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071622.HEdTlo3h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_amp.h:21,
                    from drivers/virtio/virtio_msg_amp.c:22:
   drivers/virtio/spsc_queue.h: In function 'spsc_atomic_load':
>> drivers/virtio/spsc_queue.h:72:23: error: implicit declaration of function 'array_index_nospec' [-Wimplicit-function-declaration]
      72 |                 val = array_index_nospec(val, q->capacity);
         |                       ^~~~~~~~~~~~~~~~~~
--
   drivers/virtio/virtio_msg_amp_pci.c: In function 'vmamp_pci_probe':
>> drivers/virtio/virtio_msg_amp_pci.c:94:30: error: implicit declaration of function 'pci_msix_vec_count' [-Wimplicit-function-declaration]
      94 |         vmamp_pci->vectors = pci_msix_vec_count(pdev);
         |                              ^~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_amp_pci.c:131:9: error: implicit declaration of function 'pci_free_irq_vectors'; did you mean 'pci_alloc_irq_vectors'? [-Wimplicit-function-declaration]
     131 |         pci_free_irq_vectors(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         pci_alloc_irq_vectors
   drivers/virtio/virtio_msg_amp_pci.c: At top level:
>> drivers/virtio/virtio_msg_amp_pci.c:178:1: warning: data definition has no type or storage class
     178 | module_pci_driver(vmamp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_amp_pci.c:178:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
>> drivers/virtio/virtio_msg_amp_pci.c:178:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/virtio/virtio_msg_amp_pci.c:171:26: warning: 'vmamp_pci_driver' defined but not used [-Wunused-variable]
     171 | static struct pci_driver vmamp_pci_driver = {
         |                          ^~~~~~~~~~~~~~~~


vim +/pci_msix_vec_count +94 drivers/virtio/virtio_msg_amp_pci.c

    48	
    49	static int vmamp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
    50	{
    51		struct vmamp_pci *vmamp_pci;
    52		resource_size_t	size;
    53		phys_addr_t addr;
    54		int ret, i;
    55	
    56		vmamp_pci = devm_kzalloc(&pdev->dev, sizeof(*vmamp_pci), GFP_KERNEL);
    57		if (!vmamp_pci) {
    58			ret = -ENOMEM;
    59			goto error;
    60		}
    61	
    62		ret = pcim_enable_device(pdev);
    63		if (ret)
    64			goto error;
    65	
    66		/* Request 3 BARs */
    67		for (i = 0; i < 3; i++) {
    68			ret = pcim_request_region(pdev, i, dev_name(&pdev->dev));
    69			if (ret)
    70				goto error;
    71	
    72			addr = pci_resource_start(pdev, i);
    73			size = pci_resource_len(pdev, i);
    74			dev_dbg(&pdev->dev, "mmr (BAR%d) at %pa, size %pr\n", i, &addr,
    75				&size);
    76		}
    77	
    78		vmamp_pci->regs = pcim_iomap(pdev, 0, 0);
    79		if (!vmamp_pci->regs) {
    80			ret = -ENOMEM;
    81			goto error;
    82		}
    83	
    84		vmamp_pci->ram = pci_iomap_wc(pdev, 1, 0);
    85		if (!vmamp_pci->ram) {
    86			ret = -ENOMEM;
    87			goto error;
    88		}
    89	
    90		/*
    91		 * Grab all vectors although we can only coalesce them into a single
    92		 * notifier. This avoids missing any event.
    93		 */
  > 94		vmamp_pci->vectors = pci_msix_vec_count(pdev);
    95		if (vmamp_pci->vectors < 0)
    96			vmamp_pci->vectors = 1;
    97	
    98		ret = pci_alloc_irq_vectors(pdev, vmamp_pci->vectors,
    99					    vmamp_pci->vectors, PCI_IRQ_MSIX);
   100		if (ret < 0)
   101			goto unmap_ram;
   102	
   103		for (i = 0; i < vmamp_pci->vectors; i++) {
   104			ret = request_irq(pci_irq_vector(pdev, i), irq_handler,
   105					  IRQF_SHARED, dev_name(&pdev->dev), vmamp_pci);
   106			if (ret)
   107				goto free_irq;
   108		}
   109	
   110		vmamp_pci->vmamp.dev = &pdev->dev;
   111		vmamp_pci->vmamp.ops = &vmamp_pci_ops;
   112		pci_set_drvdata(pdev, vmamp_pci);
   113		pci_set_master(pdev);
   114	
   115		/* First 4KB are reserved */
   116		vmamp_pci->vmamp.shmem = vmamp_pci->ram + 4 * 1024;
   117		vmamp_pci->vmamp.shmem_size = 8 * 1024;
   118		memset(vmamp_pci->vmamp.shmem, 0, vmamp_pci->vmamp.shmem_size);
   119	
   120		ret = virtio_msg_amp_register(&vmamp_pci->vmamp);
   121		if (ret)
   122			goto clear_master;
   123	
   124		return 0;
   125	
   126	clear_master:
   127		pci_clear_master(pdev);
   128	free_irq:
   129		while (--i >= 0)
   130			free_irq(pci_irq_vector(pdev, i), vmamp_pci);
 > 131		pci_free_irq_vectors(pdev);
   132	unmap_ram:
   133		pci_iounmap(pdev, vmamp_pci->ram);
   134	error:
   135		dev_err(&pdev->dev, "probe failed: %d\n", ret);
   136		return ret;
   137	}
   138	
   139	static void vmamp_pci_remove(struct pci_dev *pdev)
   140	{
   141		struct vmamp_pci *vmamp_pci = pci_get_drvdata(pdev);
   142		int i;
   143	
   144		virtio_msg_amp_unregister(&vmamp_pci->vmamp);
   145		pci_clear_master(pdev);
   146	
   147		for (i = vmamp_pci->vectors - 1; i >= 0; i--)
   148			free_irq(pci_irq_vector(pdev, i), vmamp_pci);
   149	
   150		pci_free_irq_vectors(pdev);
   151		pci_iounmap(pdev, vmamp_pci->ram);
   152	}
   153	
   154	static void vmamp_pci_shutdown(struct pci_dev *pdev)
   155	{
   156		struct vmamp_pci *vmamp_pci = pci_get_drvdata(pdev);
   157	
   158		/*
   159		 * Do the minimal to make device harmless. Need to tell our virtio-msg
   160		 * peer we're going down.
   161		 */
   162		virtio_msg_amp_unregister(&vmamp_pci->vmamp);
   163	}
   164	
   165	static const struct pci_device_id vmamp_pci_id_table[] = {
   166		{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, 0x9039) },
   167		{ 0 }
   168	};
   169	MODULE_DEVICE_TABLE(pci, vmamp_pci_id_table);
   170	
 > 171	static struct pci_driver vmamp_pci_driver = {
   172		.name = "virtio_msg_amp_pci",
   173		.id_table = vmamp_pci_id_table,
   174		.probe = vmamp_pci_probe,
   175		.remove = vmamp_pci_remove,
   176		.shutdown = vmamp_pci_shutdown,
   177	};
 > 178	module_pci_driver(vmamp_pci_driver);
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
