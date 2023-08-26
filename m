Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB2F9D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693066325; x=1724602325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8S1OiNnlxbaWb6EFMAmkjbRGvAgofsNiNcPoheB0Gk=;
  b=maTZqQ72TWP4B8oKDk4cbXxEsaVSnjfFZ/yCGnBSkk2PAo4EJU5Lyh3S
   Kqg0XlEn5793Vx92x2uDl4dWG+tIo7WCX74FhDAYXoWNQAXWVf8Ta3vjW
   FOnYiM86M74gfptxkLCtT/dHd5fOtOCyYo48HUyPJjJ0h9cKMFOQ8d0sQ
   t7R2baW8ZzMZxHPFsRNoweWsCJVD58x+ZeXWuITjgxncF4RNe+KwUKAJB
   3jWR6G/h/4hguIPAX5x2NH3HGknK1WvZRBADC94hBY0Ycg6Qq75mUuH8c
   SgmPgbOY/F6TUdbqC8EKNHwj1ilkzt9I4MmZHeInq/6aqbUgDDO7n2ZDL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="378666802"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="378666802"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 09:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="687632605"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="687632605"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 09:12:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZvtK-0004qZ-2M;
	Sat, 26 Aug 2023 16:12:02 +0000
Date: Sun, 27 Aug 2023 00:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11365/11472]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:11: warning: shift count >=
 width of type
Message-ID: <202308270053.wZOM3ZNu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   ac51b4d17c5139b51a358b7030597afc6f380271
commit: 3f31085c427397694bdaf679ebad6eac8645f842 [11365/11472] net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988
config: mips-randconfig-r003-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270053.wZOM3ZNu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270053.wZOM3ZNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270053.wZOM3ZNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:67: note: expanded from macro 'TX_DMA_PREP_ADDR64'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:425:22: note: expanded from macro 'compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:413:23: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:405:9: note: expanded from macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:67: note: expanded from macro 'TX_DMA_PREP_ADDR64'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                                                   ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:425:22: note: expanded from macro 'compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:413:23: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:405:9: note: expanded from macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:67: note: expanded from macro 'TX_DMA_PREP_ADDR64'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2100:24: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    2100 |                         if (ring->frag_size <= PAGE_SIZE)
         |                             ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:67: note: expanded from macro 'RX_DMA_PREP_ADDR64'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:425:22: note: expanded from macro 'compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:413:23: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:405:9: note: expanded from macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:67: note: expanded from macro 'RX_DMA_PREP_ADDR64'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                                                   ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:425:22: note: expanded from macro 'compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:413:23: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:405:9: note: expanded from macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:67: note: expanded from macro 'RX_DMA_PREP_ADDR64'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2659:24: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    2659 |                         if (ring->frag_size <= PAGE_SIZE)
         |                             ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2685:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2685 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:67: note: expanded from macro 'RX_DMA_PREP_ADDR64'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:425:22: note: expanded from macro 'compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:413:23: note: expanded from macro '_compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:405:9: note: expanded from macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2685:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2685 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:67: note: expanded from macro 'RX_DMA_PREP_ADDR64'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \


vim +1333 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1317	
  1318	static void mtk_tx_set_dma_desc_v2(struct net_device *dev, void *txd,
  1319					   struct mtk_tx_dma_desc_info *info)
  1320	{
  1321		struct mtk_mac *mac = netdev_priv(dev);
  1322		struct mtk_tx_dma_v2 *desc = txd;
  1323		struct mtk_eth *eth = mac->hw;
  1324		u32 data;
  1325	
  1326		WRITE_ONCE(desc->txd1, info->addr);
  1327	
  1328		data = TX_DMA_PLEN0(info->size);
  1329		if (info->last)
  1330			data |= TX_DMA_LS0;
  1331	
  1332		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
> 1333			data |= TX_DMA_PREP_ADDR64(info->addr);
  1334	
  1335		WRITE_ONCE(desc->txd3, data);
  1336	
  1337		 /* set forward port */
  1338		switch (mac->id) {
  1339		case MTK_GMAC1_ID:
  1340			data = PSE_GDM1_PORT << TX_DMA_FPORT_SHIFT_V2;
  1341			break;
  1342		case MTK_GMAC2_ID:
  1343			data = PSE_GDM2_PORT << TX_DMA_FPORT_SHIFT_V2;
  1344			break;
  1345		case MTK_GMAC3_ID:
  1346			data = PSE_GDM3_PORT << TX_DMA_FPORT_SHIFT_V2;
  1347			break;
  1348		}
  1349	
  1350		data |= TX_DMA_SWC_V2 | QID_BITS_V2(info->qid);
  1351		WRITE_ONCE(desc->txd4, data);
  1352	
  1353		data = 0;
  1354		if (info->first) {
  1355			if (info->gso)
  1356				data |= TX_DMA_TSO_V2;
  1357			/* tx checksum offload */
  1358			if (info->csum)
  1359				data |= TX_DMA_CHKSUM_V2;
  1360			if (mtk_is_netsys_v3_or_greater(eth) && netdev_uses_dsa(dev))
  1361				data |= TX_DMA_SPTAG_V3;
  1362		}
  1363		WRITE_ONCE(desc->txd5, data);
  1364	
  1365		data = 0;
  1366		if (info->first && info->vlan)
  1367			data |= TX_DMA_INS_VLAN_V2 | info->vlan_tci;
  1368		WRITE_ONCE(desc->txd6, data);
  1369	
  1370		WRITE_ONCE(desc->txd7, 0);
  1371		WRITE_ONCE(desc->txd8, 0);
  1372	}
  1373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
