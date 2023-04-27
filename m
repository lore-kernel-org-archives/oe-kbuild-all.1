Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342915BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 03:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682567508; x=1714103508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xKUqUZ2io5agPlqOrDi/DPPS+yFAEGL0malA5DOPd4=;
  b=KyXiBmlXwnjmEqmybHStVsMXzDd/Qb+c/hQWU1cziIwjPrEuq8bDOMqg
   uM54qDnXwubXPOkVthZQvIRjuJWarGQe+uPFBYFJ/y0an1TKepJFulu2V
   v1MJuYvu+QioAPwdCkyvYpeEGpT3OmFpt7Xi3wV0KQWpPh2s0C0LZjJxM
   4B9S22SJO/sE2STk0zTSpTGtbYC9A0Ijywm0ZCKQA8/aWVqk/zmDKotPr
   FnxDXh8J/t0/qyEZ2jGJTBpEYSY2yz+sxcBq2gyJLX6u+mR+63U3LTlb/
   AXXRRtmdjFSrxlpcsT+dcjdxtgGRB9JLpP3VMSxkiStBq1GyWkHKy69iZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346072837"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="346072837"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671605925"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="671605925"
Received: from lkp-server01.sh.intel.com (HELO 848ce1e85e7c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Apr 2023 20:51:30 -0700
Received: from kbuild by 848ce1e85e7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prsfG-000029-1i;
	Thu, 27 Apr 2023 03:51:26 +0000
Date: Thu, 27 Apr 2023 11:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 56/56]
 drivers/input/serio/i8042-sparcio.h:62:55: warning: initialization of
 'struct platform_device *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202304271114.WJRx0NjQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 4cc2262d09430892703b2d82d4a48f65679a8b53 [56/56] of: header cleanups
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230427/202304271114.WJRx0NjQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=4cc2262d09430892703b2d82d4a48f65679a8b53
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 4cc2262d09430892703b2d82d4a48f65679a8b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash arch/sparc/ drivers/ lib// net/ sound/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271114.WJRx0NjQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/serio/i8042.h:21,
                    from drivers/input/serio/i8042.c:135:
   drivers/input/serio/i8042-sparcio.h: In function 'sparc_i8042_probe':
   drivers/input/serio/i8042-sparcio.h:62:55: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
      62 |                         struct platform_device *kbd = of_find_device_by_node(dp);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                                       bus_find_device_by_fwnode
>> drivers/input/serio/i8042-sparcio.h:62:55: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/serio/i8042-sparcio.h:72:54: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 |                         struct platform_device *ms = of_find_device_by_node(dp);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/atm/fore200e.c: In function 'fore200e_sba_map':
   drivers/atm/fore200e.c:668:38: error: implicit declaration of function 'to_platform_device' [-Werror=implicit-function-declaration]
     668 |         struct platform_device *op = to_platform_device(fore200e->dev);
         |                                      ^~~~~~~~~~~~~~~~~~
>> drivers/atm/fore200e.c:668:38: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/atm/fore200e.c:672:48: error: invalid use of undefined type 'struct platform_device'
     672 |         fore200e->regs.sba.hcr = of_ioremap(&op->resource[0], 0, SBA200E_HCR_LENGTH, "SBA HCR");
         |                                                ^~
   drivers/atm/fore200e.c:673:48: error: invalid use of undefined type 'struct platform_device'
     673 |         fore200e->regs.sba.bsr = of_ioremap(&op->resource[1], 0, SBA200E_BSR_LENGTH, "SBA BSR");
         |                                                ^~
   drivers/atm/fore200e.c:674:48: error: invalid use of undefined type 'struct platform_device'
     674 |         fore200e->regs.sba.isr = of_ioremap(&op->resource[2], 0, SBA200E_ISR_LENGTH, "SBA ISR");
         |                                                ^~
   drivers/atm/fore200e.c:675:48: error: invalid use of undefined type 'struct platform_device'
     675 |         fore200e->virt_base    = of_ioremap(&op->resource[3], 0, SBA200E_RAM_LENGTH, "SBA RAM");
         |                                                ^~
   drivers/atm/fore200e.c:687:42: error: invalid use of undefined type 'struct platform_device'
     687 |         bursts = of_getintprop_default(op->dev.of_node->parent, "burst-sizes", 0x00);
         |                                          ^~
   drivers/atm/fore200e.c:690:36: error: invalid use of undefined type 'struct platform_device'
     690 |                 sbus_set_sbus64(&op->dev, bursts);
         |                                    ^~
   drivers/atm/fore200e.c: In function 'fore200e_sba_unmap':
   drivers/atm/fore200e.c:698:38: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     698 |         struct platform_device *op = to_platform_device(fore200e->dev);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:700:23: error: invalid use of undefined type 'struct platform_device'
     700 |         of_iounmap(&op->resource[0], fore200e->regs.sba.hcr, SBA200E_HCR_LENGTH);
         |                       ^~
   drivers/atm/fore200e.c:701:23: error: invalid use of undefined type 'struct platform_device'
     701 |         of_iounmap(&op->resource[1], fore200e->regs.sba.bsr, SBA200E_BSR_LENGTH);
         |                       ^~
   drivers/atm/fore200e.c:702:23: error: invalid use of undefined type 'struct platform_device'
     702 |         of_iounmap(&op->resource[2], fore200e->regs.sba.isr, SBA200E_ISR_LENGTH);
         |                       ^~
   drivers/atm/fore200e.c:703:23: error: invalid use of undefined type 'struct platform_device'
     703 |         of_iounmap(&op->resource[3], fore200e->virt_base,    SBA200E_RAM_LENGTH);
         |                       ^~
   drivers/atm/fore200e.c: In function 'fore200e_sba_prom_read':
   drivers/atm/fore200e.c:714:38: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     714 |         struct platform_device *op = to_platform_device(fore200e->dev);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:718:34: error: invalid use of undefined type 'struct platform_device'
     718 |         prop = of_get_property(op->dev.of_node, "madaddrlo2", &len);
         |                                  ^~
   drivers/atm/fore200e.c:723:34: error: invalid use of undefined type 'struct platform_device'
     723 |         prop = of_get_property(op->dev.of_node, "madaddrhi4", &len);
         |                                  ^~
   drivers/atm/fore200e.c:728:55: error: invalid use of undefined type 'struct platform_device'
     728 |         prom->serial_number = of_getintprop_default(op->dev.of_node,
         |                                                       ^~
   drivers/atm/fore200e.c:730:53: error: invalid use of undefined type 'struct platform_device'
     730 |         prom->hw_revision = of_getintprop_default(op->dev.of_node,
         |                                                     ^~
   drivers/atm/fore200e.c: In function 'fore200e_sba_proc_read':
   drivers/atm/fore200e.c:738:38: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     738 |         struct platform_device *op = to_platform_device(fore200e->dev);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:741:34: error: invalid use of undefined type 'struct platform_device'
     741 |         regs = of_get_property(op->dev.of_node, "reg", NULL);
         |                                  ^~
   drivers/atm/fore200e.c:744:55: error: invalid use of undefined type 'struct platform_device'
     744 |                        (regs ? regs->which_io : 0), op->dev.of_node);
         |                                                       ^~
   drivers/atm/fore200e.c: In function 'fore200e_sba_probe':
   drivers/atm/fore200e.c:2534:28: error: invalid use of undefined type 'struct platform_device'
    2534 |         fore200e->dev = &op->dev;
         |                            ^~
   drivers/atm/fore200e.c:2535:27: error: invalid use of undefined type 'struct platform_device'
    2535 |         fore200e->irq = op->archdata.irqs[0];
         |                           ^~
   drivers/atm/fore200e.c:2536:33: error: invalid use of undefined type 'struct platform_device'
    2536 |         fore200e->phys_base = op->resource[0].start;
         |                                 ^~
   drivers/atm/fore200e.c:2540:42: error: invalid use of undefined type 'struct platform_device'
    2540 |         err = fore200e_init(fore200e, &op->dev);
         |                                          ^~
   drivers/atm/fore200e.c:2548:28: error: invalid use of undefined type 'struct platform_device'
    2548 |         dev_set_drvdata(&op->dev, fore200e);
         |                            ^~
   drivers/atm/fore200e.c: In function 'fore200e_sba_remove':
   drivers/atm/fore200e.c:2555:56: error: invalid use of undefined type 'struct platform_device'
    2555 |         struct fore200e *fore200e = dev_get_drvdata(&op->dev);
         |                                                        ^~
   drivers/atm/fore200e.c: At top level:
   drivers/atm/fore200e.c:2571:15: error: variable 'fore200e_sba_driver' has initializer but incomplete type
    2571 | static struct platform_driver fore200e_sba_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:2572:10: error: 'struct platform_driver' has no member named 'driver'
    2572 |         .driver = {
         |          ^~~~~~
   drivers/atm/fore200e.c:2572:19: error: extra brace group at end of initializer
    2572 |         .driver = {
         |                   ^
   drivers/atm/fore200e.c:2572:19: note: (near initialization for 'fore200e_sba_driver')
>> drivers/atm/fore200e.c:2572:19: warning: excess elements in struct initializer
   drivers/atm/fore200e.c:2572:19: note: (near initialization for 'fore200e_sba_driver')
   drivers/atm/fore200e.c:2576:10: error: 'struct platform_driver' has no member named 'probe'
    2576 |         .probe          = fore200e_sba_probe,
         |          ^~~~~
   drivers/atm/fore200e.c:2576:27: warning: excess elements in struct initializer
    2576 |         .probe          = fore200e_sba_probe,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:2576:27: note: (near initialization for 'fore200e_sba_driver')
   drivers/atm/fore200e.c:2577:10: error: 'struct platform_driver' has no member named 'remove'
    2577 |         .remove         = fore200e_sba_remove,
         |          ^~~~~~
   drivers/atm/fore200e.c:2577:27: warning: excess elements in struct initializer
    2577 |         .remove         = fore200e_sba_remove,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:2577:27: note: (near initialization for 'fore200e_sba_driver')
   drivers/atm/fore200e.c: In function 'fore200e_module_init':
   drivers/atm/fore200e.c:2673:15: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
    2673 |         err = platform_driver_register(&fore200e_sba_driver);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:2684:17: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
    2684 |                 platform_driver_unregister(&fore200e_sba_driver);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 driver_unregister
   drivers/atm/fore200e.c: At top level:
   drivers/atm/fore200e.c:2571:31: error: storage size of 'fore200e_sba_driver' isn't known
    2571 | static struct platform_driver fore200e_sba_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/input/misc/sparcspkr.c: In function 'sparcspkr_shutdown':
   drivers/input/misc/sparcspkr.c:179:41: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     179 |         struct sparcspkr_state *state = platform_get_drvdata(dev);
         |                                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/sparcspkr.c:179:41: warning: initialization of 'struct sparcspkr_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/misc/sparcspkr.c: In function 'bbc_beep_probe':
   drivers/input/misc/sparcspkr.c:212:36: error: invalid use of undefined type 'struct platform_device'
     212 |         info->regs = of_ioremap(&op->resource[0], 0, 6, "bbc beep");
         |                                    ^~
   drivers/input/misc/sparcspkr.c:216:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     216 |         platform_set_drvdata(op, state);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:218:34: error: invalid use of undefined type 'struct platform_device'
     218 |         err = sparcspkr_probe(&op->dev);
         |                                  ^~
   drivers/input/misc/sparcspkr.c:225:23: error: invalid use of undefined type 'struct platform_device'
     225 |         of_iounmap(&op->resource[0], info->regs, 6);
         |                       ^~
   drivers/input/misc/sparcspkr.c: In function 'bbc_remove':
   drivers/input/misc/sparcspkr.c:235:41: warning: initialization of 'struct sparcspkr_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     235 |         struct sparcspkr_state *state = platform_get_drvdata(op);
         |                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:244:23: error: invalid use of undefined type 'struct platform_device'
     244 |         of_iounmap(&op->resource[0], info->regs, 6);
         |                       ^~
   drivers/input/misc/sparcspkr.c: At top level:
   drivers/input/misc/sparcspkr.c:260:15: error: variable 'bbc_beep_driver' has initializer but incomplete type
     260 | static struct platform_driver bbc_beep_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:261:10: error: 'struct platform_driver' has no member named 'driver'
     261 |         .driver = {
         |          ^~~~~~
   drivers/input/misc/sparcspkr.c:261:19: error: extra brace group at end of initializer
     261 |         .driver = {
         |                   ^
   drivers/input/misc/sparcspkr.c:261:19: note: (near initialization for 'bbc_beep_driver')
>> drivers/input/misc/sparcspkr.c:261:19: warning: excess elements in struct initializer
   drivers/input/misc/sparcspkr.c:261:19: note: (near initialization for 'bbc_beep_driver')
   drivers/input/misc/sparcspkr.c:265:10: error: 'struct platform_driver' has no member named 'probe'
     265 |         .probe          = bbc_beep_probe,
         |          ^~~~~
   drivers/input/misc/sparcspkr.c:265:27: warning: excess elements in struct initializer
     265 |         .probe          = bbc_beep_probe,
         |                           ^~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:265:27: note: (near initialization for 'bbc_beep_driver')
   drivers/input/misc/sparcspkr.c:266:10: error: 'struct platform_driver' has no member named 'remove'
     266 |         .remove         = bbc_remove,
         |          ^~~~~~
   drivers/input/misc/sparcspkr.c:266:27: warning: excess elements in struct initializer
     266 |         .remove         = bbc_remove,
         |                           ^~~~~~~~~~
   drivers/input/misc/sparcspkr.c:266:27: note: (near initialization for 'bbc_beep_driver')
   drivers/input/misc/sparcspkr.c:267:10: error: 'struct platform_driver' has no member named 'shutdown'
     267 |         .shutdown       = sparcspkr_shutdown,
         |          ^~~~~~~~
   drivers/input/misc/sparcspkr.c:267:27: warning: excess elements in struct initializer
     267 |         .shutdown       = sparcspkr_shutdown,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:267:27: note: (near initialization for 'bbc_beep_driver')
   drivers/input/misc/sparcspkr.c: In function 'grover_beep_probe':
   drivers/input/misc/sparcspkr.c:285:41: error: invalid use of undefined type 'struct platform_device'
     285 |         info->freq_regs = of_ioremap(&op->resource[2], 0, 2, "grover beep freq");
         |                                         ^~
   drivers/input/misc/sparcspkr.c:289:42: error: invalid use of undefined type 'struct platform_device'
     289 |         info->enable_reg = of_ioremap(&op->resource[3], 0, 1, "grover beep enable");
         |                                          ^~
   drivers/input/misc/sparcspkr.c:295:34: error: invalid use of undefined type 'struct platform_device'
     295 |         err = sparcspkr_probe(&op->dev);
         |                                  ^~
   drivers/input/misc/sparcspkr.c:302:23: error: invalid use of undefined type 'struct platform_device'
     302 |         of_iounmap(&op->resource[3], info->enable_reg, 1);
         |                       ^~
   drivers/input/misc/sparcspkr.c:305:23: error: invalid use of undefined type 'struct platform_device'
     305 |         of_iounmap(&op->resource[2], info->freq_regs, 2);
         |                       ^~
   drivers/input/misc/sparcspkr.c: In function 'grover_remove':
   drivers/input/misc/sparcspkr.c:314:41: warning: initialization of 'struct sparcspkr_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     314 |         struct sparcspkr_state *state = platform_get_drvdata(op);
         |                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:323:23: error: invalid use of undefined type 'struct platform_device'
     323 |         of_iounmap(&op->resource[3], info->enable_reg, 1);
         |                       ^~
   drivers/input/misc/sparcspkr.c:324:23: error: invalid use of undefined type 'struct platform_device'
     324 |         of_iounmap(&op->resource[2], info->freq_regs, 2);
         |                       ^~
   drivers/input/misc/sparcspkr.c: At top level:
   drivers/input/misc/sparcspkr.c:340:15: error: variable 'grover_beep_driver' has initializer but incomplete type
     340 | static struct platform_driver grover_beep_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:341:10: error: 'struct platform_driver' has no member named 'driver'
     341 |         .driver = {
         |          ^~~~~~
   drivers/input/misc/sparcspkr.c:341:19: error: extra brace group at end of initializer
     341 |         .driver = {
         |                   ^
   drivers/input/misc/sparcspkr.c:341:19: note: (near initialization for 'grover_beep_driver')
   drivers/input/misc/sparcspkr.c:341:19: warning: excess elements in struct initializer
   drivers/input/misc/sparcspkr.c:341:19: note: (near initialization for 'grover_beep_driver')
   drivers/input/misc/sparcspkr.c:345:10: error: 'struct platform_driver' has no member named 'probe'
     345 |         .probe          = grover_beep_probe,
         |          ^~~~~
   drivers/input/misc/sparcspkr.c:345:27: warning: excess elements in struct initializer
     345 |         .probe          = grover_beep_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:345:27: note: (near initialization for 'grover_beep_driver')
   drivers/input/misc/sparcspkr.c:346:10: error: 'struct platform_driver' has no member named 'remove'
     346 |         .remove         = grover_remove,
         |          ^~~~~~
   drivers/input/misc/sparcspkr.c:346:27: warning: excess elements in struct initializer
     346 |         .remove         = grover_remove,
         |                           ^~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:346:27: note: (near initialization for 'grover_beep_driver')
   drivers/input/misc/sparcspkr.c:347:10: error: 'struct platform_driver' has no member named 'shutdown'
     347 |         .shutdown       = sparcspkr_shutdown,
         |          ^~~~~~~~
   drivers/input/misc/sparcspkr.c:347:27: warning: excess elements in struct initializer
     347 |         .shutdown       = sparcspkr_shutdown,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:347:27: note: (near initialization for 'grover_beep_driver')
   drivers/input/misc/sparcspkr.c: In function 'sparcspkr_init':
   drivers/input/misc/sparcspkr.c:357:16: error: implicit declaration of function 'platform_register_drivers' [-Werror=implicit-function-declaration]
     357 |         return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c: In function 'sparcspkr_exit':
   drivers/input/misc/sparcspkr.c:362:9: error: implicit declaration of function 'platform_unregister_drivers' [-Werror=implicit-function-declaration]
     362 |         platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c: At top level:
   drivers/input/misc/sparcspkr.c:260:31: error: storage size of 'bbc_beep_driver' isn't known
     260 | static struct platform_driver bbc_beep_driver = {
         |                               ^~~~~~~~~~~~~~~
   drivers/input/misc/sparcspkr.c:340:31: error: storage size of 'grover_beep_driver' isn't known
     340 | static struct platform_driver grover_beep_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/crypto/n2_core.c:1506:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1506 | static int find_devino_index(struct platform_device *dev, struct spu_mdesc_info *ip,
         |                                     ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'find_devino_index':
   drivers/crypto/n2_core.c:1522:40: error: invalid use of undefined type 'struct platform_device'
    1522 |         dev_intrs = of_get_property(dev->dev.of_node, "interrupts", NULL);
         |                                        ^~
   drivers/crypto/n2_core.c:1526:28: error: invalid use of undefined type 'struct platform_device'
    1526 |         for (i = 0; i < dev->archdata.num_irqs; i++) {
         |                            ^~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1534:31: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1534 | static int spu_map_ino(struct platform_device *dev, struct spu_mdesc_info *ip,
         |                               ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'spu_map_ino':
   drivers/crypto/n2_core.c:1545:35: error: passing argument 1 of 'find_devino_index' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1545 |         index = find_devino_index(dev, ip, p->devino);
         |                                   ^~~
         |                                   |
         |                                   struct platform_device *
   drivers/crypto/n2_core.c:1506:54: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1506 | static int find_devino_index(struct platform_device *dev, struct spu_mdesc_info *ip,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/n2_core.c:1549:21: error: invalid use of undefined type 'struct platform_device'
    1549 |         p->irq = dev->archdata.irqs[index];
         |                     ^~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1680:39: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1680 |                                struct platform_device *dev,
         |                                       ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'spu_mdesc_walk_arcs':
   drivers/crypto/n2_core.c:1695:25: error: implicit declaration of function 'dev_err' [-Werror=implicit-function-declaration]
    1695 |                         dev_err(&dev->dev, "%pOF: SPU cpu slot already set.\n",
         |                         ^~~~~~~
   drivers/crypto/n2_core.c:1695:37: error: invalid use of undefined type 'struct platform_device'
    1695 |                         dev_err(&dev->dev, "%pOF: SPU cpu slot already set.\n",
         |                                     ^~
   drivers/crypto/n2_core.c:1696:36: error: invalid use of undefined type 'struct platform_device'
    1696 |                                 dev->dev.of_node);
         |                                    ^~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1707:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1707 |                             struct platform_device *dev, struct mdesc_handle *mdesc,
         |                                    ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'handle_exec_unit':
   drivers/crypto/n2_core.c:1716:29: error: invalid use of undefined type 'struct platform_device'
    1716 |                 dev_err(&dev->dev, "%pOF: Could not allocate SPU queue.\n",
         |                             ^~
   drivers/crypto/n2_core.c:1717:28: error: invalid use of undefined type 'struct platform_device'
    1717 |                         dev->dev.of_node);
         |                            ^~
   drivers/crypto/n2_core.c:1727:42: error: passing argument 2 of 'spu_mdesc_walk_arcs' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1727 |         err = spu_mdesc_walk_arcs(mdesc, dev, node, p, table);
         |                                          ^~~
         |                                          |
         |                                          struct platform_device *
   drivers/crypto/n2_core.c:1680:56: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1680 |                                struct platform_device *dev,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/n2_core.c:1735:28: error: passing argument 1 of 'spu_map_ino' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1735 |         return spu_map_ino(dev, ip, iname, p, handler);
         |                            ^~~
         |                            |
         |                            struct platform_device *
   drivers/crypto/n2_core.c:1534:48: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1534 | static int spu_map_ino(struct platform_device *dev, struct spu_mdesc_info *ip,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1738:62: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1738 | static int spu_mdesc_scan(struct mdesc_handle *mdesc, struct platform_device *dev,
         |                                                              ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'spu_mdesc_scan':
   drivers/crypto/n2_core.c:1753:50: error: passing argument 3 of 'handle_exec_unit' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1753 |                 err = handle_exec_unit(ip, list, dev, mdesc, node,
         |                                                  ^~~
         |                                                  |
         |                                                  struct platform_device *
   drivers/crypto/n2_core.c:1707:53: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1707 |                             struct platform_device *dev, struct mdesc_handle *mdesc,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1794:40: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1794 |                                 struct platform_device *dev,
         |                                        ^~~~~~~~~~~~~~~
   drivers/crypto/n2_core.c: In function 'grab_mdesc_irq_props':
   drivers/crypto/n2_core.c:1801:34: error: invalid use of undefined type 'struct platform_device'
    1801 |         reg = of_get_property(dev->dev.of_node, "reg", NULL);
         |                                  ^~
   drivers/crypto/n2_core.c: At top level:
   drivers/crypto/n2_core.c:1941:35: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1941 | static int n2_crypto_probe(struct platform_device *dev)
         |                                   ^~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:29,
                    from drivers/crypto/n2_core.c:9:
   drivers/crypto/n2_core.c: In function 'n2_crypto_probe':
   drivers/crypto/n2_core.c:1949:44: error: invalid use of undefined type 'struct platform_device'
    1949 |         pr_info("Found N2CP at %pOF\n", dev->dev.of_node);
         |                                            ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
..


vim +62 drivers/input/serio/i8042-sparcio.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  54  
5298cc4cc753bb Bill Pemberton  2012-11-23  55  static int sparc_i8042_probe(struct platform_device *op)
f57caaefacc2ff David S. Miller 2006-06-29  56  {
0b8f452c9698d4 Rob Herring     2019-02-17  57  	struct device_node *dp;
f57caaefacc2ff David S. Miller 2006-06-29  58  
0b8f452c9698d4 Rob Herring     2019-02-17  59  	for_each_child_of_node(op->dev.of_node, dp) {
0b8f452c9698d4 Rob Herring     2019-02-17  60  		if (of_node_name_eq(dp, OBP_PS2KBD_NAME1) ||
0b8f452c9698d4 Rob Herring     2019-02-17  61  		    of_node_name_eq(dp, OBP_PS2KBD_NAME2)) {
2dc11581376829 Grant Likely    2010-08-06 @62  			struct platform_device *kbd = of_find_device_by_node(dp);
1636f8ac2b0841 Grant Likely    2010-06-18  63  			unsigned int irq = kbd->archdata.irqs[0];
f57caaefacc2ff David S. Miller 2006-06-29  64  			if (irq == 0xffffffff)
1636f8ac2b0841 Grant Likely    2010-06-18  65  				irq = op->archdata.irqs[0];
f57caaefacc2ff David S. Miller 2006-06-29  66  			i8042_kbd_irq = irq;
f57caaefacc2ff David S. Miller 2006-06-29  67  			kbd_iobase = of_ioremap(&kbd->resource[0],
f57caaefacc2ff David S. Miller 2006-06-29  68  						0, 8, "kbd");
e3a411a3dfc1d6 David S. Miller 2006-12-28  69  			kbd_res = &kbd->resource[0];
0b8f452c9698d4 Rob Herring     2019-02-17  70  		} else if (of_node_name_eq(dp, OBP_PS2MS_NAME1) ||
0b8f452c9698d4 Rob Herring     2019-02-17  71  			   of_node_name_eq(dp, OBP_PS2MS_NAME2)) {
2dc11581376829 Grant Likely    2010-08-06  72  			struct platform_device *ms = of_find_device_by_node(dp);
1636f8ac2b0841 Grant Likely    2010-06-18  73  			unsigned int irq = ms->archdata.irqs[0];
f57caaefacc2ff David S. Miller 2006-06-29  74  			if (irq == 0xffffffff)
1636f8ac2b0841 Grant Likely    2010-06-18  75  				irq = op->archdata.irqs[0];
f57caaefacc2ff David S. Miller 2006-06-29  76  			i8042_aux_irq = irq;
f57caaefacc2ff David S. Miller 2006-06-29  77  		}
f57caaefacc2ff David S. Miller 2006-06-29  78  	}
f57caaefacc2ff David S. Miller 2006-06-29  79  
f57caaefacc2ff David S. Miller 2006-06-29  80  	return 0;
f57caaefacc2ff David S. Miller 2006-06-29  81  }
f57caaefacc2ff David S. Miller 2006-06-29  82  

:::::: The code at line 62 was first introduced by commit
:::::: 2dc11581376829303b98eadb2de253bee065a56a of/device: Replace struct of_device with struct platform_device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
