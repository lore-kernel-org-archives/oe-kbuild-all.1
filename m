Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825236A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 01:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693098004; x=1724634004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/reEIsgtQD2Y0uaUNwfoEw4zZOhL6ccS73HONc29eC0=;
  b=WWFG4gB60lxi+COB3NgVghTky8KMHvk467yEXO4YETgRmBn5tQHW/rP+
   WPW7iz9Kgi+B+axHmvaUq0SIrrnd6IgS8/OrR4jNyKBSzMnJMS7lG4OEl
   KnwmF4cf2B3JtSxcUbSY5wfVQuwhH+BTvNR75RVX8nFyac6NZ1UE+6s+K
   7vmj3WHErKLKDmae7KxYjMpPwvNHUn8/Kn10N1OcCNIF0mjpReeTVbV1e
   RGVFkM693dSsAq/wtdlNnCYHs03qIeVPZjwXk8D/uq+GJ2dEMFl7EHF7S
   7AALJYC3a4q+2VOqH9hhQUDzYdAW+s9Q3UoVp6qrbHH9z5+ZX2Ygs/XFt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="378689763"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="378689763"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 18:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881544155"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2023 18:00:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa48H-0005EZ-2a;
	Sun, 27 Aug 2023 01:00:01 +0000
Date: Sun, 27 Aug 2023 08:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11365/11475]
 drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:69: warning: right shift
 count >= width of type
Message-ID: <202308270819.Zw9EMCSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   d6000c552c7d192fdd2d7e21a320c3b269bff5a5
commit: 3f31085c427397694bdaf679ebad6eac8645f842 [11365/11475] net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988
config: mips-randconfig-r034-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270819.Zw9EMCSd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270819.Zw9EMCSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270819.Zw9EMCSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_tx_set_dma_desc_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:33: note: in expansion of macro 'FIELD_PREP'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                 ^~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:25: note: in expansion of macro 'TX_DMA_PREP_ADDR64'
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:33: note: in expansion of macro 'FIELD_PREP'
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                 ^~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:25: note: in expansion of macro 'TX_DMA_PREP_ADDR64'
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/mdio.h:10,
                    from include/linux/phy.h:20,
                    from include/linux/of_mdio.h:12,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.h:336:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     336 | #define TX_DMA_PREP_ADDR64(x)   FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/bitfield.h:115:34: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1333:25: note: in expansion of macro 'TX_DMA_PREP_ADDR64'
    1333 |                 data |= TX_DMA_PREP_ADDR64(info->addr);
         |                         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_poll_rx':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:33: note: in expansion of macro 'FIELD_PREP'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                 ^~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:38: note: in expansion of macro 'RX_DMA_PREP_ADDR64'
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:33: note: in expansion of macro 'FIELD_PREP'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                 ^~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:38: note: in expansion of macro 'RX_DMA_PREP_ADDR64'
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/bitfield.h:115:34: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190:38: note: in expansion of macro 'RX_DMA_PREP_ADDR64'
    2190 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_rx_alloc':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:33: note: in expansion of macro 'FIELD_PREP'
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                 ^~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2685:38: note: in expansion of macro 'RX_DMA_PREP_ADDR64'
    2685 |                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:351:69: warning: right shift count >= width of type [-Wshift-count-overflow]
     351 | #define RX_DMA_PREP_ADDR64(x)   FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
         |                                                                     ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~


vim +336 drivers/net/ethernet/mediatek/mtk_eth_soc.h

   326	
   327	/* QDMA descriptor txd3 */
   328	#define TX_DMA_OWNER_CPU	BIT(31)
   329	#define TX_DMA_LS0		BIT(30)
   330	#define TX_DMA_PLEN0(x)		(((x) & eth->soc->txrx.dma_max_len) << eth->soc->txrx.dma_len_offset)
   331	#define TX_DMA_PLEN1(x)		((x) & eth->soc->txrx.dma_max_len)
   332	#define TX_DMA_SWC		BIT(14)
   333	#define TX_DMA_PQID		GENMASK(3, 0)
   334	#define TX_DMA_ADDR64_MASK	GENMASK(3, 0)
   335	#define TX_DMA_GET_ADDR64(x)	(((u64)FIELD_GET(TX_DMA_ADDR64_MASK, (x))) << 32)
 > 336	#define TX_DMA_PREP_ADDR64(x)	FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
