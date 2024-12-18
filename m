Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF031F238D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734561036; cv=none; b=XKPt+0mfOlqb4K8KinrW5kk8GuHZ0HKHjpAZYK96dhxDZCSGwZtClDGuHCZv4HS+oEmh1eAOZ01MMICdaPAmEFRiNEivS1zsRk7imywL+bH5TUottE5C79jc8q55ms+C7DW283iXAJQFZAyDGogWCJGfVAIOjTywXdju0CZgiro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734561036; c=relaxed/simple;
	bh=dG39gpY+aTXoeC5PZNoCj3RY41m9RMiuafKJXY1kawE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ki1nslQaWN+QPdiKnyrtJkh1GFy1m3oiuZDDp18ixCaj2abZMv7rR2CAyVVcsZgsSQ/4Pi9lQGywqKM1yFDya45daOJm7L5CoLh3XarGzLwUZ6YtM/2uVOniYNhyn5yV1DxHJcWUY5O3UBXHYNyDtWweLHD0Pt2DPRES2Xj6nxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1xBS4F2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1xBS4F2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734561034; x=1766097034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dG39gpY+aTXoeC5PZNoCj3RY41m9RMiuafKJXY1kawE=;
  b=m1xBS4F2andCwCdJ69OmahCOo2cpF+H7wclgzf+WEet85m+xfP96Xa4c
   NV9ZjjcGwQYHka1OJ4e/xf3RRjDec4zGMYUB4BYKoU6HXJlMgn7Q1kTq1
   ubc07gpRjDEq8X0yKDolM3zvKzjaoSvDkhOi9Dq+UNUzVvgd3n0D7NDDF
   W8IXUsRPo9/XcNwFbBiBm7b4jj3q8UzthqA7Rb+4cI4CyDvgpyCUxcPiK
   lH4alPHI0mKBa30itZeqJyoPYHkLcwQ2dP4Kpa0FAstBEWN4VpT34KAbm
   MSa8Zts1PYKn5Mq5h6u+tErWSs1owxXwLFKRXmotQHnSgwAKhF1EV4OIb
   w==;
X-CSE-ConnectionGUID: dl9kRRq4QfaxL5q3NNWb5w==
X-CSE-MsgGUID: tgFbdXjcQSeO/IaPj7GVkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34781236"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34781236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 14:30:33 -0800
X-CSE-ConnectionGUID: 5AaKZw5rQACB2hQUREkknw==
X-CSE-MsgGUID: SP1lmrSNR8CP02MQ/yxqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="102833932"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2024 14:30:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO2Yo-000Gg4-13;
	Wed, 18 Dec 2024 22:30:30 +0000
Date: Thu, 19 Dec 2024 06:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 9/22]
 drivers/virtio/virtio_msg_ffa.c:328:27: error: incompatible integer to
 pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of
 type 'const void *'
Message-ID: <202412190809.3FxrOW8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   ee30c003667d1a0890e7a0c45595feccbda8c410
commit: 6bdf658c5db93a8e34262d42df68fffef9ef50db [9/22] virtio-msg: Add support for FFA based channel bus
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241219/202412190809.3FxrOW8N-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190809.3FxrOW8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190809.3FxrOW8N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa.c:328:27: error: incompatible integer to pointer conversion passing 'u64' (aka 'unsigned long long') to parameter of type 'const void *' [-Wint-conversion]
     328 |                 pages[i] = virt_to_page((u64)vaddr + PAGE_SIZE * i);
         |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:409:50: note: expanded from macro 'virt_to_page'
     409 | #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/include/asm/memory.h:382:53: note: passing argument to parameter 'kaddr' here
     382 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   drivers/virtio/virtio_msg_ffa.c:394:6: warning: unused variable 'ret' [-Wunused-variable]
     394 |         int ret = 0;
         |             ^~~
   drivers/virtio/virtio_msg_ffa.c:501:49: warning: shift count >= width of type [-Wshift-count-overflow]
     501 |         ret = dma_set_mask_and_coherent(&ffa_dev->dev, DMA_BIT_MASK(64));
         |                                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 1 error generated.


vim +328 drivers/virtio/virtio_msg_ffa.c

   303	
   304	static int vmsg_ffa_bus_area_share_single(struct ffa_device *ffa_dev, void *vaddr,
   305			size_t n_pages, dma_addr_t *dma_handle)
   306	{
   307		struct virtio_msg_ffa_device *vmfdev = ffa_dev->dev.driver_data;
   308		struct virtio_msg_ffa request;
   309		struct ffa_mem_region_attributes mem_attr = {
   310			.receiver = ffa_dev->vm_id,
   311			.attrs = FFA_MEM_RW,
   312		};
   313		struct ffa_mem_ops_args args = {
   314			.use_txbuf = true,
   315			.attrs = &mem_attr,
   316			.nattrs = 1,
   317		};
   318		struct shared_area *area;
   319		struct page **pages;
   320		struct sg_table sgt;
   321		int ret, i;
   322	
   323		pages = kmalloc(sizeof(*pages) * n_pages, GFP_KERNEL);
   324		if (!pages)
   325			return -ENOMEM;
   326	
   327		for (i = 0; i < n_pages; i++)
 > 328			pages[i] = virt_to_page((u64)vaddr + PAGE_SIZE * i);
   329	
   330		area = kzalloc(sizeof(*area), GFP_KERNEL);
   331		if (!area)
   332			goto free_pages;
   333	
   334		ret = ida_alloc_range(&vmfdev->area_id_map, 1, U32_MAX - 1, GFP_KERNEL);
   335		if (ret < 0)
   336			goto free_area;
   337		area->id = ret;
   338	
   339		/* Share the pages */
   340		ret = sg_alloc_table_from_pages(&sgt, pages, n_pages, 0,
   341						n_pages * PAGE_SIZE, GFP_KERNEL);
   342		if (ret)
   343			goto free_ida;
   344	
   345		args.sg = sgt.sgl;
   346		ret = ffa_dev->ops->mem_ops->memory_share(&args);
   347		sg_free_table(&sgt);
   348	
   349		if (ret)
   350			goto free_ida;
   351	
   352		area->handle = args.g_handle;
   353		area->vaddr = vaddr;
   354		area->dma_handle = virt_to_phys(vaddr);
   355		area->n_pages = n_pages;
   356		area->count = 1;
   357	
   358		vmsg_ffa_prepare(&request, VIRTIO_MSG_FFA_AREA_SHARE);
   359		request.bus_area_share.area_id = cpu_to_le32(area->id);
   360		request.bus_area_share.mem_handle = cpu_to_le64(area->handle);
   361	
   362		ret = vmsg_ffa_send(vmfdev, &vmfdev->async, &request, NULL);
   363		if (ret < 0)
   364			goto mem_reclaim;
   365	
   366		*dma_handle = ffa_to_dma(area->id, 0);
   367	
   368		mutex_lock(&vmfdev->lock);
   369		list_add(&area->list, &vmfdev->area_list);
   370		mutex_unlock(&vmfdev->lock);
   371	
   372		kfree(pages);
   373		return 0;
   374	
   375	mem_reclaim:
   376		ffa_dev->ops->mem_ops->memory_reclaim(area->handle, 0);
   377	free_ida:
   378		ida_free(&vmfdev->area_id_map, area->id);
   379	free_area:
   380		kfree(area);
   381	free_pages:
   382		kfree(pages);
   383	
   384		return ret;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
