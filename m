Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4428E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682076797; x=1713612797;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=faIsgz28mH0+3IzzmQixyJJwo15bMaKdkPjfmkbb1mM=;
  b=f49E6XMwprU0MJVxcXndSVfBx/wgPCiGZWqV6RZj0D42mLWNefG551U5
   3JI/tr5eQTje7/V0OsvS47/PPZ8TlcM11A++YnLobPLLCaprDU2PMYvkG
   1731UgVkkCdipTbb8Z9i23FAuUxaVqcimbhQiFytaxlv8XtuM6zJWmtfl
   Re8Ptkftn5ZPDd88vqXWcJBvy/WyY2u0xIhihEAbCzVm1/x7gnynSM12B
   FfN8IdSi4wX/Fln3/OjgcwhijKJcj7v9ENecqNgeg9auLUwri/5+3v79B
   zVUO27h7/VupEl8P4cTU7sAwI+Q8G6so5w0diV4bvlwA28xRIx2iOeMyZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344728390"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="344728390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 04:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781578202"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="781578202"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 04:33:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppp0q-000gYS-17;
	Fri, 21 Apr 2023 11:33:12 +0000
Date: Fri, 21 Apr 2023 19:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 37/2236] include/linux/ioport.h:158:9: error:
 expected expression before '{' token
Message-ID: <202304211936.bH464McU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   3fd2d2340000361c6df236099087eda85d92a97a
commit: 6177a3f4ed080f15205c73c19445152d51f5bd36 [37/2236] mfd: vexpress-sysreg: Fix resource compound literal assignments
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304211936.bH464McU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/6177a3f4ed080f15205c73c19445152d51f5bd36
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 6.1/linux
        git checkout 6177a3f4ed080f15205c73c19445152d51f5bd36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211936.bH464McU-lkp@intel.com/

Note: the intel-lts/6.1/linux HEAD 3fd2d2340000361c6df236099087eda85d92a97a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:17,
                    from include/linux/gpio/driver.h:5,
                    from drivers/mfd/vexpress-sysreg.c:7:
>> include/linux/ioport.h:158:9: error: expected expression before '{' token
     158 |         {                                                               \
         |         ^
   include/linux/ioport.h:172:9: note: in expansion of macro 'DEFINE_RES_NAMED'
     172 |         DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
         |         ^~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:64:31: note: in expansion of macro 'DEFINE_RES_MEM_NAMED'
      64 |                 .resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
         |                               ^~~~~~~~~~~~~~~~~~~~
>> include/linux/ioport.h:158:9: error: expected expression before '{' token
     158 |         {                                                               \
         |         ^
   include/linux/ioport.h:172:9: note: in expansion of macro 'DEFINE_RES_NAMED'
     172 |         DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
         |         ^~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:71:31: note: in expansion of macro 'DEFINE_RES_MEM_NAMED'
      71 |                 .resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
         |                               ^~~~~~~~~~~~~~~~~~~~
>> include/linux/ioport.h:158:9: error: expected expression before '{' token
     158 |         {                                                               \
         |         ^
   include/linux/ioport.h:172:9: note: in expansion of macro 'DEFINE_RES_NAMED'
     172 |         DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
         |         ^~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:78:31: note: in expansion of macro 'DEFINE_RES_MEM_NAMED'
      78 |                 .resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
         |                               ^~~~~~~~~~~~~~~~~~~~
>> include/linux/ioport.h:158:9: error: expected expression before '{' token
     158 |         {                                                               \
         |         ^
   include/linux/ioport.h:172:9: note: in expansion of macro 'DEFINE_RES_NAMED'
     172 |         DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
         |         ^~~~~~~~~~~~~~~~
   include/linux/ioport.h:174:9: note: in expansion of macro 'DEFINE_RES_MEM_NAMED'
     174 |         DEFINE_RES_MEM_NAMED((_start), (_size), NULL)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:84:31: note: in expansion of macro 'DEFINE_RES_MEM'
      84 |                 .resources = &DEFINE_RES_MEM(SYS_MISC, 0x4c),
         |                               ^~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:53:27: warning: 'vexpress_sysreg_sys_flash_pdata' defined but not used [-Wunused-variable]
      53 | static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:47:27: warning: 'vexpress_sysreg_sys_mci_pdata' defined but not used [-Wunused-variable]
      47 | static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/vexpress-sysreg.c:41:27: warning: 'vexpress_sysreg_sys_led_pdata' defined but not used [-Wunused-variable]
      41 | static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +158 include/linux/ioport.h

5da04cc86d1215 Lianbo Jiang     2019-04-23  155  
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  156  /* helpers to define resources */
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  157  #define DEFINE_RES_NAMED(_start, _size, _name, _flags)			\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25 @158  	{								\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  159  		.start = (_start),					\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  160  		.end = (_start) + (_size) - 1,				\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  161  		.name = (_name),					\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  162  		.flags = (_flags),					\
43ee493bde78da Toshi Kani       2016-01-26  163  		.desc = IORES_DESC_NONE,				\
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  164  	}
a0e44d4a7a3935 Uwe Kleine-König 2011-07-25  165  

:::::: The code at line 158 was first introduced by commit
:::::: a0e44d4a7a3935afe425ec8dd1a5b63895e1f9c3 include/linux/ioport.h: new helper to define common struct resource constructs

:::::: TO: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
