Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DFA944F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 17:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715362888; cv=none; b=j0S3FvpX18t3iMkKQgJkRzdlvKTFGoxP3O7axGazsV1GljhPUbAK+56OvbWEBL9g2Pug8EVhiYMZA3cDTZ81wQ30UPIjgFfRUpjPlSkavDlDznAcCTaSD67Xl2NwCKcALLI02IyWGQmazcd4e/iTWAlmVAqYb8oEW4JLwuoCD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715362888; c=relaxed/simple;
	bh=VwM+5YJkdCCO/1x2RaFhFn51m9oJeXBh0Si8vnjKDyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRFgemdZM2Pnb/cAmaOJDSueOh96rgYBOI2Be2xW4ECOd98KJNKyADxbI/G2beYMSAzkFGdf/JWZynH8MCya1gM+J1kc9tZU+yJaQztuHN//R3kgkuQVE0KnBn1kprS6/R1Gb6U9hfT7qnwzCOHGfs41bWhSgFqAi0CCpSfIez8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsThjYlo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsThjYlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715362887; x=1746898887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwM+5YJkdCCO/1x2RaFhFn51m9oJeXBh0Si8vnjKDyc=;
  b=KsThjYloh4iRLhLj0IptScFBGg2uGYrSXWubqFfwEW3jea+XB9IdpYFy
   gr+HsDrIUUB72lPCejdajNY4KBWiHfdx0C/asNZl36N9BTqOepR41jqtp
   SHtra4eIPpb0tFmP9cj62Xw6tACzXp+v4aOrQWYWCDHg4JfHTSaYotsVd
   4GzETBEXGcQgJqCD7Ii+E0xR3Yu6+qDk4BVqNggWo5U/I5CAHz0pYR7MG
   1RQqZjShX1wF4hbHs4kG+nt5bLQytCfj/fK6xVRVyOhtRWxn/SPVK2lyC
   v6ieWCJx5f68yNnOsQpCwEGkmu0lteQGgfofAGlRc9UmYe54hsrZ2ZeGj
   A==;
X-CSE-ConnectionGUID: mSC84DRWSIC62uE+5wAklg==
X-CSE-MsgGUID: PVDSh2WiQ4CTclKTO0O51Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11572821"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11572821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:41:26 -0700
X-CSE-ConnectionGUID: V6qIjIrxSzaIUZtwh57VeA==
X-CSE-MsgGUID: sTicpcxnS1iehgrtm/zUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="52901746"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2024 10:41:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5UFH-0006RL-0y;
	Fri, 10 May 2024 17:41:23 +0000
Date: Sat, 11 May 2024 01:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netnext 3/4]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1150:57: error: 'const struct
 <anonymous>' has no member named 'txd_size'; did you mean 'tx_dma_size'?
Message-ID: <202405110144.Ca6tMbps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netnext
head:   1e4e8b309fb8046b0b6fe43a01c296c606833938
commit: aa62e0d7ebff3929eb1b1d8fb415ff217d2eda85 [3/4] net: mediatek: make MTK_DMA_SIZE soc specific
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405110144.Ca6tMbps-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110144.Ca6tMbps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110144.Ca6tMbps-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_init_fq_dma':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1150:57: error: 'const struct <anonymous>' has no member named 'txd_size'; did you mean 'tx_dma_size'?
    1150 |         phy_ring_tail = eth->phy_scratch_ring + soc->tx.txd_size * (cnt - 1);
         |                                                         ^~~~~~~~
         |                                                         tx_dma_size
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1170:89: error: 'const struct <anonymous>' has no member named 'txd_size'; did you mean 'tx_dma_size'?
    1170 |                         txd = eth->scratch_ring + (j * MTK_FQ_DMA_LENGTH + i) * soc->tx.txd_size;
         |                                                                                         ^~~~~~~~
         |                                                                                         tx_dma_size
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1174:87: error: 'const struct <anonymous>' has no member named 'txd_size'; did you mean 'tx_dma_size'?
    1174 |                                             (j * MTK_FQ_DMA_LENGTH + i + 1) * soc->tx.txd_size;
         |                                                                                       ^~~~~~~~
         |                                                                                       tx_dma_size
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: At top level:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5071:18: error: 'struct <anonymous>' has no member named 'dma_size'; did you mean 'desc_size'?
    5071 |                 .dma_size = MTK_DMA_SIZE(2K),
         |                  ^~~~~~~~
         |                  desc_size
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5078:18: error: 'struct <anonymous>' has no member named 'dma_size'; did you mean 'desc_size'?
    5078 |                 .dma_size = MTK_DMA_SIZE(2K),
         |                  ^~~~~~~~
         |                  desc_size
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:31:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:32:33: warning: initialized field overwritten [-Woverride-init]
      32 | #define MTK_TX_DMA_BUF_LEN      0x3fff
         |                                 ^~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5079:32: note: in expansion of macro 'MTK_TX_DMA_BUF_LEN'
    5079 |                 .dma_max_len = MTK_TX_DMA_BUF_LEN,
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:32:33: note: (near initialization for 'mt2701_data.rx.dma_max_len')
      32 | #define MTK_TX_DMA_BUF_LEN      0x3fff
         |                                 ^~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5079:32: note: in expansion of macro 'MTK_TX_DMA_BUF_LEN'
    5079 |                 .dma_max_len = MTK_TX_DMA_BUF_LEN,
         |                                ^~~~~~~~~~~~~~~~~~


vim +1150 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1128	
  1129	/* the qdma core needs scratch memory to be setup */
  1130	static int mtk_init_fq_dma(struct mtk_eth *eth)
  1131	{
  1132		const struct mtk_soc_data *soc = eth->soc;
  1133		dma_addr_t phy_ring_tail;
  1134		int cnt = soc->tx.fq_dma_size;
  1135		dma_addr_t dma_addr;
  1136		u64 addr64 = 0;
  1137		int i, j, len;
  1138	
  1139		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM))
  1140			eth->scratch_ring = eth->sram_base;
  1141		else
  1142			eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
  1143							       cnt * soc->tx.desc_size,
  1144							       &eth->phy_scratch_ring,
  1145							       GFP_KERNEL);
  1146	
  1147		if (unlikely(!eth->scratch_ring))
  1148			return -ENOMEM;
  1149	
> 1150		phy_ring_tail = eth->phy_scratch_ring + soc->tx.txd_size * (cnt - 1);
  1151	
  1152		for (j = 0; j < DIV_ROUND_UP(soc->tx.fq_dma_size, MTK_FQ_DMA_LENGTH); j++) {
  1153			len = min_t(int, cnt - j * MTK_FQ_DMA_LENGTH, MTK_FQ_DMA_LENGTH);
  1154			eth->scratch_head[j] = kcalloc(len, MTK_QDMA_PAGE_SIZE, GFP_KERNEL);
  1155	
  1156			if (unlikely(!eth->scratch_head[j]))
  1157				return -ENOMEM;
  1158	
  1159			dma_addr = dma_map_single(eth->dma_dev,
  1160						  eth->scratch_head[j], len * MTK_QDMA_PAGE_SIZE,
  1161						  DMA_FROM_DEVICE);
  1162	
  1163			if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
  1164				return -ENOMEM;
  1165	
  1166			for (i = 0; i < cnt; i++) {
  1167				//dma_addr_t addr = dma_addr + i * MTK_QDMA_PAGE_SIZE;
  1168				struct mtk_tx_dma_v2 *txd;
  1169	
  1170				txd = eth->scratch_ring + (j * MTK_FQ_DMA_LENGTH + i) * soc->tx.txd_size;
  1171				txd->txd1 = dma_addr + i * MTK_QDMA_PAGE_SIZE;
  1172				if (j * MTK_FQ_DMA_LENGTH + i < cnt)
  1173					txd->txd2 = eth->phy_scratch_ring +
  1174						    (j * MTK_FQ_DMA_LENGTH + i + 1) * soc->tx.txd_size;
  1175	
  1176				addr64 = (MTK_HAS_CAPS(eth->soc->caps, MTK_8GB_ADDRESSING)) ?
  1177					  TX_DMA_SDP1(dma_addr + i * MTK_QDMA_PAGE_SIZE) : 0;
  1178	
  1179				txd->txd3 = TX_DMA_PLEN0(MTK_QDMA_PAGE_SIZE) | addr64;
  1180	
  1181				if (MTK_HAS_CAPS(soc->caps, MTK_36BIT_DMA))
  1182					txd->txd3 |= TX_DMA_PREP_ADDR64(addr64);
  1183	
  1184				txd->txd4 = 0;
  1185				if (mtk_is_netsys_v2_or_greater(eth)) {
  1186					txd->txd5 = 0;
  1187					txd->txd6 = 0;
  1188					txd->txd7 = 0;
  1189					txd->txd8 = 0;
  1190				}
  1191			}
  1192		}
  1193	
  1194		mtk_w32(eth, eth->phy_scratch_ring, soc->reg_map->qdma.fq_head);
  1195		mtk_w32(eth, phy_ring_tail, soc->reg_map->qdma.fq_tail);
  1196		mtk_w32(eth, (cnt << 16) | cnt, soc->reg_map->qdma.fq_count);
  1197		mtk_w32(eth, MTK_QDMA_PAGE_SIZE << 16, soc->reg_map->qdma.fq_blen);
  1198	
  1199		return 0;
  1200	}
  1201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
