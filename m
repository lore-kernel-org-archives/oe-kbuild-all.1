Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8590138E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmzgNFYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699158494; x=1730694494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjB5UgLrtTi+CalvYc7PtxaEISw9Jf8tjE/oppOKlNg=;
  b=lmzgNFYF7zy+SnQSpHLt57/YwJ3fmbWoTibME1HTtBJE0XX18LPbxWSo
   GMSw6eJ5/N2xRuD3MBlvoH/SHDrdY8dDZDp0VJ6ZHSA0LTgnp7hme6f5E
   +hFZrOj7ucEEZYBubXUmbF9ME0itR6Gwr+5+fIMy9qlNzTmXiZPrLj0PN
   q5Oa8+OlGo7HOp/n0Y5PtX94gasckky0dASE5PDIkeuOOZx1blzbR5zQ4
   TKcpqSbgcI6lksCkXLdpsLRZLRrZ9pQeOwA7qbC48Hq8YK/ByQef7vk9b
   5bX/C4kSowTQxSyWoza3L5XFf81G49XRzk0c+k91VQbdzfem1xjZn042B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="374157146"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="374157146"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 21:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="755534356"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="755534356"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Nov 2023 21:28:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzUk6-00050m-0j;
	Sun, 05 Nov 2023 04:28:10 +0000
Date: Sun, 5 Nov 2023 12:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:sa1100 29/36] arch/arm/mach-sa1100/h3600.c:92:15: error:
 variable 'h3600_sleeve_gpio_table' has initializer but incomplete type
Message-ID: <202311051237.taYzHwct-lkp@intel.com>
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
commit: 7061a74a938c818c6b23e79fe19b5696d25919f6 [29/36] ARM: sa1100/h3xxx: sleeve support
config: arm-h3600_defconfig (https://download.01.org/0day-ci/archive/20231105/202311051237.taYzHwct-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051237.taYzHwct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051237.taYzHwct-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm/mach-sa1100/h3600.c:92:15: error: variable 'h3600_sleeve_gpio_table' has initializer but incomplete type
      92 | static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
         |               ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-sa1100/h3600.c:93:10: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
      93 |         .dev_id = "ipaq-h3xxx-sleeve",
         |          ^~~~~~
>> arch/arm/mach-sa1100/h3600.c:93:19: warning: excess elements in struct initializer
      93 |         .dev_id = "ipaq-h3xxx-sleeve",
         |                   ^~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c:93:19: note: (near initialization for 'h3600_sleeve_gpio_table')
>> arch/arm/mach-sa1100/h3600.c:94:10: error: 'struct gpiod_lookup_table' has no member named 'table'
      94 |         .table = {
         |          ^~~~~
>> arch/arm/mach-sa1100/h3600.c:94:18: error: extra brace group at end of initializer
      94 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:94:18: note: (near initialization for 'h3600_sleeve_gpio_table')
>> arch/arm/mach-sa1100/h3600.c:95:17: error: implicit declaration of function 'GPIO_LOOKUP'; did you mean 'IOP_LOOKUP'? [-Werror=implicit-function-declaration]
      95 |                 GPIO_LOOKUP("gpio", H3600_GPIO_OPT_DET,
         |                 ^~~~~~~~~~~
         |                 IOP_LOOKUP
>> arch/arm/mach-sa1100/h3600.c:96:46: error: 'GPIO_ACTIVE_LOW' undeclared here (not in a function); did you mean 'GPIOF_ACTIVE_LOW'?
      96 |                             "option-detect", GPIO_ACTIVE_LOW),
         |                                              ^~~~~~~~~~~~~~~
         |                                              GPIOF_ACTIVE_LOW
>> arch/arm/mach-sa1100/h3600.c:97:61: error: 'GPIO_ACTIVE_HIGH' undeclared here (not in a function); did you mean 'ACPI_ACTIVE_HIGH'?
      97 |                 GPIO_LOOKUP("htc-egpio", 2, "option-reset", GPIO_ACTIVE_HIGH),
         |                                                             ^~~~~~~~~~~~~~~~
         |                                                             ACPI_ACTIVE_HIGH
   arch/arm/mach-sa1100/h3600.c:100:17: error: extra brace group at end of initializer
     100 |                 { },
         |                 ^
   arch/arm/mach-sa1100/h3600.c:100:17: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c:94:18: warning: excess elements in struct initializer
      94 |         .table = {
         |                  ^
   arch/arm/mach-sa1100/h3600.c:94:18: note: (near initialization for 'h3600_sleeve_gpio_table')
   arch/arm/mach-sa1100/h3600.c: In function 'h3600_mach_init':
>> arch/arm/mach-sa1100/h3600.c:106:9: error: implicit declaration of function 'gpiod_add_lookup_table' [-Werror=implicit-function-declaration]
     106 |         gpiod_add_lookup_table(&h3600_sleeve_gpio_table);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/h3600.c: At top level:
>> arch/arm/mach-sa1100/h3600.c:92:34: error: storage size of 'h3600_sleeve_gpio_table' isn't known
      92 | static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/h3600_sleeve_gpio_table +92 arch/arm/mach-sa1100/h3600.c

    91	
  > 92	static struct gpiod_lookup_table h3600_sleeve_gpio_table = {
  > 93		.dev_id = "ipaq-h3xxx-sleeve",
  > 94		.table = {
  > 95			GPIO_LOOKUP("gpio", H3600_GPIO_OPT_DET,
  > 96				    "option-detect", GPIO_ACTIVE_LOW),
  > 97			GPIO_LOOKUP("htc-egpio", 2, "option-reset", GPIO_ACTIVE_HIGH),
    98			GPIO_LOOKUP("htc-egpio", 4, "nvram-on", GPIO_ACTIVE_HIGH),
    99			GPIO_LOOKUP("htc-egpio", 5, "option-on", GPIO_ACTIVE_HIGH),
   100			{ },
   101		},
   102	};
   103	
   104	static void __init h3600_mach_init(void)
   105	{
 > 106		gpiod_add_lookup_table(&h3600_sleeve_gpio_table);
   107	
   108		h3xxx_mach_init();
   109	
   110		sa11x0_register_lcd(&h3600_lcd_info);
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
