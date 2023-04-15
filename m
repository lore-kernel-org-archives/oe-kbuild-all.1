Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A02103
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681562983; x=1713098983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oXSRmvG7d9O+1P2F4QjqoLfdvyuus1zHVsfjuhUvi9I=;
  b=GiiZYUhybbub/61LNjWARaHJzeLkyCMggeFvrSL06Yi7L+naavYG+e0y
   Jwud4QtI+suEcPkiLNflbSTeGAaOWaX+ET410OmwbSlPzI905EGplYuwL
   1yuEbULx/nHq7YbvUvEcnAbW4jRfqqNa/gE4GmXm4Hy4N0n1LxUUXDAAn
   NOEsO/sttZjVI5nFkdim3eLHbYGyJ9bL7m1GQjLIt+/yBI+ka4JT9/fiT
   3ExbSVK7BtecnHBL3FBlK/ONCJb+DTXPEl6UXNSoMzzzvVkIMc49z2rh6
   GIfAKD2vA91GbieTQg7th5lvYgAob7R/ycm0tFMxt4/y0WJ5Ie4yzL1hP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="324268508"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324268508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 05:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864515208"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="864515208"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Apr 2023 05:49:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnfLX-000b23-2k;
	Sat, 15 Apr 2023 12:49:39 +0000
Date: Sat, 15 Apr 2023 20:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 2242/9999] s390-linux-ld: timer-of.c:undefined
 reference to `of_iomap'
Message-ID: <202304152049.dFswAfsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: 0b45bf16593238fee3c01cb8c9841e68154e9318 [2242/9999] clocksource/drivers/timer-of: Check return value of of_iomap in timer_of_base_init()
config: s390-randconfig-r005-20230415 (https://download.01.org/0day-ci/archive/20230415/202304152049.dFswAfsP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0b45bf16593238fee3c01cb8c9841e68154e9318
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 0b45bf16593238fee3c01cb8c9841e68154e9318
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152049.dFswAfsP-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x92c): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0xa4e): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0xd54): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x7e): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x112): undefined reference to `iounmap'
   s390-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
   idma64.c:(.text+0x291a): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/input/keyboard/omap4-keypad.o: in function `omap4_keypad_remove':
   omap4-keypad.c:(.text+0x78): undefined reference to `iounmap'
   s390-linux-ld: drivers/input/keyboard/omap4-keypad.o: in function `omap4_keypad_probe':
   omap4-keypad.c:(.text+0x352): undefined reference to `ioremap'
   s390-linux-ld: omap4-keypad.c:(.text+0x3fa): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_init':
   timer-of.c:(.init.text+0x2fe): undefined reference to `iounmap'
>> s390-linux-ld: timer-of.c:(.init.text+0x322): undefined reference to `of_iomap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cleanup':
   timer-of.c:(.init.text+0x724): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
