Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071038E8A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209696; cv=none; b=da/PTL6GRWDiJtLjUedxVhbqPmJRdVHpudQnsohnyQ6qVofU/qzMh5+XQeqACAmssVuBTLTaYrploeexvj9ICWIdf002Va+77nW2YdPt4lu1eWTge0a0NmEzBNJrQWzJeVuT/QJZHC6XpnMbT7NxE5sxENdSCz4yy1Q5U+Lu2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209696; c=relaxed/simple;
	bh=KM6IqZVILW9ddnvOrkC6irZKKU3A5zqOZnUev1wD1ag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JioYyMbC3iAe20Kid9n+6xdGSXuDPcVGGx5jr3BHjH97tzFU0BrJgO7t9CQNuFI8pAISL9Tn0DCvxIBx8jfmy0eA+acN9PXD5HMxZ0yPyKmpA/j6/XqzVt956wPbi/HznZ18pDNI2HhJlN6sDqrT4MWacZfwm3LVHGgGqoE3N0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPZ76mhL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPZ76mhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787209695; x=1818745695;
  h=date:from:to:cc:subject:message-id;
  bh=KM6IqZVILW9ddnvOrkC6irZKKU3A5zqOZnUev1wD1ag=;
  b=FPZ76mhLQ+Fkt7CZ8poT6EXBzdBv1SiDGySMKuSfOeOWwuN/4t6MiWUD
   gW3zqf/sY1YuYtusfhly6DOv9HLAJCQ4ufI4RDEZ5O0nhtU74o+kigQXv
   crLxpuqg4/WoxlUxXasWJ/c5BUsTf0Rvwb7qL8UE9/cJ/Vfu7B0v3lpQn
   o4dUHrmSEkmgJasX5KTZK2Zx85hdocAKEdA+1fHRGBll1QJhf19/kdrf5
   89P9sjjF0ZJNrUvuK1CjBJJ5e3NDJpVcmV9lPWzAJucw194+CTpx7yfB3
   jAGJO6I5EhqhOhAqKMEQL7i4sNfm5L3jbagyKBnHWfcG508ieHSwXvEWH
   Q==;
X-CSE-ConnectionGUID: Fz5TVZzRROO2C14zsawfYA==
X-CSE-MsgGUID: rdZaHbicTCaIjyu3qezrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113274261"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="113274261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 00:08:14 -0700
X-CSE-ConnectionGUID: gNALWSfQSAW0zJoBZ+ZfuQ==
X-CSE-MsgGUID: C2RagkRxSU6tysu908/EYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="261643640"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2026 00:08:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwwsj-00000000iBd-3bQ0;
	Thu, 20 Aug 2026 07:08:09 +0000
Date: Thu, 20 Aug 2026 15:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:spi-7.3 78/79]
 drivers/spi/spi-loongson-core.c:252:12: warning: 'loongson_spi_resume'
 defined but not used
Message-ID: <202608201500.sPIW7fK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-7.3
head:   273f66b33a1760c1a87ab083d0d745161d1fd8eb
commit: b4b52cc0bc1c941f9cdf8f746f45575eba5aad1f [78/79] spi: loongson: pm: add .freeze .poweroff .thaw .restore
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260820/202608201500.sPIW7fK0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201500.sPIW7fK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201500.sPIW7fK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-loongson-core.c:252:12: warning: 'loongson_spi_resume' defined but not used [-Wunused-function]
     252 | static int loongson_spi_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-loongson-core.c:232:12: warning: 'loongson_spi_suspend' defined but not used [-Wunused-function]
     232 | static int loongson_spi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/loongson_spi_resume +252 drivers/spi/spi-loongson-core.c

6c7a864007b66e Yinbo Zhu     2023-06-13  231  
8de18aced458db Jisheng Zhang 2026-08-03 @232  static int loongson_spi_suspend(struct device *dev)
6c7a864007b66e Yinbo Zhu     2023-06-13  233  {
6c7a864007b66e Yinbo Zhu     2023-06-13  234  	struct loongson_spi *loongson_spi;
6c7a864007b66e Yinbo Zhu     2023-06-13  235  	struct spi_controller *controller;
6c7a864007b66e Yinbo Zhu     2023-06-13  236  
6c7a864007b66e Yinbo Zhu     2023-06-13  237  	controller = dev_get_drvdata(dev);
6c7a864007b66e Yinbo Zhu     2023-06-13  238  	spi_controller_suspend(controller);
6c7a864007b66e Yinbo Zhu     2023-06-13  239  
6c7a864007b66e Yinbo Zhu     2023-06-13  240  	loongson_spi = spi_controller_get_devdata(controller);
6c7a864007b66e Yinbo Zhu     2023-06-13  241  
6c7a864007b66e Yinbo Zhu     2023-06-13  242  	loongson_spi->spcr = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPCR_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  243  	loongson_spi->sper = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPER_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  244  	loongson_spi->spsr = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPSR_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  245  	loongson_spi->para = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_PARA_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  246  	loongson_spi->sfcs = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SFCS_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  247  	loongson_spi->timi = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_TIMI_REG);
6c7a864007b66e Yinbo Zhu     2023-06-13  248  
6c7a864007b66e Yinbo Zhu     2023-06-13  249  	return 0;
6c7a864007b66e Yinbo Zhu     2023-06-13  250  }
6c7a864007b66e Yinbo Zhu     2023-06-13  251  
8de18aced458db Jisheng Zhang 2026-08-03 @252  static int loongson_spi_resume(struct device *dev)
6c7a864007b66e Yinbo Zhu     2023-06-13  253  {
6c7a864007b66e Yinbo Zhu     2023-06-13  254  	struct loongson_spi *loongson_spi;
6c7a864007b66e Yinbo Zhu     2023-06-13  255  	struct spi_controller *controller;
6c7a864007b66e Yinbo Zhu     2023-06-13  256  
6c7a864007b66e Yinbo Zhu     2023-06-13  257  	controller = dev_get_drvdata(dev);
6c7a864007b66e Yinbo Zhu     2023-06-13  258  	loongson_spi = spi_controller_get_devdata(controller);
6c7a864007b66e Yinbo Zhu     2023-06-13  259  
6c7a864007b66e Yinbo Zhu     2023-06-13  260  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, loongson_spi->spcr);
6c7a864007b66e Yinbo Zhu     2023-06-13  261  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, loongson_spi->sper);
6c7a864007b66e Yinbo Zhu     2023-06-13  262  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPSR_REG, loongson_spi->spsr);
6c7a864007b66e Yinbo Zhu     2023-06-13  263  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loongson_spi->para);
6c7a864007b66e Yinbo Zhu     2023-06-13  264  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SFCS_REG, loongson_spi->sfcs);
6c7a864007b66e Yinbo Zhu     2023-06-13  265  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_TIMI_REG, loongson_spi->timi);
6c7a864007b66e Yinbo Zhu     2023-06-13  266  
6c7a864007b66e Yinbo Zhu     2023-06-13  267  	spi_controller_resume(controller);
6c7a864007b66e Yinbo Zhu     2023-06-13  268  
6c7a864007b66e Yinbo Zhu     2023-06-13  269  	return 0;
6c7a864007b66e Yinbo Zhu     2023-06-13  270  }
6c7a864007b66e Yinbo Zhu     2023-06-13  271  

:::::: The code at line 252 was first introduced by commit
:::::: 8de18aced458db42f847d0da2ae08e654ba2f6c1 spi: loongson: use modern PM macros

:::::: TO: Jisheng Zhang <jszhang@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
