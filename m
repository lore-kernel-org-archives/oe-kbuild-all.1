Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D6AA94D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675977552; x=1707513552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hFfAMOg9LuyvUthmOrG4KZhwC57nAPPh1H9iFj8VyE=;
  b=mDiNGyJO1jhpid4R7fETUwdRbTJ0raEfrR25t68+3vxwOHtdIPBDDbsp
   PdDDHBvGy1cPYRaiObBQl8qQJkyCovBJoEZ/QoA5WyrfgcVuXfl04kWd0
   T8zFLcuYcABH2jCZgD1fRGPaiV09vaP9HfJigz4fcG3R2NQg+j7HbrXBK
   rZPNW/4zdlTIQTQ95slWmAF2TkbeyOPVwj6Lqp9/zqMV1hiJoUYma/VFu
   qXkWypk8YfjOycIe43IiBGpnn6A5bl2JJmsqGCDAC1lA+kvc5JKAFw4Aw
   t6AMs4BaJWX+2Qo17LudmP0RJKnFMuwdbavNYzbbUEsRN+P4KquOS1Oz+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327942040"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="327942040"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 13:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617677779"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="617677779"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 13:19:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQEJv-0005JO-28;
	Thu, 09 Feb 2023 21:19:07 +0000
Date: Fri, 10 Feb 2023 05:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Dhruva Gole <d-gole@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [broonie-ci:v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 29/35] drivers/spi/spi-sh-msiof.c:590:29: warning: passing argument 1 of
 'spi_get_csgpiod' discards 'const' qualifier from pointer target type
Message-ID: <202302100551.ijqkQN0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
head:   b1bff13bcb2439c0ba5142fb0851ad602f3a4a02
commit: 24f7ead2ae6d2afb32565d4c39add464d59b1d30 [29/35] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302100551.ijqkQN0H-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=24f7ead2ae6d2afb32565d4c39add464d59b1d30
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
        git checkout 24f7ead2ae6d2afb32565d4c39add464d59b1d30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100551.ijqkQN0H-lkp@intel.com/

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
