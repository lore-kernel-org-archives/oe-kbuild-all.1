Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352638E5D7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552723; cv=none; b=T7W6ZL0wcWzVVVzGg0Yj3j7+OmXoqrhcT6jKINOq5HNRN4W2AuZq3mGOWhRovIOvz0G2hWzbGzcF+5Gvg7gAG2clC7LvyHbNY6l/O6KQz9f32mSf8LF6WxZ77yXkp8iKKV0IlBOnaIl6kvAIf+jWKVoupueqg5IQyUGO8egjrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552723; c=relaxed/simple;
	bh=loJf0I+eYSyLeTbqdFIh+kZoMPo3Ms2gkKkLjlhwxcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FadHX/w74EXNqqy+bqumhBCpwd6uQLPoHgLsPK13ICVfW4vemECz4+R7sBfQ+edi8yOC0Ig894gKKJAGGo8nHcIa8aRA5G3lciK0AYVpVv2vpob+vT0Z14zAPxNBpDpOSpALiFgTIfSA45nwL8B5V0D8GmVz2D4+GhS39LfCPgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9QEc1UJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9QEc1UJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775552722; x=1807088722;
  h=date:from:to:cc:subject:message-id;
  bh=loJf0I+eYSyLeTbqdFIh+kZoMPo3Ms2gkKkLjlhwxcg=;
  b=G9QEc1UJGdNE7DUZSpv3sTiMJxPec6THkZO5rKoEFXOkSB0kno8dbgQp
   dinCX8X+++Z3HMxYQDDNimBmUltTxzSNKaU6hNu2t17nIIj21EfZw5xy8
   Zoxe3zkH9BCvMY+8xIbJwOi/CWZoTfWqYdt1ALhH4J1eApC28iKG0yakV
   I/ovd/spverF0fGIMMB0cCZSruuWQl90QMxE0YkMMEWxaTAZuGckcwLA7
   vFrl6ga6oK4KxWR3rReqT5xZ3DwTTez0Br5bvzrL6aMzM711bWzH1LV5/
   NfQ93Q92KDJM9uS6DQmhsHKQ1UFMmP+T/lH+7F9m1Zjq7HTrYM2vhQhnS
   w==;
X-CSE-ConnectionGUID: uCdA9+PDTj+hBY8foELvRQ==
X-CSE-MsgGUID: SImIm9AQSoGxT+vDDEiNjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="101965131"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="101965131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 02:05:19 -0700
X-CSE-ConnectionGUID: G+xz0pNBSy2IDVP0vGJmuQ==
X-CSE-MsgGUID: 5ylVS5ZgTOiisBMxlfaRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232149809"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 02:05:18 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA2N1-000000000PT-1uI8;
	Tue, 07 Apr 2026 09:05:15 +0000
Date: Tue, 07 Apr 2026 17:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 20/22]
 drivers/virtio/virtio_msg_amp_pci.c:84:26: error: implicit declaration of
 function 'pci_iomap_wc'; did you mean 'pcim_iomap'?
Message-ID: <202604071721.0XEDYxnl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   781a260a2b5802f6ac428e12ffe8a54d0c6330eb
commit: 47d31ad5e63c3d62a6b26136692b9b480bb11fb3 [20/22] virtio: msg: Add generic PCI transport driver for virtio-msg AMP
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260407/202604071721.0XEDYxnl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071721.0XEDYxnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071721.0XEDYxnl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_amp_pci.c: In function 'vmamp_pci_probe':
>> drivers/virtio/virtio_msg_amp_pci.c:84:26: error: implicit declaration of function 'pci_iomap_wc'; did you mean 'pcim_iomap'? [-Wimplicit-function-declaration]
      84 |         vmamp_pci->ram = pci_iomap_wc(pdev, 1, 0);
         |                          ^~~~~~~~~~~~
         |                          pcim_iomap
>> drivers/virtio/virtio_msg_amp_pci.c:84:24: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      84 |         vmamp_pci->ram = pci_iomap_wc(pdev, 1, 0);
         |                        ^
   drivers/virtio/virtio_msg_amp_pci.c:94:30: error: implicit declaration of function 'pci_msix_vec_count' [-Wimplicit-function-declaration]
      94 |         vmamp_pci->vectors = pci_msix_vec_count(pdev);
         |                              ^~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_msg_amp_pci.c:131:9: error: implicit declaration of function 'pci_free_irq_vectors'; did you mean 'pci_alloc_irq_vectors'? [-Wimplicit-function-declaration]
     131 |         pci_free_irq_vectors(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         pci_alloc_irq_vectors
   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from drivers/virtio/virtio_msg_amp_pci.c:10:
>> arch/sh/include/asm/io.h:122:21: error: implicit declaration of function 'pci_iounmap'; did you mean 'pcim_iounmap'? [-Wimplicit-function-declaration]
     122 | #define pci_iounmap pci_iounmap
         |                     ^~~~~~~~~~~
   drivers/virtio/virtio_msg_amp_pci.c:133:9: note: in expansion of macro 'pci_iounmap'
     133 |         pci_iounmap(pdev, vmamp_pci->ram);
         |         ^~~~~~~~~~~
   drivers/virtio/virtio_msg_amp_pci.c: At top level:
   drivers/virtio/virtio_msg_amp_pci.c:178:1: warning: data definition has no type or storage class
     178 | module_pci_driver(vmamp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_msg_amp_pci.c:178:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
   drivers/virtio/virtio_msg_amp_pci.c:178:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/virtio/virtio_msg_amp_pci.c:171:26: warning: 'vmamp_pci_driver' defined but not used [-Wunused-variable]
     171 | static struct pci_driver vmamp_pci_driver = {
         |                          ^~~~~~~~~~~~~~~~


vim +84 drivers/virtio/virtio_msg_amp_pci.c

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
  > 84		vmamp_pci->ram = pci_iomap_wc(pdev, 1, 0);
    85		if (!vmamp_pci->ram) {
    86			ret = -ENOMEM;
    87			goto error;
    88		}
    89	
    90		/*
    91		 * Grab all vectors although we can only coalesce them into a single
    92		 * notifier. This avoids missing any event.
    93		 */
    94		vmamp_pci->vectors = pci_msix_vec_count(pdev);
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
   131		pci_free_irq_vectors(pdev);
   132	unmap_ram:
   133		pci_iounmap(pdev, vmamp_pci->ram);
   134	error:
   135		dev_err(&pdev->dev, "probe failed: %d\n", ret);
   136		return ret;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
