Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4039C26E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678385187; x=1709921187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k/NYcRka9KCU4z6241hts+LzrQoo2UuYI4Ej2AWSnEA=;
  b=KVqEnzaGGtLgeBJ2VPrgmMkENfJZi1NpOT27E2RD9vB/I1B5Fo4N9m6K
   DDEFA1UQv1Nt6SH01Bv+SzzR/6VRkpryskbNPpPAEtdo4aGvvGO2/6CO7
   2a4WPPOHf00dwc1TBXLUUAGVO7uFudXPN0ujdkWjQTnMZ+HPC+PgTFxEY
   vkEqwlPurBa5AC9+BubF/0fumkBgrWJC9WO2wdTpzJMyGT8Y+t6QLnA8b
   pXKNyBs7zTDmy1s8jlZNzb/VCVdeclCuTCSwyW6lG/LqpTHR+a4jicS4t
   egIuL8Hr5tCMJyp9WoBtbjsuZfanR10C0OxbSXJhAFALfHbsQuKDGicly
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316179278"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="316179278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746414697"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="746414697"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 10:05:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paKe0-00038T-00;
	Thu, 09 Mar 2023 18:05:36 +0000
Date: Fri, 10 Mar 2023 02:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:ncycles 1/1] drivers/spi/spi-aspeed-smc.c:593:22: error:
 'struct <anonymous>' has no member named 'nbytes'
Message-ID: <202303100211.6QdtIODH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/ambarus/linux-0day ncycles
head:   9c690f96a2dd7d844295599362acba3b8c95d2eb
commit: 9c690f96a2dd7d844295599362acba3b8c95d2eb [1/1] spi: spimem: Convert dummy.nbytes to dummy.ncycles
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100211.6QdtIODH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ambarus/linux-0day/commit/9c690f96a2dd7d844295599362acba3b8c95d2eb
        git remote add ambarus https://github.com/ambarus/linux-0day
        git fetch --no-tags ambarus ncycles
        git checkout 9c690f96a2dd7d844295599362acba3b8c95d2eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100211.6QdtIODH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/spi/spi-aspeed-smc.c: In function 'aspeed_spi_dirmap_create':
>> drivers/spi/spi-aspeed-smc.c:593:22: error: 'struct <anonymous>' has no member named 'nbytes'
     593 |         if (op->dummy.nbytes)
         |                      ^
--
   drivers/spi/spi-hisi-sfc-v3xx.c: In function 'hisi_sfc_v3xx_start_bus':
>> drivers/spi/spi-hisi-sfc-v3xx.c:307:9: error: 'dummy_mbytes' undeclared (first use in this function); did you mean 'dummy_nbytes'?
     307 |         dummy_mbytes = (op->dummy.ncycles * op->dummy.buswidth) / BITS_PER_BYTE;
         |         ^~~~~~~~~~~~
         |         dummy_nbytes
   drivers/spi/spi-hisi-sfc-v3xx.c:307:9: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/spi/spi-mtk-snfi.c: In function 'mtk_snand_adjust_op_size':
>> drivers/spi/spi-mtk-snfi.c:1276:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1276 |                 size_t hl = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
         |                 ^~~~~~
--
   drivers/spi/spi-npcm-fiu.c: In function 'npcm_fiu_set_drd':
>> drivers/spi/spi-npcm-fiu.c:280:27: error: 'struct <anonymous>' has no member named 'cycles'; did you mean 'ncycles'?
     280 |         fiu->drd_op.dummy.cycles = op->dummy.ncycles;
         |                           ^~~~~~
         |                           ncycles
--
   drivers/spi/spi-nxp-fspi.c: In function 'nxp_fspi_prepare_lut':
>> drivers/spi/spi-nxp-fspi.c:544:22: error: 'const struct <anonymous>' has no member named 'nbytes'
     544 |         if (op->dummy.nbytes) {
         |                      ^
--
   drivers/spi/spi-stm32-qspi.c: In function 'stm32_qspi_transfer_one_message':
>> drivers/spi/spi-stm32-qspi.c:596:47: error: invalid type argument of '->' (have 'struct spi_mem_op')
     596 |                                             op->dummy.buswidth;
         |                                               ^~


vim +593 drivers/spi/spi-aspeed-smc.c

eeaec1ea05c0e0f Cédric Le Goater 2022-05-09  558  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  559  static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
9da06d7bdec7dad Cédric Le Goater 2022-05-09  560  {
9da06d7bdec7dad Cédric Le Goater 2022-05-09  561  	struct aspeed_spi *aspi = spi_controller_get_devdata(desc->mem->spi->master);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  562  	struct aspeed_spi_chip *chip = &aspi->chips[desc->mem->spi->chip_select];
9da06d7bdec7dad Cédric Le Goater 2022-05-09  563  	struct spi_mem_op *op = &desc->info.op_tmpl;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  564  	u32 ctl_val;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  565  	int ret = 0;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  566  
8988ba7dec43aab Cédric Le Goater 2022-06-22  567  	dev_dbg(aspi->dev,
8988ba7dec43aab Cédric Le Goater 2022-06-22  568  		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
8988ba7dec43aab Cédric Le Goater 2022-06-22  569  		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
8988ba7dec43aab Cédric Le Goater 2022-06-22  570  		desc->info.offset, desc->info.offset + desc->info.length,
8988ba7dec43aab Cédric Le Goater 2022-06-22  571  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
8988ba7dec43aab Cédric Le Goater 2022-06-22  572  		op->dummy.buswidth, op->data.buswidth,
9c690f96a2dd7d8 Tudor Ambarus    2023-03-09  573  		op->addr.nbytes, op->dummy.ncycles);
8988ba7dec43aab Cédric Le Goater 2022-06-22  574  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  575  	chip->clk_freq = desc->mem->spi->max_speed_hz;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  576  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  577  	/* Only for reads */
9da06d7bdec7dad Cédric Le Goater 2022-05-09  578  	if (op->data.dir != SPI_MEM_DATA_IN)
9da06d7bdec7dad Cédric Le Goater 2022-05-09  579  		return -EOPNOTSUPP;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  580  
bb084f94e1bca4a Cédric Le Goater 2022-05-09  581  	aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.length);
bb084f94e1bca4a Cédric Le Goater 2022-05-09  582  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  583  	if (desc->info.length > chip->ahb_window_size)
9da06d7bdec7dad Cédric Le Goater 2022-05-09  584  		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
9da06d7bdec7dad Cédric Le Goater 2022-05-09  585  			 chip->cs, chip->ahb_window_size >> 20);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  586  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  587  	/* Define the default IO read settings */
9da06d7bdec7dad Cédric Le Goater 2022-05-09  588  	ctl_val = readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  589  	ctl_val |= aspeed_spi_get_io_mode(op) |
9da06d7bdec7dad Cédric Le Goater 2022-05-09  590  		op->cmd.opcode << CTRL_COMMAND_SHIFT |
9da06d7bdec7dad Cédric Le Goater 2022-05-09  591  		CTRL_IO_MODE_READ;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  592  
30554a1f0fd6a5d Cédric Le Goater 2022-06-22 @593  	if (op->dummy.nbytes)
9c690f96a2dd7d8 Tudor Ambarus    2023-03-09  594  		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.ncycles);
30554a1f0fd6a5d Cédric Le Goater 2022-06-22  595  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  596  	/* Tune 4BYTE address mode */
9da06d7bdec7dad Cédric Le Goater 2022-05-09  597  	if (op->addr.nbytes) {
9da06d7bdec7dad Cédric Le Goater 2022-05-09  598  		u32 addr_mode = readl(aspi->regs + CE_CTRL_REG);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  599  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  600  		if (op->addr.nbytes == 4)
9da06d7bdec7dad Cédric Le Goater 2022-05-09  601  			addr_mode |= (0x11 << chip->cs);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  602  		else
9da06d7bdec7dad Cédric Le Goater 2022-05-09  603  			addr_mode &= ~(0x11 << chip->cs);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  604  		writel(addr_mode, aspi->regs + CE_CTRL_REG);
53526ab27d9c256 Cédric Le Goater 2022-05-09  605  
53526ab27d9c256 Cédric Le Goater 2022-05-09  606  		/* AST2400 SPI controller sets 4BYTE address mode in
53526ab27d9c256 Cédric Le Goater 2022-05-09  607  		 * CE0 Control Register
53526ab27d9c256 Cédric Le Goater 2022-05-09  608  		 */
53526ab27d9c256 Cédric Le Goater 2022-05-09  609  		if (op->addr.nbytes == 4 && chip->aspi->data == &ast2400_spi_data)
53526ab27d9c256 Cédric Le Goater 2022-05-09  610  			ctl_val |= CTRL_IO_ADDRESS_4B;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  611  	}
9da06d7bdec7dad Cédric Le Goater 2022-05-09  612  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  613  	/* READ mode is the controller default setting */
9da06d7bdec7dad Cédric Le Goater 2022-05-09  614  	chip->ctl_val[ASPEED_SPI_READ] = ctl_val;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  615  	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  616  
eeaec1ea05c0e0f Cédric Le Goater 2022-05-09  617  	ret = aspeed_spi_do_calibration(chip);
eeaec1ea05c0e0f Cédric Le Goater 2022-05-09  618  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  619  	dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
9da06d7bdec7dad Cédric Le Goater 2022-05-09  620  		 chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_READ]);
9da06d7bdec7dad Cédric Le Goater 2022-05-09  621  
9da06d7bdec7dad Cédric Le Goater 2022-05-09  622  	return ret;
9da06d7bdec7dad Cédric Le Goater 2022-05-09  623  }
9da06d7bdec7dad Cédric Le Goater 2022-05-09  624  

:::::: The code at line 593 was first introduced by commit
:::::: 30554a1f0fd6a5d2e2413bdc05389995d5611736 spi: aspeed: Fix division by zero

:::::: TO: Cédric Le Goater <clg@kaod.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
