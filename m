Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17D320B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WC/6IRxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699171260; x=1730707260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1ncKDWhr7Rsu/+9cCq8NW21wpZkVXPf4sFZELASVAA=;
  b=WC/6IRxJd/5Nhwzog/FVEH2OZqxCsWQkq52bFPbsJx+paXvL3Dwx+zwU
   kejemiGxTMNjp+qmfwsAOiXgk6rYhk2vHJDoEKZXQRM08C0u4yS9AKMBX
   Jt8eI5/kknR7EP1p//6qRp+isOEx+ZO3+/Bo1EGWnwDnTn75D1xFUeTTb
   +vz6vJj/3mHl6ZQg6Kt2xlJh/B6Yb+JHIG2g8W2ZBJRJqTLiStRIJetqi
   jNnDM1Sw41/bP26jrFodIy+5R/AT512VxH7S16NnVzyI0kLqM3g8Zb2Ic
   8OyBo42Qy6ODNYtykFL5+PWcSn26bNKq9YiCcn+oGvv1i047kt5Xs8hWl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="369338875"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="369338875"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="711922163"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="711922163"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2023 01:00:57 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzY3z-0005Ap-1P;
	Sun, 05 Nov 2023 08:00:55 +0000
Date: Sun, 5 Nov 2023 15:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:sa1100 32/36] arch/arm/mach-sa1100/h3600.c:105:15: error:
 variable 'h3600_audio_clk_gpio_table' has initializer but incomplete type
Message-ID: <202311051549.SmyouJ8V-lkp@intel.com>
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
commit: 0c4935e04aa86d2470e05ff3adf2a4062a2ab7d0 [32/36] clk: add iPAQ audio sysclock driver
config: arm-h3600_defconfig (https://download.01.org/0day-ci/archive/20231105/202311051549.SmyouJ8V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051549.SmyouJ8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051549.SmyouJ8V-lkp@intel.com/

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
>> arch/arm/mach-sa1100/h3600.c:105:15: error: variable 'h3600_audio_clk_gpio_table' has initializer but incomplete type
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
   arch/arm/mach-sa1100/h3600.c: In function 'h3600_mach_init':
   arch/arm/mach-sa1100/h3600.c:121:9: error: implicit declaration of function 'gpiod_add_lookup_table' [-Werror=implicit-function-declaration]
     121 |         gpiod_add_lookup_table(&h3600_sleeve_gpio_table);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c: At top level:
   arch/arm/mach-sa1100/h3600.c:93:34: error: storage size of 'h3600_sleeve_gpio_table' isn't known
      93 | static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-sa1100/h3600.c:105:34: error: storage size of 'h3600_audio_clk_gpio_table' isn't known
     105 | static struct gpiod_lookup_table h3600_audio_clk_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/h3600_audio_clk_gpio_table +105 arch/arm/mach-sa1100/h3600.c

   104	
 > 105	static struct gpiod_lookup_table h3600_audio_clk_gpio_table = {
   106		.dev_id = "ipaq-audio-clk",
   107		.table = {
   108			GPIO_LOOKUP("gpio", 12, "clk0", GPIO_ACTIVE_HIGH),
   109			GPIO_LOOKUP("gpio", 13, "clk1", GPIO_ACTIVE_HIGH),
   110			{ },
   111		},
   112	};
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
