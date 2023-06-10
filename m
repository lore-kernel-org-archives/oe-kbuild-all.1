Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C11112
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686357304; x=1717893304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNu0s5S2fNjl94xbpyPWWMBj80cCbuW7WOLDwbq0ID8=;
  b=iJc5A8dKa4rWEcRsrJ14FiROBgymowhYIdvEq5k3UQjMLzUhvRcvZfSp
   qw06AJyaZGkJ/sYAbNlrhGF6bWhV7/HIBQCTGxvb1ZgOWUZSNQLacvd4W
   9JHJ1fxWngeKCyo1V9ojyTDBV3lF952925X/l/sCsupi5mvvL+q9S1uWv
   hBGoV3Szw/2TKLIPSw5RhefddDW9xX8ROCbwiJyWLBhW3t+5qbPgbUU0v
   AxvWg75x3Lw+2kc9eQ4KGUqUBffeQABE+o0J4wCDu/f9SGa9rZQ1q1APZ
   oA/xgXx5bqeh9tukMZw8ZiLF28MKiiiYJn8bV8yaKlj9yGUNyi3pfoKaP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386081824"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="386081824"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="780491393"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="780491393"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2023 17:34:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mZG-0009Y1-36;
	Sat, 10 Jun 2023 00:34:58 +0000
Date: Sat, 10 Jun 2023 08:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 20/20] arch/sparc/kernel/chmc.c:428:34:
 error: invalid use of undefined type 'struct platform_device'
Message-ID: <202306100828.RWwjEoPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d [20/20] of: header cleanups
config: sparc-randconfig-r014-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100828.RWwjEoPM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash arch/sparc/kernel/ drivers/char/hw_random/ drivers/gpu/drm/bridge/ drivers/mfd/ drivers/sbus/char/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100828.RWwjEoPM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mfd/palmas.c: In function 'palmas_i2c_probe':
>> drivers/mfd/palmas.c:675:23: error: implicit declaration of function 'devm_of_platform_populate' [-Werror=implicit-function-declaration]
     675 |                 ret = devm_of_platform_populate(&i2c->dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/sparc/kernel/chmc.c:396:32: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     396 | static int jbusmc_probe(struct platform_device *op)
         |                                ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'jbusmc_probe':
>> arch/sparc/kernel/chmc.c:428:34: error: invalid use of undefined type 'struct platform_device'
     428 |         prop = of_get_property(op->dev.of_node, "portid", &len);
         |                                  ^~
   arch/sparc/kernel/chmc.c:436:34: error: invalid use of undefined type 'struct platform_device'
     436 |         prop = of_get_property(op->dev.of_node, "memory-control-register-1", &len);
         |                                  ^~
   arch/sparc/kernel/chmc.c:445:33: error: invalid use of undefined type 'struct platform_device'
     445 |         p->regs = of_ioremap(&op->resource[0], 0, JBUSMC_REGS_SIZE, "jbusmc");
         |                                 ^~
   arch/sparc/kernel/chmc.c:452:32: error: invalid use of undefined type 'struct platform_device'
     452 |         ml = of_get_property(op->dev.of_node, "memory-layout", &p->layout_len);
         |                                ^~
   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from arch/sparc/kernel/chmc.c:7:
   arch/sparc/kernel/chmc.c:469:18: error: invalid use of undefined type 'struct platform_device'
     469 |                op->dev.of_node);
         |                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/sparc/kernel/chmc.c:468:9: note: in expansion of macro 'printk'
     468 |         printk(KERN_INFO PFX "UltraSPARC-IIIi memory controller at %pOF\n",
         |         ^~~~~~
>> arch/sparc/kernel/chmc.c:471:9: error: implicit declaration of function 'dev_set_drvdata' [-Werror=implicit-function-declaration]
     471 |         dev_set_drvdata(&op->dev, p);
         |         ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c:471:28: error: invalid use of undefined type 'struct platform_device'
     471 |         dev_set_drvdata(&op->dev, p);
         |                            ^~
   arch/sparc/kernel/chmc.c:479:23: error: invalid use of undefined type 'struct platform_device'
     479 |         of_iounmap(&op->resource[0], p->regs, JBUSMC_REGS_SIZE);
         |                       ^~
   arch/sparc/kernel/chmc.c: At top level:
   arch/sparc/kernel/chmc.c:693:30: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     693 | static int chmc_probe(struct platform_device *op)
         |                              ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'chmc_probe':
   arch/sparc/kernel/chmc.c:695:36: error: invalid use of undefined type 'struct platform_device'
     695 |         struct device_node *dp = op->dev.of_node;
         |                                    ^~
   arch/sparc/kernel/chmc.c:733:33: error: invalid use of undefined type 'struct platform_device'
     733 |         p->regs = of_ioremap(&op->resource[0], 0, 0x48, "chmc");
         |                                 ^~
   arch/sparc/kernel/chmc.c:755:28: error: invalid use of undefined type 'struct platform_device'
     755 |         dev_set_drvdata(&op->dev, p);
         |                            ^~
   arch/sparc/kernel/chmc.c: At top level:
   arch/sparc/kernel/chmc.c:767:31: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     767 | static int us3mc_probe(struct platform_device *op)
         |                               ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'us3mc_probe':
>> arch/sparc/kernel/chmc.c:770:35: error: passing argument 1 of 'chmc_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     770 |                 return chmc_probe(op);
         |                                   ^~
         |                                   |
         |                                   struct platform_device *
   arch/sparc/kernel/chmc.c:693:47: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
     693 | static int chmc_probe(struct platform_device *op)
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~^~
>> arch/sparc/kernel/chmc.c:772:37: error: passing argument 1 of 'jbusmc_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     772 |                 return jbusmc_probe(op);
         |                                     ^~
         |                                     |
         |                                     struct platform_device *
   arch/sparc/kernel/chmc.c:396:49: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
     396 | static int jbusmc_probe(struct platform_device *op)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/sparc/kernel/chmc.c: At top level:
   arch/sparc/kernel/chmc.c:776:33: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     776 | static void chmc_destroy(struct platform_device *op, struct chmc *p)
         |                                 ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'chmc_destroy':
   arch/sparc/kernel/chmc.c:779:23: error: invalid use of undefined type 'struct platform_device'
     779 |         of_iounmap(&op->resource[0], p->regs, 0x48);
         |                       ^~
   arch/sparc/kernel/chmc.c: At top level:
   arch/sparc/kernel/chmc.c:783:35: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     783 | static void jbusmc_destroy(struct platform_device *op, struct jbusmc *p)
         |                                   ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'jbusmc_destroy':
   arch/sparc/kernel/chmc.c:786:23: error: invalid use of undefined type 'struct platform_device'
     786 |         of_iounmap(&op->resource[0], p->regs, JBUSMC_REGS_SIZE);
         |                       ^~
   arch/sparc/kernel/chmc.c: At top level:
   arch/sparc/kernel/chmc.c:790:32: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     790 | static int us3mc_remove(struct platform_device *op)
         |                                ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'us3mc_remove':
>> arch/sparc/kernel/chmc.c:792:19: error: implicit declaration of function 'dev_get_drvdata' [-Werror=implicit-function-declaration]
     792 |         void *p = dev_get_drvdata(&op->dev);
         |                   ^~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c:792:38: error: invalid use of undefined type 'struct platform_device'
     792 |         void *p = dev_get_drvdata(&op->dev);
         |                                      ^~
>> arch/sparc/kernel/chmc.c:796:38: error: passing argument 1 of 'chmc_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     796 |                         chmc_destroy(op, p);
         |                                      ^~
         |                                      |
         |                                      struct platform_device *
   arch/sparc/kernel/chmc.c:776:50: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
     776 | static void chmc_destroy(struct platform_device *op, struct chmc *p)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~^~
>> arch/sparc/kernel/chmc.c:798:40: error: passing argument 1 of 'jbusmc_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     798 |                         jbusmc_destroy(op, p);
         |                                        ^~
         |                                        |
         |                                        struct platform_device *
   arch/sparc/kernel/chmc.c:783:52: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
     783 | static void jbusmc_destroy(struct platform_device *op, struct jbusmc *p)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/sparc/kernel/chmc.c: At top level:
>> arch/sparc/kernel/chmc.c:811:15: error: variable 'us3mc_driver' has initializer but incomplete type
     811 | static struct platform_driver us3mc_driver = {
         |               ^~~~~~~~~~~~~~~
>> arch/sparc/kernel/chmc.c:812:10: error: 'struct platform_driver' has no member named 'driver'
     812 |         .driver = {
         |          ^~~~~~
>> arch/sparc/kernel/chmc.c:812:19: error: extra brace group at end of initializer
     812 |         .driver = {
         |                   ^
   arch/sparc/kernel/chmc.c:812:19: note: (near initialization for 'us3mc_driver')
   arch/sparc/kernel/chmc.c:812:19: error: excess elements in struct initializer [-Werror]
   arch/sparc/kernel/chmc.c:812:19: note: (near initialization for 'us3mc_driver')
>> arch/sparc/kernel/chmc.c:816:10: error: 'struct platform_driver' has no member named 'probe'
     816 |         .probe          = us3mc_probe,
         |          ^~~~~
   arch/sparc/kernel/chmc.c:816:27: error: excess elements in struct initializer [-Werror]
     816 |         .probe          = us3mc_probe,
         |                           ^~~~~~~~~~~
   arch/sparc/kernel/chmc.c:816:27: note: (near initialization for 'us3mc_driver')
>> arch/sparc/kernel/chmc.c:817:10: error: 'struct platform_driver' has no member named 'remove'
     817 |         .remove         = us3mc_remove,
         |          ^~~~~~
   arch/sparc/kernel/chmc.c:817:27: error: excess elements in struct initializer [-Werror]
     817 |         .remove         = us3mc_remove,
         |                           ^~~~~~~~~~~~
   arch/sparc/kernel/chmc.c:817:27: note: (near initialization for 'us3mc_driver')
   arch/sparc/kernel/chmc.c: In function 'us3mc_init':
>> arch/sparc/kernel/chmc.c:848:23: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     848 |                 ret = platform_driver_register(&us3mc_driver);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/chmc.c: In function 'us3mc_cleanup':
>> arch/sparc/kernel/chmc.c:859:17: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     859 |                 platform_driver_unregister(&us3mc_driver);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 driver_unregister
   arch/sparc/kernel/chmc.c: At top level:
>> arch/sparc/kernel/chmc.c:811:31: error: storage size of 'us3mc_driver' isn't known
     811 | static struct platform_driver us3mc_driver = {
         |                               ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/sbus/char/uctrl.c: In function 'uctrl_probe':
>> drivers/sbus/char/uctrl.c:358:33: error: invalid use of undefined type 'struct platform_device'
     358 |         p->regs = of_ioremap(&op->resource[0], 0,
         |                                 ^~
   drivers/sbus/char/uctrl.c:359:47: error: invalid use of undefined type 'struct platform_device'
     359 |                              resource_size(&op->resource[0]),
         |                                               ^~
   drivers/sbus/char/uctrl.c:366:20: error: invalid use of undefined type 'struct platform_device'
     366 |         p->irq = op->archdata.irqs[0];
         |                    ^~
   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/sbus/char/uctrl.c:8:
   drivers/sbus/char/uctrl.c:381:18: error: invalid use of undefined type 'struct platform_device'
     381 |                op->dev.of_node, p->regs, p->irq);
         |                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/sbus/char/uctrl.c:380:9: note: in expansion of macro 'printk'
     380 |         printk(KERN_INFO "%pOF: uctrl regs[0x%p] (irq %d)\n",
         |         ^~~~~~
   drivers/sbus/char/uctrl.c:385:28: error: invalid use of undefined type 'struct platform_device'
     385 |         dev_set_drvdata(&op->dev, p);
         |                            ^~
   drivers/sbus/char/uctrl.c:395:23: error: invalid use of undefined type 'struct platform_device'
     395 |         of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
         |                       ^~
   drivers/sbus/char/uctrl.c:395:64: error: invalid use of undefined type 'struct platform_device'
     395 |         of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
         |                                                                ^~
   drivers/sbus/char/uctrl.c: In function 'uctrl_remove':
   drivers/sbus/char/uctrl.c:404:53: error: invalid use of undefined type 'struct platform_device'
     404 |         struct uctrl_driver *p = dev_get_drvdata(&op->dev);
         |                                                     ^~
   drivers/sbus/char/uctrl.c:409:31: error: invalid use of undefined type 'struct platform_device'
     409 |                 of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
         |                               ^~
   drivers/sbus/char/uctrl.c:409:72: error: invalid use of undefined type 'struct platform_device'
     409 |                 of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
         |                                                                        ^~
   drivers/sbus/char/uctrl.c: At top level:
>> drivers/sbus/char/uctrl.c:423:15: error: variable 'uctrl_driver' has initializer but incomplete type
     423 | static struct platform_driver uctrl_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/sbus/char/uctrl.c:424:10: error: 'struct platform_driver' has no member named 'driver'
     424 |         .driver = {
         |          ^~~~~~
>> drivers/sbus/char/uctrl.c:424:19: error: extra brace group at end of initializer
     424 |         .driver = {
         |                   ^
   drivers/sbus/char/uctrl.c:424:19: note: (near initialization for 'uctrl_driver')
>> drivers/sbus/char/uctrl.c:424:19: warning: excess elements in struct initializer
   drivers/sbus/char/uctrl.c:424:19: note: (near initialization for 'uctrl_driver')
>> drivers/sbus/char/uctrl.c:428:10: error: 'struct platform_driver' has no member named 'probe'
     428 |         .probe          = uctrl_probe,
         |          ^~~~~
   drivers/sbus/char/uctrl.c:428:27: warning: excess elements in struct initializer
     428 |         .probe          = uctrl_probe,
         |                           ^~~~~~~~~~~
   drivers/sbus/char/uctrl.c:428:27: note: (near initialization for 'uctrl_driver')
>> drivers/sbus/char/uctrl.c:429:10: error: 'struct platform_driver' has no member named 'remove'
     429 |         .remove         = uctrl_remove,
         |          ^~~~~~
   drivers/sbus/char/uctrl.c:429:27: warning: excess elements in struct initializer
     429 |         .remove         = uctrl_remove,
         |                           ^~~~~~~~~~~~
   drivers/sbus/char/uctrl.c:429:27: note: (near initialization for 'uctrl_driver')
>> drivers/sbus/char/uctrl.c:433:1: warning: data definition has no type or storage class
     433 | module_platform_driver(uctrl_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/sbus/char/uctrl.c:433:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/sbus/char/uctrl.c:433:1: warning: parameter names (without types) in function declaration
>> drivers/sbus/char/uctrl.c:423:31: error: storage size of 'uctrl_driver' isn't known
     423 | static struct platform_driver uctrl_driver = {
         |                               ^~~~~~~~~~~~
   drivers/sbus/char/uctrl.c:423:31: warning: 'uctrl_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
--
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_grab_diag_control':
>> drivers/char/hw_random/n2-drv.c:391:25: error: implicit declaration of function 'dev_err' [-Werror=implicit-function-declaration]
     391 |                         dev_err(&np->op->dev,
         |                         ^~~~~~~
>> drivers/char/hw_random/n2-drv.c:391:40: error: invalid use of undefined type 'struct platform_device'
     391 |                         dev_err(&np->op->dev,
         |                                        ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_data_read':
   drivers/char/hw_random/n2-drv.c:439:40: error: invalid use of undefined type 'struct platform_device'
     439 |                         dev_err(&np->op->dev, "RNG error, retesting\n");
         |                                        ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_dump_test_buffer':
   drivers/char/hw_random/n2-drv.c:517:32: error: invalid use of undefined type 'struct platform_device'
     517 |                 dev_err(&np->op->dev, "Test buffer slot %d [0x%016llx]\n",
         |                                ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_check_selftest_buffer':
   drivers/char/hw_random/n2-drv.c:549:32: error: invalid use of undefined type 'struct platform_device'
     549 |                 dev_err(&np->op->dev, "Selftest failed on unit %lu\n", unit);
         |                                ^~
>> drivers/char/hw_random/n2-drv.c:552:17: error: implicit declaration of function 'dev_info' [-Werror=implicit-function-declaration]
     552 |                 dev_info(&np->op->dev, "Selftest passed on unit %lu\n", unit);
         |                 ^~~~~~~~
   drivers/char/hw_random/n2-drv.c:552:33: error: invalid use of undefined type 'struct platform_device'
     552 |                 dev_info(&np->op->dev, "Selftest passed on unit %lu\n", unit);
         |                                 ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_work':
   drivers/char/hw_random/n2-drv.c:678:33: error: invalid use of undefined type 'struct platform_device'
     678 |                 dev_info(&np->op->dev, "RNG ready\n");
         |                                 ^~
   drivers/char/hw_random/n2-drv.c:682:32: error: invalid use of undefined type 'struct platform_device'
     682 |                 dev_err(&np->op->dev, "Self-test retries failed, RNG not ready\n");
         |                                ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_probe':
>> drivers/char/hw_random/n2-drv.c:702:14: error: implicit declaration of function 'devm_kzalloc' [-Werror=implicit-function-declaration]
     702 |         np = devm_kzalloc(&op->dev, sizeof(*np), GFP_KERNEL);
         |              ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:702:30: error: invalid use of undefined type 'struct platform_device'
     702 |         np = devm_kzalloc(&op->dev, sizeof(*np), GFP_KERNEL);
         |                              ^~
   drivers/char/hw_random/n2-drv.c:706:73: error: invalid use of undefined type 'struct platform_device'
     706 |         np->data = (struct n2rng_template *)of_device_get_match_data(&op->dev);
         |                                                                         ^~
   drivers/char/hw_random/n2-drv.c:722:36: error: invalid use of undefined type 'struct platform_device'
     722 |                         dev_err(&op->dev, "Cannot register suitable "
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:730:36: error: invalid use of undefined type 'struct platform_device'
     730 |                         dev_err(&op->dev, "multi-unit-capable RNG requires "
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:735:57: error: invalid use of undefined type 'struct platform_device'
     735 |                 np->num_units = of_getintprop_default(op->dev.of_node,
         |                                                         ^~
   drivers/char/hw_random/n2-drv.c:738:36: error: invalid use of undefined type 'struct platform_device'
     738 |                         dev_err(&op->dev, "VF RNG lacks rng-#units property\n");
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:745:21: error: invalid use of undefined type 'struct platform_device'
     745 |         dev_info(&op->dev, "Registered RNG HVAPI major %lu minor %lu\n",
         |                     ^~
>> drivers/char/hw_random/n2-drv.c:747:21: error: implicit declaration of function 'devm_kcalloc' [-Werror=implicit-function-declaration]
     747 |         np->units = devm_kcalloc(&op->dev, np->num_units, sizeof(*np->units),
         |                     ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:747:37: error: invalid use of undefined type 'struct platform_device'
     747 |         np->units = devm_kcalloc(&op->dev, np->num_units, sizeof(*np->units),
         |                                     ^~
   drivers/char/hw_random/n2-drv.c:757:21: error: invalid use of undefined type 'struct platform_device'
     757 |         dev_info(&op->dev, "Found %s RNG, units: %d\n",
         |                     ^~
   drivers/char/hw_random/n2-drv.c:766:38: error: invalid use of undefined type 'struct platform_device'
     766 |         err = devm_hwrng_register(&op->dev, &np->hwrng);
         |                                      ^~
>> drivers/char/hw_random/n2-drv.c:770:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     770 |         platform_set_drvdata(op, np);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_remove':
>> drivers/char/hw_random/n2-drv.c:785:28: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     785 |         struct n2rng *np = platform_get_drvdata(op);
         |                            ^~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:785:28: warning: initialization of 'struct n2rng *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/char/hw_random/n2-drv.c: At top level:
>> drivers/char/hw_random/n2-drv.c:856:15: error: variable 'n2rng_driver' has initializer but incomplete type
     856 | static struct platform_driver n2rng_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:857:10: error: 'struct platform_driver' has no member named 'driver'
     857 |         .driver = {
         |          ^~~~~~
>> drivers/char/hw_random/n2-drv.c:857:19: error: extra brace group at end of initializer
     857 |         .driver = {
         |                   ^
   drivers/char/hw_random/n2-drv.c:857:19: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:857:19: warning: excess elements in struct initializer
   drivers/char/hw_random/n2-drv.c:857:19: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:861:10: error: 'struct platform_driver' has no member named 'probe'
     861 |         .probe          = n2rng_probe,
         |          ^~~~~
   drivers/char/hw_random/n2-drv.c:861:27: warning: excess elements in struct initializer
     861 |         .probe          = n2rng_probe,
         |                           ^~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:861:27: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:862:10: error: 'struct platform_driver' has no member named 'remove'
     862 |         .remove         = n2rng_remove,
         |          ^~~~~~
   drivers/char/hw_random/n2-drv.c:862:27: warning: excess elements in struct initializer
     862 |         .remove         = n2rng_remove,
         |                           ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:862:27: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:865:1: warning: data definition has no type or storage class
     865 | module_platform_driver(n2rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:865:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/char/hw_random/n2-drv.c:865:1: warning: parameter names (without types) in function declaration
>> drivers/char/hw_random/n2-drv.c:856:31: error: storage size of 'n2rng_driver' isn't known
     856 | static struct platform_driver n2rng_driver = {
         |                               ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:856:31: warning: 'n2rng_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
..


vim +428 arch/sparc/kernel/chmc.c

85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  395  
7c9503b8382cc41 arch/sparc/kernel/chmc.c   Greg Kroah-Hartman 2012-12-21  396  static int jbusmc_probe(struct platform_device *op)
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  397  {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  398  	const struct linux_prom64_registers *mem_regs;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  399  	struct device_node *mem_node;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  400  	int err, len, num_mem_regs;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  401  	struct jbusmc *p;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  402  	const u32 *prop;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  403  	const void *ml;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  404  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  405  	err = -ENODEV;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  406  	mem_node = of_find_node_by_path("/memory");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  407  	if (!mem_node) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  408  		printk(KERN_ERR PFX "Cannot find /memory node.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  409  		goto out;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  410  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  411  	mem_regs = of_get_property(mem_node, "reg", &len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  412  	if (!mem_regs) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  413  		printk(KERN_ERR PFX "Cannot get reg property of /memory node.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  414  		goto out;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  415  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  416  	num_mem_regs = len / sizeof(*mem_regs);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  417  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  418  	err = -ENOMEM;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  419  	p = kzalloc(sizeof(*p), GFP_KERNEL);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  420  	if (!p) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  421  		printk(KERN_ERR PFX "Cannot allocate struct jbusmc.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  422  		goto out;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  423  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  424  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  425  	INIT_LIST_HEAD(&p->list);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  426  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  427  	err = -ENODEV;
61c7a080a5a061c arch/sparc/kernel/chmc.c   Grant Likely       2010-04-13 @428  	prop = of_get_property(op->dev.of_node, "portid", &len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  429  	if (!prop || len != 4) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  430  		printk(KERN_ERR PFX "Cannot find portid.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  431  		goto out_free;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  432  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  433  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  434  	p->portid = *prop;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  435  
61c7a080a5a061c arch/sparc/kernel/chmc.c   Grant Likely       2010-04-13  436  	prop = of_get_property(op->dev.of_node, "memory-control-register-1", &len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  437  	if (!prop || len != 8) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  438  		printk(KERN_ERR PFX "Cannot get memory control register 1.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  439  		goto out_free;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  440  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  441  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  442  	p->mc_reg_1 = ((u64)prop[0] << 32) | (u64) prop[1];
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  443  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  444  	err = -ENOMEM;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  445  	p->regs = of_ioremap(&op->resource[0], 0, JBUSMC_REGS_SIZE, "jbusmc");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  446  	if (!p->regs) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  447  		printk(KERN_ERR PFX "Cannot map jbusmc regs.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  448  		goto out_free;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  449  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  450  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  451  	err = -ENODEV;
61c7a080a5a061c arch/sparc/kernel/chmc.c   Grant Likely       2010-04-13  452  	ml = of_get_property(op->dev.of_node, "memory-layout", &p->layout_len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  453  	if (!ml) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  454  		printk(KERN_ERR PFX "Cannot get memory layout property.\n");
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  455  		goto out_iounmap;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  456  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  457  	if (p->layout_len > sizeof(p->layout)) {
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  458  		printk(KERN_ERR PFX "Unexpected memory-layout size %d\n",
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  459  		       p->layout_len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  460  		goto out_iounmap;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  461  	}
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  462  	memcpy(&p->layout, ml, p->layout_len);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  463  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  464  	jbusmc_construct_dimm_groups(p, mem_regs, num_mem_regs);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  465  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  466  	mc_list_add(&p->list);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  467  
a412c85aa82a5c8 arch/sparc/kernel/chmc.c   Rob Herring        2018-11-16  468  	printk(KERN_INFO PFX "UltraSPARC-IIIi memory controller at %pOF\n",
a412c85aa82a5c8 arch/sparc/kernel/chmc.c   Rob Herring        2018-11-16  469  	       op->dev.of_node);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  470  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25 @471  	dev_set_drvdata(&op->dev, p);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  472  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  473  	err = 0;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  474  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  475  out:
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  476  	return err;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  477  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  478  out_iounmap:
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  479  	of_iounmap(&op->resource[0], p->regs, JBUSMC_REGS_SIZE);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  480  
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  481  out_free:
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  482  	kfree(p);
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  483  	goto out;
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  484  }
85269eb5542b425 arch/sparc64/kernel/chmc.c David S. Miller    2008-08-25  485  

:::::: The code at line 428 was first introduced by commit
:::::: 61c7a080a5a061c976988fd4b844dfb468dda255 of: Always use 'struct device.of_node' to get device node pointer.

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
