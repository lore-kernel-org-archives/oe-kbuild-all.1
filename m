Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5D7F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676009357; x=1707545357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehsASdic3xANKuOz3KvcVnY3GHkD9+y9J6yADkKVYAA=;
  b=bKBnHGeyivR6S5yKy3IMW/DrgthppydJerzxeW6u+vImqnZuzVM2ahwE
   2cORjdSqk891q6DVBjZo5aQbkmQtOqwIKHMFhupBz80/2e/QuIK/Y7YNN
   /R1l6Va2+a4UdlblkgkCPfGUc4ZtLIl+/eQpxXzqScG2pv7Gdyt0UdRH8
   jYGFg3xRzx4Ykh2oYrYjUuJ4qkwXbCEPY/dFUdNR05tQRLN06oIfBFRei
   YPEF6dIDIWAgfcaG5Pwz/U2T5rHq1eke85JO0yNyk2K/wRq0fNc2dGpAA
   AI3UtKr15Lh7Wo8bBnan1VNiddU4HHh3ElsUFvhlnAwP65har2lkLmbYV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="357746145"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="357746145"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 22:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661293238"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="661293238"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Feb 2023 22:08:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQMaA-0005c2-0m;
	Fri, 10 Feb 2023 06:08:26 +0000
Date: Fri, 10 Feb 2023 14:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Dhruva Gole <d-gole@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [broonie-ci:v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 29/35] drivers/spi/spi-pl022.c:1592:31: error: 'struct spi_message' has no
 member named 'spi_get_csgpiod'
Message-ID: <202302101426.USRJvCep-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230210/202302101426.USRJvCep-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=24f7ead2ae6d2afb32565d4c39add464d59b1d30
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
        git checkout 24f7ead2ae6d2afb32565d4c39add464d59b1d30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101426.USRJvCep-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-pl022.c: In function 'pl022_transfer_one_message':
>> drivers/spi/spi-pl022.c:1592:31: error: 'struct spi_message' has no member named 'spi_get_csgpiod'
    1592 |         pl022->cur_gpiod = msg->spi_get_csgpiod(spi, 0);
         |                               ^~
>> drivers/spi/spi-pl022.c:1592:49: error: 'spi' undeclared (first use in this function)
    1592 |         pl022->cur_gpiod = msg->spi_get_csgpiod(spi, 0);
         |                                                 ^~~
   drivers/spi/spi-pl022.c:1592:49: note: each undeclared identifier is reported only once for each function it appears in


vim +1592 drivers/spi/spi-pl022.c

  1575	
  1576	static int pl022_transfer_one_message(struct spi_master *master,
  1577					      struct spi_message *msg)
  1578	{
  1579		struct pl022 *pl022 = spi_master_get_devdata(master);
  1580	
  1581		/* Initial message state */
  1582		pl022->cur_msg = msg;
  1583		msg->state = STATE_START;
  1584	
  1585		pl022->cur_transfer = list_entry(msg->transfers.next,
  1586						 struct spi_transfer, transfer_list);
  1587	
  1588		/* Setup the SPI using the per chip configuration */
  1589		pl022->cur_chip = spi_get_ctldata(msg->spi);
  1590		pl022->cur_cs = spi_get_chipselect(msg->spi, 0);
  1591		/* This is always available but may be set to -ENOENT */
> 1592		pl022->cur_gpiod = msg->spi_get_csgpiod(spi, 0);
  1593	
  1594		restore_state(pl022);
  1595		flush(pl022);
  1596	
  1597		if (pl022->cur_chip->xfer_type == POLLING_TRANSFER)
  1598			do_polling_transfer(pl022);
  1599		else
  1600			do_interrupt_dma_transfer(pl022);
  1601	
  1602		return 0;
  1603	}
  1604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
