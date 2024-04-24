Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEA15B99E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970222; cv=none; b=nbx5mjl68oMT4/hfpGUvJKtnYEk05k3cwfT7kKch/r3JWEbkw04cmxBBoghNM51FzUBHR/KhDabckRHxgIFz2TXP/jQbMGaXeeJIg1VUwrbWztBURo40wvtBbUBzmHoeBIOBj0L+O1urcCQ5btgMDRnE5DlfHKS4w+RDbAGeOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970222; c=relaxed/simple;
	bh=Na03EZ4M0BoY2aVd84qx13LApk0vDLfNnDJxd2Jk/2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVx+AFo9D55kuJHqmAZJJEWQ0utoQW7jBHvGQ6jLT1q4+3kQt5Hy+kNff8oJEXQ6yn7jN3TsWFI3V3IXIfMqd/ARwoJ9mqUrTo/FbL+STsupTeAR1mMFiKGG6NwrWsDI0ywABw9g1pSCV4iyffa8IbZstVZ2DUhnrL19Xr8P8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4IESvIJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4IESvIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713970220; x=1745506220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Na03EZ4M0BoY2aVd84qx13LApk0vDLfNnDJxd2Jk/2M=;
  b=c4IESvIJT1EhxWQ+9edUyCJxrNZ976rqfscXURZCg43Kz4IA1q9P3XeE
   Byy5Gfp8zlxU19ZNMvB5ey6mocO35lmjS7VRKPI2PrUhkXSqBgqum/qtm
   N/ay2uJ1rWVclR6+xJ9RufVpySz2M+BH607t1W7306VvdKtSblqtL7IrY
   j0zhZb7u635dn+PuOzpekjklqskiqiP+q1xeMiPdN/Nh0BOVJzynBXJOZ
   IZ9EUPzpIlV3kEEzsyPAnEwoQyH38t9B2l3vClH5uuGXQdi+gkPKJjlsW
   y7AreA3uZINccvcNKUZr4m9rcAbezD7Znn7RZLGSx3UcpPMFSnVs67l9u
   w==;
X-CSE-ConnectionGUID: I2mGQnayRYSGrXydKUkbDw==
X-CSE-MsgGUID: mwulANFNQZe6AVyjY7unFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9715868"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9715868"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:50:19 -0700
X-CSE-ConnectionGUID: 8O2CM2aaTPC5pLDBBvqOpg==
X-CSE-MsgGUID: E0EwNkkBRIeLeD3IakOCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="62194456"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Apr 2024 07:50:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzdwt-0001Lk-1t;
	Wed, 24 Apr 2024 14:50:15 +0000
Date: Wed, 24 Apr 2024 22:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org
Subject: [awilliam-vfio:vfio-address-space 4/4]
 drivers/vfio/pci/vfio_pci_core.c:1693:undefined reference to
 `vmf_insert_pfn_pud'
Message-ID: <202404242226.o8OcEO59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/awilliam/linux-vfio.git vfio-address-space
head:   ec6c970f8374f91df0ebfe180cd388ba31187942
commit: ec6c970f8374f91df0ebfe180cd388ba31187942 [4/4] vfio/pci: Make use of huge_fault
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240424/202404242226.o8OcEO59-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404242226.o8OcEO59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404242226.o8OcEO59-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/vfio/pci/vfio_pci_core.o: in function `vfio_pci_mmap_huge_fault':
>> drivers/vfio/pci/vfio_pci_core.c:1693:(.text+0xc40): undefined reference to `vmf_insert_pfn_pud'


vim +1693 drivers/vfio/pci/vfio_pci_core.c

  1666	
  1667	static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf, unsigned int order)
  1668	{
  1669		struct vm_area_struct *vma = vmf->vma;
  1670		struct vfio_pci_core_device *vdev = vma->vm_private_data;
  1671		unsigned long pfn, pgoff = vmf->pgoff - vma->vm_pgoff;
  1672		vm_fault_t ret = VM_FAULT_FALLBACK;
  1673	
  1674		if (vmf->address & ((PAGE_SIZE << order) - 1) ||
  1675		    vmf->address + (PAGE_SIZE << order) > vma->vm_end)
  1676			return ret;
  1677	
  1678		if (vma_to_pfn(vma, &pfn))
  1679			return ret;
  1680	
  1681		down_read(&vdev->memory_lock);
  1682	
  1683		if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev)) {
  1684			ret = VM_FAULT_SIGBUS;
  1685			goto out_disabled;
  1686		}
  1687	
  1688		if (order == 0)
  1689			ret = vmf_insert_pfn(vma, vmf->address, pfn + pgoff);
  1690		else if (order == PMD_ORDER)
  1691			ret = vmf_insert_pfn_pmd(vmf, __pfn_to_pfn_t(pfn + pgoff, PFN_DEV), false);
  1692		else if (order == PUD_ORDER)
> 1693			ret = vmf_insert_pfn_pud(vmf, __pfn_to_pfn_t(pfn + pgoff, PFN_DEV), false);
  1694	
  1695	out_disabled:
  1696		up_read(&vdev->memory_lock);
  1697	
  1698		return ret;
  1699	}
  1700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
