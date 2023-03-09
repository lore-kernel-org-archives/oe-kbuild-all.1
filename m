Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6273C261
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678385186; x=1709921186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLXzbqs++k3KFPmgFXpdIMOFVGZc+MBm62W5coPF6bs=;
  b=dASLSg4CZ7i2DamPEYCKL4c/8FBYe67e20IDQMP4LvF272pGbSp5xJnD
   MmED/HlksTpwXPFxmdQP8Goi/EPWP0ZiyxsDhYVRYt+8OxVzUfP80eaKn
   JR9OnQd9U4d7l+m7ND0lKM8M6cJVw0g8hBP5+cQP6kkH+ru7ytjrI0Ygj
   Jhbz31Ypuq8FKAdebVtaN34E0RqvfRwS1gIUEjkp98AUg6WUcUV15a+Yt
   x1kCeA5xYVcRjC+DGYuleV0EUqBItMxqqO3caiden+7vjshhfyUwPwj0K
   nD4f8c8QK4ony9l1tEcQMdLtfk8DxKT/x+rXHhq+tZG9AZLnB0kUGS/Sh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316179275"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="316179275"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746414696"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="746414696"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 10:05:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paKdz-00038R-37;
	Thu, 09 Mar 2023 18:05:35 +0000
Date: Fri, 10 Mar 2023 02:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:ncycles 1/1] drivers/spi/spi-hisi-sfc-v3xx.c:307:9: error:
 'dummy_mbytes' undeclared; did you mean 'dummy_nbytes'?
Message-ID: <202303100226.At5CpEzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day ncycles
head:   9c690f96a2dd7d844295599362acba3b8c95d2eb
commit: 9c690f96a2dd7d844295599362acba3b8c95d2eb [1/1] spi: spimem: Convert dummy.nbytes to dummy.ncycles
config: m68k-randconfig-r016-20230308 (https://download.01.org/0day-ci/archive/20230310/202303100226.At5CpEzC-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100226.At5CpEzC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-hisi-sfc-v3xx.c: In function 'hisi_sfc_v3xx_start_bus':
>> drivers/spi/spi-hisi-sfc-v3xx.c:307:9: error: 'dummy_mbytes' undeclared (first use in this function); did you mean 'dummy_nbytes'?
     307 |         dummy_mbytes = (op->dummy.ncycles * op->dummy.buswidth) / BITS_PER_BYTE;
         |         ^~~~~~~~~~~~
         |         dummy_nbytes
   drivers/spi/spi-hisi-sfc-v3xx.c:307:9: note: each undeclared identifier is reported only once for each function it appears in


vim +307 drivers/spi/spi-hisi-sfc-v3xx.c

   273	
   274	static int hisi_sfc_v3xx_start_bus(struct hisi_sfc_v3xx_host *host,
   275					   const struct spi_mem_op *op,
   276					   u8 chip_select)
   277	{
   278		int len = op->data.nbytes, buswidth_mode;
   279		unsigned int dummy_nbytes;
   280		u32 config = 0;
   281	
   282		if (op->addr.nbytes)
   283			config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
   284	
   285		if (op->data.buswidth == 0 || op->data.buswidth == 1) {
   286			buswidth_mode = HISI_SFC_V3XX_STD;
   287		} else {
   288			int data_idx, addr_idx, cmd_idx;
   289	
   290			data_idx = (op->data.buswidth - 1) / 2;
   291			addr_idx = op->addr.buswidth / 2;
   292			cmd_idx = op->cmd.buswidth / 2;
   293			buswidth_mode = hisi_sfc_v3xx_io_modes[data_idx][addr_idx][cmd_idx];
   294		}
   295		if (buswidth_mode < 0)
   296			return buswidth_mode;
   297		config |= buswidth_mode;
   298	
   299		if (op->data.dir != SPI_MEM_NO_DATA) {
   300			config |= (len - 1) << HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF;
   301			config |= HISI_SFC_V3XX_CMD_CFG_DATA_EN_MSK;
   302		}
   303	
   304		if (op->data.dir == SPI_MEM_DATA_IN)
   305			config |= HISI_SFC_V3XX_CMD_CFG_RW_MSK;
   306	
 > 307		dummy_mbytes = (op->dummy.ncycles * op->dummy.buswidth) / BITS_PER_BYTE;
   308		config |= dummy_nbytes << HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF |
   309			  chip_select << HISI_SFC_V3XX_CMD_CFG_CS_SEL_OFF |
   310			  HISI_SFC_V3XX_CMD_CFG_START_MSK;
   311	
   312		writel(op->addr.val, host->regbase + HISI_SFC_V3XX_CMD_ADDR);
   313		writel(op->cmd.opcode, host->regbase + HISI_SFC_V3XX_CMD_INS);
   314	
   315		writel(config, host->regbase + HISI_SFC_V3XX_CMD_CFG);
   316	
   317		return 0;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
