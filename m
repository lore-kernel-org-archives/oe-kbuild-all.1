Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C514B7E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 03:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676001386; x=1707537386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGpsFgUSy1luFrJ/WzlCx5bUMRysqRKfjjcCqF6MCU0=;
  b=PIi8ogs39b8rX3w4InHS0FF2rRjOB3zCx1c0RQyM4U26NrZ24AkFCY6p
   TuDcTIfXMfat1KtmNnMYXJwEUH/hLthx69boAny+zHWsGT7uf53nXFbf8
   4dp9qqDEvYN6HKojFAEqfPBag1+f/q27fFTnQ1m9pN3itIIcuJhRsF6FT
   g1egGCQI+CCxzQ3+4lk7cNZBMcTRZ5N5aiYdCpta8TZTDU/5FT2ahCvg9
   LE2yWQPPrHpIO37n1+2QRiozwcmH0MKakDXvxAFxeUSnPku84DLMK29IC
   XP9uVgcCWd67Wr60xhWUrfvmB1y0Jrkd498ik34GmndWnp5QUMX9fET83
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="309959276"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="309959276"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 19:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617762184"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="617762184"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 19:56:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQKWH-0005Wc-30;
	Fri, 10 Feb 2023 03:56:17 +0000
Date: Fri, 10 Feb 2023 11:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 35/35] sound/pci/hda/cs35l41_hda_spi.c:28:61: warning: passing argument 3 of
 'cs35l41_hda_probe' makes integer from pointer without a cast
Message-ID: <202302101127.AxwfAPSu-lkp@intel.com>
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
commit: b1bff13bcb2439c0ba5142fb0851ad602f3a4a02 [35/35] spi: Add stacked and parallel memories support in SPI core
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302101127.AxwfAPSu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=b1bff13bcb2439c0ba5142fb0851ad602f3a4a02
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v3_20230202_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
        git checkout b1bff13bcb2439c0ba5142fb0851ad602f3a4a02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101127.AxwfAPSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/cs35l41_hda_spi.c: In function 'cs35l41_hda_spi_probe':
>> sound/pci/hda/cs35l41_hda_spi.c:28:61: warning: passing argument 3 of 'cs35l41_hda_probe' makes integer from pointer without a cast [-Wint-conversion]
      28 |         return cs35l41_hda_probe(&spi->dev, device_name, spi->chip_select, spi->irq,
         |                                                          ~~~^~~~~~~~~~~~~
         |                                                             |
         |                                                             u8 * {aka unsigned char *}
   In file included from sound/pci/hda/cs35l41_hda_spi.c:13:
   sound/pci/hda/cs35l41_hda.h:83:72: note: expected 'int' but argument is of type 'u8 *' {aka 'unsigned char *'}
      83 | int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
         |                                                                    ~~~~^~


vim +/cs35l41_hda_probe +28 sound/pci/hda/cs35l41_hda_spi.c

7b2f3eb492dac7 Lucas Tanure    2021-12-17  14  
7b2f3eb492dac7 Lucas Tanure    2021-12-17  15  static int cs35l41_hda_spi_probe(struct spi_device *spi)
7b2f3eb492dac7 Lucas Tanure    2021-12-17  16  {
7b2f3eb492dac7 Lucas Tanure    2021-12-17  17  	const char *device_name;
7b2f3eb492dac7 Lucas Tanure    2021-12-17  18  
642999365da3b7 Andy Shevchenko 2022-07-11  19  	/*
642999365da3b7 Andy Shevchenko 2022-07-11  20  	 * Compare against the device name so it works for SPI, normal ACPI
642999365da3b7 Andy Shevchenko 2022-07-11  21  	 * and for ACPI by serial-multi-instantiate matching cases.
7b2f3eb492dac7 Lucas Tanure    2021-12-17  22  	 */
7b2f3eb492dac7 Lucas Tanure    2021-12-17  23  	if (strstr(dev_name(&spi->dev), "CSC3551"))
7b2f3eb492dac7 Lucas Tanure    2021-12-17  24  		device_name = "CSC3551";
7b2f3eb492dac7 Lucas Tanure    2021-12-17  25  	else
7b2f3eb492dac7 Lucas Tanure    2021-12-17  26  		return -ENODEV;
7b2f3eb492dac7 Lucas Tanure    2021-12-17  27  
7b2f3eb492dac7 Lucas Tanure    2021-12-17 @28  	return cs35l41_hda_probe(&spi->dev, device_name, spi->chip_select, spi->irq,
7b2f3eb492dac7 Lucas Tanure    2021-12-17  29  				 devm_regmap_init_spi(spi, &cs35l41_regmap_spi));
7b2f3eb492dac7 Lucas Tanure    2021-12-17  30  }
7b2f3eb492dac7 Lucas Tanure    2021-12-17  31  

:::::: The code at line 28 was first introduced by commit
:::::: 7b2f3eb492dac7665c75df067e4d8e4869589f4a ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems

:::::: TO: Lucas Tanure <tanureal@opensource.cirrus.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
