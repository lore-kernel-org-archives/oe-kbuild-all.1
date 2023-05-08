Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F64101FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 06:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683528451; x=1715064451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+1QOsGHi9ZD+1MKMsIZzGw5NPMdCCYahK7dk79jxcQ=;
  b=HPMSGjyarRVR+le7d+MCBnjky9Fs7USy/LoTvHIJLa98c2N2jw5/AcW9
   WC/jFJM+CXlvrjEHW7kWg8X7py2sIYo/cs2vQaWyCD8Z4kQx/IBg2ocGx
   u4g7iQOIB5o8mYG1ebrcyyBdzSO661C0ObnP2M35GJCgawmzce7DrKr22
   hTjpMj5301kVR6C9nJqslUz/YrZDsZxreNqr6rX0Xg/fBoMrBeBZpWBxV
   tabI6BbduEQw7WsRorDR7QFXjtwyU8dohST1C6Kq75SdfHbIaNIqhaVGw
   JVcszmEIbY8b3tLYSSCl+7d9uQCyTVGQz+NVjQFZ4JkKpJkZB3gfHUJa9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349604404"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="349604404"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="767953482"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="767953482"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 May 2023 23:47:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvued-000161-2N;
	Mon, 08 May 2023 06:47:27 +0000
Date: Mon, 8 May 2023 14:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
 1/2] drivers/spi/spi-loongson-core.c:222:31: error: implicit declaration of
 function 'of_node_get'
Message-ID: <202305081401.ePsG2Yim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
head:   45991d67ae06843705fece64fc304aee0e8e360b
commit: 31d0b163bc42e0d717788c1718e42c7d83763307 [1/2] spi: loongson: add bus driver for the loongson spi controller
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230508/202305081401.ePsG2Yim-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=31d0b163bc42e0d717788c1718e42c7d83763307
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
        git checkout 31d0b163bc42e0d717788c1718e42c7d83763307
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081401.ePsG2Yim-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-loongson-core.c: In function 'loongson_spi_init_master':
>> drivers/spi/spi-loongson-core.c:222:31: error: implicit declaration of function 'of_node_get' [-Werror=implicit-function-declaration]
     222 |         master->dev.of_node = of_node_get(dev->of_node);
         |                               ^~~~~~~~~~~
   drivers/spi/spi-loongson-core.c:222:29: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     222 |         master->dev.of_node = of_node_get(dev->of_node);
         |                             ^
>> drivers/spi/spi-loongson-core.c:242:13: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
     242 |         if (of_get_property(dev->of_node, "spi-nocs", NULL))
         |             ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_node_get +222 drivers/spi/spi-loongson-core.c

   202	
   203	int loongson_spi_init_master(struct device *dev, struct resource *res)
   204	{
   205		struct spi_master *master;
   206		struct loongson_spi *spi;
   207		struct clk *clk;
   208	
   209		master = devm_spi_alloc_master(dev, sizeof(struct loongson_spi));
   210		if (master == NULL) {
   211			dev_info(dev, "master allocation failed\n");
   212			return -ENOMEM;
   213		}
   214	
   215		master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
   216		master->setup = loongson_spi_setup;
   217		master->prepare_message = loongson_spi_prepare_message;
   218		master->transfer_one = loongson_spi_transfer_one;
   219		master->unprepare_message = loongson_spi_unprepare_message;
   220		master->set_cs = loongson_spi_set_cs;
   221		master->num_chipselect = 4;
 > 222		master->dev.of_node = of_node_get(dev->of_node);
   223		dev_set_drvdata(dev, master);
   224	
   225		spi = spi_master_get_devdata(master);
   226	
   227		spi->master = master;
   228	
   229		spi->base = devm_ioremap(dev, res->start, resource_size(res));
   230		if (spi->base == NULL) {
   231			dev_err(dev, "cannot map io\n");
   232			return -ENXIO;
   233		}
   234	
   235		clk = devm_clk_get(dev, NULL);
   236		if (!IS_ERR(clk))
   237			spi->clk_rate = clk_get_rate(clk);
   238	
   239		loongson_spi_reginit(spi);
   240	
   241		spi->mode = 0;
 > 242		if (of_get_property(dev->of_node, "spi-nocs", NULL))
   243			spi->mode |= SPI_NO_CS;
   244	
   245		return devm_spi_register_master(dev, master);
   246	}
   247	EXPORT_SYMBOL_GPL(loongson_spi_init_master);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
