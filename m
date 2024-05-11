Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ADA79D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715390983; cv=none; b=Jm7BKAks44bZXN0qtDgqt3gbRN8zGbYBBe+jriZBDcz0zeS101GJ3QD/2jkVyCxmJVXeno1Mw6nlzgF+UqXY6Mjg/Pf+8evmYArJ6wnT+qngPh43rHUOb1gf0mwgvPcrhYRhkhzqG2F7mzkOGJERs0YIEAGfN7DrlJcLBqlhqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715390983; c=relaxed/simple;
	bh=n+5Oq3P4mCWAq8a/9pI291xt12Che1xkpep2kI1ixA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hothahnX53GSTdArYFcBiQth8ruKEzWiV83ONdRHnQ6/WnU2QPxirlBxrn88bYb1MVUz5aSojSIYmlr2oW7HybvlKiFka8F8POVfNHFHInF3NJIjfFxQuVIqLlSCOW10ssIMSJe9N4zrkvfAHI+4Q3eHWGpSHLK4lMJz6q0RTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmmKfLYm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmmKfLYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715390982; x=1746926982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+5Oq3P4mCWAq8a/9pI291xt12Che1xkpep2kI1ixA0=;
  b=VmmKfLYmZV/rOfdZWNaTvbuqAsnU14xlrOAjD842dFwSDrBJfD7RYgQa
   JQ3SF+J+t59izWjKIkcrJ3+tX/Ih5IuhJZGUbhYKpMobsY+rOGfGm6TJy
   XlkVDyXJq75YHhOBWBKmeABRzWYEyFBGhxTxp5RQ8gGWXJnQ46BuxPWM8
   ajqiIQ6pyyuubDcEviMeTbX1CEVgNPqy5uigciyeTz0xwTFDuYfNUOMeK
   zXAgFzaVlYD5vfeKma2XOiDKtnlIoXvEbeWcOO2CJ68wfpeVRq+WB/aqZ
   hZvrCUzOO8ZZbLlMV9fMdUHX5Y+M1OiR8njo6c8PKj2YmleHqgYtg5mnQ
   w==;
X-CSE-ConnectionGUID: UAHP2keqRfeUEn5gpoExhQ==
X-CSE-MsgGUID: wonpV5uSSxee0xMQ8/+fZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="14345279"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="14345279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 18:29:41 -0700
X-CSE-ConnectionGUID: nPvOs9nHTaiF9XtH+bvLwQ==
X-CSE-MsgGUID: bVPtjYuISZWDLPHDts+ITg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29798377"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2024 18:29:40 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5bYP-0006mB-1y;
	Sat, 11 May 2024 01:29:37 +0000
Date: Sat, 11 May 2024 09:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netnext 3/4]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1150:50: error: no member named
 'txd_size' in 'struct mtk_soc_data::(unnamed at
 drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:2)'
Message-ID: <202405110938.FBOSZ1CK-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405110938.FBOSZ1CK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110938.FBOSZ1CK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110938.FBOSZ1CK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1150:50: error: no member named 'txd_size' in 'struct mtk_soc_data::(unnamed at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:2)'
    1150 |         phy_ring_tail = eth->phy_scratch_ring + soc->tx.txd_size * (cnt - 1);
         |                                                 ~~~~~~~ ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1170:68: error: no member named 'txd_size' in 'struct mtk_soc_data::(unnamed at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:2)'
    1170 |                         txd = eth->scratch_ring + (j * MTK_FQ_DMA_LENGTH + i) * soc->tx.txd_size;
         |                                                                                 ~~~~~~~ ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1174:52: error: no member named 'txd_size' in 'struct mtk_soc_data::(unnamed at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:2)'
    1174 |                                             (j * MTK_FQ_DMA_LENGTH + i + 1) * soc->tx.txd_size;
         |                                                                               ~~~~~~~ ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5071:4: error: field designator 'dma_size' does not refer to any field in type 'struct (unnamed struct at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1181:2)'
    5071 |                 .dma_size = MTK_DMA_SIZE(2K),
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5078:4: error: field designator 'dma_size' does not refer to any field in type 'struct (unnamed struct at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1188:2)'
    5078 |                 .dma_size = MTK_DMA_SIZE(2K),
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


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
