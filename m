Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A60345CAE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 21:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778190586; cv=none; b=aNEXdUnWnthFi84VT748Ha3L4uVMPpXpFAdvBrDwjgBPqX5zKMgKAYr8WROtsVgfL0pvB8O+ErtRNvVQmXyG3uXyXew14Y3L3f4V8m73LWE6s6dwVEfoxM13Q9oi7iU0T14+eGUeBbnN50xEOwoByC8fTY2vCnhHWiJiBevudoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778190586; c=relaxed/simple;
	bh=0CcW3ZQjJUxMksG6iI0Hrjd+Ijj7bQBDi/+B9WtZMNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PBQ3IbAki5ATg5nhYVZGonnWQR9nnOEJr4u00fGfWStDQmtWyud7+e753JoEJjGS7qR5SQpVWhi1preVrnoFCkp2gdSLQkGM1lwj086+YBKSnYMzSy7A/mOW5T2dxqoUwOG96L7tiXehpJ9gyJ+xVjN3ZR1U6HAnZ73fGtnJhxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj5DddBH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj5DddBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778190585; x=1809726585;
  h=date:from:to:cc:subject:message-id;
  bh=0CcW3ZQjJUxMksG6iI0Hrjd+Ijj7bQBDi/+B9WtZMNo=;
  b=Mj5DddBHKnzYauWfXs7dbXSkkDhvvQiRA/H1wMtn2t/8d978If8gFGzN
   DyS+R9Ylss2xf6gHs7tBm1XxAL5QhsOotXV7PXGuIedqjAbX4uCK89REe
   wXDWdsyFA9mnUwncmCcND6C4WCn7RrvO+v+u9VjUAB/ZKOaFxGpPCqdVo
   OohcAZNnZKM17QtBr3MfFayrCNIq2/NCZS1jtttfGjqxrRN+bqkSGBgcV
   IxLY3AalR8/NjfUDMv5goj4gvHDtbMUfhQyLlJBGq8yHrVL1OqPS6bnGj
   auMCkMcznwWTrnJYlDcwJtPscNttyEnqsh2oo0SDt+vilfXug4D0NNlkM
   A==;
X-CSE-ConnectionGUID: H0qUAoFOQvi2QB3CMfAHNA==
X-CSE-MsgGUID: avFqGSP8R1uV/GUOZ/1zPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82775724"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="82775724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 14:49:44 -0700
X-CSE-ConnectionGUID: o0oDjNNxSiaGABwp7k/dvQ==
X-CSE-MsgGUID: rej8jVgsRjCXDconQrFvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="238374528"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 14:49:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL6bE-000000006x3-0pIP;
	Thu, 07 May 2026 21:49:40 +0000
Date: Thu, 07 May 2026 23:49:32 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Evans <mattev@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_core.c:1775:13: warning: unused
 variable 'ret'
Message-ID: <202605072358.FqfGLAt1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Matt-Evans/vfio-pci-Set-up-barmap-in-vfio_pci_core_enable/20260426-165316
head:   3a69d9395a88f53b7a52aa91446b93c305a510ba
commit: 3a69d9395a88f53b7a52aa91446b93c305a510ba vfio/pci: Remove vfio_pci_core_setup_barmap()
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260507/202605072358.FqfGLAt1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072358.FqfGLAt1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072358.FqfGLAt1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_core.c: In function 'vfio_pci_core_mmap':
>> drivers/vfio/pci/vfio_pci_core.c:1775:13: warning: unused variable 'ret' [-Wunused-variable]
    1775 |         int ret;
         |             ^~~


vim +/ret +1775 drivers/vfio/pci/vfio_pci_core.c

11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1767  
ff53edf6d6ab09 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy          2021-08-26  1768  int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1769  {
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy          2021-08-26  1770  	struct vfio_pci_core_device *vdev =
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy          2021-08-26  1771  		container_of(core_vdev, struct vfio_pci_core_device, vdev);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1772  	struct pci_dev *pdev = vdev->pdev;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1773  	unsigned int index;
34002f54d2bd8e drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-10-10  1774  	u64 phys_len, req_len, pgoff, req_start;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31 @1775  	int ret;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1776  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1777  	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1778  
909290786ea335 drivers/vfio/pci/vfio_pci.c      Christian A. Ehrhardt 2021-04-12  1779  	if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
909290786ea335 drivers/vfio/pci/vfio_pci.c      Christian A. Ehrhardt 2021-04-12  1780  		return -EINVAL;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1781  	if (vma->vm_end < vma->vm_start)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1782  		return -EINVAL;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1783  	if ((vma->vm_flags & VM_SHARED) == 0)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1784  		return -EINVAL;
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1785  	if (index >= VFIO_PCI_NUM_REGIONS) {
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1786  		int regnum = index - VFIO_PCI_NUM_REGIONS;
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1787  		struct vfio_pci_region *region = vdev->region + regnum;
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1788  
909290786ea335 drivers/vfio/pci/vfio_pci.c      Christian A. Ehrhardt 2021-04-12  1789  		if (region->ops && region->ops->mmap &&
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1790  		    (region->flags & VFIO_REGION_INFO_FLAG_MMAP))
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1791  			return region->ops->mmap(vdev, region, vma);
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1792  		return -EINVAL;
a15b1883fee11e drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy  2018-12-19  1793  	}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1794  	if (index >= VFIO_PCI_ROM_REGION_INDEX)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1795  		return -EINVAL;
05f0c03fbac181 drivers/vfio/pci/vfio_pci.c      Yongji Xie            2016-06-30  1796  	if (!vdev->bar_mmap_supported[index])
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1797  		return -EINVAL;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1798  
05f0c03fbac181 drivers/vfio/pci/vfio_pci.c      Yongji Xie            2016-06-30  1799  	phys_len = PAGE_ALIGN(pci_resource_len(pdev, index));
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1800  	req_len = vma->vm_end - vma->vm_start;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1801  	pgoff = vma->vm_pgoff &
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1802  		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1803  	req_start = pgoff << PAGE_SHIFT;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1804  
05f0c03fbac181 drivers/vfio/pci/vfio_pci.c      Yongji Xie            2016-06-30  1805  	if (req_start + req_len > phys_len)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1806  		return -EINVAL;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1807  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1808  	vma->vm_private_data = vdev;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1809  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
aac6db75a9fc2c drivers/vfio/pci/vfio_pci_core.c Alex Williamson       2024-05-29  1810  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1811  
11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1812  	/*
aac6db75a9fc2c drivers/vfio/pci/vfio_pci_core.c Alex Williamson       2024-05-29  1813  	 * Set vm_flags now, they should not be changed in the fault handler.
aac6db75a9fc2c drivers/vfio/pci/vfio_pci_core.c Alex Williamson       2024-05-29  1814  	 * We want the same flags and page protection (decrypted above) as
aac6db75a9fc2c drivers/vfio/pci/vfio_pci_core.c Alex Williamson       2024-05-29  1815  	 * io_remap_pfn_range() would set.
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1816  	 *
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1817  	 * VM_ALLOW_ANY_UNCACHED: The VMA flag is implemented for ARM64,
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1818  	 * allowing KVM stage 2 device mapping attributes to use Normal-NC
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1819  	 * rather than DEVICE_nGnRE, which allows guest mappings
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1820  	 * supporting write-combining attributes (WC). ARM does not
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1821  	 * architecturally guarantee this is safe, and indeed some MMIO
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1822  	 * regions like the GICv2 VCPU interface can trigger uncontained
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1823  	 * faults if Normal-NC is used.
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1824  	 *
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1825  	 * To safely use VFIO in KVM the platform must guarantee full
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1826  	 * safety in the guest where no action taken against a MMIO
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1827  	 * mapping can trigger an uncontained failure. The assumption is
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1828  	 * that most VFIO PCI platforms support this for both mapping types,
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1829  	 * at least in common flows, based on some expectations of how
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1830  	 * PCI IP is integrated. Hence VM_ALLOW_ANY_UNCACHED is set in
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1831  	 * the VMA flags.
11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1832  	 */
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1833  	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
a39d3a966a0909 drivers/vfio/pci/vfio_pci_core.c Ankit Agrawal         2024-02-24  1834  			VM_DONTEXPAND | VM_DONTDUMP);
11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1835  	vma->vm_ops = &vfio_pci_mmap_ops;
11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1836  
11c4cd07ba111a drivers/vfio/pci/vfio_pci.c      Alex Williamson       2020-04-28  1837  	return 0;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1838  }
7fa005caa35ed9 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy          2021-08-26  1839  EXPORT_SYMBOL_GPL(vfio_pci_core_mmap);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson       2012-07-31  1840  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
