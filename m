Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F3538B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680876245; x=1712412245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbNL+i43101z0Vx5VKmHIUuIKlemk7oQqqBBUZ29cV0=;
  b=gVbFwX13NcG0o+wcAPiZijisq+BJ776iZRqkqYTDxDZ5VPbc4f4IO6U2
   NednphmOxtd6jKhcLqlaP3zlxdVVZ76FUG3kPftzvJVuinTo8XbQuNmeb
   EU8v4NKOX1NwYKnphCHa/PQNImTOrYmJYq4IhL+X/M32lEa+Dl41No9/M
   dT2n3CT1i4D4ExV+qd4RrujtAVSJn0AuGjFS1QxLCj5jHP9OUOJr2zL4m
   NEe1HSP79N6RnDM1fAPd6pTdzMgK/xGDBuRToVIIZWZTkfH44TU8hXOeF
   xNlbgI2t3LSf0DC9Hybbh06JlPSzVf3Qmoqrk1k+TzWzAGAWGq1XEGRon
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408122548"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="408122548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 07:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637713488"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637713488"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 07:03:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkmgt-000SZR-1c;
	Fri, 07 Apr 2023 14:03:47 +0000
Date: Fri, 7 Apr 2023 22:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 18848/22025]
 drivers/spi/spi-omap2-mcspi.c:563:34: warning: variable 'mcspi_dma' set but
 not used
Message-ID: <202304072158.9ulcNhL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaishnav,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 907e39b5b1e12c07bb20b83044f3e12bdd9d8a36 [18848/22025] spi: spi-omap2-mcspi: Use EOW interrupt for completion when DMA enabled
config: nios2-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072158.9ulcNhL6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 907e39b5b1e12c07bb20b83044f3e12bdd9d8a36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072158.9ulcNhL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-omap2-mcspi.c: In function 'omap2_mcspi_txrx_dma':
>> drivers/spi/spi-omap2-mcspi.c:563:34: warning: variable 'mcspi_dma' set but not used [-Wunused-but-set-variable]
     563 |         struct omap2_mcspi_dma  *mcspi_dma;
         |                                  ^~~~~~~~~


vim +/mcspi_dma +563 drivers/spi/spi-omap2-mcspi.c

d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  557  
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  558  static unsigned
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  559  omap2_mcspi_txrx_dma(struct spi_device *spi, struct spi_transfer *xfer)
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  560  {
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  561  	struct omap2_mcspi	*mcspi;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  562  	struct omap2_mcspi_cs	*cs = spi->controller_state;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11 @563  	struct omap2_mcspi_dma  *mcspi_dma;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  564  	unsigned int		count;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  565  	u8			*rx;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  566  	const u8		*tx;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  567  	struct dma_slave_config	cfg;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  568  	enum dma_slave_buswidth width;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  569  	unsigned es;
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  570  	void __iomem		*chstat_reg;
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  571  	int			wait_res;
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  572  	int ret;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  573  
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  574  	mcspi = spi_master_get_devdata(spi->master);
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  575  	mcspi_dma = &mcspi->dma_channels[spi->chip_select];
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  576  
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  577  	if (cs->word_len <= 8) {
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  578  		width = DMA_SLAVE_BUSWIDTH_1_BYTE;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  579  		es = 1;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  580  	} else if (cs->word_len <= 16) {
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  581  		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  582  		es = 2;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  583  	} else {
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  584  		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  585  		es = 4;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  586  	}
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  587  
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  588  	count = xfer->len;
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  589  
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  590  	memset(&cfg, 0, sizeof(cfg));
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  591  	cfg.src_addr = cs->phys + OMAP2_MCSPI_RX0;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  592  	cfg.dst_addr = cs->phys + OMAP2_MCSPI_TX0;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  593  	cfg.src_addr_width = width;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  594  	cfg.dst_addr_width = width;
baf8b9f8d260c5 drivers/spi/spi-omap2-mcspi.c Vignesh R       2019-01-15  595  	cfg.src_maxburst = 1;
baf8b9f8d260c5 drivers/spi/spi-omap2-mcspi.c Vignesh R       2019-01-15  596  	cfg.dst_maxburst = 1;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  597  
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  598  	rx = xfer->rx_buf;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  599  	tx = xfer->tx_buf;
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  600  
89e8b9cb846515 drivers/spi/spi-omap2-mcspi.c Vignesh R       2018-10-15  601  	mcspi->slave_aborted = false;
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  602  	reinit_completion(&mcspi->txrxdone);
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  603  	mcspi_write_reg(spi->master, OMAP2_MCSPI_IRQENABLE,	OMAP2_MCSPI_IRQSTATUS_EOW);
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  604  	if (tx)
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  605  		omap2_mcspi_tx_dma(spi, xfer, cfg);
d7b4394e780b02 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-09-11  606  
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  607  	if (rx)
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  608  		count = omap2_mcspi_rx_dma(spi, xfer, cfg, es);
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  609  
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  610  	ret = mcspi_wait_for_completion(mcspi, &mcspi->txrxdone);
89e8b9cb846515 drivers/spi/spi-omap2-mcspi.c Vignesh R       2018-10-15  611  	omap2_mcspi_set_dma_req(spi, 0, 0);
89e8b9cb846515 drivers/spi/spi-omap2-mcspi.c Vignesh R       2018-10-15  612  	if (ret || mcspi->slave_aborted)
89e8b9cb846515 drivers/spi/spi-omap2-mcspi.c Vignesh R       2018-10-15  613  		return 0;
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  614  
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  615  	/* for TX_ONLY mode, be sure all words have shifted out */
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  616  	if (tx && !rx) {
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  617  		chstat_reg = cs->base + OMAP2_MCSPI_CHSTAT0;
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  618  		if (mcspi->fifo_depth > 0) {
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  619  			wait_res = mcspi_wait_for_reg_bit(chstat_reg, OMAP2_MCSPI_CHSTAT_TXFFE);
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  620  			if (wait_res < 0)
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  621  				dev_err(&spi->dev, "TXFFE timed out\n");
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  622  		} else {
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  623  			wait_res = mcspi_wait_for_reg_bit(chstat_reg, OMAP2_MCSPI_CHSTAT_TXS);
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  624  			if (wait_res < 0)
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  625  				dev_err(&spi->dev, "TXS timed out\n");
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  626  		}
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  627  		if (wait_res >= 0 && (mcspi_wait_for_reg_bit(chstat_reg,
d33f473dcd8e69 drivers/spi/spi-omap2-mcspi.c Illia Smyrnov   2013-06-17  628  							     OMAP2_MCSPI_CHSTAT_EOT) < 0))
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  629  			dev_err(&spi->dev, "EOT timed out\n");
e47a682ace0cd5 drivers/spi/spi-omap2-mcspi.c Shubhrajyoti D  2012-11-06  630  	}
907e39b5b1e12c drivers/spi/spi-omap2-mcspi.c Vaishnav Achath 2022-10-11  631  
ccdc7bf925731e drivers/spi/omap2_mcspi.c     Samuel Ortiz    2007-07-17  632  	return count;
ccdc7bf925731e drivers/spi/omap2_mcspi.c     Samuel Ortiz    2007-07-17  633  }
ccdc7bf925731e drivers/spi/omap2_mcspi.c     Samuel Ortiz    2007-07-17  634  

:::::: The code at line 563 was first introduced by commit
:::::: d7b4394e780b02511c8a7a499380cdd56316c770 spi: omap2-mcspi: Cleanup the omap2_mcspi_txrx_dma function

:::::: TO: Shubhrajyoti D <shubhrajyoti@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
