Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E063B8BD9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575953; cv=none; b=pr5Nhm1f3MIQyDuA/JnVbs2sms94tSdaaHcCzx1HkSUslRaKacm6raR4PS0mDNnwTqog8dzmXZFgUtdp0WXrx3RLgYw6nZ3d3BOzvyqfLgNgBflgm8yGel0zzDbgykbSV3SNJiUF41comSOCrRbHKvRV9hI7oxxIY19GIyAZpy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575953; c=relaxed/simple;
	bh=l7hAy5JWW8iWXF8OI6IZixsOLIAgVdU/uea0QMTgbLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RyGu7eKtEzahnD7Xhohzp4YBtLkkq4p8S4A4XFyJlnxeIedhi4oK2j+OTlMlP9qBjk6PeGNMAP4ujGt64WufWRK+6rQUCpB4pcsn8e/ebcIG/vWlz1l8r25jLfq7sWI24ErMjpETf4pXWkzIgzGO1SjSVkLdO6gQTk4SpdXVjjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7gAhb2G; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7gAhb2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775575942; x=1807111942;
  h=date:from:to:cc:subject:message-id;
  bh=l7hAy5JWW8iWXF8OI6IZixsOLIAgVdU/uea0QMTgbLs=;
  b=N7gAhb2GENdhKPZDSUwp8ta/ZcP6VkbWVEmJtvj7ToeJlzgm0IscgB0x
   YJhaW4xHzrnBXu5suEYCOHl/89GtTJjlTuCIqXXkFSBnikJ7Kaf6Jqifq
   3LDv71cvnFaRI6wldb2u6qjwjk59nZ3hFNl0VgT00dSbk+jPvU9olqIvs
   fcPf3V+l/NIqv4FFQSiLE+uyzeb7C77hVZE6GCgiREzxDH4RHLB/7uTFW
   H/QSO98vEXbLI4H4qATcitGwTjDQR3rW4ifTvnRda3whN8CfTo5kYlaIC
   1b+I0l6wm/HfyXv0q+4acEKrE+XdMHH0ojWODHkYbTBa8k+qhi/n5mJec
   g==;
X-CSE-ConnectionGUID: lBabEoG6R0CcyrO7h2cyRw==
X-CSE-MsgGUID: TnXUum1QRfSSrAqj8e8dqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80400166"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80400166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:32:19 -0700
X-CSE-ConnectionGUID: Zcxp8kE2R3uOA/Gqxa30nA==
X-CSE-MsgGUID: lOIqRUkkR8eT5fYmK9wO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251490552"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2026 08:32:18 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA8PX-000000000kl-3D6u;
	Tue, 07 Apr 2026 15:32:15 +0000
Date: Tue, 07 Apr 2026 23:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 20/22]
 drivers/virtio/virtio_msg_amp_pci.c:116:32: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202604072336.XtFz7KKD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   b382c54fa38099ef72901ecdd4e3edd3e3998d5a
commit: d51c9e25aa3b090302ca726b9c01d1e9310a700e [20/22] virtio: msg: Add generic PCI transport driver for virtio-msg AMP
config: csky-randconfig-r122-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072336.XtFz7KKD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072336.XtFz7KKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072336.XtFz7KKD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_amp_pci.c:116:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *shmem @@     got void [noderef] __iomem * @@
   drivers/virtio/virtio_msg_amp_pci.c:116:32: sparse:     expected unsigned char [usertype] *shmem
   drivers/virtio/virtio_msg_amp_pci.c:116:32: sparse:     got void [noderef] __iomem *

vim +116 drivers/virtio/virtio_msg_amp_pci.c

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
 > 116		vmamp_pci->vmamp.shmem = vmamp_pci->ram + 4 * 1024;
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
