Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066D63B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 04:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683000327; x=1714536327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aBMbsPLV7a8hpPBASVOoOkGrfTDmFzlp5u/5l1TWWTM=;
  b=ZuHToiTZXfJeVgdhdHZPl0XhdR7Pp3ArNEQpXO42XywTnv7j6mzfqRI6
   xo90MxSUVYa00apXVL6GDed0o7ylgRLdpMb79AWH7XmF9yJDIvKC1y+o2
   J6algrxi/fbEq/CKwt1nDa/SfqX026vO8GMI3Bsun/0t52tG5ynnoEXIx
   8XIuIRHhKkoFcOtLBTnRahHN7J6FWHVnyXApJQEKPKwerdXWUgfCroQvv
   1vlcAdaMKiQqW+O/YDbOhCthh1FQ0r63w1bN4TloZFD3CG9B5nEXcuCmF
   w/oUNMkOM+uCAIficre6WaeCBsExUkav1AbFLwvfQ6MbOwyD43REkhao3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337428041"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="337428041"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 21:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673472316"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="673472316"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 May 2023 21:05:11 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pthGI-0000pA-2y;
	Tue, 02 May 2023 04:05:10 +0000
Date: Tue, 2 May 2023 12:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 58/59]
 arch/arm/mach-keystone/keystone.c:56:40: error: 'platform_bus_type'
 undeclared
Message-ID: <202305021159.fJHEq441-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   34ab035cf8c37588331031cac8fc0dd07f15f3cc
commit: 894dc706a2551a50b00384fe3e2d34b47bbaaba4 [58/59] DT include cleanups
config: arm-buildonly-randconfig-r002-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021159.fJHEq441-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=894dc706a2551a50b00384fe3e2d34b47bbaaba4
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 894dc706a2551a50b00384fe3e2d34b47bbaaba4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021159.fJHEq441-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mach-keystone/keystone.c: In function 'keystone_init':
>> arch/arm/mach-keystone/keystone.c:56:40: error: 'platform_bus_type' undeclared (first use in this function)
      56 |                 bus_register_notifier(&platform_bus_type, &platform_nb);
         |                                        ^~~~~~~~~~~~~~~~~
   arch/arm/mach-keystone/keystone.c:56:40: note: each undeclared identifier is reported only once for each function it appears in


vim +/platform_bus_type +56 arch/arm/mach-keystone/keystone.c

30b5f4d6128e12 Russell King      2015-04-04  51  
828989ad87af15 Santosh Shilimkar 2013-06-10  52  static void __init keystone_init(void)
828989ad87af15 Santosh Shilimkar 2013-06-10  53  {
cf141ae989e2ff Christoph Hellwig 2020-09-08  54  #ifdef CONFIG_ARM_LPAE
e0d072782c734d Jim Quinlan       2020-09-17  55  	if (PHYS_OFFSET >= KEYSTONE_HIGH_PHYS_START)
14f3791439b5a6 Santosh Shilimkar 2014-02-24 @56  		bus_register_notifier(&platform_bus_type, &platform_nb);
cf141ae989e2ff Christoph Hellwig 2020-09-08  57  #endif
30b5f4d6128e12 Russell King      2015-04-04  58  	keystone_pm_runtime_init();
828989ad87af15 Santosh Shilimkar 2013-06-10  59  }
828989ad87af15 Santosh Shilimkar 2013-06-10  60  

:::::: The code at line 56 was first introduced by commit
:::::: 14f3791439b5a6cf12127fb80204265533d92664 ARM: keystone: Update the dma offset for non-dt platform devices

:::::: TO: Santosh Shilimkar <santosh.shilimkar@ti.com>
:::::: CC: Santosh Shilimkar <santosh.shilimkar@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
