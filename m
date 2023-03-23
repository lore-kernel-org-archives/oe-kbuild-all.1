Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55B944E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579851; x=1711115851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBJb0c0Yb7Obq0J/Gt5S73TDVV8wV6QjkPNedeADdRw=;
  b=mFvRrL7THqx+EJWm9xDvTaH6B6GK2YYta8G3V+tAV99rqx8qXivroxOq
   0NSOh53n74d2495CZAdflQtQ3WmqZ8zafG66vUxYpCTdGr29zvgA+cXLk
   X6XKm+NYJ6RcnXtm6G4ZaJV+Hgf0Ua190NHBeP5fRG3uflbDI6LZy9DE2
   284VVQmmV2kOjWrIBiVGcy5sVvdExtJVoJ5tCEv6PZL/9RCltlMczCa8c
   7BRT4tspiQOjbVOmVufLVZhgtAUP83UjxEebZgy6r7zwpjQiQmGEpmHC8
   dBbNcaQGlbK1oBKUaX1cL2qdjs/ib1iX3yXLT+joRjfxunQjF+3+Re+8M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="425772318"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="425772318"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011807918"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="1011807918"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 06:57:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLRY-000EQI-07;
	Thu, 23 Mar 2023 13:57:28 +0000
Date: Thu, 23 Mar 2023 21:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 1000/6100] gpio.c:undefined reference to
 `of_mm_gpiochip_add_data'
Message-ID: <202303232154.aXOXAWhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c4a254d78f89546d0e74a40617ef24c6151c8d1
commit: a99cc66807d6c854a7f65f962766c530c91be149 [1000/6100] gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h
config: powerpc-randconfig-s041-20230322 (https://download.01.org/0day-ci/archive/20230323/202303232154.aXOXAWhg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a99cc66807d6c854a7f65f962766c530c91be149
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a99cc66807d6c854a7f65f962766c530c91be149
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232154.aXOXAWhg-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: powerpc-linux-ld: DWARF error: could not find abbrev number 15209
   arch/powerpc/platforms/4xx/gpio.o: in function `ppc4xx_add_gpiochips':
>> gpio.c:(.init.text+0xec): undefined reference to `of_mm_gpiochip_add_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
