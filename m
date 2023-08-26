Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC502C9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693070660; x=1724606660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kY15YCq4JkkYMGB5sPlwoQrRj3V2xAP2CcD1jK/YZdA=;
  b=EvcFtk13nsfMIS8OinQ8Ff0tPlr/JjYPiTjLhvdY9Y0kitLvgTZ4BPLP
   UFETd3auRCXSAMqW/OlAHe5DrNCrUYYn+R7ybbnfx05xQ68lMk9IRcNR7
   ApNTwUhOFIdfOtiiF88YX8upKtIQIfRv+44qwXzd4+bzzf3uKWuyeIUd1
   i8SaLwl20mBB28D+AIoZYOUdu+qTpysou7CT4+FOQ+BeFm/XSyY0GFx7a
   KWJz1Ddi8Q0MtLjrFpdxaTC1N0pZYh/0AFIul6L3Lf48k+MjFLCn8RDVL
   dwP+NI/metpgqqaIfotVGBkS9A9YUHZYALFr+561UcOjoUg7etMUuDT0Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="378670653"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="378670653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 10:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="687641130"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="687641130"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 10:24:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZx1F-0004vz-1K;
	Sat, 26 Aug 2023 17:24:17 +0000
Date: Sun, 27 Aug 2023 01:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11366/11472]
 drivers/net/ethernet/mediatek/mtk_eth_soc.h:1656:21: warning: no previous
 prototype for function 'mtk_sgmii_wrapper_select_pcs'
Message-ID: <202308270156.NWkDS3v2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   9da4af54446a9e2a6f6e734ea33cff68ce412a6c
commit: a5a54758c1022d9da88499b08f2ca26d4d8d230f [11366/11472] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: mips-randconfig-r003-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270156.NWkDS3v2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270156.NWkDS3v2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270156.NWkDS3v2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_path.c:13:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.h:1656:21: warning: no previous prototype for function 'mtk_sgmii_wrapper_select_pcs' [-Wmissing-prototypes]
    1656 | struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id)
         |                     ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1656:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1656 | struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id)
         | ^
         | static 
   1 warning generated.
--
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:31:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.h:1656:21: warning: no previous prototype for function 'mtk_sgmii_wrapper_select_pcs' [-Wmissing-prototypes]
    1656 | struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id)
         |                     ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1656:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1656 | struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id)
         | ^
         | static 
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1447:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1447 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
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
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1447:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1447 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
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
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1447:11: warning: shift count >= width of type [-Wshift-count-overflow]
    1447 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:67: note: expanded from macro 'TX_DMA_PREP_ADDR64'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2214:24: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
    2214 |                         if (ring->frag_size <= PAGE_SIZE)
         |                             ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2304:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2304 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
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
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2304:17: warning: shift count >= width of type [-Wshift-count-overflow]
    2304 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
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


vim +/mtk_sgmii_wrapper_select_pcs +1656 drivers/net/ethernet/mediatek/mtk_eth_soc.h

  1650	
  1651	#ifdef CONFIG_NET_MEDIATEK_SOC_USXGMII
  1652	struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id);
  1653	struct phylink_pcs *mtk_usxgmii_select_pcs(struct mtk_eth *eth, int id);
  1654	int mtk_usxgmii_init(struct mtk_eth *eth);
  1655	#else
> 1656	struct phylink_pcs *mtk_sgmii_wrapper_select_pcs(struct mtk_eth *eth, int id)
  1657	{
  1658		return NULL;
  1659	}
  1660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
