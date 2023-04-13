Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53649626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681404058; x=1712940058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzE3za/R8rVaZ29jgaSPzk9bFB+8OuBZAXYBV6TM3M8=;
  b=e+pVYS1gmVQ6ggD+8LXsE4uPolrgs2wz6KA9UHPVTYHde2pERSOv+bDF
   xKNU8hLz+5fPaR3d1wns3/EhG9dJznYG/gNPIQVSd7kII88xpsnUq6VgC
   GECFcbEH+HvH35W5KdRtDK9hQ/N+zdsH80Nw46eqBhhDV5pooS7nLTDYz
   W91jI9XKO7t7p36k+pjpEC7IFyE2LfIOdvEj1lJQp5auwQEeK7eIzUaiI
   BrrplgnEeg58x4tGiPHU7DmF+Katqky19xrgc+tlv465sW/E4/ARhDir3
   nu+SgkcaTscxkccHEAr/sLrQ3zbqcUE4F+LPLA0ksgMD6mo5OF0vo4vTr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372091636"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="372091636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="863856188"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="863856188"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 09:40:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn00E-000Yoy-30;
	Thu, 13 Apr 2023 16:40:54 +0000
Date: Fri, 14 Apr 2023 00:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 883/1065]
 drivers/spi/spi-sh-msiof.c:590:29: warning: passing argument 1 of
 'spi_get_csgpiod' discards 'const' qualifier from pointer target type
Message-ID: <202304140009.1EEA8HuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
head:   bbf25ceb15a43c9047e14ab46a1d25c8ae6b67b4
commit: 570ea9b08474a574958a1857b5d71d1ff2f47cc0 [883/1065] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304140009.1EEA8HuJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/570ea9b08474a574958a1857b5d71d1ff2f47cc0
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1
        git checkout 570ea9b08474a574958a1857b5d71d1ff2f47cc0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140009.1EEA8HuJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-sh-msiof.c: In function 'sh_msiof_prepare_message':
>> drivers/spi/spi-sh-msiof.c:590:29: warning: passing argument 1 of 'spi_get_csgpiod' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     590 |         if (spi_get_csgpiod(spi, 0)) {
         |                             ^~~
   In file included from drivers/spi/spi-sh-msiof.c:29:
   include/linux/spi/spi.h:276:68: note: expected 'struct spi_device *' but argument is of type 'const struct spi_device *'
     276 | static inline struct gpio_desc *spi_get_csgpiod(struct spi_device *spi, u8 idx)
         |                                                 ~~~~~~~~~~~~~~~~~~~^~~
>> drivers/spi/spi-sh-msiof.c:594:41: warning: passing argument 1 of 'spi_get_chipselect' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     594 |                 ss = spi_get_chipselect(spi, 0);
         |                                         ^~~
   include/linux/spi/spi.h:266:56: note: expected 'struct spi_device *' but argument is of type 'const struct spi_device *'
     266 | static inline u8 spi_get_chipselect(struct spi_device *spi, u8 idx)
         |                                     ~~~~~~~~~~~~~~~~~~~^~~


vim +590 drivers/spi/spi-sh-msiof.c

   581	
   582	static int sh_msiof_prepare_message(struct spi_controller *ctlr,
   583					    struct spi_message *msg)
   584	{
   585		struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
   586		const struct spi_device *spi = msg->spi;
   587		u32 ss, cs_high;
   588	
   589		/* Configure pins before asserting CS */
 > 590		if (spi_get_csgpiod(spi, 0)) {
   591			ss = ctlr->unused_native_cs;
   592			cs_high = p->native_cs_high;
   593		} else {
 > 594			ss = spi_get_chipselect(spi, 0);
   595			cs_high = !!(spi->mode & SPI_CS_HIGH);
   596		}
   597		sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
   598					  !!(spi->mode & SPI_CPHA),
   599					  !!(spi->mode & SPI_3WIRE),
   600					  !!(spi->mode & SPI_LSB_FIRST), cs_high);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
