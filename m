Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1206117D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 03:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681875870; x=1713411870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkTr+io0rZ8adeoCnzDSbDqpTWnKUMWLZ61oV9x84vg=;
  b=Q+nXpnWbkVy25j0OAOd97i/JI5wpnCs35obe1t9xSOmbjVB1/IPvcWom
   LUeXqKcR+6FvO9wXzxuDo5wPLniSDrFbJwzKA+eE2/Osld3kjkK/EZuXl
   yRoBxZp6xhnL9B7f05hxpBG+RwpVbau1o3LZSvm+f37CXvit1TT+vz8A3
   Zk3j+xP94Hcds9/rwghwLIjvO3xDv3/Oym7iP4f4oXxuHVo4nfgYEbEG7
   Vpk2mA3hfGmEw5Pn5I/aCLf0EnXEW0rWaJLt8CUnF56oX8Cxbh120Lhl0
   MZpUOsVGR2dgl4Gu/FxMhueKnDhSBQFF9SouxC/g0jsSM0tmeIx6QUpBY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348097930"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="348097930"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 20:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641604551"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="641604551"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 20:44:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poyk7-000eRd-1e;
	Wed, 19 Apr 2023 03:44:27 +0000
Date: Wed, 19 Apr 2023 11:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xillybus_of.c:undefined reference to `devm_platform_ioremap_resource'
Message-ID: <202304191106.swKbBeDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herbert,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af67688dca57999fd848f051eeea1d375ba546b2
commit: a1315dcb7b6a7d3a78df848eed5b331a4b3ec28a hwrng: ks-sa - Add dependency on IOMEM and OF
date:   2 years, 4 months ago
config: s390-buildonly-randconfig-r006-20230418 (https://download.01.org/0day-ci/archive/20230419/202304191106.swKbBeDh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a1315dcb7b6a7d3a78df848eed5b331a4b3ec28a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a1315dcb7b6a7d3a78df848eed5b331a4b3ec28a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191106.swKbBeDh-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x2bc): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x3e2): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x662): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x4c): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x40a): undefined reference to `iounmap'
   s390-linux-ld: drivers/irqchip/irq-imx-intmux.o: in function `imx_intmux_probe':
   irq-imx-intmux.c:(.text+0x882): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/phy/marvell/phy-mvebu-a3700-utmi.o: in function `mvebu_a3700_utmi_phy_probe':
   phy-mvebu-a3700-utmi.c:(.text+0x5ba): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
   fsl-edma.c:(.text+0x1270): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: fsl-edma.c:(.text+0x143e): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x536): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x5a0): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/dma/ti/edma.o: in function `edma_xbar_event_map':
   edma.c:(.text+0x3ed8): undefined reference to `of_address_to_resource'
   s390-linux-ld: edma.c:(.text+0x3f02): undefined reference to `devm_ioremap'
   s390-linux-ld: drivers/dma/ti/edma.o: in function `edma_probe':
   edma.c:(.text+0x5d7a): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/dma/ti/omap-dma.o: in function `omap_dma_probe':
   omap-dma.c:(.text+0x12de): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/dma/ti/dma-crossbar.o: in function `ti_am335x_xbar_probe':
   dma-crossbar.c:(.text+0x8aa): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/dma/ti/dma-crossbar.o: in function `ti_dra7_xbar_probe':
   dma-crossbar.c:(.text+0xe96): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_console_close':
   dpaa2-console.c:(.text+0x82): undefined reference to `iounmap'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_console_probe':
   dpaa2-console.c:(.text+0xe0): undefined reference to `of_address_to_resource'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_generic_console_open.constprop.0':
   dpaa2-console.c:(.text+0x20e): undefined reference to `ioremap'
   s390-linux-ld: dpaa2-console.c:(.text+0x262): undefined reference to `iounmap'
   s390-linux-ld: dpaa2-console.c:(.text+0x276): undefined reference to `ioremap'
   s390-linux-ld: dpaa2-console.c:(.text+0x340): undefined reference to `iounmap'
   s390-linux-ld: drivers/char/hw_random/exynos-trng.o: in function `exynos_trng_probe':
   exynos-trng.c:(.text+0x39e): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/char/hw_random/meson-rng.o: in function `meson_rng_probe':
   meson-rng.c:(.text+0x10a): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/char/hw_random/mtk-rng.o: in function `mtk_rng_probe':
   mtk-rng.c:(.text+0x40e): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/char/hw_random/npcm-rng.o: in function `npcm_rng_probe':
   npcm-rng.c:(.text+0x2ca): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/char/xillybus/xillybus_of.o: in function `xilly_drv_probe':
>> xillybus_of.c:(.text+0x23a): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/mfd/sun6i-prcm.o: in function `sun6i_prcm_probe':
   sun6i-prcm.c:(.text+0xc8): undefined reference to `mfd_add_devices'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
   Depends on [n]: HAS_IOMEM [=n] && (ARCH_SUNXI || COMPILE_TEST [=y])
   Selected by [y]:
   - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
   - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
