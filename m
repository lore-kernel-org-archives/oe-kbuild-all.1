Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42C1A0AF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714513561; cv=none; b=Mf9ZrTCPstquAq8tcZ2KBYGakJIQke5EzVPkmUzRSE1ft3kmKHHOb5O4yZRI3HSWSWJ2Qg7jUblPzZMR/rUm3ViqcIv//SwEb2k47PkLZthpwjWOZVRV+iPxhTv2xh485n61mshDrSLi3WN5T7WDvNhnnJS9PoDXpPMVD7ecISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714513561; c=relaxed/simple;
	bh=8hA+yFLz+2fPRMgHmfPpksvUawODa+i8ixzyykyi4/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AoQq7SvTAsFMie72r0edOmce9aI8B7l0jxyxaeH92rderZmtZG9aNshCIriA9nA07+Daltzoru64waGYhqdBklMOzMwYcGphzk8aw9m9AanlEmOTQoPACOsRJ611z8ebDuIA4LEOslYbqv6tazTtnFN9KZrAcFbYVoMa3VUqYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lA3hNMQk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lA3hNMQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714513559; x=1746049559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8hA+yFLz+2fPRMgHmfPpksvUawODa+i8ixzyykyi4/E=;
  b=lA3hNMQk6snyqfXpxQc1CllcmDpOHw9YiPCviBB4Zberyf9PoHMSDRrA
   tixsDQYyXn9rQnseDcXJq+6hYNEOvxfb+ijj+49lYrGk+7MhzGkpzqwB4
   9tOrcxB6uDSo/ZQJkiOdmyvorKyYpS+hGrBmuBYmSM7fBPB2ZYt034WO4
   orkF1TeGA8ypFgVSAYtXiEdVAaadVuh1ubBwJDuxBBFNyArhJhw/qcC0B
   wTNbAekPhNReGm52B8dlgq2cyWSEAjGSe+so7wqZ4ASgGisd2Tn/i4j9L
   a180edi6x0sZJFAdv9Re61770b6hObQYXg8lpEiugsCxT3ZIrF7K64ht9
   A==;
X-CSE-ConnectionGUID: cpwKrlP4T6GE1M6FoOamtQ==
X-CSE-MsgGUID: woqBb5Y5S6qP04+X6M7gIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20932343"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="20932343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 14:45:59 -0700
X-CSE-ConnectionGUID: o4CnaNumRiq/gaElGhuGFw==
X-CSE-MsgGUID: 6WXl51/gTMWPaFkA1231AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="26605897"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2024 14:45:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1vIQ-0008cx-1o;
	Tue, 30 Apr 2024 21:45:54 +0000
Date: Wed, 1 May 2024 05:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 17/17] drivers/vfio/pci/mlx5/cmd.c:368:29:
 error: 'page_list' undeclared; did you mean 'page_shift'?
Message-ID: <202405010516.VoX8X3zz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9 [17/17] vfio/mlx5: Convert vfio to use DMA link API
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010516.VoX8X3zz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010516.VoX8X3zz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010516.VoX8X3zz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/vfio/pci/mlx5/cmd.c: In function 'unregister_dma_pages':
>> drivers/vfio/pci/mlx5/cmd.c:368:29: error: 'page_list' undeclared (first use in this function); did you mean 'page_shift'?
     368 |         dma_get_memory_type(page_list[0], &type);
         |                             ^~~~~~~~~
         |                             page_shift
   drivers/vfio/pci/mlx5/cmd.c:368:29: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/vfio/pci/mlx5/cmd.c:374:9: error: 'mtt' undeclared (first use in this function)
     374 |         mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
         |         ^~~
>> drivers/vfio/pci/mlx5/cmd.c:376:41: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_range_states' [-Wenum-conversion]
     376 |                 dma_start_range(&state, false);
         |                                         ^~~~~
   drivers/vfio/pci/mlx5/cmd.c:386:39: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_range_states' [-Wenum-conversion]
     386 |                 dma_end_range(&state, false);
         |                                       ^~~~~
   drivers/vfio/pci/mlx5/cmd.c: In function 'register_dma_pages':
   drivers/vfio/pci/mlx5/cmd.c:421:41: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_range_states' [-Wenum-conversion]
     421 |                 dma_start_range(&state, true);
         |                                         ^~~~
   drivers/vfio/pci/mlx5/cmd.c:436:39: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_range_states' [-Wenum-conversion]
     436 |                 dma_end_range(&state, true);
         |                                       ^~~~
   drivers/vfio/pci/mlx5/cmd.c: In function 'mlx5vf_add_migration_pages':
>> drivers/vfio/pci/mlx5/cmd.c:534:17: error: 'to_fill' undeclared (first use in this function)
     534 |                 to_fill = min_t(unsigned int, to_alloc,
         |                 ^~~~~~~


vim +368 drivers/vfio/pci/mlx5/cmd.c

   356	
   357	static void unregister_dma_pages(struct mlx5_core_dev *mdev, u32 npages,
   358					 u32 *mkey_in, struct dma_iova_attrs *iova)
   359	{
   360		struct dma_memory_type type = {};
   361		struct dma_iova_state state = {};
   362		dma_addr_t addr;
   363		bool use_iova;
   364		int i;
   365	
   366		WARN_ON_ONCE(iova->dir == DMA_NONE);
   367	
 > 368		dma_get_memory_type(page_list[0], &type);
   369		state.iova = iova;
   370		state.type = &type;
   371	
   372		use_iova = dma_can_use_iova(&state, PAGE_SIZE);
   373	
 > 374		mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
   375		if (use_iova)
 > 376			dma_start_range(&state, false);
   377		for (i = npages - 1; i >= 0; i--) {
   378			addr = be64_to_cpu(mtt[i]);
   379			if (use_iova)
   380				dma_unlink_range(&state, addr, PAGE_SIZE);
   381			else
   382				dma_unmap_page_attrs(iova->dev, addr, PAGE_SIZE,
   383						     iova->dir, iova->attrs);
   384		}
   385		if (use_iova)
   386			dma_end_range(&state, false);
   387		dma_free_iova(iova);
   388	}
   389	
   390	static int register_dma_pages(struct mlx5_core_dev *mdev, u32 npages,
   391				      struct page **page_list, u32 *mkey_in,
   392				      struct dma_iova_attrs *iova)
   393	{
   394		struct dma_memory_type type = {};
   395		struct dma_iova_state state = {};
   396		dma_addr_t addr;
   397		bool use_iova;
   398		__be64 *mtt;
   399		int i, err;
   400	
   401		WARN_ON_ONCE(iova->dir == DMA_NONE);
   402	
   403		iova->dev = mdev->device;
   404		iova->size = npages * PAGE_SIZE;
   405		err = dma_alloc_iova(iova);
   406		if (err)
   407			return err;
   408	
   409		/*
   410		 * All VFIO pages are of the same type, and it is enough
   411		 * to check one page only
   412		 */
   413		dma_get_memory_type(page_list[0], &type);
   414		state.iova = iova;
   415		state.type = &type;
   416	
   417		use_iova = dma_can_use_iova(&state, PAGE_SIZE);
   418	
   419		mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
   420		if (use_iova)
   421			dma_start_range(&state, true);
   422		for (i = 0; i < npages; i++) {
   423			if (use_iova)
   424				addr = dma_link_range(&state, page_list[i],
   425						      i * PAGE_SIZE, PAGE_SIZE);
   426			else
   427				addr = dma_map_page_attrs(iova->dev, page_list[i], 0,
   428							  PAGE_SIZE, iova->dir,
   429							  iova->attrs);
   430			if (dma_mapping_error(mdev->device, addr))
   431				goto error;
   432	
   433			*mtt++ = cpu_to_be64(addr);
   434		}
   435		if (use_iova)
   436			dma_end_range(&state, true);
   437	
   438		return 0;
   439	
   440	error:
   441		unregister_dma_pages(mdev, i, mkey_in, iova);
   442		return -ENOMEM;
   443	}
   444	
   445	static int mlx5vf_dma_data_buffer(struct mlx5_vhca_data_buffer *buf)
   446	{
   447		struct mlx5vf_pci_core_device *mvdev = buf->migf->mvdev;
   448		struct mlx5_core_dev *mdev = mvdev->mdev;
   449		int ret;
   450	
   451		lockdep_assert_held(&mvdev->state_mutex);
   452		if (mvdev->mdev_detach)
   453			return -ENOTCONN;
   454	
   455		if (buf->mkey_in || !buf->npages)
   456			return -EINVAL;
   457	
   458		buf->mkey_in = alloc_mkey_in(buf->npages, buf->migf->pdn);
   459		if (!buf->mkey_in)
   460			return -ENOMEM;
   461	
   462		ret = register_dma_pages(mdev, buf->npages, buf->page_list,
   463					 buf->mkey_in, &buf->iova);
   464		if (ret)
   465			goto err_register_dma;
   466	
   467		ret = create_mkey(mdev, buf->npages, buf->mkey_in, &buf->mkey);
   468		if (ret)
   469			goto err_create_mkey;
   470	
   471		return 0;
   472	
   473	err_create_mkey:
   474		unregister_dma_pages(mdev, buf->npages, buf->mkey_in, &buf->iova);
   475	err_register_dma:
   476		kvfree(buf->mkey_in);
   477		return ret;
   478	}
   479	
   480	static void free_page_list(u32 npages, struct page **page_list)
   481	{
   482		int i;
   483	
   484		/* Undo alloc_pages_bulk_array() */
   485		for (i = npages - 1; i >= 0; i--)
   486			__free_page(page_list[i]);
   487	
   488		kvfree(page_list);
   489	}
   490	
   491	void mlx5vf_free_data_buffer(struct mlx5_vhca_data_buffer *buf)
   492	{
   493		struct mlx5vf_pci_core_device *mvdev = buf->migf->mvdev;
   494		struct mlx5_core_dev *mdev = mvdev->mdev;
   495	
   496		lockdep_assert_held(&mvdev->state_mutex);
   497		WARN_ON(mvdev->mdev_detach);
   498	
   499		if (buf->mkey_in) {
   500			mlx5_core_destroy_mkey(mdev, buf->mkey);
   501			unregister_dma_pages(mdev, buf->npages, buf->mkey_in, &buf->iova);
   502			kvfree(buf->mkey_in);
   503		}
   504	
   505		free_page_list(buf->npages, buf->page_list);
   506		kfree(buf);
   507	}
   508	
   509	static int mlx5vf_add_migration_pages(struct mlx5_vhca_data_buffer *buf,
   510					      unsigned int npages)
   511	{
   512		unsigned int to_alloc = npages;
   513		size_t old_size, new_size;
   514		struct page **page_list;
   515		unsigned long filled;
   516	
   517		old_size = buf->npages * sizeof(*buf->page_list);
   518		new_size = old_size + to_alloc * sizeof(*buf->page_list);
   519		page_list = kvrealloc(buf->page_list, old_size, new_size,
   520				GFP_KERNEL_ACCOUNT | __GFP_ZERO);
   521		if (!page_list)
   522			return -ENOMEM;
   523	
   524		buf->page_list = page_list;
   525	
   526		do {
   527			filled = alloc_pages_bulk_array(GFP_KERNEL_ACCOUNT, to_alloc,
   528							buf->page_list + buf->npages);
   529			if (!filled)
   530				return -ENOMEM;
   531	
   532			to_alloc -= filled;
   533			buf->npages += filled;
 > 534			to_fill = min_t(unsigned int, to_alloc,
   535					PAGE_SIZE / sizeof(*buf->page_list));
   536		} while (to_alloc > 0);
   537	
   538		return 0;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
