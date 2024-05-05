Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2D1339A2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 22:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714947814; cv=none; b=rfUB1N67uM5XrH7J2PxZix8XDNu436qkfLHVgsS7hUafjM6ppTvOsjm5vU3z6XLDXuM6A0FW8jQ4sq/25+6Q+1f5TsumRsAqDEpjTjA3MvfTpy1Zx0d06HdwmRNggXug8gysz/+vTnuvJJUExpD03cez6eqyPvPopwVAumzHH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714947814; c=relaxed/simple;
	bh=c4rxBXZNxnSTwo/P6OYdZPtb8tRm/N64x9EQxDvJRRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkdQvu6I26LLDDOvh4PVRAnn+zVZs6xzwPEtqkVGgTzwUDVkAx4+Jgengw0pcITkhiEkEw0Cc/jUCkOz/l91R7wgQjoiShZ+voxgSo2uv6twrsXOIYHljtmwRVYIxzoMZb0mtBpuzy4g7KR7U25EHduI5MThLuv+0/hzhyL0OzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEtKMCcr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEtKMCcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714947812; x=1746483812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4rxBXZNxnSTwo/P6OYdZPtb8tRm/N64x9EQxDvJRRA=;
  b=jEtKMCcrzNIhDe4mNSXYo2xnTbBCFS0LV+qOwgJfn8wLCD1P9jKohjm2
   UIEfYGRRctPWM6BJYLQRdZtLNoa+Ze8vpQJRTg73jOoWtfR1Ysfevy4ue
   MDJmujkADjWIrPCEwqRU2w32vp4m+yEoQhvafWw8RGSagBgoPbI71kHIv
   hlNGLLnZWZqekNu1+Y+F3YeJZZB9M1vNadC+RIp2xYlv/Yl5olLWeWf/F
   GOOg7OXlax7CR4fuKsI5HPvVQQBeiqvVe2S7ce2GisMJoD1r9ceAnNc/Q
   sUB8Y4mSWhPRReVFaoTovwvBMDRwyRDAN3dnn3N3ZItrJA4nDleiqIaUX
   g==;
X-CSE-ConnectionGUID: 1U9NZomBSR+U6p4eLCaCFA==
X-CSE-MsgGUID: FRmUqSg7Qbqv2hPliKDkfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10513132"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10513132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 15:23:32 -0700
X-CSE-ConnectionGUID: 9ZfgZfOAQx+uxZQpnvqHvg==
X-CSE-MsgGUID: OZ7wk5HZTdmW92ON92DRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28067000"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 15:23:31 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3kGW-0000Fk-1s;
	Sun, 05 May 2024 22:23:28 +0000
Date: Mon, 6 May 2024 06:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netdma 35/36]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1364:36: warning: unused
 variable 'addr'
Message-ID: <202405060659.wOdHePO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netdma
head:   f4e76f5899b89144d4421d61833ecc6bee17328f
commit: afb3fcc813b994c689a568e83981189ff2566134 [35/36] tx-dma revert the 36bit adressing part
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405060659.wOdHePO3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060659.wOdHePO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060659.wOdHePO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_init_fq_dma':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1364:36: warning: unused variable 'addr' [-Wunused-variable]
    1364 |                         dma_addr_t addr = dma_addr + i * MTK_QDMA_PAGE_SIZE;
         |                                    ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4632:12: warning: 'mtk_change_mtu' defined but not used [-Wunused-function]
    4632 | static int mtk_change_mtu(struct net_device *dev, int new_mtu)
         |            ^~~~~~~~~~~~~~


vim +/addr +1364 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1326	
  1327	/* the qdma core needs scratch memory to be setup */
  1328	static int mtk_init_fq_dma(struct mtk_eth *eth)
  1329	{
  1330		const struct mtk_soc_data *soc = eth->soc;
  1331		dma_addr_t phy_ring_tail;
  1332		int cnt = soc->txrx.fq_dma_size;
  1333		dma_addr_t dma_addr;
  1334		int i, j, len;
  1335	
  1336		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM))
  1337			eth->scratch_ring = eth->sram_base;
  1338		else
  1339			eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
  1340							       cnt * soc->txrx.txd_size,
  1341							       &eth->phy_scratch_ring,
  1342							       GFP_KERNEL);
  1343	
  1344		if (unlikely(!eth->scratch_ring))
  1345			return -ENOMEM;
  1346	
  1347		phy_ring_tail = eth->phy_scratch_ring + soc->txrx.txd_size * (cnt - 1);
  1348	
  1349		for (j = 0; j < DIV_ROUND_UP(soc->txrx.fq_dma_size, MTK_FQ_DMA_LENGTH); j++) {
  1350			len = min_t(int, cnt - j * MTK_FQ_DMA_LENGTH, MTK_FQ_DMA_LENGTH);
  1351			eth->scratch_head[j] = kcalloc(len, MTK_QDMA_PAGE_SIZE, GFP_KERNEL);
  1352	
  1353			if (unlikely(!eth->scratch_head[j]))
  1354				return -ENOMEM;
  1355	
  1356			dma_addr = dma_map_single(eth->dma_dev,
  1357						  eth->scratch_head[j], len * MTK_QDMA_PAGE_SIZE,
  1358						  DMA_FROM_DEVICE);
  1359	
  1360			if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
  1361				return -ENOMEM;
  1362	
  1363			for (i = 0; i < cnt; i++) {
> 1364				dma_addr_t addr = dma_addr + i * MTK_QDMA_PAGE_SIZE;
  1365				struct mtk_tx_dma_v2 *txd;
  1366	
  1367				txd = eth->scratch_ring + (j * MTK_FQ_DMA_LENGTH + i) * soc->txrx.txd_size;
  1368				txd->txd1 = dma_addr + i * MTK_QDMA_PAGE_SIZE;
  1369				if (j * MTK_FQ_DMA_LENGTH + i < cnt)
  1370					txd->txd2 = eth->phy_scratch_ring +
  1371						    (j * MTK_FQ_DMA_LENGTH + i + 1) * soc->txrx.txd_size;
  1372	
  1373				txd->txd3 = TX_DMA_PLEN0(MTK_QDMA_PAGE_SIZE);
  1374				if (MTK_HAS_CAPS(soc->caps, MTK_36BIT_DMA))
  1375					txd->txd3 |= TX_DMA_PREP_ADDR64(addr);
  1376	
  1377				txd->txd4 = 0;
  1378				if (mtk_is_netsys_v2_or_greater(eth)) {
  1379					txd->txd5 = 0;
  1380					txd->txd6 = 0;
  1381					txd->txd7 = 0;
  1382					txd->txd8 = 0;
  1383				}
  1384			}
  1385		}
  1386	
  1387		mtk_w32(eth, eth->phy_scratch_ring, soc->reg_map->qdma.fq_head);
  1388		mtk_w32(eth, phy_ring_tail, soc->reg_map->qdma.fq_tail);
  1389		mtk_w32(eth, (cnt << 16) | cnt, soc->reg_map->qdma.fq_count);
  1390		mtk_w32(eth, MTK_QDMA_PAGE_SIZE << 16, soc->reg_map->qdma.fq_blen);
  1391	
  1392		return 0;
  1393	}
  1394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
