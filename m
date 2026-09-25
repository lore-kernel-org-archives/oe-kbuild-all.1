Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47F1940B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 00:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297380; cv=none; b=F4GpUfiqAAo9DkxtScINhBFSfdMOVFj1/pOHR727qEALQL7xp1biFvgDMqVoKXaYhWUWoSih+qpCpFyQ30SzCzHCrg6FmtLdJoeXPhfspYrBeV0kDL3VN9QQrByIQIz+GxRjyVyp09QMEi0NxqqEFEJ98I0abqZhh7gxyEPqrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297380; c=relaxed/simple;
	bh=++9XlYCgfIIOtfASML3TrmG0AJyNMXShChp9RXHNMRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rj9+8euhtSxyi/dV56Fm1xy2X7XOBIipmp6k/30seShL7wfIqNBNlI4u7KEOCTAFyylPBMeVcqo6iHPgtc/AaJIvvGll86wGwwdptB3pHwKZknWixq5H1eCtsO+B/BQwCogCE5j4hla57/lMT5a4TIfoLryJgyVVw8+IMD0Ukqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr8nMxY0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr8nMxY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790297379; x=1821833379;
  h=date:from:to:cc:subject:message-id;
  bh=++9XlYCgfIIOtfASML3TrmG0AJyNMXShChp9RXHNMRk=;
  b=Jr8nMxY0z1CxDuHTgK/7ge3Mm2M/sb9AicIfDM1SVhronmnjU4yqizHp
   rsB/h5FFRjLLpRGaMNKtFgM25WR6gibYyZU/J4Z5P8ZgYTCXwtpBwMa/c
   LHlphV5mVvOvOm2XQbLV1fB0PeQho+Ii8FchVcGV73Y3dxrmDHky/rVsg
   KcJ+xUKQbeuTg1wRWj1c1v6o3gzpsk4X2WHZORqyHlW9bOO6xwaACOBmS
   8Pib8MeCBa0n5AyoDRIJMYcYhHB5eT/45Z/Z1HbehKruDvlqmpmaB7CTU
   vSa1wsJvjrZTrS/f1bK+eYRFBx0ZAvVWFJR5/3D1abCi0wUd0qjCtjXBr
   Q==;
X-CSE-ConnectionGUID: GsgOD2wMRkmlLHLDzNFwxg==
X-CSE-MsgGUID: tZyq3osaQWqCKIS5U8nAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102444328"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="102444328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:49:38 -0700
X-CSE-ConnectionGUID: bEi2BXKvSHSB2Hs9mqENjw==
X-CSE-MsgGUID: GScmY2b+RU+BvNgb3PTG0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273280968"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2026 17:49:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9u86-00000000JtO-0CfM;
	Fri, 25 Sep 2026 00:49:34 +0000
Date: Fri, 25 Sep 2026 08:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v6 6/13]
 drivers/nvme/host/pci.c:2456:33: sparse: sparse: symbol
 'nvme_dmabuf_importer_ops' was not declared. Should it be static?
Message-ID: <202609250812.LPVwIM7X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v6
head:   0d82253d5e930981e6a21503e145a1ebd280f995
commit: e80c3b1e0de004eaca6c51a2a86115ac9ed36381 [6/13] nvme-pci: implement dma-buf backed requests
config: microblaze-randconfig-r1304-20260925 (https://download.01.org/0day-ci/archive/20260925/202609250812.LPVwIM7X-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250812.LPVwIM7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250812.LPVwIM7X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:2456:33: sparse: sparse: symbol 'nvme_dmabuf_importer_ops' was not declared. Should it be static?
>> drivers/nvme/host/pci.c:2540:29: sparse: sparse: symbol 'nvme_dma_buf_io_ops' was not declared. Should it be static?

vim +/nvme_dmabuf_importer_ops +2456 drivers/nvme/host/pci.c

  2455	
> 2456	const struct dma_buf_attach_ops nvme_dmabuf_importer_ops = {
  2457		.invalidate_mappings	= nvme_dmabuf_invalidate_mappings,
  2458		.allow_peer2peer	= true,
  2459	};
  2460	
  2461	static struct dma_buf_io_map *nvme_dma_buf_io_map(struct dma_buf_io_ctx *ctx)
  2462	{
  2463		unsigned nr_entries = ctx->dmabuf->size / NVME_CTRL_PAGE_SIZE;
  2464		struct nvme_dma_buf_io_ctx *nvme_ctx = ctx->dev_priv;
  2465		struct dma_buf_attachment *attach = nvme_ctx->attach;
  2466		unsigned long tmp, i = 0;
  2467		struct nvme_dmabuf_map *map;
  2468		struct scatterlist *sg;
  2469		struct sg_table *sgt;
  2470		int ret;
  2471	
  2472		dma_resv_assert_held(ctx->dmabuf->resv);
  2473	
  2474		map = kmalloc_flex(*map, dma_list, nr_entries);
  2475		if (!map)
  2476			return ERR_PTR(-ENOMEM);
  2477	
  2478		sgt = dma_buf_map_attachment(attach, ctx->dir);
  2479		if (IS_ERR(sgt)) {
  2480			ret = PTR_ERR(sgt);
  2481			sgt = NULL;
  2482			goto err;
  2483		}
  2484	
  2485		for_each_sgtable_dma_sg(sgt, sg, tmp) {
  2486			dma_addr_t dma_addr = sg_dma_address(sg);
  2487			unsigned long sg_len = sg_dma_len(sg);
  2488	
  2489			if (sg_len % NVME_CTRL_PAGE_SIZE) {
  2490				ret = -EINVAL;
  2491				goto err;
  2492			}
  2493			while (sg_len) {
  2494				map->dma_list[i++] = dma_addr;
  2495				dma_addr += NVME_CTRL_PAGE_SIZE;
  2496				sg_len -= NVME_CTRL_PAGE_SIZE;
  2497			}
  2498		}
  2499	
  2500		ret = dma_buf_io_init_map(ctx, &map->base, sgt);
  2501		if (ret)
  2502			goto err;
  2503		map->nr_entries = nr_entries;
  2504		map->sgt = sgt;
  2505		return &map->base;
  2506	err:
  2507		if (sgt)
  2508			dma_buf_unmap_attachment(attach, sgt, ctx->dir);
  2509		kfree(map);
  2510		return ERR_PTR(ret);
  2511	}
  2512	
  2513	static void nvme_dma_buf_io_unmap(struct dma_buf_io_ctx *ctx,
  2514			struct dma_buf_io_map *map_base)
  2515	{
  2516		struct nvme_dma_buf_io_ctx *nvme_ctx = ctx->dev_priv;
  2517		struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(map_base);
  2518	
  2519		dma_resv_assert_held(ctx->dmabuf->resv);
  2520	
  2521		dma_buf_unmap_attachment(nvme_ctx->attach, map->sgt, ctx->dir);
  2522	}
  2523	
  2524	static void nvme_dma_buf_io_release(struct dma_buf_io_ctx *ctx)
  2525	{
  2526		struct nvme_dma_buf_io_ctx *nvme_ctx = ctx->dev_priv;
  2527		struct nvme_dev *dev = nvme_ctx->dev;
  2528	
  2529		mutex_lock(&dev->dmabuf_lock);
  2530		if (!list_empty(&nvme_ctx->list)) {
  2531			dma_buf_detach(ctx->dmabuf, nvme_ctx->attach);
  2532			list_del_init(&nvme_ctx->list);
  2533		}
  2534		mutex_unlock(&dev->dmabuf_lock);
  2535	
  2536		nvme_put_ctrl(&dev->ctrl);
  2537		kfree(nvme_ctx);
  2538	}
  2539	
> 2540	const struct dma_buf_io_ops nvme_dma_buf_io_ops = {
  2541		.map		= nvme_dma_buf_io_map,
  2542		.unmap		= nvme_dma_buf_io_unmap,
  2543		.release	= nvme_dma_buf_io_release,
  2544	};
  2545	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
