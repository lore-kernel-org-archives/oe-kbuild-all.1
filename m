Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552832F744F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389936; cv=none; b=fsFiObdGUXnD8pB9b4+E0B8QzPJY3gHFREqy1GECrcWvcBDSIFTGmDH6MtAWrDC6K6r3CN3BtahzfinIu8ngQGGCvFPIQ7ofM1taxDkQCPzNRQ+3XKp80GEV34zYT81kkmhB5racqAACD4yWlQ/TDdbrgrXmLLGacpMbwUDgnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389936; c=relaxed/simple;
	bh=K1r9w8c3gYu3Ur0CQuEkwBpJi9SQY+eRb4bI1XcNgrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OwTNaJuKw2VuddaRdmzRK6Rxg263BieY0bFsvW4MCH36qXW4G0eSquZ8IwLqm8Gu0EhFTm0kDirpo4E8nmdGpQywTN2zHnpgUa0nJQdpubR9lz3oeSoBUnanp+gbGhumFtaf/l9FPXNmOkFpjjOOD5WN94ZIgG5IVeIocm4qkOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kxeyh8uY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kxeyh8uY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766389934; x=1797925934;
  h=date:from:to:cc:subject:message-id;
  bh=K1r9w8c3gYu3Ur0CQuEkwBpJi9SQY+eRb4bI1XcNgrY=;
  b=Kxeyh8uYmqtuWbGA02NE6uLwCUZmPnoPTfNt0yF/zfcNXXf4aME5+lf+
   To26KKyn5FxFRipR/iVZs5QADvDDvIFfjC+onC6oKVJ9v/3jJJ6i+mcNH
   FvuCtAAW5S2rC83n9oQvOdI+ULAQlA6MPGLxomYX6NfvqCkenVpyogX4Y
   xgHSnhrKhQDsjQSpA1/kEI+RDhQSxzD9fc0RZ7+NEfw6QO+iJ6hxgKAkX
   Pnz4ntYk1TrmqkqzxOQJfbLZugFCUyQ12FvjPSA97ilqRq2xfocGCeMiQ
   u2LiT5KseClXmW/J7jFmaTj9IP7xl8wEQ/aiwfo+ff9PnPDH3CEFyBDhf
   g==;
X-CSE-ConnectionGUID: AdDbv0GBRPSJUEKWhLP2UA==
X-CSE-MsgGUID: 6GK3nMAAR/S8lbZwuO9Pgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85827433"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85827433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:52:14 -0800
X-CSE-ConnectionGUID: KCaOTleYQNStETCtJo4Njw==
X-CSE-MsgGUID: u6ujyDRcRBaDlqRWKYJ5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199372751"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 23:52:12 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXai3-000000000EU-3WBr;
	Mon, 22 Dec 2025 07:52:06 +0000
Date: Mon, 22 Dec 2025 15:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-netnext-rss 23/25]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202512221559.ysgVuYPU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-netnext-rss
head:   2f037797178ec9f630e7f6bd06d51e4045963b0b
commit: d9c5425a11c06623040e0d69c59c28a9c86544aa [23/25] net: mediatek: add proprietary debugfs
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251222/202512221559.ysgVuYPU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221559.ysgVuYPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221559.ysgVuYPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac' set but not used [-Wunused-but-set-variable]
     435 |         struct mtk_mac *mac = 0;
         |                         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_stats_update':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1443:20: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1443 |         if (idx >= MTK_HW_LRO_RING_NUM)
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1443:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_flush_stats_update':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1467:20: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1467 |         if (idx >= MTK_HW_LRO_RING_NUM)
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_agg_cnt_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1736:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1736 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:118:37: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     118 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro "MTK_LRO_CTRL_DW3_CFG" requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277: note: macro "MTK_LRO_CTRL_DW3_CFG" defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:119:37: error: 'MTK_LRO_CTRL_DW3_CFG' undeclared (first use in this function)
     119 |         u32 reg_val2 = mtk_r32(eth, MTK_LRO_CTRL_DW3_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro "MTK_LRO_CTRL_DW3_CFG" requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277: note: macro "MTK_LRO_CTRL_DW3_CFG" defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1733:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1733 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_agg_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1748:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1748 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:54: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:131:36: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     131 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:17: note: in expansion of macro 'SET_PDMA_RXRING_AGG_TIME'
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:54: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1745:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1745 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_age_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1760:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1760 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro "MTK_LRO_CTRL_DW1_CFG" requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273: note: macro "MTK_LRO_CTRL_DW1_CFG" defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:139:37: error: 'MTK_LRO_CTRL_DW1_CFG' undeclared (first use in this function)
     139 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:17: note: in expansion of macro 'SET_PDMA_RXRING_AGE_TIME'
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:140:37: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     140 |         u32 reg_val2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:17: note: in expansion of macro 'SET_PDMA_RXRING_AGE_TIME'
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro "MTK_LRO_CTRL_DW1_CFG" requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273: note: macro "MTK_LRO_CTRL_DW1_CFG" defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1757:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1757 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_threshold_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:152:36: error: 'MTK_PDMA_LRO_CTRL_DW2' undeclared (first use in this function)
     152 |         u32 reg_val = mtk_r32(eth, MTK_PDMA_LRO_CTRL_DW2);              \
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1770:9: note: in expansion of macro 'SET_PDMA_LRO_BW_THRESHOLD'
    1770 |         SET_PDMA_LRO_BW_THRESHOLD(eth, bandwidth);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1768:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1768 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_ring_enable_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1783:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1783 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:53: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:159:36: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     159 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:17: note: in expansion of macro 'SET_PDMA_RXRING_VALID'
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:53: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1778:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1778 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1815:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1815 |         int ret;
         |             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v1':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1870:26: error: 'MTK_PDMA_LRO_CTRL_DW0' undeclared (first use in this function)
    1870 |         if (mtk_r32(eth, MTK_PDMA_LRO_CTRL_DW0) & MTK_LRO_ALT_PKT_CNT_MODE)
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1848:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1848 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1922:26: error: 'MTK_PDMA_LRO_CTRL_DW0' undeclared (first use in this function)
    1922 |         if (mtk_r32(eth, MTK_PDMA_LRO_CTRL_DW0) & MTK_LRO_ALT_PKT_CNT_MODE)
         |                          ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1909:13: warning: variable 'score' set but not used [-Wunused-but-set-variable]
    1909 |         u32 score = 0, ipv4 = 0;
         |             ^~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_read':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2016:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    2016 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++) {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2017:62: error: macro "MTK_LRO_CTRL_DW1_CFG" requires 2 arguments, but only 1 given
    2017 |                 reg_op1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(i));
         |                                                              ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273: note: macro "MTK_LRO_CTRL_DW1_CFG" defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2017:40: error: 'MTK_LRO_CTRL_DW1_CFG' undeclared (first use in this function)
    2017 |                 reg_op1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2018:62: error: macro "MTK_LRO_CTRL_DW2_CFG" requires 2 arguments, but only 1 given
    2018 |                 reg_op2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(i));
         |                                                              ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275: note: macro "MTK_LRO_CTRL_DW2_CFG" defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2018:40: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
    2018 |                 reg_op2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2019:62: error: macro "MTK_LRO_CTRL_DW3_CFG" requires 2 arguments, but only 1 given
    2019 |                 reg_op3 = mtk_r32(eth, MTK_LRO_CTRL_DW3_CFG(i));
         |                                                              ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277: note: macro "MTK_LRO_CTRL_DW3_CFG" defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        (reg_map->pdma.lro_ring_ctrl_dw1 + \
         | 
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2019:40: error: 'MTK_LRO_CTRL_DW3_CFG' undeclared (first use in this function)
    2019 |                 reg_op3 = mtk_r32(eth, MTK_LRO_CTRL_DW3_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2020:40: error: 'MTK_PDMA_LRO_CTRL_DW2' undeclared (first use in this function)
    2020 |                 reg_op4 = mtk_r32(eth, MTK_PDMA_LRO_CTRL_DW2);
         |                                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1983:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1983 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~


vim +/mac +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   431	
   432	static int mtketh_debug_show(struct seq_file *m, void *private)
   433	{
   434		struct mtk_eth *eth = m->private;
 > 435		struct mtk_mac *mac = 0;
   436		int  i = 0;
   437	
   438		for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
   439			if (!eth->mac[i] ||
   440			    of_phy_is_fixed_link(eth->mac[i]->of_node))
   441				continue;
   442			mac = eth->mac[i];
   443	/* FIXME */
   444	/*
   445			while (j < 30) {
   446				d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
   447	
   448				seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
   449					   mac->phy_dev->addr, j, d);
   450				j++;
   451			}
   452	*/
   453		}
   454		return 0;
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
