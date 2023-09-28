Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1F1872
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 02:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695866476; x=1727402476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6DuiiIKrWHEPdFO2AEcbOHba7JjAL36ITVvdV8mC/w=;
  b=k65M5SZ6zg7Q7jNyeCqiO4WSlVC8IBANu4vFb23yw/RztSeS8hx3JfZN
   Go9oh7D6fhVIAlsJPFkaXKSExZIHCM7qrjC4akr+Y+QChLrt7CElxJwMP
   PS3UQ7FpmlDIiOIkBQlUWghtpQSZBMlRIGxgYLn8JwlXe3sixLT7C6Qah
   hOwr8HN/woAAmTBQbQYdjUdud+stWfSDXl2A0YAKNT4aFaOwjCowNdblO
   pUcIaHtCfvhGjdmer0d7xJfBwDa1LUU3dzCmW/SfSOcqPqZWOJpB7uYth
   7yrpMQZPYadwaP/GzqHMyPeOxqbkz5LHeTHE3yt5FVinPmeQPnwXEb2o+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379243439"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="379243439"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 19:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873112650"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="873112650"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 19:01:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlgKz-00011Y-34;
	Thu, 28 Sep 2023 02:01:09 +0000
Date: Thu, 28 Sep 2023 10:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v5_20230927_wangweidong_a_asoc_codecs_add_aw87390_amplifier_driver
 62/71] arch/sh/boards/mach-ecovec24/setup.c:885:10: error: 'struct
 asoc_simple_card_info' has no member named 'name'
Message-ID: <202309280927.8AdnsLuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20230927_wangweidong_a_asoc_codecs_add_aw87390_amplifier_driver
head:   cadf6ebe01b1b5f5bdb2eab0652f30c084c92495
commit: ad484cc98f2c7ee8e22f63691562a7abae5a9832 [62/71] ASoC: remove asoc_xxx() compatible macro
config: sh-ecovec24_defconfig (https://download.01.org/0day-ci/archive/20230928/202309280927.8AdnsLuP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280927.8AdnsLuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280927.8AdnsLuP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sh/boards/mach-ecovec24/setup.c:622:27: warning: initialized field overwritten [-Woverride-init]
     622 |         .type           = "tsc2007",
         |                           ^~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:622:27: note: (near initialization for 'ts_i2c_clients.type')
>> arch/sh/boards/mach-ecovec24/setup.c:884:15: error: variable 'fsi_da7210_info' has initializer but incomplete type
     884 | static struct asoc_simple_card_info fsi_da7210_info = {
         |               ^~~~~~~~~~~~~~~~~~~~~
>> arch/sh/boards/mach-ecovec24/setup.c:885:10: error: 'struct asoc_simple_card_info' has no member named 'name'
     885 |         .name           = "DA7210",
         |          ^~~~
   arch/sh/boards/mach-ecovec24/setup.c:885:27: warning: excess elements in struct initializer
     885 |         .name           = "DA7210",
         |                           ^~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:885:27: note: (near initialization for 'fsi_da7210_info')
>> arch/sh/boards/mach-ecovec24/setup.c:886:10: error: 'struct asoc_simple_card_info' has no member named 'card'
     886 |         .card           = "FSIB-DA7210",
         |          ^~~~
   arch/sh/boards/mach-ecovec24/setup.c:886:27: warning: excess elements in struct initializer
     886 |         .card           = "FSIB-DA7210",
         |                           ^~~~~~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:886:27: note: (near initialization for 'fsi_da7210_info')
>> arch/sh/boards/mach-ecovec24/setup.c:887:10: error: 'struct asoc_simple_card_info' has no member named 'codec'
     887 |         .codec          = "da7210.0-001a",
         |          ^~~~~
   arch/sh/boards/mach-ecovec24/setup.c:887:27: warning: excess elements in struct initializer
     887 |         .codec          = "da7210.0-001a",
         |                           ^~~~~~~~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:887:27: note: (near initialization for 'fsi_da7210_info')
>> arch/sh/boards/mach-ecovec24/setup.c:888:10: error: 'struct asoc_simple_card_info' has no member named 'platform'
     888 |         .platform       = "sh_fsi.0",
         |          ^~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:888:27: warning: excess elements in struct initializer
     888 |         .platform       = "sh_fsi.0",
         |                           ^~~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:888:27: note: (near initialization for 'fsi_da7210_info')
>> arch/sh/boards/mach-ecovec24/setup.c:889:10: error: 'struct asoc_simple_card_info' has no member named 'daifmt'
     889 |         .daifmt         = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP,
         |          ^~~~~~
   In file included from include/sound/soc-topology.h:15,
                    from include/sound/soc-dapm.h:15,
                    from include/sound/soc.h:418,
                    from include/sound/sh_fsi.h:12,
                    from arch/sh/boards/mach-ecovec24/setup.c:45:
   include/uapi/sound/asoc.h:150:41: warning: excess elements in struct initializer
     150 | #define SND_SOC_DAI_FORMAT_I2S          1 /* I2S mode */
         |                                         ^
   include/sound/soc-dai.h:27:41: note: in expansion of macro 'SND_SOC_DAI_FORMAT_I2S'
      27 | #define SND_SOC_DAIFMT_I2S              SND_SOC_DAI_FORMAT_I2S
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:889:27: note: in expansion of macro 'SND_SOC_DAIFMT_I2S'
     889 |         .daifmt         = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP,
         |                           ^~~~~~~~~~~~~~~~~~
   include/uapi/sound/asoc.h:150:41: note: (near initialization for 'fsi_da7210_info')
     150 | #define SND_SOC_DAI_FORMAT_I2S          1 /* I2S mode */
         |                                         ^
   include/sound/soc-dai.h:27:41: note: in expansion of macro 'SND_SOC_DAI_FORMAT_I2S'
      27 | #define SND_SOC_DAIFMT_I2S              SND_SOC_DAI_FORMAT_I2S
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:889:27: note: in expansion of macro 'SND_SOC_DAIFMT_I2S'
     889 |         .daifmt         = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP,
         |                           ^~~~~~~~~~~~~~~~~~
>> arch/sh/boards/mach-ecovec24/setup.c:890:10: error: 'struct asoc_simple_card_info' has no member named 'cpu_dai'
     890 |         .cpu_dai = {
         |          ^~~~~~~
>> arch/sh/boards/mach-ecovec24/setup.c:890:20: error: extra brace group at end of initializer
     890 |         .cpu_dai = {
         |                    ^
   arch/sh/boards/mach-ecovec24/setup.c:890:20: note: (near initialization for 'fsi_da7210_info')
   arch/sh/boards/mach-ecovec24/setup.c:890:20: warning: excess elements in struct initializer
   arch/sh/boards/mach-ecovec24/setup.c:890:20: note: (near initialization for 'fsi_da7210_info')
>> arch/sh/boards/mach-ecovec24/setup.c:893:10: error: 'struct asoc_simple_card_info' has no member named 'codec_dai'
     893 |         .codec_dai = {
         |          ^~~~~~~~~
   arch/sh/boards/mach-ecovec24/setup.c:893:22: error: extra brace group at end of initializer
     893 |         .codec_dai = {
         |                      ^
   arch/sh/boards/mach-ecovec24/setup.c:893:22: note: (near initialization for 'fsi_da7210_info')
   arch/sh/boards/mach-ecovec24/setup.c:893:22: warning: excess elements in struct initializer
   arch/sh/boards/mach-ecovec24/setup.c:893:22: note: (near initialization for 'fsi_da7210_info')
   arch/sh/boards/mach-ecovec24/setup.c: In function 'arch_setup':
   arch/sh/boards/mach-ecovec24/setup.c:1223:37: error: 'struct gpio_backlight_platform_data' has no member named 'fbdev'; did you mean 'dev'?
    1223 |                 gpio_backlight_data.fbdev = NULL;
         |                                     ^~~~~
         |                                     dev
   arch/sh/boards/mach-ecovec24/setup.c: At top level:
>> arch/sh/boards/mach-ecovec24/setup.c:884:37: error: storage size of 'fsi_da7210_info' isn't known
     884 | static struct asoc_simple_card_info fsi_da7210_info = {
         |                                     ^~~~~~~~~~~~~~~


vim +885 arch/sh/boards/mach-ecovec24/setup.c

1980fdc4df4778 Kuninori Morimoto 2009-12-15  883  
064bfada66779d Kuninori Morimoto 2012-04-08 @884  static struct asoc_simple_card_info fsi_da7210_info = {
064bfada66779d Kuninori Morimoto 2012-04-08 @885  	.name		= "DA7210",
064bfada66779d Kuninori Morimoto 2012-04-08 @886  	.card		= "FSIB-DA7210",
064bfada66779d Kuninori Morimoto 2012-04-08 @887  	.codec		= "da7210.0-001a",
064bfada66779d Kuninori Morimoto 2012-04-08 @888  	.platform	= "sh_fsi.0",
81a13ac7e3e490 Mark Brown        2021-09-15 @889  	.daifmt		= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP,
a4a2992c531f6c Kuninori Morimoto 2013-01-10 @890  	.cpu_dai = {
a4a2992c531f6c Kuninori Morimoto 2013-01-10  891  		.name	= "fsib-dai",
a4a2992c531f6c Kuninori Morimoto 2013-01-10  892  	},
a4a2992c531f6c Kuninori Morimoto 2013-01-10 @893  	.codec_dai = {
a4a2992c531f6c Kuninori Morimoto 2013-01-10  894  		.name	= "da7210-hifi",
a4a2992c531f6c Kuninori Morimoto 2013-01-10  895  	},
064bfada66779d Kuninori Morimoto 2012-04-08  896  };
064bfada66779d Kuninori Morimoto 2012-04-08  897  

:::::: The code at line 885 was first introduced by commit
:::::: 064bfada66779d95686cacdcbb17551e2c0bf66b ASoC: sh: fsi: use simple-card instead of fsi-da7210

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
