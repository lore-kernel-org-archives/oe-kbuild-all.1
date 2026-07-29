Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB13143BDD1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785313442; cv=none; b=uHELFDEQ0e6+SPHMM0pFn7xq7Xt0a1cN8/jCrawbOS45qGDVYE5QAt4BgKfIsy3SI4bqd51+DgSIp1IVnt07DDaskTGAvRbUL6nrbNRDR+oCUTZsvQhPfUWMpo1uDksW7MJ6J3K5/N2ucX8cJgku7gJMZ5TdH4lwylZK5HvtERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785313442; c=relaxed/simple;
	bh=Gz9HHw7LuNC5xMvrssrN6dcrkA6H4K/fbz5OZnEemUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qPBMy+MgVd2g0/N8hIYwlfFvN4Ddr5+qzsVeM6ymVEF8+jP10cFBgli+2Zk/LV2PzJd7nJf+1lpBq4SaciNFgdDETZQayrFgA9WHYInCTAmemIwWjLyUIxs9rExwtZE8k63i834Wb0Hl638WXJGrpUaU4Fl2mpDWXDORbO4/es4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGVZHvc0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGVZHvc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785313432; x=1816849432;
  h=date:from:to:cc:subject:message-id;
  bh=Gz9HHw7LuNC5xMvrssrN6dcrkA6H4K/fbz5OZnEemUA=;
  b=TGVZHvc0/L0DxQQ08oncB+1VO7jIzDXFW9JOAC2CrR7Pp4SHNAXlqyi7
   oAaygMz+i6fVQMnpBt6S/ssrV6jSVZH2/2raqfiyR/+eR8U2AncUrWAQ/
   mg9aOb7ViXcQS2EFd0zEM2LV+4HQC8LwUDVOe3ZYl4PnsW249VZBpayfh
   q6XCQBRtqCs6k3XluI3T+rMfaABD908mMSq0SEX1tQvgsIw9AKl4oSZgx
   kQ1y/zMhshDjXemzoAoNAomJuZCOgy27UOkmpQfcGAr02OFe/o2MhTRPP
   eLmtH2Z5WpiJ2S6LqBgZKg3gqPwyMrtcoYMkWh9InDnnstZv0BqWw+xHm
   Q==;
X-CSE-ConnectionGUID: IvMhLdF9QSCh+jTsne9ivg==
X-CSE-MsgGUID: p8kHhd+sSGOsdA5epVflSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86103444"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86103444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:23:48 -0700
X-CSE-ConnectionGUID: Lf49/GddROG1kbgzxNJf3A==
X-CSE-MsgGUID: e0i5zCIwQV25MGiQiwOy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="258179310"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2026 01:23:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wozZo-00000000fC5-1WDC;
	Wed, 29 Jul 2026 08:23:44 +0000
Date: Wed, 29 Jul 2026 16:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4 8/14]
 drivers/nvme/host/pci.c:2429:33: sparse: sparse: symbol
 'nvme_dmabuf_importer_ops' was not declared. Should it be static?
Message-ID: <202607291615.ppk2esq4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4
head:   26dcd0ae5c87a3ada5710b14b6894ef343cec6fe
commit: 19e5c945ea8114320c10f7951d19197d48b59249 [8/14] nvme-pci: implement dma_token backed requests
config: arm-randconfig-r131-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291615.ppk2esq4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291615.ppk2esq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291615.ppk2esq4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:2429:33: sparse: sparse: symbol 'nvme_dmabuf_importer_ops' was not declared. Should it be static?
>> drivers/nvme/host/pci.c:2504:29: sparse: sparse: symbol 'nvme_dma_buf_io_ops' was not declared. Should it be static?

vim +/nvme_dmabuf_importer_ops +2429 drivers/nvme/host/pci.c

  2428	
> 2429	const struct dma_buf_attach_ops nvme_dmabuf_importer_ops = {
  2430		.invalidate_mappings	= nvme_dmabuf_invalidate_mappings,
  2431		.allow_peer2peer	= true,
  2432	};
  2433	
  2434	static struct dma_buf_io_map *nvme_dma_buf_io_map(struct dma_buf_io_ctx *ctx)
  2435	{
  2436		unsigned nr_entries = ctx->dmabuf->size / NVME_CTRL_PAGE_SIZE;
  2437		struct dma_buf_attachment *attach = ctx->dev_priv;
  2438		unsigned long tmp, i = 0;
  2439		struct nvme_dmabuf_map *map;
  2440		struct scatterlist *sg;
  2441		struct sg_table *sgt;
  2442		int ret;
  2443	
  2444		dma_resv_assert_held(ctx->dmabuf->resv);
  2445	
  2446		map = kmalloc_flex(*map, dma_list, nr_entries);
  2447		if (!map)
  2448			return ERR_PTR(-ENOMEM);
  2449	
  2450		sgt = dma_buf_map_attachment(attach, ctx->dir);
  2451		if (IS_ERR(sgt)) {
  2452			ret = PTR_ERR(sgt);
  2453			sgt = NULL;
  2454			goto err;
  2455		}
  2456	
  2457		for_each_sgtable_dma_sg(sgt, sg, tmp) {
  2458			dma_addr_t dma_addr = sg_dma_address(sg);
  2459			unsigned long sg_len = sg_dma_len(sg);
  2460	
  2461			if (sg_len % NVME_CTRL_PAGE_SIZE) {
  2462				ret = -EINVAL;
  2463				goto err;
  2464			}
  2465	
  2466			while (sg_len) {
  2467				map->dma_list[i++] = dma_addr;
  2468				dma_addr += NVME_CTRL_PAGE_SIZE;
  2469				sg_len -= NVME_CTRL_PAGE_SIZE;
  2470			}
  2471		}
  2472	
  2473		ret = dma_buf_io_init_map(ctx, &map->base);
  2474		if (ret)
  2475			goto err;
  2476		map->nr_entries = nr_entries;
  2477		map->sgt = sgt;
  2478		return &map->base;
  2479	err:
  2480		if (sgt)
  2481			dma_buf_unmap_attachment(attach, sgt, ctx->dir);
  2482		kfree(map);
  2483		return ERR_PTR(ret);
  2484	}
  2485	
  2486	static void nvme_dma_buf_io_unmap(struct dma_buf_io_ctx *ctx,
  2487					  struct dma_buf_io_map *map_base)
  2488	{
  2489		struct dma_buf_attachment *attach = ctx->dev_priv;
  2490		struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(map_base);
  2491	
  2492		dma_resv_assert_held(ctx->dmabuf->resv);
  2493	
  2494		dma_buf_unmap_attachment(attach, map->sgt, ctx->dir);
  2495	}
  2496	
  2497	static void nvme_dma_buf_io_release(struct dma_buf_io_ctx *ctx)
  2498	{
  2499		struct dma_buf_attachment *attach = ctx->dev_priv;
  2500	
  2501		dma_buf_detach(ctx->dmabuf, attach);
  2502	}
  2503	
> 2504	const struct dma_buf_io_ops nvme_dma_buf_io_ops = {
  2505		.map		= nvme_dma_buf_io_map,
  2506		.unmap		= nvme_dma_buf_io_unmap,
  2507		.release	= nvme_dma_buf_io_release,
  2508	};
  2509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
