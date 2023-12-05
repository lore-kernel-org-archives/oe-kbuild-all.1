Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE156458
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg9Efljg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774929; x=1733310929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ztw1slu3TaA4rUwHsafEEGA9mY1oz7LTl5MSrHnmkBM=;
  b=gg9EfljgVetf9iClRW4xpRBDEUBWG8zINfFuHcA9EodvJTxF3dO093tb
   eRX2W3hTYXoP0Kgwb1Xs6uD/Z2b374TSVEGgWj78gIwwMzNnX43qpTmR0
   g5x3HKqI0k4wTyRQpvrsp4INXrp8RbydaVimaE4mPp37u68F4vjlmH9kV
   pfqnoaIBdAuLzGe5zvCZVTRj9dwfE98XnSRr5VYi2JCKJe3eqmY6ftnzU
   SbEeZm96Lhb3dfO91D9wUVgCd4D2friwI649LD6bnEyMmu4wJ9MAvNbVh
   d7shkCNPsdg0cqtbOgLBT3n0PcjxnS7tLMpKThf0tGlx3ni8SZtA52nrM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15427260"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="15427260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799943800"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="799943800"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 03:15:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATOe-0008qY-0G;
	Tue, 05 Dec 2023 11:15:24 +0000
Date: Tue, 5 Dec 2023 19:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Haoran Liu <liuhaoran14@163.com>, support.opensource@diasemi.com
Cc: oe-kbuild-all@lists.linux.dev, lee@kernel.org,
	linux-kernel@vger.kernel.org, Haoran Liu <liuhaoran14@163.com>
Subject: Re: [PATCH] [mfd] da9052: Add error handling for spi_setup in
 da9052_spi_probe
Message-ID: <202312051908.qxoHjGkx-lkp@intel.com>
References: <20231203052125.37334-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203052125.37334-1-liuhaoran14@163.com>

Hi Haoran,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoran-Liu/da9052-Add-error-handling-for-spi_setup-in-da9052_spi_probe/20231203-132410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20231203052125.37334-1-liuhaoran14%40163.com
patch subject: [PATCH] [mfd] da9052: Add error handling for spi_setup in da9052_spi_probe
config: i386-buildonly-randconfig-004-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051908.qxoHjGkx-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051908.qxoHjGkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051908.qxoHjGkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/da9052-spi.c: In function 'da9052_spi_probe':
>> drivers/mfd/da9052-spi.c:25:6: error: redeclaration of 'ret' with no linkage
     int ret;
         ^~~
   drivers/mfd/da9052-spi.c:22:6: note: previous declaration of 'ret' was here
     int ret;
         ^~~


vim +/ret +25 drivers/mfd/da9052-spi.c

    18	
    19	static int da9052_spi_probe(struct spi_device *spi)
    20	{
    21		struct regmap_config config;
    22		int ret;
    23		const struct spi_device_id *id = spi_get_device_id(spi);
    24		struct da9052 *da9052;
  > 25		int ret;
    26	
    27		da9052 = devm_kzalloc(&spi->dev, sizeof(struct da9052), GFP_KERNEL);
    28		if (!da9052)
    29			return -ENOMEM;
    30	
    31		spi->mode = SPI_MODE_0;
    32		spi->bits_per_word = 8;
    33		ret = spi_setup(spi);
    34		if (ret) {
    35			dev_err(&spi->dev, "spi_setup failed: %d\n", ret);
    36			return ret;
    37		}
    38	
    39		da9052->dev = &spi->dev;
    40		da9052->chip_irq = spi->irq;
    41	
    42		spi_set_drvdata(spi, da9052);
    43	
    44		config = da9052_regmap_config;
    45		config.read_flag_mask = 1;
    46		config.reg_bits = 7;
    47		config.pad_bits = 1;
    48		config.val_bits = 8;
    49		config.use_single_read = true;
    50		config.use_single_write = true;
    51	
    52		da9052->regmap = devm_regmap_init_spi(spi, &config);
    53		if (IS_ERR(da9052->regmap)) {
    54			ret = PTR_ERR(da9052->regmap);
    55			dev_err(&spi->dev, "Failed to allocate register map: %d\n",
    56				ret);
    57			return ret;
    58		}
    59	
    60		return da9052_device_init(da9052, id->driver_data);
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
