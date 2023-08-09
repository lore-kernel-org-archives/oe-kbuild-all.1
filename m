Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771C612D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691595161; x=1723131161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsHZ355T5RXH4X2oQFu1qkikLwAubsoT2rVkVqZ08Ko=;
  b=K3QjXqeqIhtXbi83uopaRwdgUPpHVz/8FB0oer4apgEeI6amOpjXni2w
   sn4KCsuhEzLXpm1SEkl5RFA2/hwrMGfK+XpbGq+rbBZRyqu3DIbPfwJdO
   AIGbzQzEA6O2juCLtCbEL0Y1mhJOGpqC4UjqNz1dkZ0pHOatkdiG2/myB
   J1mmEWw6hC5WTLDnCzhf6uX/eiBXzwvLIJ7lWUiROQQ0+hZ2R/uGl0cnI
   wFLO+oIwri7M0lDyVr6IncDBpb6dD2fUYJvzDm9O6Ma8vA3gapumAYDPn
   rnX8YwfRChSSmEeUlOvO/BQwi6nbXSwFlBmIjwciPAagb7tR3nHHAGhMz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368614071"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368614071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681726248"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="681726248"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 08:32:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlAp-0006By-3C;
	Wed, 09 Aug 2023 15:32:35 +0000
Date: Wed, 9 Aug 2023 23:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 1/12]
 arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
Message-ID: <202308092300.dUV3j029-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: 4e8bfe6b7c765cae93e261e7d35b88ab05e41499 [1/12] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-r015-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092300.dUV3j029-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092300.dUV3j029-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092300.dUV3j029-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/light/jsa1212.c:16:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   drivers/iio/light/jsa1212.c:425:36: warning: 'jsa1212_acpi_match' defined but not used [-Wunused-const-variable=]
     425 | static const struct acpi_device_id jsa1212_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/light/stk3310.c:11:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   drivers/iio/light/stk3310.c:693:36: warning: 'stk3310_acpi_id' defined but not used [-Wunused-const-variable=]
     693 | static const struct acpi_device_id stk3310_acpi_id[] = {
         |                                    ^~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/light/us5182d.c:14:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   drivers/iio/light/us5182d.c:950:36: warning: 'us5182d_acpi_match' defined but not used [-Wunused-const-variable=]
     950 | static const struct acpi_device_id us5182d_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 


vim +/ZERO_PAGE +49 arch/arm/include/asm/pgtable-nommu.h

    44	
    45	/*
    46	 * ZERO_PAGE is a global shared page that is always zero: used
    47	 * for zero-mapped memory areas etc..
    48	 */
  > 49	#define ZERO_PAGE(vaddr)	(virt_to_page((const void *)0))
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
