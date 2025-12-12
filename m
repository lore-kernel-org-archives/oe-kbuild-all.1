Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F720B7ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765536472; cv=none; b=Femj4YSm9D9yR0907Y1xO8GCcM33pDm+cQvaqTHiDlR6Po/4+0r3VpqaP7RnW0hhLQ67zos2g4tQBaBmF2UsoiL4KP5f45BwRYqOe9EwMMBCxTWKaTXNsHX1ZGMnyK4zx3FFjEtlWvDx9KiLJkXyuAT84no3K6XLSVRLY4ge/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765536472; c=relaxed/simple;
	bh=oP0nyl90Q0HUE3g0VCwadWveFVCksoIItfH7kzFXNjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KypxQOid0jhSFN7QpWYcF9g8QEVc7nREEgNk9ERikf4R1pEZm4dmUo3PIl+SJ/F/Ih2i6GahMW3e22LbSC3Su8qBCnBqFkiMLY6YXl7rNcnmxTc2/VhdwJZSC/gMI+yqAHQbEsEKqAHJmfhUEEtIc7YV+rOltLYZ8To+4cKSPqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miDKXJpI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miDKXJpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765536470; x=1797072470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oP0nyl90Q0HUE3g0VCwadWveFVCksoIItfH7kzFXNjI=;
  b=miDKXJpIyUZTH1ekTLrf7wA/Icrk5+We+K7c41mTcB8gZBIcMDXxhC0t
   YhZto75NfuCXYnnaucQ/a/ARkmKteN3tz6ZFUjtA+bryBveZMKCCRAi6A
   e9PEznUmfmMctCGokWzvjKdgNSZC+e+onp9wQ34jc3w9NrSNdiBk3E3kK
   RexEh4mAq7gGnLaQuvvqICkPFfKdNab4rWtwNqhDBGd8bz1QY9ZZJ9yIu
   I+S5CX3EuMCdx347nPLtOZbAokC2ekj3g7yU8T8QkrYS+mpEfvFb4ZomC
   UkA9tTpmst+5UssM6H+IHraLUBwvnCyLOq8N//Jt75VeAkVYI4aXrqHWG
   g==;
X-CSE-ConnectionGUID: 0E69O8rcTV+nQsMtjZu1pg==
X-CSE-MsgGUID: Wcdub17tQzeYPoZgcrCDLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85131857"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="85131857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:47:49 -0800
X-CSE-ConnectionGUID: EQgTkHhJSfekqd6KwIgpwA==
X-CSE-MsgGUID: CgjyVDy8SOmOz98uPK5wKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196658635"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 02:47:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0gb-000000005wx-0ybF;
	Fri, 12 Dec 2025 10:47:45 +0000
Date: Fri, 12 Dec 2025 18:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:676:30:
 warning: variable 'vfn' set but not used
Message-ID: <202512121829.l6WBMb9f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [3541/3541] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121829.l6WBMb9f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121829.l6WBMb9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121829.l6WBMb9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c: In function 'nbl_userdev_get_bar_size':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:475:21: warning: variable 'hw_addr' set but not used [-Wunused-but-set-variable]
     475 |         u8 __iomem *hw_addr;
         |                     ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c: In function 'nbl_userdev_dma_map_ioctl':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:676:30: warning: variable 'vfn' set but not used [-Wunused-but-set-variable]
     676 |         unsigned long vaddr, vfn;
         |                              ^~~


vim +/vfn +676 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c

bad535d287c9c1 Bennie Yan 2024-09-24  665  
bad535d287c9c1 Bennie Yan 2024-09-24  666  static long nbl_userdev_dma_map_ioctl(struct nbl_dev_user *user, unsigned long arg)
bad535d287c9c1 Bennie Yan 2024-09-24  667  {
bad535d287c9c1 Bennie Yan 2024-09-24  668  	struct nbl_dev_user_dma_map map;
bad535d287c9c1 Bennie Yan 2024-09-24  669  	struct nbl_adapter *adapter = user->adapter;
bad535d287c9c1 Bennie Yan 2024-09-24  670  	struct pci_dev *pdev = adapter->pdev;
bad535d287c9c1 Bennie Yan 2024-09-24  671  	struct device *dev = &pdev->dev;
bad535d287c9c1 Bennie Yan 2024-09-24  672  	struct nbl_vfio_batch batch;
bad535d287c9c1 Bennie Yan 2024-09-24  673  	struct nbl_userdev_dma *dma;
bad535d287c9c1 Bennie Yan 2024-09-24  674  	struct page *h_page;
bad535d287c9c1 Bennie Yan 2024-09-24  675  	unsigned long minsz, pfn_base = 0, pfn;
bad535d287c9c1 Bennie Yan 2024-09-24 @676  	unsigned long vaddr, vfn;
bad535d287c9c1 Bennie Yan 2024-09-24  677  	dma_addr_t iova;
bad535d287c9c1 Bennie Yan 2024-09-24  678  	u32 mask = NBL_DEV_USER_DMA_MAP_FLAG_READ | NBL_DEV_USER_DMA_MAP_FLAG_WRITE;
bad535d287c9c1 Bennie Yan 2024-09-24  679  	size_t size;
bad535d287c9c1 Bennie Yan 2024-09-24  680  	long npage, batch_pages, pinned = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  681  	int i, ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  682  	phys_addr_t phys;
bad535d287c9c1 Bennie Yan 2024-09-24  683  
bad535d287c9c1 Bennie Yan 2024-09-24  684  	minsz = offsetofend(struct nbl_dev_user_dma_map, size);
bad535d287c9c1 Bennie Yan 2024-09-24  685  
bad535d287c9c1 Bennie Yan 2024-09-24  686  	if (copy_from_user(&map, (void __user *)arg, minsz))
bad535d287c9c1 Bennie Yan 2024-09-24  687  		return -EFAULT;
bad535d287c9c1 Bennie Yan 2024-09-24  688  
bad535d287c9c1 Bennie Yan 2024-09-24  689  	if (map.argsz < minsz || map.flags & ~mask)
bad535d287c9c1 Bennie Yan 2024-09-24  690  		return -EINVAL;
bad535d287c9c1 Bennie Yan 2024-09-24  691  
bad535d287c9c1 Bennie Yan 2024-09-24  692  	npage = map.size >> PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  693  	vaddr = map.vaddr;
bad535d287c9c1 Bennie Yan 2024-09-24  694  	iova = map.iova;
bad535d287c9c1 Bennie Yan 2024-09-24  695  
bad535d287c9c1 Bennie Yan 2024-09-24  696  	if (!npage)
bad535d287c9c1 Bennie Yan 2024-09-24  697  		return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  698  
bad535d287c9c1 Bennie Yan 2024-09-24  699  	mutex_lock(&user->group->dma_tree_lock);
bad535d287c9c1 Bennie Yan 2024-09-24  700  	/* rb-tree find */
bad535d287c9c1 Bennie Yan 2024-09-24  701  	dma = nbl_userdev_find_dma(user->group, vaddr, map.size);
bad535d287c9c1 Bennie Yan 2024-09-24  702  	if (dma && dma->iova == iova && dma->size == map.size) {
bad535d287c9c1 Bennie Yan 2024-09-24  703  		vfn = vaddr >> PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  704  		ret = vfio_pin_pages(&user->vdev, vaddr, 1, IOMMU_READ | IOMMU_WRITE, &h_page);
bad535d287c9c1 Bennie Yan 2024-09-24  705  		if (ret <= 0) {
bad535d287c9c1 Bennie Yan 2024-09-24  706  			dev_err(dev, "vfio_pin_pages failed %d\n", ret);
bad535d287c9c1 Bennie Yan 2024-09-24  707  			goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  708  		}
bad535d287c9c1 Bennie Yan 2024-09-24  709  
bad535d287c9c1 Bennie Yan 2024-09-24  710  		pfn = page_to_pfn(h_page);
bad535d287c9c1 Bennie Yan 2024-09-24  711  		ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  712  		vfio_unpin_pages(&user->vdev, vaddr, 1);
bad535d287c9c1 Bennie Yan 2024-09-24  713  
bad535d287c9c1 Bennie Yan 2024-09-24  714  		if (pfn != dma->pfn) {
bad535d287c9c1 Bennie Yan 2024-09-24  715  			dev_err(dev, "multiple dma pfn not equal, new pfn %lu, dma pfn %lu\n",
bad535d287c9c1 Bennie Yan 2024-09-24  716  				pfn, dma->pfn);
bad535d287c9c1 Bennie Yan 2024-09-24  717  			ret = -EINVAL;
bad535d287c9c1 Bennie Yan 2024-09-24  718  			goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  719  		}
bad535d287c9c1 Bennie Yan 2024-09-24  720  
bad535d287c9c1 Bennie Yan 2024-09-24  721  		dev_info(dev, "existing dma info, ref_cnt++\n");
bad535d287c9c1 Bennie Yan 2024-09-24  722  		dma->ref_cnt++;
bad535d287c9c1 Bennie Yan 2024-09-24  723  		goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  724  	} else if (dma) {
bad535d287c9c1 Bennie Yan 2024-09-24  725  		dev_info(dev, "multiple dma not equal\n");
bad535d287c9c1 Bennie Yan 2024-09-24  726  		ret = -EINVAL;
bad535d287c9c1 Bennie Yan 2024-09-24  727  		goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  728  	}
bad535d287c9c1 Bennie Yan 2024-09-24  729  
bad535d287c9c1 Bennie Yan 2024-09-24  730  	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  731  	if (!dma) {
bad535d287c9c1 Bennie Yan 2024-09-24  732  		ret = -ENOMEM;
bad535d287c9c1 Bennie Yan 2024-09-24  733  		goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  734  	}
bad535d287c9c1 Bennie Yan 2024-09-24  735  
bad535d287c9c1 Bennie Yan 2024-09-24  736  	if (nbl_vfio_batch_init(&batch)) {
bad535d287c9c1 Bennie Yan 2024-09-24  737  		kfree(dma);
bad535d287c9c1 Bennie Yan 2024-09-24  738  		ret = -ENOMEM;
bad535d287c9c1 Bennie Yan 2024-09-24  739  		goto mutext_unlock;
bad535d287c9c1 Bennie Yan 2024-09-24  740  	}
bad535d287c9c1 Bennie Yan 2024-09-24  741  
bad535d287c9c1 Bennie Yan 2024-09-24  742  	while (npage) {
bad535d287c9c1 Bennie Yan 2024-09-24  743  		if (batch.size == 0) {
bad535d287c9c1 Bennie Yan 2024-09-24  744  			if (npage >= NBL_VFIO_BATCH_MAX_CAPACITY)
bad535d287c9c1 Bennie Yan 2024-09-24  745  				batch_pages = NBL_VFIO_BATCH_MAX_CAPACITY;
bad535d287c9c1 Bennie Yan 2024-09-24  746  			else
bad535d287c9c1 Bennie Yan 2024-09-24  747  				batch_pages = npage;
bad535d287c9c1 Bennie Yan 2024-09-24  748  			batch.pages_in[0] = vaddr >> PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  749  			for (i = 1; i < batch_pages; i++)
bad535d287c9c1 Bennie Yan 2024-09-24  750  				batch.pages_in[i] = batch.pages_in[i - 1] + 1;
bad535d287c9c1 Bennie Yan 2024-09-24  751  
bad535d287c9c1 Bennie Yan 2024-09-24  752  			ret = vfio_pin_pages(&user->vdev, vaddr, batch_pages,
bad535d287c9c1 Bennie Yan 2024-09-24  753  					     IOMMU_READ | IOMMU_WRITE, batch.h_page);
bad535d287c9c1 Bennie Yan 2024-09-24  754  
bad535d287c9c1 Bennie Yan 2024-09-24  755  			dev_dbg(dev, "page %ld pages, return %d\n", batch_pages, batch.size);
bad535d287c9c1 Bennie Yan 2024-09-24  756  			if (ret <= 0) {
bad535d287c9c1 Bennie Yan 2024-09-24  757  				dev_err(dev, "pin page failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  758  				goto unwind;
bad535d287c9c1 Bennie Yan 2024-09-24  759  			}
bad535d287c9c1 Bennie Yan 2024-09-24  760  
bad535d287c9c1 Bennie Yan 2024-09-24  761  			for (i = 0; i < batch_pages; i++)
bad535d287c9c1 Bennie Yan 2024-09-24  762  				batch.pages_out[i] = page_to_pfn(batch.h_page[i]);
bad535d287c9c1 Bennie Yan 2024-09-24  763  
bad535d287c9c1 Bennie Yan 2024-09-24  764  			batch.offset = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  765  			batch.size = ret;
bad535d287c9c1 Bennie Yan 2024-09-24  766  			if (!pfn_base) {
bad535d287c9c1 Bennie Yan 2024-09-24  767  				pfn_base = batch.pages_out[batch.offset];
bad535d287c9c1 Bennie Yan 2024-09-24  768  				dma->pfn = batch.pages_out[batch.offset];
bad535d287c9c1 Bennie Yan 2024-09-24  769  			}
bad535d287c9c1 Bennie Yan 2024-09-24  770  		}
bad535d287c9c1 Bennie Yan 2024-09-24  771  
bad535d287c9c1 Bennie Yan 2024-09-24  772  		while (batch.size) {
bad535d287c9c1 Bennie Yan 2024-09-24  773  			pfn = batch.pages_out[batch.offset];
bad535d287c9c1 Bennie Yan 2024-09-24  774  			if (pfn == (pfn_base + pinned)) {
bad535d287c9c1 Bennie Yan 2024-09-24  775  				pinned++;
bad535d287c9c1 Bennie Yan 2024-09-24  776  				vaddr += PAGE_SIZE;
bad535d287c9c1 Bennie Yan 2024-09-24  777  				batch.offset++;
bad535d287c9c1 Bennie Yan 2024-09-24  778  				batch.size--;
bad535d287c9c1 Bennie Yan 2024-09-24  779  				npage--;
bad535d287c9c1 Bennie Yan 2024-09-24  780  				continue;
bad535d287c9c1 Bennie Yan 2024-09-24  781  			}
bad535d287c9c1 Bennie Yan 2024-09-24  782  
bad535d287c9c1 Bennie Yan 2024-09-24  783  			size = pinned << PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  784  			phys = pfn_base << PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  785  
bad535d287c9c1 Bennie Yan 2024-09-24  786  			ret = iommu_map(iommu_get_domain_for_dev(dev), iova, phys,
bad535d287c9c1 Bennie Yan 2024-09-24  787  					size, IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE, GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  788  
bad535d287c9c1 Bennie Yan 2024-09-24  789  			if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  790  				dev_err(dev, "iommu_map failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  791  				goto unwind;
bad535d287c9c1 Bennie Yan 2024-09-24  792  			}
bad535d287c9c1 Bennie Yan 2024-09-24  793  			dev_dbg(dev, "iommu map succeed, iova 0x%llx, phys 0x%llx,\n"
bad535d287c9c1 Bennie Yan 2024-09-24  794  				"size 0x%llx\n", (u64)iova, (u64)phys, (u64)size);
bad535d287c9c1 Bennie Yan 2024-09-24  795  			pfn_base = pfn;
bad535d287c9c1 Bennie Yan 2024-09-24  796  			pinned = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  797  			iova += size;
bad535d287c9c1 Bennie Yan 2024-09-24  798  		}
bad535d287c9c1 Bennie Yan 2024-09-24  799  	}
bad535d287c9c1 Bennie Yan 2024-09-24  800  
bad535d287c9c1 Bennie Yan 2024-09-24  801  	if (pinned) {
bad535d287c9c1 Bennie Yan 2024-09-24  802  		size = pinned << PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  803  		phys = pfn_base << PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  804  
bad535d287c9c1 Bennie Yan 2024-09-24  805  		ret = iommu_map(iommu_get_domain_for_dev(dev), iova, phys,
bad535d287c9c1 Bennie Yan 2024-09-24  806  				size, IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE, GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  807  
bad535d287c9c1 Bennie Yan 2024-09-24  808  		if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  809  			dev_err(dev, "iommu_map failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  810  			goto unwind;
bad535d287c9c1 Bennie Yan 2024-09-24  811  		}
bad535d287c9c1 Bennie Yan 2024-09-24  812  		dev_dbg(dev, "iommu map succeed, iova 0x%llx, phys 0x%llx,\n"
bad535d287c9c1 Bennie Yan 2024-09-24  813  			"size 0x%llx\n", (u64)iova, (u64)phys, (u64)size);
bad535d287c9c1 Bennie Yan 2024-09-24  814  	}
bad535d287c9c1 Bennie Yan 2024-09-24  815  	nbl_vfio_batch_fini(&batch);
bad535d287c9c1 Bennie Yan 2024-09-24  816  
bad535d287c9c1 Bennie Yan 2024-09-24  817  	dma->iova = map.iova;
bad535d287c9c1 Bennie Yan 2024-09-24  818  	dma->size = map.size;
bad535d287c9c1 Bennie Yan 2024-09-24  819  	dma->vaddr = map.vaddr;
bad535d287c9c1 Bennie Yan 2024-09-24  820  	dma->ref_cnt = 1;
bad535d287c9c1 Bennie Yan 2024-09-24  821  	nbl_userdev_link_dma(user->group, dma);
bad535d287c9c1 Bennie Yan 2024-09-24  822  
bad535d287c9c1 Bennie Yan 2024-09-24  823  	dev_info(dev, "dma map info: vaddr=0x%llx, iova=0x%llx, size=0x%llx\n",
bad535d287c9c1 Bennie Yan 2024-09-24  824  		 (u64)map.vaddr, (u64)map.iova, (u64)map.size);
bad535d287c9c1 Bennie Yan 2024-09-24  825  	mutex_unlock(&user->group->dma_tree_lock);
bad535d287c9c1 Bennie Yan 2024-09-24  826  
bad535d287c9c1 Bennie Yan 2024-09-24  827  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  828  
bad535d287c9c1 Bennie Yan 2024-09-24  829  unwind:
bad535d287c9c1 Bennie Yan 2024-09-24  830  	if (iova > map.iova)
bad535d287c9c1 Bennie Yan 2024-09-24  831  		iommu_unmap(iommu_get_domain_for_dev(dev), map.iova, iova - map.iova);
bad535d287c9c1 Bennie Yan 2024-09-24  832  
bad535d287c9c1 Bennie Yan 2024-09-24  833  	if (batch.size)
bad535d287c9c1 Bennie Yan 2024-09-24  834  		vfio_unpin_pages(&user->vdev, vaddr, batch.size);
bad535d287c9c1 Bennie Yan 2024-09-24  835  
bad535d287c9c1 Bennie Yan 2024-09-24  836  	npage = (vaddr - map.vaddr) >> PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  837  	vaddr = map.vaddr;
bad535d287c9c1 Bennie Yan 2024-09-24  838  
bad535d287c9c1 Bennie Yan 2024-09-24  839  	while (npage) {
bad535d287c9c1 Bennie Yan 2024-09-24  840  		if (npage >= NBL_VFIO_BATCH_MAX_CAPACITY)
bad535d287c9c1 Bennie Yan 2024-09-24  841  			batch_pages = NBL_VFIO_BATCH_MAX_CAPACITY;
bad535d287c9c1 Bennie Yan 2024-09-24  842  		else
bad535d287c9c1 Bennie Yan 2024-09-24  843  			batch_pages = npage;
bad535d287c9c1 Bennie Yan 2024-09-24  844  
bad535d287c9c1 Bennie Yan 2024-09-24  845  		batch.pages_in[0] = vaddr >> PAGE_SHIFT;
bad535d287c9c1 Bennie Yan 2024-09-24  846  		for (i = 1; i < batch_pages; i++)
bad535d287c9c1 Bennie Yan 2024-09-24  847  			batch.pages_in[i] =  batch.pages_in[i - 1] + 1;
bad535d287c9c1 Bennie Yan 2024-09-24  848  
bad535d287c9c1 Bennie Yan 2024-09-24  849  		vfio_unpin_pages(&user->vdev, vaddr, batch_pages);
bad535d287c9c1 Bennie Yan 2024-09-24  850  		npage -= batch_pages;
bad535d287c9c1 Bennie Yan 2024-09-24  851  		vaddr += (batch_pages << PAGE_SHIFT);
bad535d287c9c1 Bennie Yan 2024-09-24  852  	}
bad535d287c9c1 Bennie Yan 2024-09-24  853  	nbl_vfio_batch_fini(&batch);
bad535d287c9c1 Bennie Yan 2024-09-24  854  
bad535d287c9c1 Bennie Yan 2024-09-24  855  mutext_unlock:
bad535d287c9c1 Bennie Yan 2024-09-24  856  	mutex_unlock(&user->group->dma_tree_lock);
bad535d287c9c1 Bennie Yan 2024-09-24  857  
bad535d287c9c1 Bennie Yan 2024-09-24  858  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  859  }
bad535d287c9c1 Bennie Yan 2024-09-24  860  

:::::: The code at line 676 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
