Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDE518017
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683654028; x=1715190028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9awU4Lk8+H5G7cviYb9Kn/KzFayaTkqAgJHXTIoBKU=;
  b=imah3V3FBBotuz1mJTu7tKGUNH85sJe3Q1H5D+2LRevQN++Q0HcsyY8W
   sNpWcgquc7sqYin8g9X1lWZx1S3jpQnJT6PSt/FFSTCOngk9fXG6X0lMi
   XiMAsezB6xFQf+G7mztuodIK21e8b0pSbrP+3I58OgR9S3TGrEyB+Gg43
   WKPXd3nZrft9YuZn7MfEpA0iPryvxjuN7l7HwNrb7TZM2Cht7dWj/pxgI
   4H8qX7z2iWKm9Uz8tSnQLbQtBIkwkiDmE1DJaFy3W3A33lJLUuwvLC0rL
   PoLWJs1B1nL4m8KTB3G0K5Ekn7HNsvH9aQScSJP8BC4BwYhpBIFnrrgUe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350038646"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="350038646"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 10:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823219233"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="823219233"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2023 10:40:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwRJj-0002Ku-03;
	Tue, 09 May 2023 17:40:03 +0000
Date: Wed, 10 May 2023 01:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq 3/8] include/linux/bits.h:43:9: warning: conversion
 from 'long long unsigned int' to 'long unsigned int' changes value from
 '274877890560' to '4294950912'
Message-ID: <202305100136.1jCqTXDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   e731c298e55b96e913ef1f5c9860dc5474353a55
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
config: arc-buildonly-randconfig-r005-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100136.1jCqTXDE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=f39a859cf7fec51e695de4544786f2b0fb566e75
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor gpio-irq
        git checkout f39a859cf7fec51e695de4544786f2b0fb566e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100136.1jCqTXDE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mpfs-mux.c:10:
>> include/linux/bits.h:43:9: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '274877890560' to '4294950912' [-Woverflow]
      43 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |         ^
   drivers/irqchip/irq-mpfs-mux.c:59:9: note: in expansion of macro 'GENMASK_ULL'
      59 |         GENMASK_ULL(37, 14),
         |         ^~~~~~~~~~~


vim +43 include/linux/bits.h

295bcca84916cb Rikard Falkeborn 2020-04-06  32  
295bcca84916cb Rikard Falkeborn 2020-04-06  33  #define __GENMASK(h, l) \
95b980d62d52c4 Masahiro Yamada  2019-07-16  34  	(((~UL(0)) - (UL(1) << (l)) + 1) & \
95b980d62d52c4 Masahiro Yamada  2019-07-16  35  	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
295bcca84916cb Rikard Falkeborn 2020-04-06  36  #define GENMASK(h, l) \
295bcca84916cb Rikard Falkeborn 2020-04-06  37  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
8bd9cb51daac89 Will Deacon      2018-06-19  38  
295bcca84916cb Rikard Falkeborn 2020-04-06  39  #define __GENMASK_ULL(h, l) \
95b980d62d52c4 Masahiro Yamada  2019-07-16  40  	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
95b980d62d52c4 Masahiro Yamada  2019-07-16  41  	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
295bcca84916cb Rikard Falkeborn 2020-04-06  42  #define GENMASK_ULL(h, l) \
295bcca84916cb Rikard Falkeborn 2020-04-06 @43  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
8bd9cb51daac89 Will Deacon      2018-06-19  44  

:::::: The code at line 43 was first introduced by commit
:::::: 295bcca84916cb5079140a89fccb472bb8d1f6e2 linux/bits.h: add compile time sanity check of GENMASK inputs

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
