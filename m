Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB223E1205
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910146; cv=none; b=nzu+LjlJ18t2mGevzgr+ZPi5+eODu8xz7Na35m+ahsT7yT8L+KMWXUkSHRrwg+aDWU/VYv48GXq+gwvOziW8LQVv13SdNC7qnJt4+IqVWYXBOzt3SYUhurGh24A46LTjMsYwM7fULsAqtDXhM5WRdNDt+mmBzotSgTPTJN8sGrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910146; c=relaxed/simple;
	bh=/ceYaueoAmLdIxHhfjVZCMt1dEFhwXO3y7F8Kvx1EgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oaPdAxsvl//zfrUiHsz69GQOZkL3Zlly8R3wz3TGVInTO1hyDWGhO+FhBZM98/Z8eDS9LFWp62eC62/+9D0kyQ6GJtUmjEANriiFUJKJPMCK/ETBtWoKzj65I8nowuFM6eyw7N0gO2dfL1GYR8ERFd57Z1vtqDEu1LeWU88ChMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8jKlStc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8jKlStc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777910145; x=1809446145;
  h=date:from:to:cc:subject:message-id;
  bh=/ceYaueoAmLdIxHhfjVZCMt1dEFhwXO3y7F8Kvx1EgE=;
  b=i8jKlStcQx44Yeww88Qyt9MkRs2N14QkiZd4nN/dLDWnD/zfXFSS8sF/
   MZZ0SCU5T3kCztT734qfzsQKoMvX0xMOZu/rx6CtBcs2tENpjwaqt+Dgg
   cIJwiLvc92/qwT2FPwHL8+zZmnGhEV3dsPvNvZowDs2GNJwHYBOyMPdNS
   lFa0KeYBqj1USpwCeaf6s88H6gbIKCB55EAn2+d5pmmufxnLEnyug1XE2
   AfN2dXaWyxglD9aO4zh4t6rgsuMBanX0U5LupUQZ7NiVui3qs9TGCE2T8
   gOAR/t8gP6lNnA7L0KmCF4T/+HJdoIQuM8wi6fFuzlSf9LX3mtBqP6O4c
   w==;
X-CSE-ConnectionGUID: kHuVXPhxR9eI6jnVS2bE8g==
X-CSE-MsgGUID: E4EvJRgyR/WFH1X5x0QaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66301149"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="66301149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 08:55:44 -0700
X-CSE-ConnectionGUID: L00tum4gQMmXaLKrPnAJQg==
X-CSE-MsgGUID: wuqG0bjvT2asolCd7bTg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235613629"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 08:55:42 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJvdq-000000003ot-2iTz;
	Mon, 04 May 2026 15:55:34 +0000
Date: Mon, 04 May 2026 23:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 141/147]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202605042313.PJ1l9Zm1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   445521c1e8057d80bfd079aa69ad69ba0a9293b3
commit: 3d7587812f1f0f35408e7efbf4bf78cbe5b07ec3 [141/147] net: mediatek: add proprietary debugfs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260504/202605042313.PJ1l9Zm1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042313.PJ1l9Zm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042313.PJ1l9Zm1-lkp@intel.com/

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
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:30:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:118:37: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     118 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro 'MTK_LRO_CTRL_DW3_CFG' requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277:9: note: macro 'MTK_LRO_CTRL_DW3_CFG' defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:119:37: error: 'MTK_LRO_CTRL_DW3_CFG' undeclared (first use in this function)
     119 |         u32 reg_val2 = mtk_r32(eth, MTK_LRO_CTRL_DW3_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1737:56: error: macro 'MTK_LRO_CTRL_DW3_CFG' requires 2 arguments, but only 1 given
    1737 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                                                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277:9: note: macro 'MTK_LRO_CTRL_DW3_CFG' defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1733:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1733 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_agg_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1748:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1748 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:54: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:131:36: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     131 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:17: note: in expansion of macro 'SET_PDMA_RXRING_AGG_TIME'
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1749:54: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1749 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1745:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1745 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_age_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1760:26: error: 'MTK_HW_LRO_RING_NUM' undeclared (first use in this function)
    1760 |         for (i = 1; i <= MTK_HW_LRO_RING_NUM; i++)
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro 'MTK_LRO_CTRL_DW1_CFG' requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273:9: note: macro 'MTK_LRO_CTRL_DW1_CFG' defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:139:37: error: 'MTK_LRO_CTRL_DW1_CFG' undeclared (first use in this function)
     139 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:17: note: in expansion of macro 'SET_PDMA_RXRING_AGE_TIME'
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:140:37: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     140 |         u32 reg_val2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:17: note: in expansion of macro 'SET_PDMA_RXRING_AGE_TIME'
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro 'MTK_LRO_CTRL_DW1_CFG' requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273:9: note: macro 'MTK_LRO_CTRL_DW1_CFG' defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1761:54: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1761 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                                                      ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1757:35: warning: unused variable 'reg_map' [-Wunused-variable]
    1757 |         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
         |                                   ^~~~~~~
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
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:53: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                                                     ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:159:36: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
     159 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:17: note: in expansion of macro 'SET_PDMA_RXRING_VALID'
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:53: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    1784 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                                                     ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
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
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2017:62: error: macro 'MTK_LRO_CTRL_DW1_CFG' requires 2 arguments, but only 1 given
    2017 |                 reg_op1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(i));
         |                                                              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:273:9: note: macro 'MTK_LRO_CTRL_DW1_CFG' defined here
     273 | #define MTK_LRO_CTRL_DW1_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2017:40: error: 'MTK_LRO_CTRL_DW1_CFG' undeclared (first use in this function)
    2017 |                 reg_op1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2018:62: error: macro 'MTK_LRO_CTRL_DW2_CFG' requires 2 arguments, but only 1 given
    2018 |                 reg_op2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(i));
         |                                                              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:275:9: note: macro 'MTK_LRO_CTRL_DW2_CFG' defined here
     275 | #define MTK_LRO_CTRL_DW2_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2018:40: error: 'MTK_LRO_CTRL_DW2_CFG' undeclared (first use in this function)
    2018 |                 reg_op2 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2019:62: error: macro 'MTK_LRO_CTRL_DW3_CFG' requires 2 arguments, but only 1 given
    2019 |                 reg_op3 = mtk_r32(eth, MTK_LRO_CTRL_DW3_CFG(i));
         |                                                              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:277:9: note: macro 'MTK_LRO_CTRL_DW3_CFG' defined here
     277 | #define MTK_LRO_CTRL_DW3_CFG(reg_map, x)        ((reg_map)->pdma.lro_ring_ctrl_dw1 + \
         |         ^~~~~~~~~~~~~~~~~~~~
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
