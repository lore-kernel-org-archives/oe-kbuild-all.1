Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC8D524
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693934627; x=1725470627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4TCDdckKQkJUZLts0D/U8PXZUUBG1gTIoFbBIlWQ2s=;
  b=lIfkmUmdv2XItI6W2dMtbZH6iSVx/QJdGzD6NxP5RN/G/qA2WPOnmT5G
   F9weRzCdlrwwfpeGmbbJZ4AQ1dgKzsIcuwuFh4thKUVOc/9zyLCW6ZLul
   MN8gLDe688DuXa7mOV32hA8nQJbIRcr//FLOkM1V161f7Ke/J4rmBI+km
   qLfpcxypltJ+W+It+VUaX4IbC8Wu5clZifXb3GjIXnqanqOoBG91y/syn
   d+XwkkIfouA2xgsbYRFGilznSyA2/RSWHQZ+CnEbpQeRLeAyOMRWOadw6
   RhYdOqAtb7L1Dyv7gYtexkNQToBNfDEnwBxLsb9eOFZg31BTrLFRJ7KAo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375748241"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="375748241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 10:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770401636"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="770401636"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 10:15:47 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdZcq-0001uF-2x;
	Tue, 05 Sep 2023 17:14:32 +0000
Date: Wed, 6 Sep 2023 01:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 935/1123] drivers/spi/spi-sh-msiof.c:590:29:
 warning: passing argument 1 of 'spi_get_csgpiod' discards 'const' qualifier
 from pointer target type
Message-ID: <202309060141.EfkIf6jB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: ae655c59997b0da487fa28ef79046f3a129a61cf [935/1123] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
config: nios2-randconfig-r016-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060141.EfkIf6jB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060141.EfkIf6jB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060141.EfkIf6jB-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
