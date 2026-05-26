Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344ED37B007
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810278; cv=none; b=E49EGLYbKCqtIfJmztBd2M3dWZmcclpniJxDsWyNs08doB2zdmuRtqn4Ik9opoH3Vyfxn+h0NEqHzY7wU6acHFPQAdBOp6FhyksQxAH5I8ilS9RLTe0lUO2Bs8lcc9OlTDH/oaeegW+2oAqbIkEpDeQdU2nC3mV50gTUZVL4guI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810278; c=relaxed/simple;
	bh=Tc1URCwo8hRkgnZgpzM2BOuy2M2fNHtYJC5wcp7KOns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VIoEUyK1VjcjRRVftFfQBGkh0YFfYoTlJ9/pep6pheCnU0JABJsrgr/hMPmHX2GGexKA8cteX/ep7YsKgayd9HKOBEpMBLa7br8DVdaNbf4apEI2TdWwKLmCwRMUq/l575zdnH8rPJk4fBuRzKPzgwkNW4R2ZNrFS476lgHk3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPNHsPou; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPNHsPou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779810276; x=1811346276;
  h=date:from:to:cc:subject:message-id;
  bh=Tc1URCwo8hRkgnZgpzM2BOuy2M2fNHtYJC5wcp7KOns=;
  b=DPNHsPouXGLoSQWVYGGnzRQ510+n/O7/ZskNkvw0Cx5ewz1g/Z3/bfCH
   y9y3A52uOBddAmH4+SgxZR0Knc7jFDypBIp1X5jV5byZHinYx82UGlwgq
   dThTk9vcvZIuJSQvIcnGfwixPwwRLpGbmc8O4+56BxuexIojk9OtGh+5X
   rUJmuX0zWJYMBkhG51Eid0qZCYUuI3WGxPm3Fk1cmgiRqC9SM4d3vR4Qz
   0EztGoR5v+JPag1Wkq+3d0sZpzF4DESq1Cj8V8kzpnh7E+4KA4EB+weR/
   6Ftc17CNpFQUi7eTqrs2SXdls9pvjVAwKy5jDsfbp2F3kDiBehJJvoIS6
   g==;
X-CSE-ConnectionGUID: +IZdMYflRYOzU/wI4iJV3Q==
X-CSE-MsgGUID: N8IK56M2RBeIMN/7BRhJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84514913"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="84514913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:44:36 -0700
X-CSE-ConnectionGUID: ybWR7h0XTGiY0t+RX9K1Xg==
X-CSE-MsgGUID: OiyvWRRtQ5KJ6x2RsolHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237789008"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 08:44:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRtxH-00000000CRF-2VRl;
	Tue, 26 May 2026 15:44:31 +0000
Date: Tue, 26 May 2026 17:44:13 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/pci-tph.h:48:10: error: 'PCI_TPH_LOC_NONE'
 undeclared
Message-ID: <202605261728.kooXGibA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260526-121037
head:   aeabc1a28fa5791d80195a8d37acf629a083a486
commit: bdb8ee095dd1a800a81e68da79b4118fa6f970b0 PCI/TPH: Export pcie_tph_get_st_modes() for external use
date:   12 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605261728.kooXGibA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261728.kooXGibA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261728.kooXGibA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/rdma/ib_verbs.h:46,
                    from ./include/linux/lsm_audit.h:25,
                    from security/lsm_audit.c:28:
   ./include/linux/pci-tph.h: In function 'pcie_tph_get_st_table_loc':
>> ./include/linux/pci-tph.h:48:10: error: 'PCI_TPH_LOC_NONE' undeclared (first use in this function)
      48 | { return PCI_TPH_LOC_NONE; }
         |          ^~~~~~~~~~~~~~~~
   ./include/linux/pci-tph.h:48:10: note: each undeclared identifier is reported only once for each function it appears in


vim +/PCI_TPH_LOC_NONE +48 ./include/linux/pci-tph.h

    22	
    23	#ifdef CONFIG_PCIE_TPH
    24	int pcie_tph_set_st_entry(struct pci_dev *pdev,
    25				  unsigned int index, u16 tag);
    26	int pcie_tph_get_cpu_st(struct pci_dev *dev,
    27				enum tph_mem_type mem_type,
    28				unsigned int cpu, u16 *tag);
    29	void pcie_disable_tph(struct pci_dev *pdev);
    30	int pcie_enable_tph(struct pci_dev *pdev, int mode);
    31	u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
    32	u32 pcie_tph_get_st_table_loc(struct pci_dev *pdev);
    33	u8 pcie_tph_get_st_modes(struct pci_dev *pdev);
    34	#else
    35	static inline int pcie_tph_set_st_entry(struct pci_dev *pdev,
    36						unsigned int index, u16 tag)
    37	{ return -EINVAL; }
    38	static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
    39					      enum tph_mem_type mem_type,
    40					      unsigned int cpu, u16 *tag)
    41	{ return -EINVAL; }
    42	static inline void pcie_disable_tph(struct pci_dev *pdev) { }
    43	static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
    44	{ return -EINVAL; }
    45	static inline u16 pcie_tph_get_st_table_size(struct pci_dev *pdev)
    46	{ return 0; }
    47	static inline u32 pcie_tph_get_st_table_loc(struct pci_dev *pdev)
  > 48	{ return PCI_TPH_LOC_NONE; }
    49	static inline u8 pcie_tph_get_st_modes(struct pci_dev *pdev)
    50	{ return 0; }
    51	#endif
    52	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
