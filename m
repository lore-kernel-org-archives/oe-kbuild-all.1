Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC317BB26
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727270605; cv=none; b=fCM2I7b7lva+Z1UmzR4LShrdwiyn1BChkaxfchTpMhquFfbp8jHzQKPpmM++1nVXCdV/U7yfErOtI5g16igOR/98SeULOBst7X4h9Yfr93dRg8SgB+4MmLJT+SnY2UcdvOltbiNO8eTuXf0lJGH8k6prPqOYpQ8dr4kSs2I/JwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727270605; c=relaxed/simple;
	bh=ePuUQatUSqwQTEo1GXCr0VdJ+0wVkVbuvP+DKZ/n79E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJLAEIs702ZUXbNbDTWgs0gFBiFzjobiHQpIePPifer1h6ycEaHi6mFWX6+ZoYn7NpdreLQKrLKI9BGtr7M+HghT3QkZo/pmK2T0DwWYs1pO1KgwLqbq7oDewrHcLnydepQtCL3B3Kd4npYaBYDiSgpnVJmeXAcLKNk9S4up+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjWrxvoi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjWrxvoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727270603; x=1758806603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePuUQatUSqwQTEo1GXCr0VdJ+0wVkVbuvP+DKZ/n79E=;
  b=BjWrxvoiaHUym2jqQKP4vH5Kb8H8F2qRjR14A74JXSiRsQN9L/0Ik6wS
   krNNYL5CGa6XKztRzeB6YSpzWMGe0lpcIXcaPdMLducFU9yPpBDfIXGQr
   8p14CL/Z04+95iarskipYTXpyXjquE4rb9pjdy12ySarrxnLjo4M23Odn
   3CuFdoU8vLQbz4BaE/LTnj9PsdmEusTJxmLs1z+je0k/5ZDCoJ1CY3KB5
   ojBrsq81/K+bL2Dtty/ZQfT3IhxKMAvpf0Z2y/FLdRGOVEi/erYpwOOkn
   WNqfgnGBnBuSOGrc/CtJENY3ZOeiOuMAEB8hfCm9N/rMDS6d7aWef3CE3
   Q==;
X-CSE-ConnectionGUID: y63rdUFOQhy4i9NxAKVDww==
X-CSE-MsgGUID: qwz1bH3MQYCupinPDg+hzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26415951"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26415951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 06:23:22 -0700
X-CSE-ConnectionGUID: yFufgBRoRZSf+V/htOMKLQ==
X-CSE-MsgGUID: GoIgJCkWSimf7L9i22IwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71780313"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2024 06:23:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stRzB-000JYt-0c;
	Wed, 25 Sep 2024 13:23:17 +0000
Date: Wed, 25 Sep 2024 21:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2211/2443]
 drivers/vfio/pci/vfio_pci_core.c:430:5: sparse: sparse: symbol
 'vfio_pci_iommu_dev_fault_handler' was not declared. Should it be static?
Message-ID: <202409252134.SSpOKdHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 7ed14911c89112b6b74bc41a23e143e1699c53ee [2211/2443] Build report error when config IOASID disable
config: x86_64-randconfig-121-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252134.SSpOKdHF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252134.SSpOKdHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252134.SSpOKdHF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vfio/pci/vfio_pci_core.c: note: in included file (through arch/x86/include/asm/bug.h, include/linux/bug.h, include/linux/debug_locks.h, ...):
   include/linux/instrumentation.h:8:9: sparse: sparse: preprocessor token instrumentation_begin redefined
   drivers/vfio/pci/vfio_pci_core.c: note: in included file (through include/linux/ioport.h, include/linux/device.h):
   include/linux/compiler.h:139:9: sparse: this was the original definition
   drivers/vfio/pci/vfio_pci_core.c:219:25: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:219:43: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:219:56: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:219:65: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:224:25: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:224:44: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:224:57: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:224:66: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:232:39: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:232:58: sparse: sparse: restricted pci_power_t degrades to integer
>> drivers/vfio/pci/vfio_pci_core.c:430:5: sparse: sparse: symbol 'vfio_pci_iommu_dev_fault_handler' was not declared. Should it be static?

vim +/vfio_pci_iommu_dev_fault_handler +430 drivers/vfio/pci/vfio_pci_core.c

d9a341570eb8c9 Dave Jiang 2021-11-29  428  
d9a341570eb8c9 Dave Jiang 2021-11-29  429  
d2073c40368fe6 Eric Auger 2021-11-09 @430  int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
d2073c40368fe6 Eric Auger 2021-11-09  431  {
d2073c40368fe6 Eric Auger 2021-11-09  432  	struct vfio_pci_core_device *vdev = (struct vfio_pci_core_device *)data;
d2073c40368fe6 Eric Auger 2021-11-09  433  	struct vfio_region_dma_fault *reg =
d2073c40368fe6 Eric Auger 2021-11-09  434  		(struct vfio_region_dma_fault *)vdev->fault_pages;
d7f86b497e0ad6 Eric Auger 2021-11-09  435  	int head, tail, size, ext_irq_index;
d2073c40368fe6 Eric Auger 2021-11-09  436  	struct iommu_fault *new;
d2073c40368fe6 Eric Auger 2021-11-09  437  	int ret = 0;
d2073c40368fe6 Eric Auger 2021-11-09  438  
d2073c40368fe6 Eric Auger 2021-11-09  439  	if (WARN_ON(!reg))
d2073c40368fe6 Eric Auger 2021-11-09  440  		return -ENOENT;
d2073c40368fe6 Eric Auger 2021-11-09  441  
d2073c40368fe6 Eric Auger 2021-11-09  442  	new = (struct iommu_fault *)(vdev->fault_pages + reg->offset +
d2073c40368fe6 Eric Auger 2021-11-09  443  				     reg->head * reg->entry_size);
d2073c40368fe6 Eric Auger 2021-11-09  444  
712fbb02163438 Jacob Pan  2021-11-09  445  	/* We need to send page request and relavent unrecoverable fault to userspace */
712fbb02163438 Jacob Pan  2021-11-09  446  	if (fault->type != IOMMU_FAULT_DMA_UNRECOV &&
712fbb02163438 Jacob Pan  2021-11-09  447  	    fault->type != IOMMU_FAULT_PAGE_REQ)
d2073c40368fe6 Eric Auger 2021-11-09  448  		return -ENOENT;
d2073c40368fe6 Eric Auger 2021-11-09  449  
d2073c40368fe6 Eric Auger 2021-11-09  450  	mutex_lock(&vdev->fault_queue_lock);
d2073c40368fe6 Eric Auger 2021-11-09  451  
ab810c4e40fa95 Liu Yi L   2021-06-25  452  	dev_dbg(&vdev->pdev->dev, "%s, enque fault event\n", __func__);
d2073c40368fe6 Eric Auger 2021-11-09  453  	head = reg->head;
d2073c40368fe6 Eric Auger 2021-11-09  454  	tail = reg->tail;
d2073c40368fe6 Eric Auger 2021-11-09  455  	size = reg->nb_entries;
d2073c40368fe6 Eric Auger 2021-11-09  456  
d2073c40368fe6 Eric Auger 2021-11-09  457  	if (CIRC_SPACE(head, tail, size) < 1) {
d2073c40368fe6 Eric Auger 2021-11-09  458  		ret = -ENOSPC;
d2073c40368fe6 Eric Auger 2021-11-09  459  		goto unlock;
d2073c40368fe6 Eric Auger 2021-11-09  460  	}
d2073c40368fe6 Eric Auger 2021-11-09  461  
d2073c40368fe6 Eric Auger 2021-11-09  462  	*new = *fault;
d2073c40368fe6 Eric Auger 2021-11-09  463  	reg->head = (head + 1) % size;
d2073c40368fe6 Eric Auger 2021-11-09  464  unlock:
d2073c40368fe6 Eric Auger 2021-11-09  465  	mutex_unlock(&vdev->fault_queue_lock);
d7f86b497e0ad6 Eric Auger 2021-11-09  466  	if (ret)
d2073c40368fe6 Eric Auger 2021-11-09  467  		return ret;
d7f86b497e0ad6 Eric Auger 2021-11-09  468  
d7f86b497e0ad6 Eric Auger 2021-11-09  469  	ext_irq_index = vfio_pci_get_ext_irq_index(vdev, VFIO_IRQ_TYPE_NESTED,
d7f86b497e0ad6 Eric Auger 2021-11-09  470  						   VFIO_IRQ_SUBTYPE_DMA_FAULT);
d7f86b497e0ad6 Eric Auger 2021-11-09  471  	if (ext_irq_index < 0)
d7f86b497e0ad6 Eric Auger 2021-11-09  472  		return -EINVAL;
d7f86b497e0ad6 Eric Auger 2021-11-09  473  
d7f86b497e0ad6 Eric Auger 2021-11-09  474  	mutex_lock(&vdev->igate);
ab810c4e40fa95 Liu Yi L   2021-06-25  475  	dev_dbg(&vdev->pdev->dev, "%s, signal userspace!\n", __func__);
d7f86b497e0ad6 Eric Auger 2021-11-09  476  	if (vdev->ext_irqs[ext_irq_index].trigger)
d7f86b497e0ad6 Eric Auger 2021-11-09  477  		eventfd_signal(vdev->ext_irqs[ext_irq_index].trigger, 1);
d7f86b497e0ad6 Eric Auger 2021-11-09  478  	mutex_unlock(&vdev->igate);
d7f86b497e0ad6 Eric Auger 2021-11-09  479  	return 0;
d2073c40368fe6 Eric Auger 2021-11-09  480  }
d2073c40368fe6 Eric Auger 2021-11-09  481  

:::::: The code at line 430 was first introduced by commit
:::::: d2073c40368fe63e37a196df6f9b0a2952d90ce6 vfio/pci: Register an iommu fault handler

:::::: TO: Eric Auger <eric.auger@redhat.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
