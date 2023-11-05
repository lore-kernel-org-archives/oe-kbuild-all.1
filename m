Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A7AD49
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNdqwAWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699184275; x=1730720275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QR0/c2YuCdvDKa40DK4l8k8HpD5QegnPhmctZra86dA=;
  b=lNdqwAWOxjxHWSVAqX+xrwhXmUY0UkNQN0jLzFEYH+05hq31Zi70cpsv
   +MsKu6seyEpI589P6lSMCkQ7pR/gT9NeGynH4rh5ljr7BKzIyk+CrmlFE
   i9kyjA6sBClPTMToV8UIqbQd6BgYhMkjNkVQ33E0kkc21q+rLJ9boTsWe
   e2gnYWkkkT8XlEHhwKhdtZkiBhmiduJwz8rQLUoWzc6wT3Aexm7eFB8+b
   ffvbt05jyxr14EZt05sEKZ8AMreryUuWEHyxE6CIE9G0a89589hvFIpRB
   xuXZ228pW++Bj88Pz2c6JozeshAvldxngoWHIr59E11AopN4T8Z/K2u55
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="475375222"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="475375222"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 03:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="852715153"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="852715153"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2023 03:37:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzbRv-0005N2-1s;
	Sun, 05 Nov 2023 11:37:51 +0000
Date: Sun, 5 Nov 2023 19:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:sa1100 33/36] arch/arm/mach-sa1100/h3600.c:119:15: error:
 variable 'h3600_uda134x_gpio_table' has initializer but incomplete type
Message-ID: <202311051948.2bqHkn6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
head:   08b1731daff3c03a1845f5edabf356876858ee5a
commit: 023163543dcecc4f0d162c64f77714fc6215bfe0 [33/36] h3600 audio gpios
config: arm-h3600_defconfig (https://download.01.org/0day-ci/archive/20231105/202311051948.2bqHkn6l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051948.2bqHkn6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051948.2bqHkn6l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mach-sa1100/h3600.c:93:15: error: variable 'h3600_sleeve_gpio_table' has initializer but incomplete type
      93 | static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
         |               ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:94:10: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
      94 |         .dev_id = "ipaq-h3xxx-sleeve",
         |          ^~~~~~
   arch/arm/mach-sa1100/h3600.c:94:19: warning: excess elements in struct initializer
      94 |         .dev_id = "ipaq-h3xxx-sleeve",
         |                   ^~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:94:19: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c:95:10: error: 'struct gpiod_lookup_table' has no member named 'table'
      95 |         .table = {
         |          ^~~~~
   arch/arm/mach-sa1100/h3600.c:95:18: error: extra brace group at end of initializer
      95 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:95:18: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c:96:17: error: implicit declaration of function 'GPIO_LOOKUP'; did you mean 'IOP_LOOKUP'? [-Werror=implicit-function-declaration]
      96 |                 GPIO_LOOKUP("gpio", H3600_GPIO_OPT_DET,
         |                 ^~~~~~~~~~~
         |                 IOP_LOOKUP
   arch/arm/mach-sa1100/h3600.c:97:46: error: 'GPIO_ACTIVE_LOW' undeclared here (not in a function); did you mean 'GPIOF_ACTIVE_LOW'?
      97 |                             "option-detect", GPIO_ACTIVE_LOW),
         |                                              ^~~~~~~~~~~~~~~
         |                                              GPIOF_ACTIVE_LOW
   arch/arm/mach-sa1100/h3600.c:98:61: error: 'GPIO_ACTIVE_HIGH' undeclared here (not in a function); did you mean 'ACPI_ACTIVE_HIGH'?
      98 |                 GPIO_LOOKUP("htc-egpio", 2, "option-reset", GPIO_ACTIVE_HIGH),
         |                                                             ^~~~~~~~~~~~~~~~
         |                                                             ACPI_ACTIVE_HIGH
   arch/arm/mach-sa1100/h3600.c:101:17: error: extra brace group at end of initializer
     101 |                 { },
         |                 ^
   arch/arm/mach-sa1100/h3600.c:101:17: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c:95:18: warning: excess elements in struct initializer
      95 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:95:18: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c:105:15: error: variable 'h3600_audio_clk_gpio_table' has initializer but incomplete type
     105 | static struct gpiod_lookup_table h3600_audio_clk_gpio_table = {
         |               ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:106:10: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
     106 |         .dev_id = "ipaq-audio-clk",
         |          ^~~~~~
   arch/arm/mach-sa1100/h3600.c:106:19: warning: excess elements in struct initializer
     106 |         .dev_id = "ipaq-audio-clk",
         |                   ^~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:106:19: note: (near initialization for 'h3600_audio_clk_gpio_table')
   arch/arm/mach-sa1100/h3600.c:107:10: error: 'struct gpiod_lookup_table' has no member named 'table'
     107 |         .table = {
         |          ^~~~~
   arch/arm/mach-sa1100/h3600.c:107:18: error: extra brace group at end of initializer
     107 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:107:18: note: (near initialization for 'h3600_audio_clk_gpio_table')
   arch/arm/mach-sa1100/h3600.c:110:17: error: extra brace group at end of initializer
     110 |                 { },
         |                 ^
   arch/arm/mach-sa1100/h3600.c:110:17: note: (near initialization for 'h3600_audio_clk_gpio_table')
   arch/arm/mach-sa1100/h3600.c:107:18: warning: excess elements in struct initializer
     107 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:107:18: note: (near initialization for 'h3600_audio_clk_gpio_table')
>> arch/arm/mach-sa1100/h3600.c:119:15: error: variable 'h3600_uda134x_gpio_table' has initializer but incomplete type
     119 | static struct gpiod_lookup_table h3600_uda134x_gpio_table = {
         |               ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:120:10: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
     120 |         .dev_id = "uda134x-codec",
         |          ^~~~~~
   arch/arm/mach-sa1100/h3600.c:120:19: warning: excess elements in struct initializer
     120 |         .dev_id = "uda134x-codec",
         |                   ^~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:120:19: note: (near initialization for 'h3600_uda134x_gpio_table')
   arch/arm/mach-sa1100/h3600.c:121:10: error: 'struct gpiod_lookup_table' has no member named 'table'
     121 |         .table = {
         |          ^~~~~
   arch/arm/mach-sa1100/h3600.c:121:18: error: extra brace group at end of initializer
     121 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:121:18: note: (near initialization for 'h3600_uda134x_gpio_table')
   arch/arm/mach-sa1100/h3600.c:123:17: error: extra brace group at end of initializer
     123 |                 { },
         |                 ^
   arch/arm/mach-sa1100/h3600.c:123:17: note: (near initialization for 'h3600_uda134x_gpio_table')
   arch/arm/mach-sa1100/h3600.c:121:18: warning: excess elements in struct initializer
     121 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:121:18: note: (near initialization for 'h3600_uda134x_gpio_table')
>> arch/arm/mach-sa1100/h3600.c:127:15: error: variable 'h3600_asoc_gpio_table' has initializer but incomplete type
     127 | static struct gpiod_lookup_table h3600_asoc_gpio_table = {
         |               ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:128:10: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
     128 |         .dev_id = "h3xxx-asoc",
         |          ^~~~~~
   arch/arm/mach-sa1100/h3600.c:128:19: warning: excess elements in struct initializer
     128 |         .dev_id = "h3xxx-asoc",
         |                   ^~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:128:19: note: (near initialization for 'h3600_asoc_gpio_table')
   arch/arm/mach-sa1100/h3600.c:129:10: error: 'struct gpiod_lookup_table' has no member named 'table'
     129 |         .table = {
         |          ^~~~~
   arch/arm/mach-sa1100/h3600.c:129:18: error: extra brace group at end of initializer
     129 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:129:18: note: (near initialization for 'h3600_asoc_gpio_table')
   arch/arm/mach-sa1100/h3600.c:133:17: error: extra brace group at end of initializer
     133 |                 { },
         |                 ^
   arch/arm/mach-sa1100/h3600.c:133:17: note: (near initialization for 'h3600_asoc_gpio_table')
   arch/arm/mach-sa1100/h3600.c:129:18: warning: excess elements in struct initializer
     129 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:129:18: note: (near initialization for 'h3600_asoc_gpio_table')
   arch/arm/mach-sa1100/h3600.c: In function 'h3600_mach_init':
   arch/arm/mach-sa1100/h3600.c:139:9: error: implicit declaration of function 'gpiod_add_lookup_table' [-Werror=implicit-function-declaration]
     139 |         gpiod_add_lookup_table(&h3600_sleeve_gpio_table);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c: At top level:
   arch/arm/mach-sa1100/h3600.c:93:34: error: storage size of 'h3600_sleeve_gpio_table' isn't known
      93 | static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:105:34: error: storage size of 'h3600_audio_clk_gpio_table' isn't known
     105 | static struct gpiod_lookup_table h3600_audio_clk_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-sa1100/h3600.c:119:34: error: storage size of 'h3600_uda134x_gpio_table' isn't known
     119 | static struct gpiod_lookup_table h3600_uda134x_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-sa1100/h3600.c:127:34: error: storage size of 'h3600_asoc_gpio_table' isn't known
     127 | static struct gpiod_lookup_table h3600_asoc_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/h3600_uda134x_gpio_table +119 arch/arm/mach-sa1100/h3600.c

   118	
 > 119	static struct gpiod_lookup_table h3600_uda134x_gpio_table = {
   120		.dev_id = "uda134x-codec",
   121		.table = {
   122			GPIO_LOOKUP("htc-egpio", 12, "qmute", GPIO_ACTIVE_HIGH),
   123			{ },
   124		},
   125	};
   126	
 > 127	static struct gpiod_lookup_table h3600_asoc_gpio_table = {
   128		.dev_id = "h3xxx-asoc",
   129		.table = {
   130			GPIO_LOOKUP("htc-egpio", 3, "audio-reset", GPIO_ACTIVE_HIGH),
   131			GPIO_LOOKUP("htc-egpio", 10, "amp-power", GPIO_ACTIVE_HIGH),
   132			GPIO_LOOKUP("htc-egpio", 11, "audio-power", GPIO_ACTIVE_HIGH),
   133			{ },
   134		},
   135	};
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
