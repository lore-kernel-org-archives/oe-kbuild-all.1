Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E517E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 03:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693019309; x=1724555309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjFKyryUIK80gN/uUUZMQDnfeDunwvYJCvV6mGoqomI=;
  b=Qepw8NZpilz78N98zFGiJ1586+7DY43/sT7FaT4nop7EYt/8cBgkZDwA
   zaaepNC+v+r18QT+HldbPYrYWqSDBsG2epmB7UrR7Tp9WXlX3ZLV0zu7f
   L4lBUPF/1IRwwr41CiNx2BAF2oLLsqAOApXnb58pCBoAciILxdr1cYlIY
   VND3gIQ879CmsA1WxPUwJsw7eQWPpelsm+Cn8xRGAW1qhlBvH+8G7MHY+
   XXaItKs+W5th0x1qtIMCVLNoSgjgge/m/tf/htXwOGsXK29n11Z/b0nYy
   iqHQMIuS522eCwas5afNkiG0kyt7GWSYfqC8TgUNvov45VWczaDBXNVvU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373715103"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373715103"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 20:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="687524556"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="687524556"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2023 20:08:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZjf0-0004HL-0I;
	Sat, 26 Aug 2023 03:08:26 +0000
Date: Sat, 26 Aug 2023 11:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11366/11473]
 drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: warning: operator '?:'
 has lower precedence than '|'; '|' will be evaluated first
Message-ID: <202308261010.mC7ZuVo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   827dddabb6e5235e1c818dea8536949700000814
commit: a5a54758c1022d9da88499b08f2ca26d4d8d230f [11366/11473] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: riscv-randconfig-r024-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261010.mC7ZuVo6-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261010.mC7ZuVo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261010.mC7ZuVo6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mediatek/mtk_usxgmii.c:10:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
                             (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: note: place parentheses around the '|' expression to silence this warning
                             (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: note: place parentheses around the '?:' expression to evaluate it first
                             (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
                                                                          ^
                             (
   14 warnings generated.


vim +468 drivers/net/ethernet/mediatek/mtk_usxgmii.c

   451	
   452	static int mtk_usxgmii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
   453					  phy_interface_t interface,
   454					  const unsigned long *advertising,
   455					  bool permit_pause_to_mac)
   456	{
   457		struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
   458		struct mtk_eth *eth = mpcs->eth;
   459		struct regmap *pextp = eth->regmap_pextp[mpcs->id];
   460		unsigned int an_ctrl = 0, link_timer = 0, xfi_mode = 0, adapt_mode = 0;
   461		bool mode_changed = false;
   462	
   463		if (!pextp)
   464			return -ENODEV;
   465	
   466		if (interface == PHY_INTERFACE_MODE_USXGMII) {
   467			an_ctrl = FIELD_PREP(USXGMII_AN_SYNC_CNT, 0x1FF) |
 > 468				  (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
   469				  USXGMII_AN_ENABLE : 0;
   470			link_timer = FIELD_PREP(USXGMII_LINK_TIMER_IDLE_DETECT, 0x7B) |
   471				     FIELD_PREP(USXGMII_LINK_TIMER_COMP_ACK_DETECT, 0x7B) |
   472				     FIELD_PREP(USXGMII_LINK_TIMER_AN_RESTART, 0x7B);
   473			xfi_mode = FIELD_PREP(USXGMII_XFI_RX_MODE, USXGMII_XFI_RX_MODE_10G) |
   474				   FIELD_PREP(USXGMII_XFI_TX_MODE, USXGMII_XFI_TX_MODE_10G);
   475		} else if (interface == PHY_INTERFACE_MODE_10GBASER) {
   476			an_ctrl = FIELD_PREP(USXGMII_AN_SYNC_CNT, 0x1FF);
   477			link_timer = FIELD_PREP(USXGMII_LINK_TIMER_IDLE_DETECT, 0x7B) |
   478				     FIELD_PREP(USXGMII_LINK_TIMER_COMP_ACK_DETECT, 0x7B) |
   479				     FIELD_PREP(USXGMII_LINK_TIMER_AN_RESTART, 0x7B);
   480			xfi_mode = FIELD_PREP(USXGMII_XFI_RX_MODE, USXGMII_XFI_RX_MODE_10G) |
   481				   FIELD_PREP(USXGMII_XFI_TX_MODE, USXGMII_XFI_TX_MODE_10G);
   482			adapt_mode = USXGMII_RATE_UPDATE_MODE;
   483		} else if (interface == PHY_INTERFACE_MODE_5GBASER) {
   484			an_ctrl = FIELD_PREP(USXGMII_AN_SYNC_CNT, 0xFF);
   485			link_timer = FIELD_PREP(USXGMII_LINK_TIMER_IDLE_DETECT, 0x3D) |
   486				     FIELD_PREP(USXGMII_LINK_TIMER_COMP_ACK_DETECT, 0x3D) |
   487				     FIELD_PREP(USXGMII_LINK_TIMER_AN_RESTART, 0x3D);
   488			xfi_mode = FIELD_PREP(USXGMII_XFI_RX_MODE, USXGMII_XFI_RX_MODE_5G) |
   489				   FIELD_PREP(USXGMII_XFI_TX_MODE, USXGMII_XFI_TX_MODE_5G);
   490			adapt_mode = USXGMII_RATE_UPDATE_MODE;
   491		} else {
   492			return -EINVAL;
   493		}
   494	
   495		adapt_mode |= FIELD_PREP(USXGMII_RATE_ADAPT_MODE, USXGMII_RATE_ADAPT_MODE_X1);
   496	
   497		if (mpcs->interface != interface) {
   498			mpcs->interface = interface;
   499			mode_changed = true;
   500		}
   501	
   502		mtk_xfi_pll_enable(eth);
   503		mtk_usxgmii_reset(eth, mpcs->id);
   504	
   505		/* Setup USXGMII AN ctrl */
   506		regmap_update_bits(mpcs->regmap, RG_PCS_AN_CTRL0,
   507				   USXGMII_AN_SYNC_CNT | USXGMII_AN_ENABLE,
   508				   an_ctrl);
   509	
   510		regmap_update_bits(mpcs->regmap, RG_PCS_AN_CTRL2,
   511				   USXGMII_LINK_TIMER_IDLE_DETECT |
   512				   USXGMII_LINK_TIMER_COMP_ACK_DETECT |
   513				   USXGMII_LINK_TIMER_AN_RESTART,
   514				   link_timer);
   515	
   516		/* Gated MAC CK */
   517		regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   518				   USXGMII_MAC_CK_GATED, USXGMII_MAC_CK_GATED);
   519	
   520		/* Enable interface force mode */
   521		regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   522				   USXGMII_IF_FORCE_EN, USXGMII_IF_FORCE_EN);
   523	
   524		/* Setup USXGMII adapt mode */
   525		regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   526				   USXGMII_RATE_UPDATE_MODE | USXGMII_RATE_ADAPT_MODE,
   527				   adapt_mode);
   528	
   529		/* Setup USXGMII speed */
   530		regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   531				   USXGMII_XFI_RX_MODE | USXGMII_XFI_TX_MODE,
   532				   xfi_mode);
   533	
   534		usleep_range(1, 10);
   535	
   536		/* Un-gated MAC CK */
   537		regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   538				   USXGMII_MAC_CK_GATED, 0);
   539	
   540		usleep_range(1, 10);
   541	
   542		/* Disable interface force mode for the AN mode */
   543		if (an_ctrl & USXGMII_AN_ENABLE)
   544			regmap_update_bits(mpcs->regmap, RG_PHY_TOP_SPEED_CTRL1,
   545					   USXGMII_IF_FORCE_EN, 0);
   546	
   547		/* Setup USXGMIISYS with the determined property */
   548		mtk_usxgmii_setup_phya(pextp, interface, mpcs->id);
   549	
   550		return mode_changed;
   551	}
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
