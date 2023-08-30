Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B96FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693435028; x=1724971028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcfut0guZEmAJSAnhSVu7ANfOiJuwraRg1Do++yO1Nk=;
  b=YssUjoH6WwObtC/dTqQhJ23VeX6ouZodny5Kv8grk1AdVLGX6bNAhpIt
   bR3Nu0TgN+Ksf6pPjaS57c8QBzlAD/sdmr4p9zrYAk+sBSXWjVFoPuW3v
   y2jxxhRrYYJLMjbctk4oAMEOZmeP9xtB8B+SSVOCvQMXrUhquZLwo7tPY
   6Cm9Ce1kjQxGxFOs0jJAUgrgk3EFrA9QpCFu/p3ntYDw/rXfKFdYh/3B6
   i1pcoK5VrM6U9B9l6k+gPAgoPOk8XP0N49Tlb23iA5XNrKacZJWuGuSzu
   n9qZFHuePoQyz2ypJJ4MUu1TlsYrCugZ+c55OZjcNNM14XZdqBuAHTBZz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365966902"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="365966902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804714211"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="804714211"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 15:37:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbTo9-000AI7-1u;
	Wed, 30 Aug 2023 22:37:05 +0000
Date: Thu, 31 Aug 2023 06:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/7] drivers/fpga/altera-ps-spi.c:240:37:
 warning: 'id_to_data' defined but not used
Message-ID: <202308310601.LxxnSy5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: ac865741027a59abe81c2e7d30edfd26082751f3 [5/7] Use of_device_get_match_data
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310601.LxxnSy5P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310601.LxxnSy5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310601.LxxnSy5P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fpga/altera-ps-spi.c: In function 'altera_ps_probe':
   drivers/fpga/altera-ps-spi.c:265:48: error: passing argument 1 of 'spi_get_device_match_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     265 |         conf->data = spi_get_device_match_data(&spi->dev);
         |                                                ^~~~~~~~~
         |                                                |
         |                                                struct device *
   In file included from drivers/fpga/altera-ps-spi.c:23:
   include/linux/spi/spi.h:1629:52: note: expected 'const struct spi_device *' but argument is of type 'struct device *'
    1629 | spi_get_device_match_data(const struct spi_device *sdev);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/fpga/altera-ps-spi.c: At top level:
>> drivers/fpga/altera-ps-spi.c:240:37: warning: 'id_to_data' defined but not used [-Wunused-function]
     240 | static const struct altera_ps_data *id_to_data(const struct spi_device_id *id)
         |                                     ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/char/tpm/tpm_i2c_nuvoton.c: In function 'i2c_nuvoton_probe':
   drivers/char/tpm/tpm_i2c_nuvoton.c:549:32: error: passing argument 1 of 'i2c_get_match_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     549 |         if (i2c_get_match_data(dev))
         |                                ^~~
         |                                |
         |                                struct device *
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:21:
   include/linux/i2c.h:370:57: note: expected 'const struct i2c_client *' but argument is of type 'struct device *'
     370 | const void *i2c_get_match_data(const struct i2c_client *client);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/char/tpm/tpm_i2c_nuvoton.c:527:37: warning: unused variable 'id' [-Wunused-variable]
     527 |         const struct i2c_device_id *id = i2c_client_get_device_id(client);
         |                                     ^~
   cc1: some warnings being treated as errors


vim +/id_to_data +240 drivers/fpga/altera-ps-spi.c

5692fae0742df75 Joshua Clayton     2017-06-14  239  
1a195d87d2c58aa Anatolij Gustschin 2018-11-26 @240  static const struct altera_ps_data *id_to_data(const struct spi_device_id *id)
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  241  {
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  242  	kernel_ulong_t devtype = id->driver_data;
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  243  	const struct altera_ps_data *data;
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  244  
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  245  	/* someone added a altera_ps_devtype without adding to the map array */
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  246  	if (devtype >= ARRAY_SIZE(altera_ps_data_map))
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  247  		return NULL;
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  248  
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  249  	data = altera_ps_data_map[devtype];
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  250  	if (!data || data->devtype != devtype)
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  251  		return NULL;
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  252  
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  253  	return data;
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  254  }
1a195d87d2c58aa Anatolij Gustschin 2018-11-26  255  

:::::: The code at line 240 was first introduced by commit
:::::: 1a195d87d2c58aa9524af9531539ccfa203cd52c fpga: mgr: altera-ps-spi: enable usage on non-dt platforms

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
