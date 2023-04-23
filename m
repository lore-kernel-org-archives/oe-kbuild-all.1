Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5E1C14
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682255412; x=1713791412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sXUx6uFNxdGi8vfusyCCbuO045rc926lOTZrVYTc/Yg=;
  b=KnwhqBIlmnEdAzhRAJxuYF1w3opdCl+sUr/Tfqjt9AixQvsMjN+ExVOm
   GQfZxfgIUfJMG1h83Zqa79FXGOn8aFyar3kmLgYbGC3fGN/LfuJtRC1SI
   2jl3wgegaaBH0OrifvDKXOe0w7wwuyYZ7F09AF1kxqkBg7bHQn8onYRZ8
   6+aZKmvcdXrBHM+MiMrOk2pY0qX07nI+kewX8vbrHenvK7T8qOIA40Xab
   sv9emdnJ1jkpFVj38pOrI1UyjLeSCg+I0CdEKxiUwOLjT250H2RxacZ4n
   x/72jGIPd1Hq33XW7vrSCw+uBBduyT/Iy+5yUc3rMuNhZGUnNsc47SrfL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="432557152"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="432557152"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 06:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="692774510"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="692774510"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Apr 2023 06:10:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqZTl-000huM-0x;
	Sun, 23 Apr 2023 13:10:09 +0000
Date: Sun, 23 Apr 2023 21:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Wang <rk.code@outlook.com>, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: oe-kbuild-all@lists.linux.dev, Yan Wang <rk.code@outlook.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] gpio: gpiolib: clear the array_info's memory space
Message-ID: <202304232025.QmaYH1Ov-lkp@intel.com>
References: <KL1PR01MB54489B7A3D9D02D242B4BDA1E6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR01MB54489B7A3D9D02D242B4BDA1E6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>

Hi Yan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on next-20230421]
[cannot apply to linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Wang/gpio-gpiolib-clear-the-array_info-s-memory-space/20230423-190500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/KL1PR01MB54489B7A3D9D02D242B4BDA1E6669%40KL1PR01MB5448.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v1] gpio: gpiolib: clear the array_info's memory space
config: arm-randconfig-r046-20230423 (https://download.01.org/0day-ci/archive/20230423/202304232025.QmaYH1Ov-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/061c9f6937fab64a9c1d051252fcd3236a35381f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yan-Wang/gpio-gpiolib-clear-the-array_info-s-memory-space/20230423-190500
        git checkout 061c9f6937fab64a9c1d051252fcd3236a35381f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304232025.QmaYH1Ov-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpiolib.c:3:
   drivers/gpio/gpiolib.c: In function 'gpiod_get_array':
>> include/linux/fortify-string.h:59:33: warning: argument 1 null where non-null expected [-Wnonnull]
      59 | #define __underlying_memset     __builtin_memset
         |                                 ^
   include/linux/fortify-string.h:453:9: note: in expansion of macro '__underlying_memset'
     453 |         __underlying_memset(p, c, __fortify_size);                      \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:461:25: note: in expansion of macro '__fortify_memset_chk'
     461 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:4345:25: note: in expansion of macro 'memset'
    4345 |                         memset(array_info, 0, sizeof(struct gpio_array));
         |                         ^~~~~~
   include/linux/fortify-string.h:59:33: note: in a call to built-in function '__builtin_memset'
      59 | #define __underlying_memset     __builtin_memset
         |                                 ^
   include/linux/fortify-string.h:453:9: note: in expansion of macro '__underlying_memset'
     453 |         __underlying_memset(p, c, __fortify_size);                      \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:461:25: note: in expansion of macro '__fortify_memset_chk'
     461 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:4345:25: note: in expansion of macro 'memset'
    4345 |                         memset(array_info, 0, sizeof(struct gpio_array));
         |                         ^~~~~~


vim +59 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25  57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25 @59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
