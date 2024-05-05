Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C514404
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714897436; cv=none; b=Qy/PDqa6OdoXj82Fiy7nDFWAbQT2ZyTKO9dt7cr+TQGJpxRNqEK3vf7looNoC5zu8eXqS01P4gPqjWv3KXqJ0S35NIq5uNeKBzBX00NBqQ1wDJcEqlGqotpQCxuEy8XD2lb54JZ4P4LcwD3JHq7YRmPNYk1V0iO6jpqV0+BpMQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714897436; c=relaxed/simple;
	bh=nmCGpASHJ0qPftEnpyxdzTEkfrWAUgNpn5hLpAb1Rro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=na1z6B+Y8eIEJNRhBciMUYY8k9e5MF/F1fvC/e5naGd0pAl078+o2OeMzJHmO2a1EbGe2ZDQHR/nLXohfY/d4U4iHnRTUALeib1PeMlk4dSTtHFs1HhMCcZxYHJYrZ3TtWRkMwgs2N3GP2EOZpwRB3P0ZlHnO7z0MOaIIu7uut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRUvO6uR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRUvO6uR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714897433; x=1746433433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmCGpASHJ0qPftEnpyxdzTEkfrWAUgNpn5hLpAb1Rro=;
  b=mRUvO6uRwz87SWWv3y0qkc+uGmyxajUlYJCjqza7bda5YVeqHSFHOc7a
   AzmpUsh8JZwyyrYs0EfnFKWPVJGm0iA//b88nerMqIHIiArRim58aTGQc
   cJaJjx7dUCL26/zuosD+fNJLo1j8AKpvl+B32SzQoAvRAtrpCqcXJuFS0
   a+NrEbHY4VDG8oKH4OOUqOIgRV3B1N89jjf1z+zmQneZjhyLkJqtG0Xw3
   40NU55XpMotnn9x0wAP8L/tw/MQB2NLjkQZLELnGEsgkVoidzv2xQGQ4R
   Ibj01waAD8gZe7ES0ATk8Ld688jU18Iiqy5hWr1vpFmZvF8Nps8mZaHHw
   g==;
X-CSE-ConnectionGUID: NB4WT24ESaqkIDMQFD3J8Q==
X-CSE-MsgGUID: 8289hdCnTSysr1vVJhlxfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10816931"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10816931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 01:23:52 -0700
X-CSE-ConnectionGUID: iMV9cVSpSRadwcFx9dhKqg==
X-CSE-MsgGUID: +Q+zlj1FQuKWFJ9LmGUTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="28382985"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2024 01:23:51 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3X9w-00004g-34;
	Sun, 05 May 2024 08:23:48 +0000
Date: Sun, 5 May 2024 16:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 207/1143]
 drivers/soc/aspeed/ast2700-espi.c:498:17: warning: variable 'dev' set but
 not used
Message-ID: <202405051627.AQHi5W6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 8d35e677f8d2360871f4696b77f30da40567dc8e [207/1143] soc/aspeed: Add AST2700 eSPI support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240505/202405051627.AQHi5W6k-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051627.AQHi5W6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051627.AQHi5W6k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/aspeed/ast2700-espi.c:15:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/aspeed/ast2700-espi.c:498:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     498 |         struct device *dev;
         |                        ^
   drivers/soc/aspeed/ast2700-espi.c:563:23: error: call to undeclared function 'of_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     563 |         perif->mcyc.enable = of_property_read_bool(dev->of_node, "perif-mcyc-enable");
         |                              ^
   drivers/soc/aspeed/ast2700-espi.c:565:8: error: call to undeclared function 'of_property_read_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     565 |                 rc = of_property_read_u64(dev->of_node, "perif-mcyc-src-addr", &perif->mcyc.saddr);
         |                      ^
   drivers/soc/aspeed/ast2700-espi.c:706:21: error: call to undeclared function 'of_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     706 |         vw->gpio.hw_mode = of_property_read_bool(dev->of_node, "vw-gpio-hw-mode");
         |                            ^
   drivers/soc/aspeed/ast2700-espi.c:707:2: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     707 |         of_property_read_u32(dev->of_node, "vw-gpio-group", &vw->gpio.grp);
         |         ^
   drivers/soc/aspeed/ast2700-espi.c:708:2: error: call to undeclared function 'of_property_read_u32_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     708 |         of_property_read_u32_index(dev->of_node, "vw-gpio-direction", 0, &vw->gpio.dir0);
         |         ^
   drivers/soc/aspeed/ast2700-espi.c:1155:20: error: call to undeclared function 'of_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1155 |         oob->dma.enable = of_property_read_bool(dev->of_node, "oob-dma-mode");
         |                           ^
   drivers/soc/aspeed/ast2700-espi.c:1493:2: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1493 |         of_property_read_u32(dev->of_node, "flash-edaf-mode", &flash->edaf.mode);
         |         ^
   drivers/soc/aspeed/ast2700-espi.c:1495:8: error: call to undeclared function 'of_property_read_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1495 |                 rc = of_property_read_u64(dev->of_node, "flash-edaf-addr", &flash->edaf.addr);
         |                      ^
   drivers/soc/aspeed/ast2700-espi.c:1508:22: error: call to undeclared function 'of_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1508 |         flash->dma.enable = of_property_read_bool(dev->of_node, "flash-dma-mode");
         |                             ^
   drivers/soc/aspeed/ast2700-espi.c:1587:38: warning: shift count >= width of type [-Wshift-count-overflow]
    1587 |         rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/soc/aspeed/ast2700-espi.c:1663:57: error: array has incomplete element type 'const struct of_device_id'
    1663 | static const struct of_device_id ast2700_espi_of_matches[] = {
         |                                                         ^
   include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
     106 |         const struct of_device_id       *of_match_table;
         |                      ^
   7 warnings and 10 errors generated.


vim +/dev +498 drivers/soc/aspeed/ast2700-espi.c

   494	
   495	static void ast2700_espi_perif_reset(struct ast2700_espi *espi)
   496	{
   497		struct ast2700_espi_perif *perif;
 > 498		struct device *dev;
   499		uint64_t mask;
   500		uint32_t reg;
   501	
   502		dev = espi->dev;
   503	
   504		perif = &espi->perif;
   505	
   506		writel(0x0, espi->regs + ESPI_CH0_INT_EN);
   507		writel(0xffffffff, espi->regs + ESPI_CH0_INT_STS);
   508	
   509		if (perif->mcyc.enable) {
   510			mask = ~(perif->mcyc.size - 1);
   511			writel(mask >> 32, espi->regs + ESPI_CH0_MCYC1_MASKH);
   512			writel(mask & 0xffffffff, espi->regs + ESPI_CH0_MCYC1_MASKL);
   513			writel((perif->mcyc.saddr >> 32), espi->regs + ESPI_CH0_MCYC1_SADDRH);
   514			writel((perif->mcyc.saddr & 0xffffffff), espi->regs + ESPI_CH0_MCYC1_SADDRL);
   515			writel((perif->mcyc.taddr >> 32), espi->regs + ESPI_CH0_MCYC1_TADDRH);
   516			writel((perif->mcyc.taddr & 0xffffffff), espi->regs + ESPI_CH0_MCYC1_TADDRL);
   517	
   518			reg = readl(espi->regs + ESPI_CH0_MCYC1_MASKL) | ESPI_CH0_MCYC1_MASKL_EN;
   519			writel(reg, espi->regs + ESPI_CH0_MCYC1_MASKL);
   520		}
   521	
   522		if (perif->dma.enable) {
   523			writel((perif->dma.np_tx_addr >> 32), espi->regs + ESPI_CH0_NP_TX_DMAH);
   524			writel((perif->dma.np_tx_addr & 0xffffffff), espi->regs + ESPI_CH0_NP_TX_DMAL);
   525			writel((perif->dma.pc_tx_addr >> 32), espi->regs + ESPI_CH0_PC_TX_DMAH);
   526			writel((perif->dma.pc_tx_addr & 0xffffffff), espi->regs + ESPI_CH0_PC_TX_DMAL);
   527			writel((perif->dma.pc_rx_addr >> 32), espi->regs + ESPI_CH0_PC_RX_DMAH);
   528			writel((perif->dma.pc_rx_addr & 0xffffffff), espi->regs + ESPI_CH0_PC_RX_DMAL);
   529	
   530			reg = readl(espi->regs + ESPI_CH0_CTRL)
   531			      | ESPI_CH0_CTRL_NP_TX_DMA_EN
   532			      | ESPI_CH0_CTRL_PC_TX_DMA_EN
   533			      | ESPI_CH0_CTRL_PC_RX_DMA_EN;
   534			writel(reg, espi->regs + ESPI_CH0_CTRL);
   535		}
   536	
   537		writel(ESPI_CH0_INT_EN_PC_RX_CMPLT, espi->regs + ESPI_CH0_INT_EN);
   538	
   539		reg = readl(espi->regs + ESPI_CH0_CTRL);
   540		reg &= ~(ESPI_CH0_CTRL_MCYC_RD_DIS | ESPI_CH0_CTRL_MCYC_WR_DIS);
   541		reg |= ESPI_CH0_CTRL_SW_RDY;
   542		writel(reg, espi->regs + ESPI_CH0_CTRL);
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
