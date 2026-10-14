Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA73419302
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009849; cv=none; b=lObKe8hebf3P5gwwrBxfmP5ieN7oVA/GQ0g2SKaAiHBPqL7NZPC6Spm7oAeafon9bK1L7/x/hEmj2SQVFdE2XHUsRdqIT1kk9KzXF8Lm/0PqhhyUq73Il18KgMqwUIHZwGir9EG94PaBxZCvkVzLF3heXa49kRE6lMmxo+4ya58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009849; c=relaxed/simple;
	bh=VccEchKQvo7zkyA48seR+9r0OZwG8Zv6nixMYHjFXMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bj4yBgIEby4MPHUz1v11JXy2RVdn7iEYqlqJ6mlQEuNAh6nCv412Zdm5iJ4T64y3sHkTJHyl7U3C7HwLq1gh/2gnvuuMnhpE/yAj8asxlXH96L+9FfRj1kdSAhq5FJpwS1X4XTw8XouCQAhHSXNNA48plAFOlLnXWY8Q1ze0FNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6WylW/G; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6WylW/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792009848; x=1823545848;
  h=date:from:to:cc:subject:message-id;
  bh=VccEchKQvo7zkyA48seR+9r0OZwG8Zv6nixMYHjFXMs=;
  b=W6WylW/G8iezxFb2GG8NBVtBrEbCCCxWZfaoAMhOOLcylNAwMZtWEJOn
   3EsaGiozSu1sNLWhRf5DX4jHgBwb1Mi7uPX0intxkDILX52S7lFfYdAv8
   yEwuOc3PX4KJjmwY/MqK6TKDkeWFM3hO63X9PXrKrrk9S/1269IhI0b5q
   RkDl+wlCc5+B56sMmDCkZDWwATyvtU5w9oc0S2RbXVScnx+7xpJ6LU4JL
   D/rdGF0yMZe5Oga1p6XyZMO0xN51mvyIqqrHOXfKtz1u/qTByGDEC7GyT
   4bL5E7+zmraX0AZtxD0PI+ZQuhCFUE2H+Ovg3k4cPloyq07QdOT5mA/G0
   g==;
X-CSE-ConnectionGUID: K5XIp2DvStSpXmv9EthnIw==
X-CSE-MsgGUID: rNsrV9/RRlyVgMlPwPK9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="647361"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="647361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 13:30:48 -0700
X-CSE-ConnectionGUID: 4uxKPJmRSrmbi5j/msWedA==
X-CSE-MsgGUID: p6VTlSJUTeOmvO/xpxHA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1852914"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2026 13:30:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH5cZ-00000000FAl-0hsr;
	Wed, 14 Oct 2026 20:30:43 +0000
Date: Thu, 15 Oct 2026 04:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rsslro2 15/15]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3006:17: error: no member named
 'lro_alt_timer' in 'struct mtk_reg_map::(unnamed at
 drivers/net/ethernet/mediatek/mtk_eth_soc.h:1214:2)'
Message-ID: <202610150431.JYQneZ67-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rsslro2
head:   0327d4826547afd9459f4696200a87542fa2fc41
commit: 15df9bebad7152de5ed4925c2ae7c654f6c80176 [15/15] Fix HW LRO uninit sequence.
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261015/202610150431.JYQneZ67-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150431.JYQneZ67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150431.JYQneZ67-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3006:17: error: no member named 'lro_alt_timer' in 'struct mtk_reg_map::(unnamed at drivers/net/ethernet/mediatek/mtk_eth_soc.h:1214:2)'
    3006 |                 reg_map->pdma.lro_alt_timer);
         |                 ~~~~~~~~~~~~~ ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5885:1: warning: unused label 'err_unreg_netdev' [-Wunused-label]
    5885 | err_unreg_netdev:
         | ^~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +3006 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  2956	
  2957	static int mtk_hwlro_rx_init(struct mtk_eth *eth)
  2958	{
  2959		u32 ring_ctrl_dw1 = 0, ring_ctrl_dw2 = 0, ring_ctrl_dw3 = 0;
  2960		const struct mtk_reg_map *reg_map = eth->soc->reg_map;
  2961		const struct mtk_soc_data *soc = eth->soc;
  2962		u32 lro_ctrl_dw0 = 0, lro_ctrl_dw3 = 0;
  2963		int i, val;
  2964	
  2965		/* set LRO rings to auto-learn modes */
  2966		ring_ctrl_dw2 |= MTK_RING_AUTO_LERAN_MODE;
  2967	
  2968		/* validate LRO ring */
  2969		ring_ctrl_dw2 |= MTK_RING_VLD;
  2970	
  2971		/* set AGE timer (unit: 20us) */
  2972		ring_ctrl_dw2 |= MTK_RING_AGE_TIME_H;
  2973		ring_ctrl_dw1 |= MTK_RING_AGE_TIME_L;
  2974	
  2975		/* set max AGG timer (unit: 20us) */
  2976		ring_ctrl_dw2 |= MTK_RING_MAX_AGG_TIME;
  2977	
  2978		/* set max LRO AGG count */
  2979		ring_ctrl_dw2 |= MTK_RING_MAX_AGG_CNT_L;
  2980		ring_ctrl_dw3 |= MTK_RING_MAX_AGG_CNT_H;
  2981	
  2982		for (i = 1; i <= MTK_HW_LRO_RING_NUM(eth); i++) {
  2983			mtk_w32(eth, ring_ctrl_dw1, MTK_LRO_CTRL_DW1_CFG(reg_map, i));
  2984			mtk_w32(eth, ring_ctrl_dw2, MTK_LRO_CTRL_DW2_CFG(reg_map, i));
  2985			mtk_w32(eth, ring_ctrl_dw3, MTK_LRO_CTRL_DW3_CFG(reg_map, i));
  2986		}
  2987	
  2988		/* IPv4 checksum update enable */
  2989		lro_ctrl_dw0 |= MTK_L3_CKS_UPD_EN(eth);
  2990	
  2991		/* switch priority comparison to packet count mode */
  2992		lro_ctrl_dw0 |= MTK_LRO_ALT_PKT_CNT_MODE;
  2993	
  2994		/* enable L4 PSH flag check */
  2995		if (mtk_is_netsys_v3_or_greater(eth))
  2996			lro_ctrl_dw0 |= MTK_LRO_L4_CTRL_PSH_EN;
  2997	
  2998		/* bandwidth threshold setting */
  2999		mtk_w32(eth, MTK_HW_LRO_BW_THRE, MTK_PDMA_LRO_CTRL_DW2(reg_map));
  3000	
  3001		/* auto-learn score delta setting */
  3002		mtk_w32(eth, MTK_HW_LRO_REPLACE_DELTA, MTK_PDMA_LRO_ALT_SCORE_DELTA(reg_map));
  3003	
  3004		/* set refresh timer for altering flows to 1 sec. (unit: 20us) */
  3005		mtk_w32(eth, (MTK_HW_LRO_TIMER_UNIT << 16) | MTK_HW_LRO_REFRESH_TIME,
> 3006			reg_map->pdma.lro_alt_timer);
  3007	
  3008		if (mtk_is_netsys_v3_or_greater(eth)) {
  3009			val = mtk_r32(eth, reg_map->pdma.rx_cfg);
  3010			mtk_w32(eth, val | ((MTK_PDMA_LRO_SDL + MTK_MAX_RX_LENGTH) <<
  3011				MTK_RX_CFG_SDL_OFFSET), reg_map->pdma.rx_cfg);
  3012	
  3013			lro_ctrl_dw0 |= MTK_PDMA_LRO_SDL << MTK_CTRL_DW0_SDL_OFFSET;
  3014	
  3015			/* enable cpu reason black list */
  3016			lro_ctrl_dw0 |= MTK_LRO_CRSN_BNW(eth);
  3017	
  3018			/* no use PPE cpu reason */
  3019			mtk_w32(eth, 0xffffffff, MTK_PDMA_LRO_CTRL_DW1(reg_map));
  3020		} else {
  3021			/* set HW LRO mode & the max aggregation count for rx packets */
  3022			lro_ctrl_dw3 |= MTK_ADMA_MODE | (MTK_HW_LRO_MAX_AGG_CNT & 0xff);
  3023		}
  3024	
  3025		/* enable max 4-depth VLAN support including switch special tag */
  3026		lro_ctrl_dw3 |= MTK_LRO_VLAN_VID_CMP_DEPTH | MTK_LRO_VLAN_EN;
  3027	
  3028		/* the minimal remaining room of SDL0 in RXD for lro aggregation */
  3029		lro_ctrl_dw3 |= MTK_LRO_MIN_RXD_SDL;
  3030	
  3031		/* enable HW LRO */
  3032		lro_ctrl_dw0 |= MTK_LRO_EN;
  3033	
  3034		mtk_w32(eth, lro_ctrl_dw3, MTK_PDMA_LRO_CTRL_DW3(reg_map));
  3035		mtk_w32(eth, lro_ctrl_dw0, MTK_PDMA_LRO_CTRL_DW0(reg_map));
  3036	
  3037		if (mtk_is_netsys_v2_or_greater(eth)) {
  3038			i = (soc->rx.desc_size == sizeof(struct mtk_rx_dma_v2)) ? 1 : 0;
  3039			mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i)),
  3040				MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i)), reg_map->pdma.int_grp);
  3041			mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i + 1)),
  3042				MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i + 1)),
  3043				reg_map->pdma.int_grp + 0x4);
  3044			mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i + 2)),
  3045				MTK_RX_DONE_INT(eth, MTK_HW_LRO_RING(eth, i + 2)), reg_map->pdma.int_grp3);
  3046		}
  3047	
  3048		return 0;
  3049	}
  3050	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
