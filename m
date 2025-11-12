Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E17B2FD667
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948673; cv=none; b=maBW0w1fCBDW+XpdGq1ie9UQIDWeIVj/JkS1SJ71jeLYX3GlniQG5tqvgRSKy43WmraGZ0SyIxzAZMeW+4fyq3jIqahx2rsQCESSSVLZbmAIbpgNrDgdtMWUbKBy3lx1Fe4XBiXt8aQh3waTIOEYtyO7TFaaJPtNHjYh7v3UHIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948673; c=relaxed/simple;
	bh=SqWLNFidTU/ZZAY/wKmL0pzzMf5lBnZV1EJFPqQvE8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSkuuepepAD6Y8f4nZqvdlClKuFsEB78v50KXe+gqxnk+C86FVehEpT/+Uy9kzCPtS3R69K+lVyt5dlq+IWLyHdoyFeUVwRcUMJdfcW4u0uN3zP3LHabBCaqkl5LH5W/xhoYdg0eW5WYcdmGyveRNAACDJXkD7IkhOjoO90YiVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NotSI5Q3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NotSI5Q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948671; x=1794484671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqWLNFidTU/ZZAY/wKmL0pzzMf5lBnZV1EJFPqQvE8Y=;
  b=NotSI5Q3hHYxI2jM/9is3pX7P6lkIdM56/0W8JxJ2sAuRau3WJORSQJu
   WfNHMdwig7p9oh8yxfWmt923BiFGsgtJTV/27xa4UzDUZI+2eQ1ysJzkX
   OtOiGrS7bywbFElecNdJYjOeO8CE5OaMnJLIZYiJjPH/nzZ2D3zdst/Fj
   LGA3HKxKOlKU+JP4cTePizdmnOBSiZl7DbrqM56DJ3HmexM/yo58VG0c/
   SWYdRE2Kp+vKAhkUBhgMz6nh2vtK7wCJi379Tk1KufIbe73SV9ntqngfs
   rYnkABN42x7Bff1IVN5g8Qa50J8eiEwQYvlVXfGFLH6JDKvBu0SwZ44yS
   w==;
X-CSE-ConnectionGUID: LcyrfL9jTpSA5mnF735iQQ==
X-CSE-MsgGUID: hYMfBBCNRkK0fNS6pgl64g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75623077"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75623077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:51 -0800
X-CSE-ConnectionGUID: 1/U9Hc9oRAucoYmfJ4f4XQ==
X-CSE-MsgGUID: nz00ygZCTHKQhdyuZoeCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="189929194"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 03:57:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ9Tv-0004CV-0w;
	Wed, 12 Nov 2025 11:57:47 +0000
Date: Wed, 12 Nov 2025 19:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6752/7613]
 drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202511121922.oP20Lzb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b179ce312bafcb8c68dc718e015aee79b7939ff0
commit: d3b4177bcf978a441cf98b7515d043eb23728194 [6752/7613] gpu/drm/nouveau: enable THP support for GPU memory migration
config: x86_64-randconfig-121-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121922.oP20Lzb8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121922.oP20Lzb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nouveau_dmem.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got int @@
   drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     got int

vim +259 drivers/gpu/drm/nouveau/nouveau_dmem.c

   182	
   183	static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
   184	{
   185		struct nouveau_drm *drm = page_to_drm(vmf->page);
   186		struct nouveau_dmem *dmem = drm->dmem;
   187		struct nouveau_fence *fence;
   188		struct nouveau_svmm *svmm;
   189		struct page *dpage;
   190		vm_fault_t ret = 0;
   191		struct migrate_vma args = {
   192			.vma		= vmf->vma,
   193			.pgmap_owner	= drm->dev,
   194			.fault_page	= vmf->page,
   195			.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
   196					  MIGRATE_VMA_SELECT_COMPOUND,
   197			.src = NULL,
   198			.dst = NULL,
   199		};
   200		unsigned int order, nr;
   201		struct folio *sfolio, *dfolio;
   202		struct nouveau_dmem_dma_info dma_info;
   203	
   204		sfolio = page_folio(vmf->page);
   205		order = folio_order(sfolio);
   206		nr = 1 << order;
   207	
   208		/*
   209		 * Handle partial unmap faults, where the folio is large, but
   210		 * the pmd is split.
   211		 */
   212		if (vmf->pte) {
   213			order = 0;
   214			nr = 1;
   215		}
   216	
   217		if (order)
   218			args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
   219	
   220		args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
   221		args.vma = vmf->vma;
   222		args.end = args.start + (PAGE_SIZE << order);
   223		args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
   224		args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
   225	
   226		if (!args.src || !args.dst) {
   227			ret = VM_FAULT_OOM;
   228			goto err;
   229		}
   230		/*
   231		 * FIXME what we really want is to find some heuristic to migrate more
   232		 * than just one page on CPU fault. When such fault happens it is very
   233		 * likely that more surrounding page will CPU fault too.
   234		 */
   235		if (migrate_vma_setup(&args) < 0)
   236			return VM_FAULT_SIGBUS;
   237		if (!args.cpages)
   238			return 0;
   239	
   240		if (order)
   241			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
   242						order, vmf->vma, vmf->address), 0);
   243		else
   244			dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
   245						vmf->address);
   246		if (!dpage) {
   247			ret = VM_FAULT_OOM;
   248			goto done;
   249		}
   250	
   251		args.dst[0] = migrate_pfn(page_to_pfn(dpage));
   252		if (order)
   253			args.dst[0] |= MIGRATE_PFN_COMPOUND;
   254		dfolio = page_folio(dpage);
   255	
   256		svmm = folio_zone_device_data(sfolio);
   257		mutex_lock(&svmm->mutex);
   258		nouveau_svmm_invalidate(svmm, args.start, args.end);
 > 259		ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
   260		mutex_unlock(&svmm->mutex);
   261		if (ret) {
   262			ret = VM_FAULT_SIGBUS;
   263			goto done;
   264		}
   265	
   266		nouveau_fence_new(&fence, dmem->migrate.chan);
   267		migrate_vma_pages(&args);
   268		nouveau_dmem_fence_done(&fence);
   269		dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
   270					DMA_BIDIRECTIONAL);
   271	done:
   272		migrate_vma_finalize(&args);
   273	err:
   274		kfree(args.src);
   275		kfree(args.dst);
   276		return ret;
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
