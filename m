Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D6CA932
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 00:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742431926; cv=none; b=SUAYr9PKxtu5+ynnp7ipyJHdrcv3Ib5T3ed5y8WalJObeJOGyQJn93ty1ScA7Ez8C/maKV+A8UQacvnYiiWBauBfC7aHzH251lzPM9QFC9d8dOBnOVTYGHbI7rWAOKlGzTGqZK9VxZRNurM7/SLKBIFtcfC9EwtCTrRA2p4Aepc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742431926; c=relaxed/simple;
	bh=oJ4XPcrmie1kikJkOL0sH31sWUW2bxbCzpTmKk8FgJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slu1FO+KcPIIlsWkmHk3vpEaCPVlDtXSWyEqRDac8gQMcy4lSTIh7L9TjaKi2YY9bv0tAifFtAPHkBQvp7FgV6/bcbgFSvkeC2E4AY6ytPXSvHSVuWwzJXrH0x6/7R2kbVIJyCmnJ2KRM4XcOFREyvDOQr1EHtXXIatABOHwuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHDU+Xgj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHDU+Xgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742431923; x=1773967923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJ4XPcrmie1kikJkOL0sH31sWUW2bxbCzpTmKk8FgJw=;
  b=AHDU+XgjpmOcXEf851ZZxVwcwDDAXyre4Z2hHrr0piI6YACFfMLiifIB
   nJqnCEvDg8DLgCxMrvtutJQmRojezfJ2Xbm60iQvVUEl0f/eXTYwoHVZn
   1xdJG/oCfUSNJAGe1OmUE35ovJ7jmZXgSjv7xBtxgpoHCY27jf7W6tYew
   5ItQTHIbGEund1f4X3u0VfFoE5j3jZyuTP2DIUq9+pACjTTxB0faf7wmz
   t1Kx0/ohNQdCv7cgzFFrend/+nk47w12qziAV8lhRzuSG6v2sRtlMXqvd
   YEHQ2mpvTyAWIp19H7S0jL9Dg5lNnF7Febp07fTh+ZFZkEhYZ3oxXwtpZ
   A==;
X-CSE-ConnectionGUID: A/6zUx+3RbW97QXiVhWE3g==
X-CSE-MsgGUID: 8ATt7vArSgOdxiFruFJrMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55022865"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="55022865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 17:52:03 -0700
X-CSE-ConnectionGUID: 4bbyf0rBTSCUBz6leTXfDQ==
X-CSE-MsgGUID: rCR2LQNhTES0QIcCbOy5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="127062210"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2025 17:52:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv48d-00003r-1r;
	Thu, 20 Mar 2025 00:51:59 +0000
Date: Thu, 20 Mar 2025 08:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2045/2045] drivers/coda/coda_pci.c:228: warning:
 Function parameter or member 'p' not described in 'virtcca_pci_get_rom_size'
Message-ID: <202503200858.XSvAPfQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   961f596cd0017f5f254fb4b0ab9f5b9975177b84
commit: 67773feaf933058b9e64a9089345b3c64f823acd [2045/2045] VirtCCA: cvm support UEFI boot
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200858.XSvAPfQM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200858.XSvAPfQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200858.XSvAPfQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/coda/coda_pci.c:36: warning: expecting prototype for virtcca_pci_write_msi_msg(). Prototype was for virtcca_pci_write_msg_msi() instead
>> drivers/coda/coda_pci.c:228: warning: Function parameter or member 'p' not described in 'virtcca_pci_get_rom_size'
>> drivers/coda/coda_pci.c:228: warning: Excess function parameter 'pdev' description in 'virtcca_pci_get_rom_size'


vim +228 drivers/coda/coda_pci.c

    28	
    29	/**
    30	 * virtcca_pci_write_msi_msg - secure dev write msi msg
    31	 * @desc: MSI-X description
    32	 * @msg: Msg information
    33	 *
    34	 **/
    35	bool virtcca_pci_write_msg_msi(struct msi_desc *desc, struct msi_msg *msg)
  > 36	{
    37		if (!is_virtcca_cvm_enable())
    38			return false;
    39	
    40		void __iomem *base = pci_msix_desc_addr(desc);
    41		u32 ctrl = desc->pci.msix_ctrl;
    42		bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);
    43		u64 pbase = mmio_va_to_pa(base);
    44		struct pci_dev *pdev = (desc->dev != NULL &&
    45			dev_is_pci(desc->dev)) ? to_pci_dev(desc->dev) : NULL;
    46	
    47		if (!is_cc_dev(pci_dev_id(pdev)))
    48			return false;
    49	
    50		u64 addr = (u64)msg->address_lo | ((u64)msg->address_hi << 32);
    51	
    52		if (addr) {
    53			/* Get the offset of the its register of a specific device */
    54			u64 offset = addr - CVM_MSI_ORIG_IOVA;
    55	
    56			addr = get_g_cc_dev_msi_addr(pci_dev_id(pdev));
    57			addr += offset;
    58			if (!addr)
    59				return true;
    60		}
    61		tmi_mmio_write(pbase + PCI_MSIX_ENTRY_LOWER_ADDR,
    62			lower_32_bits(addr), CVM_RW_32_BIT, pci_dev_id(pdev));
    63		tmi_mmio_write(pbase + PCI_MSIX_ENTRY_UPPER_ADDR,
    64			upper_32_bits(addr), CVM_RW_32_BIT, pci_dev_id(pdev));
    65		tmi_mmio_write(pbase + PCI_MSIX_ENTRY_DATA,
    66			msg->data, CVM_RW_32_BIT, pci_dev_id(pdev));
    67	
    68		if (unmasked)
    69			pci_msix_write_vector_ctrl(desc, ctrl);
    70		tmi_mmio_read(pbase + PCI_MSIX_ENTRY_DATA,
    71			CVM_RW_32_BIT, pci_dev_id(pdev));
    72	
    73		return true;
    74	}
    75	
    76	void virtcca_msix_prepare_msi_desc(struct pci_dev *dev,
    77		struct msi_desc *desc, void __iomem *addr)
    78	{
    79		desc->pci.msix_ctrl = tmi_mmio_read(mmio_va_to_pa(addr + PCI_MSIX_ENTRY_VECTOR_CTRL),
    80			CVM_RW_32_BIT, pci_dev_id(dev));
    81	}
    82	
    83	/*
    84	 * If it is a safety device, write vector ctrl need
    85	 * use tmi interface
    86	 */
    87	bool virtcca_pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
    88	{
    89		if (!is_virtcca_cvm_enable())
    90			return false;
    91	
    92		void __iomem *desc_addr = pci_msix_desc_addr(desc);
    93		struct pci_dev *pdev = (desc->dev != NULL &&
    94			dev_is_pci(desc->dev)) ? to_pci_dev(desc->dev) : NULL;
    95	
    96		if (pdev == NULL || !is_cc_dev(pci_dev_id(pdev)))
    97			return false;
    98	
    99		if (desc->pci.msi_attrib.can_mask)
   100			tmi_mmio_write(mmio_va_to_pa(desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL),
   101				ctrl, CVM_RW_32_BIT, pci_dev_id(pdev));
   102		return true;
   103	}
   104	
   105	/*
   106	 * If it is a safety device, read msix need
   107	 * use tmi interface
   108	 */
   109	bool virtcca_pci_msix_mask(struct msi_desc *desc)
   110	{
   111		if (!is_virtcca_cvm_enable())
   112			return false;
   113	
   114		struct pci_dev *pdev = (desc->dev != NULL &&
   115			dev_is_pci(desc->dev)) ? to_pci_dev(desc->dev) : NULL;
   116	
   117		if (pdev == NULL || !is_cc_dev(pci_dev_id(pdev)))
   118			return false;
   119	
   120		/* Flush write to device */
   121		tmi_mmio_read(mmio_va_to_pa(desc->pci.mask_base), CVM_RW_32_BIT, pci_dev_id(pdev));
   122		return true;
   123	}
   124	
   125	/**
   126	 * virtcca_msix_mask_all_cc - mask all secure dev msix c
   127	 * @dev: Pointer to the pci_dev data structure of MSI-X device function
   128	 * @base: Io address
   129	 * @tsize: Number of entry
   130	 * @dev_num: Dev number
   131	 *
   132	 * Returns:
   133	 * %0 if msix mask all cc device success
   134	 **/
   135	int virtcca_msix_mask_all_cc(struct pci_dev *dev, void __iomem *base, int tsize, u64 dev_num)
   136	{
   137		int i;
   138		u16 rw_ctrl;
   139		u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
   140		u64 pbase = mmio_va_to_pa(base);
   141	
   142		if (pci_msi_ignore_mask)
   143			goto out;
   144	
   145		for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE) {
   146			tmi_mmio_write(pbase + PCI_MSIX_ENTRY_VECTOR_CTRL,
   147				ctrl, CVM_RW_32_BIT, dev_num);
   148		}
   149	
   150	out:
   151		pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &rw_ctrl);
   152		rw_ctrl &= ~PCI_MSIX_FLAGS_MASKALL;
   153		rw_ctrl |= 0;
   154		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, rw_ctrl);
   155	
   156		pcibios_free_irq(dev);
   157		return 0;
   158	}
   159	
   160	/* If device is secure dev, read config need transfer to tmm module */
   161	int virtcca_pci_generic_config_read(void __iomem *addr, unsigned char bus_num,
   162		unsigned int devfn, int size, u32 *val)
   163	{
   164		u32 cvm_bit = size == 1 ? CVM_RW_8_BIT : size == 2 ? CVM_RW_16_BIT : CVM_RW_32_BIT;
   165	
   166		*val = tmi_mmio_read(mmio_va_to_pa(addr), cvm_bit, PCI_DEVID(bus_num, devfn));
   167		return 0;
   168	}
   169	
   170	/* If device is secure dev, write config need transfer to tmm module */
   171	int virtcca_pci_generic_config_write(void __iomem *addr, unsigned char bus_num,
   172		unsigned int devfn, int size, u32 val)
   173	{
   174		u32 cvm_bit = size == 1 ? CVM_RW_8_BIT : size == 2 ? CVM_RW_16_BIT : CVM_RW_32_BIT;
   175	
   176		tmi_mmio_write(mmio_va_to_pa(addr), val, cvm_bit, PCI_DEVID(bus_num, devfn));
   177		return 0;
   178	}
   179	
   180	/* Judge startup virtcca_cvm_host is enable and device is secure or not */
   181	bool is_virtcca_pci_io_rw(struct vfio_pci_core_device *vdev)
   182	{
   183		if (!is_virtcca_cvm_enable())
   184			return false;
   185	
   186		struct pci_dev *pdev = vdev->pdev;
   187		bool cc_dev = pdev == NULL ? false : is_cc_dev(pci_dev_id(pdev));
   188	
   189		if (cc_dev)
   190			return true;
   191	
   192		return false;
   193	}
   194	EXPORT_SYMBOL_GPL(is_virtcca_pci_io_rw);
   195	
   196	/* Transfer to tmm write io value */
   197	void virtcca_pci_io_write(struct vfio_pci_core_device *vdev, u64 val,
   198		u64 size, void __iomem *io)
   199	{
   200		struct pci_dev *pdev = vdev->pdev;
   201	
   202		WARN_ON(tmi_mmio_write(mmio_va_to_pa(io), val, size, pci_dev_id(pdev)));
   203	}
   204	EXPORT_SYMBOL_GPL(virtcca_pci_io_write);
   205	
   206	/* Transfer to tmm read io value */
   207	u64 virtcca_pci_io_read(struct vfio_pci_core_device *vdev,
   208		u64 size, void __iomem *io)
   209	{
   210		struct pci_dev *pdev = vdev->pdev;
   211	
   212		return tmi_mmio_read(mmio_va_to_pa(io), size, pci_dev_id(pdev));
   213	}
   214	EXPORT_SYMBOL_GPL(virtcca_pci_io_read);
   215	
   216	/**
   217	 * virtcca_pci_get_rom_size - obtain the actual size of the ROM image
   218	 * @pdev: target PCI device
   219	 * @rom: kernel virtual pointer to image of ROM
   220	 * @size: size of PCI window
   221	 *  return: size of actual ROM image
   222	 *
   223	 * Determine the actual length of the ROM image.
   224	 * The PCI window size could be much larger than the
   225	 * actual image size.
   226	 */
   227	size_t virtcca_pci_get_rom_size(void *p, void __iomem *rom, size_t size)
 > 228	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
