Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016D22D12F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594552; cv=none; b=GnowiNSitiYxOtLihk23lhXkrH8eoZu7iEfoakNZZq3bphLmINb+kR2F3WFrjg57fwwie9to/ktGtTlgHPnSekFVd6bQBIBZvo4bCDNZEhl4TBD4GyYY1d0czeVaws5zykzPybI1ePR1Ucv7QkgENYF1dMz94DMZWkrBWQnXzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594552; c=relaxed/simple;
	bh=kAucBYJy3/iBuHpqV9tSUfqwhRTOFOj6GhFSPikbeMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mk7XgD+vUeGKAw+5U8BZsgT4aTcbyWTjKCdA9yd8vVLg7y0JE+T8ocnbDbmCE/FD/2WSVIOXLpzOZjAr6nU/TuJP390xKSIPV2SL4xNoQSFiL/P55ni8LDFOmWGU491F2RezyUHeVaiBuxg51uqQVW09wevTFPrpVWP/uRmguxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcjUlGo6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcjUlGo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769594551; x=1801130551;
  h=date:from:to:cc:subject:message-id;
  bh=kAucBYJy3/iBuHpqV9tSUfqwhRTOFOj6GhFSPikbeMY=;
  b=RcjUlGo66CiUFF+IFdTyw+Keq4XsBWwfro1mZIsc3jUDGtME8KzWsAcL
   9xlfR+DlBfH7sPJ5eTls9HhK+9DU0dLyuIqtfqe+09E7MGpq84i5C94rE
   NH1cgi5but/MjX9bzufCNAW4pH9I+rf6sNDxyzkZZfEOFjgfyxYaq2lOU
   y6IvCRPjlSUw7nT6zroIbZ/Xk3or2o31Ji8Y+Ky1RhmPBTSjnxY+gcq2q
   n6c6t2IKouzMPsu+D8P91Wqi2MctMp2TxKNRWMCqObhZSCwYdayLiTDo2
   eZJvqCdp3BMF2hdXqkIsyZ2M+PefZHYlhlhIBVNhHPVQPhTbvhrhY6xN0
   A==;
X-CSE-ConnectionGUID: oNrHDwVRRhCpNGL6iHyNjg==
X-CSE-MsgGUID: IvKgJ436RROVtQc74+Bqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70702883"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70702883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:02:31 -0800
X-CSE-ConnectionGUID: Tit4kS9aS5OwBOJDvtYU+w==
X-CSE-MsgGUID: MWFE90QhTk+5ML0iw3T5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212777204"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2026 02:02:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl2NW-00000000ZWc-0kGj;
	Wed, 28 Jan 2026 10:02:26 +0000
Date: Wed, 28 Jan 2026 18:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:virtio-dmb 1/1]
 drivers/virtio/virtio_pci_modern.c:545:45: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202601281736.6KZZJdNR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/agraf/linux-2.6.git virtio-dmb
head:   45a0bb294baa814a4b7f4acbc0eea8c55b05cd69
commit: 45a0bb294baa814a4b7f4acbc0eea8c55b05cd69 [1/1] virtio-pci: Add Device Memory Buffer (DMB) support
config: x86_64-randconfig-123-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281736.6KZZJdNR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281736.6KZZJdNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281736.6KZZJdNR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_pci_modern.c:545:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *shmem_vaddr @@     got void [noderef] __iomem * @@
   drivers/virtio/virtio_pci_modern.c:545:45: sparse:     expected void *shmem_vaddr
   drivers/virtio/virtio_pci_modern.c:545:45: sparse:     got void [noderef] __iomem *
   drivers/virtio/virtio_pci_modern.c:567:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *shmem_vaddr @@     got void [noderef] __iomem * @@
   drivers/virtio/virtio_pci_modern.c:567:45: sparse:     expected void *shmem_vaddr
   drivers/virtio/virtio_pci_modern.c:567:45: sparse:     got void [noderef] __iomem *
   drivers/virtio/virtio_pci_modern.c:587:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *shmem_vaddr @@     got void [noderef] __iomem * @@
   drivers/virtio/virtio_pci_modern.c:587:45: sparse:     expected void *shmem_vaddr
   drivers/virtio/virtio_pci_modern.c:587:45: sparse:     got void [noderef] __iomem *
>> drivers/virtio/virtio_pci_modern.c:659:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dmb_mem @@     got void * @@
   drivers/virtio/virtio_pci_modern.c:659:33: sparse:     expected void [noderef] __iomem *dmb_mem
   drivers/virtio/virtio_pci_modern.c:659:33: sparse:     got void *

vim +545 drivers/virtio/virtio_pci_modern.c

   538	
   539	static void vp_dmb_unmap_page(union virtio_map map, dma_addr_t map_handle,
   540					     size_t size, enum dma_data_direction dir,
   541					     ulong attrs)
   542	{
   543		struct pci_dev *pci_dev = to_pci_dev(map.dma_dev);
   544		struct virtio_pci_device *vp_dev = pci_get_drvdata(pci_dev);
 > 545		void *shmem_vaddr = vp_dev->dmb_mem + map_handle;
   546		struct device *dev = &pci_dev->dev;
   547		struct vp_dmb_mapping *mapping;
   548	
   549		mapping = vp_dmb_pop_map(vp_dev, map_handle);
   550		if (dev_WARN_ONCE(dev, !mapping, "Unmap without map of handle %lx", (long)map_handle))
   551			return;
   552	
   553		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
   554		    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
   555			memcpy(mapping->va, shmem_vaddr, size);
   556	
   557		kfree(mapping);
   558	
   559		vp_dmb_free(map, size, shmem_vaddr, map_handle, attrs);
   560	}
   561	
   562	static void vp_dmb_sync_single_for_cpu(union virtio_map map, dma_addr_t map_handle,
   563						      size_t size, enum dma_data_direction dir)
   564	{
   565		struct pci_dev *pci_dev = to_pci_dev(map.dma_dev);
   566		struct virtio_pci_device *vp_dev = pci_get_drvdata(pci_dev);
   567		void *shmem_vaddr = vp_dev->dmb_mem + map_handle;
   568		struct device *dev = &pci_dev->dev;
   569		struct vp_dmb_mapping mapping = {};
   570		int r;
   571	
   572		r = vp_dmb_peek_map(vp_dev, map_handle, &mapping);
   573	
   574		if (dev_WARN_ONCE(dev, r, "CPU sync without map of handle %lx", (long)map_handle))
   575			return;
   576	
   577		if ((dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)) {
   578			memcpy(mapping.va, shmem_vaddr, size);
   579		}
   580	}
   581	
   582	static void vp_dmb_sync_single_for_device(union virtio_map map, dma_addr_t map_handle,
   583							 size_t size, enum dma_data_direction dir)
   584	{
   585		struct pci_dev *pci_dev = to_pci_dev(map.dma_dev);
   586		struct virtio_pci_device *vp_dev = pci_get_drvdata(pci_dev);
   587		void *shmem_vaddr = vp_dev->dmb_mem + map_handle;
   588		struct device *dev = &pci_dev->dev;
   589		struct vp_dmb_mapping mapping;
   590		int r;
   591	
   592		r = vp_dmb_peek_map(vp_dev, map_handle, &mapping);
   593	
   594		if (dev_WARN_ONCE(dev, r, "CPU sync without map of handle %lx", (long)map_handle))
   595			return;
   596	
   597		if ((dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
   598			memcpy(shmem_vaddr, mapping.va, size);
   599	}
   600	
   601	static bool vp_dmb_need_sync(union virtio_map map, dma_addr_t map_handle)
   602	{
   603		return true;
   604	}
   605	
   606	static int vp_dmb_mapping_error(union virtio_map map, dma_addr_t map_handle)
   607	{
   608		return dma_mapping_error(map.dma_dev, map_handle);
   609	}
   610	
   611	static size_t vp_dmb_max_mapping_size(union virtio_map map)
   612	{
   613		return 1024 * 1024; /* 1 MiB */
   614	}
   615	
   616	static const struct virtio_map_ops vp_dmb_map_ops = {
   617		.map_page = vp_dmb_map_page,
   618		.unmap_page = vp_dmb_unmap_page,
   619		.sync_single_for_cpu = vp_dmb_sync_single_for_cpu,
   620		.sync_single_for_device = vp_dmb_sync_single_for_device,
   621		.alloc = vp_dmb_alloc,
   622		.free = vp_dmb_free,
   623		.need_sync = vp_dmb_need_sync,
   624		.mapping_error = vp_dmb_mapping_error,
   625		.max_mapping_size = vp_dmb_max_mapping_size,
   626	};
   627	
   628	/* virtio config->finalize_features() implementation */
   629	static int vp_finalize_features(struct virtio_device *vdev)
   630	{
   631		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
   632		u64 features = vdev->features;
   633	
   634		/* Give virtio_ring a chance to accept features. */
   635		vring_transport_features(vdev);
   636	
   637		/* Give virtio_pci a chance to accept features. */
   638		vp_transport_features(vdev, features);
   639	
   640		if (!__virtio_test_bit(vdev, VIRTIO_F_VERSION_1)) {
   641			dev_err(&vdev->dev, "virtio: device uses modern interface "
   642				"but does not have VIRTIO_F_VERSION_1\n");
   643			return -EINVAL;
   644		}
   645	
   646		if (vp_check_common_size(vdev))
   647			return -EINVAL;
   648	
   649		/* Initialize Device Memory Buffer if advertised by host */
   650		if (__virtio_test_bit(vdev, VIRTIO_F_DMB)) {
   651			struct virtio_shm_region region;
   652	
   653			if (!virtio_get_shm_region(vdev, &region, VIRTIO_SHMEM_ID_DMB)) {
   654				dev_warn(&vdev->dev, "Failed to find DMB region");
   655				return -EINVAL;
   656			}
   657	
   658			vp_dev->dmb_pool = devm_gen_pool_create(&vdev->dev, ilog2(SMP_CACHE_BYTES), -1, "virtio-shmem");
 > 659			vp_dev->dmb_mem = devm_memremap(&vdev->dev, region.addr, region.len, MEMREMAP_WB | MEMREMAP_DEC);
   660			INIT_LIST_HEAD(&vp_dev->dmb_mappings);
   661			spin_lock_init(&vp_dev->dmb_lock);
   662	
   663			if (vp_dev->dmb_pool) {
   664				int ret = gen_pool_add_virt(vp_dev->dmb_pool, (ulong)vp_dev->dmb_mem,
   665							    region.addr, region.len, -1);
   666				if (ret != 0) {
   667					dev_warn(&vdev->dev, "Failed to initialize DMB region");
   668					return -EINVAL;
   669				}
   670	
   671				/* Reserve first cache line to avoid offset 0 allocations */
   672				ulong reserved = gen_pool_alloc(vp_dev->dmb_pool, SMP_CACHE_BYTES);
   673				if (!reserved) {
   674					dev_warn(&vdev->dev, "Failed to reserve shmem offset 0");
   675					return -EINVAL;
   676				}
   677				vdev->map = &vp_dmb_map_ops;
   678				vdev->vmap.dma_dev = &vp_dev->pci_dev->dev;
   679	
   680				dev_info(&vdev->dev, "Enabled %d bytes Virtio DMB region for %s", (int)region.len, dev_name(&vp_dev->pci_dev->dev));
   681			}
   682		}
   683	
   684		vp_modern_set_extended_features(&vp_dev->mdev, vdev->features_array);
   685	
   686		return 0;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
