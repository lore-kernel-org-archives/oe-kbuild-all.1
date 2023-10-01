Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADDE17E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696119544; x=1727655544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vAytYYYlDqlGyN+3qo3WOX2k2jLdGNB1LvaDwuIYzdA=;
  b=E63m3W+SBgeYXowLCQwFDn6wgPRpdChCZpiZ6vsv0wbhYtX4Ods0pDCM
   vugaFveLPsa6eYHCiQ4Sf51cCL98e3zYyh/vKv8JeJjyJB5h07wJn0qZN
   eklz817K7KMpzxpVgJKpyawbCsFkB5hxLVzlqg0YuwiD3smuTkXLZBTfi
   c6IXzJFbeGs2f7QE8fmdKq1xVeQ7pnQ687XKvgRDfPj1fPcFl41xHBWlj
   ngbdkOUMBgdIXVJXLvayU/zw/DdD6sJOO50720asFKuPag/yYCYEEEzPA
   KOROkvn7Tv7ggVVC4as5bv8TFTL8W/nTIC6SGt9MuN1GMKZkkcEtKrd93
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="468761536"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="468761536"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 17:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="726915364"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="726915364"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Sep 2023 17:19:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmkAl-0004bB-2z;
	Sun, 01 Oct 2023 00:18:59 +0000
Date: Sun, 1 Oct 2023 08:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 5/6] ARM: pxa: Convert Spitz hsync to GPIO
 descriptors
Message-ID: <202310010819.covrgCHd-lkp@intel.com>
References: <20230929-pxa-gpio-v3-5-af8d5e5d1f34@skole.hr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-pxa-gpio-v3-5-af8d5e5d1f34@skole.hr>

Hi Duje,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 6465e260f48790807eef06b583b38ca9789b6072]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi/ARM-pxa-Convert-Spitz-OHCI-to-GPIO-descriptors/20230929-211703
base:   6465e260f48790807eef06b583b38ca9789b6072
patch link:    https://lore.kernel.org/r/20230929-pxa-gpio-v3-5-af8d5e5d1f34%40skole.hr
patch subject: [PATCH RFC v3 5/6] ARM: pxa: Convert Spitz hsync to GPIO descriptors
config: arm-spitz_defconfig (https://download.01.org/0day-ci/archive/20231001/202310010819.covrgCHd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010819.covrgCHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010819.covrgCHd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/mach-pxa/spitz.c:11:
   arch/arm/mach-pxa/spitz.c: In function 'spitz_spi_init':
>> include/linux/kernel.h:57:38: warning: division 'sizeof (struct spi_board_info *) / sizeof (struct spi_board_info)' does not compute the number of array elements [-Wsizeof-pointer-div]
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                      ^
   arch/arm/mach-pxa/generic.h:22:38: note: in expansion of macro 'ARRAY_SIZE'
      22 | #define ARRAY_AND_SIZE(x)       (x), ARRAY_SIZE(x)
         |                                      ^~~~~~~~~~
   arch/arm/mach-pxa/spitz.c:633:41: note: in expansion of macro 'ARRAY_AND_SIZE'
     633 |                 spi_register_board_info(ARRAY_AND_SIZE(&spitz_spi_devices[1]));
         |                                         ^~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21:
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   arch/arm/mach-pxa/generic.h:22:38: note: in expansion of macro 'ARRAY_SIZE'
      22 | #define ARRAY_AND_SIZE(x)       (x), ARRAY_SIZE(x)
         |                                      ^~~~~~~~~~
   arch/arm/mach-pxa/spitz.c:633:41: note: in expansion of macro 'ARRAY_AND_SIZE'
     633 |                 spi_register_board_info(ARRAY_AND_SIZE(&spitz_spi_devices[1]));
         |                                         ^~~~~~~~~~~~~~


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
