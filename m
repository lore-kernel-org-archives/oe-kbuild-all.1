Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C7174C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689063714; x=1720599714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayMzWdHsPonowgdXVgweL0zffMaITi14ohWIrcJ4O88=;
  b=ACE/S+clnTegm97WEI9meW2uDuutTHBACDXQvY0IePPKSXndSFYXNz0i
   WZELwkReUFjGhg94LCnHKVGjaO7GJCxGuOPedIQythBQlo/lfPyc1FmJa
   Cwvk62FSoRJXIzt8gaQlAcOcTWxwjG701+QrwfXgNNvk3e6m1bzGxWi9p
   AVckqQxWKrkzcJQ5jWI2khROva9UTperUiRnDIQDUA/By+A9Xt1Ey9ft/
   l0ctIdPb17fr/PAPj8ecjKM9cdKTMSMmtZqKibrt48Q9qhIcrhtH34nKd
   gWppjZTX9Em6IsIdHptaSSspQoItlz9p/niS0NM8fwRABmbCbPPqHtrFM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344156539"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344156539"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 01:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671288180"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="671288180"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Jul 2023 01:21:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ8d5-0004Z1-16;
	Tue, 11 Jul 2023 08:21:51 +0000
Date: Tue, 11 Jul 2023 16:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 15/15] drivers/atm/fore200e.c:668:38:
 warning: initialization of 'struct platform_device *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202307111654.5lYYafBE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   92a0590e6af4168d400aa0d285a1160122f54c1c
commit: 92a0590e6af4168d400aa0d285a1160122f54c1c [15/15] of: header cleanups
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230711/202307111654.5lYYafBE-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111654.5lYYafBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111654.5lYYafBE-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   sound/sparc/amd7930.c: In function 'snd_amd7930_free':
   sound/sparc/amd7930.c:899:31: error: invalid use of undefined type 'struct platform_device'
     899 |                 of_iounmap(&op->resource[0], amd->regs,
         |                               ^~
   sound/sparc/amd7930.c:900:45: error: invalid use of undefined type 'struct platform_device'
     900 |                            resource_size(&op->resource[0]));
         |                                             ^~
   sound/sparc/amd7930.c: In function 'snd_amd7930_create':
   sound/sparc/amd7930.c:936:35: error: invalid use of undefined type 'struct platform_device'
     936 |         amd->regs = of_ioremap(&op->resource[0], 0,
         |                                   ^~
   sound/sparc/amd7930.c:937:49: error: invalid use of undefined type 'struct platform_device'
     937 |                                resource_size(&op->resource[0]), "amd7930");
         |                                                 ^~
   sound/sparc/amd7930.c: In function 'amd7930_sbus_probe':
   sound/sparc/amd7930.c:991:34: error: invalid use of undefined type 'struct platform_device'
     991 |         struct resource *rp = &op->resource[0];
         |                                  ^~
   sound/sparc/amd7930.c:997:17: error: invalid use of undefined type 'struct platform_device'
     997 |         irq = op->archdata.irqs[0];
         |                 ^~
   sound/sparc/amd7930.c:1006:31: error: invalid use of undefined type 'struct platform_device'
    1006 |         err = snd_card_new(&op->dev, index[dev_num], id[dev_num],
         |                               ^~
   sound/sparc/amd7930.c: At top level:
   sound/sparc/amd7930.c:1055:15: error: variable 'amd7930_sbus_driver' has initializer but incomplete type
    1055 | static struct platform_driver amd7930_sbus_driver = {
         |               ^~~~~~~~~~~~~~~
   sound/sparc/amd7930.c:1056:10: error: 'struct platform_driver' has no member named 'driver'
    1056 |         .driver = {
         |          ^~~~~~
   sound/sparc/amd7930.c:1056:19: error: extra brace group at end of initializer
    1056 |         .driver = {
         |                   ^
   sound/sparc/amd7930.c:1056:19: note: (near initialization for 'amd7930_sbus_driver')
>> sound/sparc/amd7930.c:1056:19: warning: excess elements in struct initializer
   sound/sparc/amd7930.c:1056:19: note: (near initialization for 'amd7930_sbus_driver')
   sound/sparc/amd7930.c:1060:10: error: 'struct platform_driver' has no member named 'probe'
    1060 |         .probe          = amd7930_sbus_probe,
         |          ^~~~~
   sound/sparc/amd7930.c:1060:27: warning: excess elements in struct initializer
    1060 |         .probe          = amd7930_sbus_probe,
         |                           ^~~~~~~~~~~~~~~~~~
   sound/sparc/amd7930.c:1060:27: note: (near initialization for 'amd7930_sbus_driver')
   sound/sparc/amd7930.c: In function 'amd7930_init':
   sound/sparc/amd7930.c:1065:16: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
    1065 |         return platform_driver_register(&amd7930_sbus_driver);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/sparc/amd7930.c: In function 'amd7930_exit':
   sound/sparc/amd7930.c:1082:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
    1082 |         platform_driver_unregister(&amd7930_sbus_driver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   sound/sparc/amd7930.c: At top level:
   sound/sparc/amd7930.c:1055:31: error: storage size of 'amd7930_sbus_driver' isn't known
    1055 | static struct platform_driver amd7930_sbus_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/sparc/cs4231.c:1231:49: error: invalid use of undefined type 'struct platform_device'
    1231 |                                        &chip->op->dev, 64 * 1024, 128 * 1024);
         |                                                 ^~
   sound/sparc/cs4231.c: In function 'cs4231_attach_begin':
   sound/sparc/cs4231.c:1558:31: error: invalid use of undefined type 'struct platform_device'
    1558 |         err = snd_card_new(&op->dev, index[dev], id[dev], THIS_MODULE,
         |                               ^~
   sound/sparc/cs4231.c: In function 'cs4231_attach_finish':
   sound/sparc/cs4231.c:1594:34: error: invalid use of undefined type 'struct platform_device'
    1594 |         dev_set_drvdata(&chip->op->dev, chip);
         |                                  ^~
   sound/sparc/cs4231.c: In function 'snd_cs4231_sbus_free':
   sound/sparc/cs4231.c:1761:31: error: invalid use of undefined type 'struct platform_device'
    1761 |                 of_iounmap(&op->resource[0], chip->port, chip->regs_size);
         |                               ^~
   sound/sparc/cs4231.c: In function 'snd_cs4231_sbus_create':
   sound/sparc/cs4231.c:1790:44: error: invalid use of undefined type 'struct platform_device'
    1790 |         chip->regs_size = resource_size(&op->resource[0]);
         |                                            ^~
   sound/sparc/cs4231.c:1794:36: error: invalid use of undefined type 'struct platform_device'
    1794 |         chip->port = of_ioremap(&op->resource[0], 0,
         |                                    ^~
   sound/sparc/cs4231.c:1816:27: error: invalid use of undefined type 'struct platform_device'
    1816 |         if (request_irq(op->archdata.irqs[0], snd_cs4231_sbus_interrupt,
         |                           ^~
   In file included from sound/sparc/cs4231.c:23:
   sound/sparc/cs4231.c:1819:36: error: invalid use of undefined type 'struct platform_device'
    1819 |                             dev, op->archdata.irqs[0]);
         |                                    ^~
   include/sound/core.h:437:55: note: in definition of macro 'snd_printdd'
     437 |         __snd_printk(2, __FILE__, __LINE__, format, ##__VA_ARGS__)
         |                                                       ^~~~~~~~~~~
   sound/sparc/cs4231.c:1823:26: error: invalid use of undefined type 'struct platform_device'
    1823 |         chip->irq[0] = op->archdata.irqs[0];
         |                          ^~
   sound/sparc/cs4231.c: In function 'cs4231_sbus_probe':
   sound/sparc/cs4231.c:1843:34: error: invalid use of undefined type 'struct platform_device'
    1843 |         struct resource *rp = &op->resource[0];
         |                                  ^~
   sound/sparc/cs4231.c:1855:19: error: invalid use of undefined type 'struct platform_device'
    1855 |                 op->archdata.irqs[0]);
         |                   ^~
   sound/sparc/cs4231.c: In function 'snd_cs4231_ebus_free':
   sound/sparc/cs4231.c:1920:31: error: invalid use of undefined type 'struct platform_device'
    1920 |                 of_iounmap(&op->resource[2], chip->c_dma.ebus_info.regs, 0x10);
         |                               ^~
   sound/sparc/cs4231.c:1924:31: error: invalid use of undefined type 'struct platform_device'
    1924 |                 of_iounmap(&op->resource[1], chip->p_dma.ebus_info.regs, 0x10);
         |                               ^~
   sound/sparc/cs4231.c:1928:31: error: invalid use of undefined type 'struct platform_device'
    1928 |                 of_iounmap(&op->resource[0], chip->port, 0x10);
         |                               ^~
   sound/sparc/cs4231.c: In function 'snd_cs4231_ebus_create':
   sound/sparc/cs4231.c:1964:39: error: invalid use of undefined type 'struct platform_device'
    1964 |         chip->c_dma.ebus_info.irq = op->archdata.irqs[0];
         |                                       ^~
   sound/sparc/cs4231.c:1969:39: error: invalid use of undefined type 'struct platform_device'
    1969 |         chip->p_dma.ebus_info.irq = op->archdata.irqs[1];
         |                                       ^~
   sound/sparc/cs4231.c:1981:36: error: invalid use of undefined type 'struct platform_device'
    1981 |         chip->port = of_ioremap(&op->resource[0], 0, 0x10, "cs4231");
         |                                    ^~
   sound/sparc/cs4231.c:1983:31: error: invalid use of undefined type 'struct platform_device'
    1983 |                 of_ioremap(&op->resource[1], 0, 0x10, "cs4231_pdma");
         |                               ^~
   sound/sparc/cs4231.c:1985:31: error: invalid use of undefined type 'struct platform_device'
    1985 |                 of_ioremap(&op->resource[2], 0, 0x10, "cs4231_cdma");
         |                               ^~
   sound/sparc/cs4231.c: In function 'cs4231_ebus_probe':
   sound/sparc/cs4231.c:2045:19: error: invalid use of undefined type 'struct platform_device'
    2045 |                 op->resource[0].start,
         |                   ^~
   sound/sparc/cs4231.c:2046:19: error: invalid use of undefined type 'struct platform_device'
    2046 |                 op->archdata.irqs[0]);
         |                   ^~
   sound/sparc/cs4231.c: In function 'cs4231_probe':
   sound/sparc/cs4231.c:2061:31: error: invalid use of undefined type 'struct platform_device'
    2061 |         if (of_node_name_eq(op->dev.of_node->parent, "ebus"))
         |                               ^~
   sound/sparc/cs4231.c:2065:31: error: invalid use of undefined type 'struct platform_device'
    2065 |         if (of_node_name_eq(op->dev.of_node->parent, "sbus") ||
         |                               ^~
   sound/sparc/cs4231.c:2066:31: error: invalid use of undefined type 'struct platform_device'
    2066 |             of_node_name_eq(op->dev.of_node->parent, "sbi"))
         |                               ^~
   sound/sparc/cs4231.c: In function 'cs4231_remove':
   sound/sparc/cs4231.c:2074:54: error: invalid use of undefined type 'struct platform_device'
    2074 |         struct snd_cs4231 *chip = dev_get_drvdata(&op->dev);
         |                                                      ^~
   sound/sparc/cs4231.c: At top level:
   sound/sparc/cs4231.c:2092:15: error: variable 'cs4231_driver' has initializer but incomplete type
    2092 | static struct platform_driver cs4231_driver = {
         |               ^~~~~~~~~~~~~~~
   sound/sparc/cs4231.c:2093:10: error: 'struct platform_driver' has no member named 'driver'
    2093 |         .driver = {
         |          ^~~~~~
   sound/sparc/cs4231.c:2093:19: error: extra brace group at end of initializer
    2093 |         .driver = {
         |                   ^
   sound/sparc/cs4231.c:2093:19: note: (near initialization for 'cs4231_driver')
>> sound/sparc/cs4231.c:2093:19: warning: excess elements in struct initializer
   sound/sparc/cs4231.c:2093:19: note: (near initialization for 'cs4231_driver')
   sound/sparc/cs4231.c:2097:10: error: 'struct platform_driver' has no member named 'probe'
    2097 |         .probe          = cs4231_probe,
         |          ^~~~~
   sound/sparc/cs4231.c:2097:27: warning: excess elements in struct initializer
    2097 |         .probe          = cs4231_probe,
         |                           ^~~~~~~~~~~~
   sound/sparc/cs4231.c:2097:27: note: (near initialization for 'cs4231_driver')
   sound/sparc/cs4231.c:2098:10: error: 'struct platform_driver' has no member named 'remove_new'
    2098 |         .remove_new     = cs4231_remove,
         |          ^~~~~~~~~~
   sound/sparc/cs4231.c:2098:27: warning: excess elements in struct initializer
    2098 |         .remove_new     = cs4231_remove,
         |                           ^~~~~~~~~~~~~
   sound/sparc/cs4231.c:2098:27: note: (near initialization for 'cs4231_driver')
>> sound/sparc/cs4231.c:2101:1: warning: data definition has no type or storage class
    2101 | module_platform_driver(cs4231_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   sound/sparc/cs4231.c:2101:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> sound/sparc/cs4231.c:2101:1: warning: parameter names (without types) in function declaration
   sound/sparc/cs4231.c:2092:31: error: storage size of 'cs4231_driver' isn't known
    2092 | static struct platform_driver cs4231_driver = {
         |                               ^~~~~~~~~~~~~
   sound/sparc/cs4231.c:2092:31: warning: 'cs4231_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
..


vim +668 drivers/atm/fore200e.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  665  
826b6cfcd5d4c3 David S. Miller   2008-08-27  666  static int __init fore200e_sba_map(struct fore200e *fore200e)
^1da177e4c3f41 Linus Torvalds    2005-04-16  667  {
aff9d262fbf021 Christoph Hellwig 2018-10-09 @668  	struct platform_device *op = to_platform_device(fore200e->dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  669  	unsigned int bursts;
^1da177e4c3f41 Linus Torvalds    2005-04-16  670  
^1da177e4c3f41 Linus Torvalds    2005-04-16  671  	/* gain access to the SBA specific registers  */
826b6cfcd5d4c3 David S. Miller   2008-08-27  672  	fore200e->regs.sba.hcr = of_ioremap(&op->resource[0], 0, SBA200E_HCR_LENGTH, "SBA HCR");
826b6cfcd5d4c3 David S. Miller   2008-08-27  673  	fore200e->regs.sba.bsr = of_ioremap(&op->resource[1], 0, SBA200E_BSR_LENGTH, "SBA BSR");
826b6cfcd5d4c3 David S. Miller   2008-08-27  674  	fore200e->regs.sba.isr = of_ioremap(&op->resource[2], 0, SBA200E_ISR_LENGTH, "SBA ISR");
826b6cfcd5d4c3 David S. Miller   2008-08-27  675  	fore200e->virt_base    = of_ioremap(&op->resource[3], 0, SBA200E_RAM_LENGTH, "SBA RAM");
^1da177e4c3f41 Linus Torvalds    2005-04-16  676  
826b6cfcd5d4c3 David S. Miller   2008-08-27  677  	if (!fore200e->virt_base) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  678  		printk(FORE200E "unable to map RAM of device %s\n", fore200e->name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  679  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  680  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  681  
^1da177e4c3f41 Linus Torvalds    2005-04-16  682  	DPRINTK(1, "device %s mapped to 0x%p\n", fore200e->name, fore200e->virt_base);
^1da177e4c3f41 Linus Torvalds    2005-04-16  683      
^1da177e4c3f41 Linus Torvalds    2005-04-16  684  	fore200e->bus->write(0x02, fore200e->regs.sba.isr); /* XXX hardwired interrupt level */
^1da177e4c3f41 Linus Torvalds    2005-04-16  685  
^1da177e4c3f41 Linus Torvalds    2005-04-16  686  	/* get the supported DVMA burst sizes */
61c7a080a5a061 Grant Likely      2010-04-13  687  	bursts = of_getintprop_default(op->dev.of_node->parent, "burst-sizes", 0x00);
^1da177e4c3f41 Linus Torvalds    2005-04-16  688  
63237eeb5ac92d David S. Miller   2008-08-26  689  	if (sbus_can_dma_64bit())
826b6cfcd5d4c3 David S. Miller   2008-08-27  690  		sbus_set_sbus64(&op->dev, bursts);
^1da177e4c3f41 Linus Torvalds    2005-04-16  691  
^1da177e4c3f41 Linus Torvalds    2005-04-16  692  	fore200e->state = FORE200E_STATE_MAP;
^1da177e4c3f41 Linus Torvalds    2005-04-16  693  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  694  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  695  

:::::: The code at line 668 was first introduced by commit
:::::: aff9d262fbf02184f1b79b264f29e9ae0bc1b77b fore200e: store a struct device in struct fore200e

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
