Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780086FA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689315807; x=1720851807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z93HUa1fsSzE4uDRbDZk2wRo1u9tQaOJ+DnxtwnJgjo=;
  b=WDL+Q5PQQoWyyDwBt4cWWu3Qu7oUMJ0EJC1SyXvC5oRYGVSyw5iuXP5J
   XDKXCujGnGOVfMpRDpMivktbETs97UXt/sPP3MJtMhEMz876YMTtRiP+U
   P+sSaW3QXQQylvc3u2gOHQ8mTOMxwRwPNIEFODqadHLWU0utiHMRsxj1i
   SH97X6Lg6BZ4vexK+GJm8Kw21UpIAy2noHZbCy28A5Eq590fA82ZSth64
   qO/qh/g0GYAadyQO40wTmxGwQUChWbkhaH1R5VesHUH/PvoUedlfDPEa5
   /qnHjhBNhuydI60rrdPOQRmIkUGP1lqB/WLZaW+4GadRme2IabNa00+uO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451766773"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451766773"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="846352670"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="846352670"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Jul 2023 23:23:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKCD5-0007ET-1K;
	Fri, 14 Jul 2023 06:23:23 +0000
Date: Fri, 14 Jul 2023 14:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 52/106] drivers/mfd/mt6397-irq.c:20:38: error:
 implicit declaration of function 'irq_data_get_irq_chip_data'; did you mean
 'irq_domain_get_irq_data'?
Message-ID: <202307141428.K4V6vZlg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   6d526c484caa62c36428fc20236387f34d8f5c75
commit: 0ca6cbf5634cd93732f504c66a8f8802d87de80e [52/106] mfd: Explicitly include correct DT includes
config: sparc64-randconfig-r024-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141428.K4V6vZlg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141428.K4V6vZlg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141428.K4V6vZlg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_lock':
>> drivers/mfd/mt6397-irq.c:20:38: error: implicit declaration of function 'irq_data_get_irq_chip_data'; did you mean 'irq_domain_get_irq_data'? [-Werror=implicit-function-declaration]
      20 |         struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      irq_domain_get_irq_data
>> drivers/mfd/mt6397-irq.c:20:38: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_sync_unlock':
   drivers/mfd/mt6397-irq.c:27:38: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      27 |         struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_disable':
   drivers/mfd/mt6397-irq.c:39:38: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      39 |         struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6397-irq.c:40:25: error: invalid use of undefined type 'struct irq_data'
      40 |         int shift = data->hwirq & 0xf;
         |                         ^~
   drivers/mfd/mt6397-irq.c:41:23: error: invalid use of undefined type 'struct irq_data'
      41 |         int reg = data->hwirq >> 4;
         |                       ^~
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_enable':
   drivers/mfd/mt6397-irq.c:48:38: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      48 |         struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:49:25: error: invalid use of undefined type 'struct irq_data'
      49 |         int shift = data->hwirq & 0xf;
         |                         ^~
   drivers/mfd/mt6397-irq.c:50:23: error: invalid use of undefined type 'struct irq_data'
      50 |         int reg = data->hwirq >> 4;
         |                       ^~
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_set_wake':
   drivers/mfd/mt6397-irq.c:57:38: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      57 |         struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:58:29: error: invalid use of undefined type 'struct irq_data'
      58 |         int shift = irq_data->hwirq & 0xf;
         |                             ^~
   drivers/mfd/mt6397-irq.c:59:27: error: invalid use of undefined type 'struct irq_data'
      59 |         int reg = irq_data->hwirq >> 4;
         |                           ^~
   drivers/mfd/mt6397-irq.c: At top level:
>> drivers/mfd/mt6397-irq.c:69:15: error: variable 'mt6397_irq_chip' has initializer but incomplete type
      69 | static struct irq_chip mt6397_irq_chip = {
         |               ^~~~~~~~
>> drivers/mfd/mt6397-irq.c:70:10: error: 'struct irq_chip' has no member named 'name'
      70 |         .name = "mt6397-irq",
         |          ^~~~
>> drivers/mfd/mt6397-irq.c:70:17: warning: excess elements in struct initializer
      70 |         .name = "mt6397-irq",
         |                 ^~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:70:17: note: (near initialization for 'mt6397_irq_chip')
>> drivers/mfd/mt6397-irq.c:71:10: error: 'struct irq_chip' has no member named 'irq_bus_lock'
      71 |         .irq_bus_lock = mt6397_irq_lock,
         |          ^~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:71:25: warning: excess elements in struct initializer
      71 |         .irq_bus_lock = mt6397_irq_lock,
         |                         ^~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:71:25: note: (near initialization for 'mt6397_irq_chip')
>> drivers/mfd/mt6397-irq.c:72:10: error: 'struct irq_chip' has no member named 'irq_bus_sync_unlock'
      72 |         .irq_bus_sync_unlock = mt6397_irq_sync_unlock,
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:72:32: warning: excess elements in struct initializer
      72 |         .irq_bus_sync_unlock = mt6397_irq_sync_unlock,
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:72:32: note: (near initialization for 'mt6397_irq_chip')
>> drivers/mfd/mt6397-irq.c:73:10: error: 'struct irq_chip' has no member named 'irq_enable'
      73 |         .irq_enable = mt6397_irq_enable,
         |          ^~~~~~~~~~
   drivers/mfd/mt6397-irq.c:73:23: warning: excess elements in struct initializer
      73 |         .irq_enable = mt6397_irq_enable,
         |                       ^~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:73:23: note: (near initialization for 'mt6397_irq_chip')
>> drivers/mfd/mt6397-irq.c:74:10: error: 'struct irq_chip' has no member named 'irq_disable'
      74 |         .irq_disable = mt6397_irq_disable,
         |          ^~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:74:24: warning: excess elements in struct initializer
      74 |         .irq_disable = mt6397_irq_disable,
         |                        ^~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:74:24: note: (near initialization for 'mt6397_irq_chip')
>> drivers/mfd/mt6397-irq.c:75:10: error: 'struct irq_chip' has no member named 'irq_set_wake'
      75 |         .irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
         |          ^~~~~~~~~~~~
   In file included from include/linux/interrupt.h:6,
                    from drivers/mfd/mt6397-irq.c:5:
>> include/linux/kernel.h:58:33: warning: excess elements in struct initializer
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/mfd/mt6397-irq.c:75:25: note: in expansion of macro 'pm_sleep_ptr'
      75 |         .irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
         |                         ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'mt6397_irq_chip')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/mfd/mt6397-irq.c:75:25: note: in expansion of macro 'pm_sleep_ptr'
      75 |         .irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
         |                         ^~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_handle_reg':
>> drivers/mfd/mt6397-irq.c:94:33: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
      94 |                                 handle_nested_irq(irq);
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c: In function 'mt6397_irq_domain_map':
>> drivers/mfd/mt6397-irq.c:116:9: error: implicit declaration of function 'irq_set_chip_data'; did you mean 'irq_set_irqchip_state'? [-Werror=implicit-function-declaration]
     116 |         irq_set_chip_data(irq, mt6397);
         |         ^~~~~~~~~~~~~~~~~
         |         irq_set_irqchip_state
>> drivers/mfd/mt6397-irq.c:117:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
     117 |         irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6397-irq.c:117:57: error: 'handle_level_irq' undeclared (first use in this function)
     117 |         irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
         |                                                         ^~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:117:57: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/mfd/mt6397-irq.c:118:9: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
     118 |         irq_set_nested_thread(irq, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6397-irq.c:119:9: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
     119 |         irq_set_noprobe(irq);
         |         ^~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c: At top level:
>> drivers/mfd/mt6397-irq.c:69:24: error: storage size of 'mt6397_irq_chip' isn't known
      69 | static struct irq_chip mt6397_irq_chip = {
         |                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/mfd/mt6358-irq.c: In function 'pmic_irq_enable':
>> drivers/mfd/mt6358-irq.c:76:30: error: implicit declaration of function 'irqd_to_hwirq' [-Werror=implicit-function-declaration]
      76 |         unsigned int hwirq = irqd_to_hwirq(data);
         |                              ^~~~~~~~~~~~~
>> drivers/mfd/mt6358-irq.c:77:36: error: implicit declaration of function 'irq_data_get_irq_chip_data'; did you mean 'irq_domain_get_irq_data'? [-Werror=implicit-function-declaration]
      77 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    irq_domain_get_irq_data
>> drivers/mfd/mt6358-irq.c:77:36: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/mfd/mt6358-irq.c: In function 'pmic_irq_disable':
   drivers/mfd/mt6358-irq.c:86:36: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      86 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c: In function 'pmic_irq_lock':
   drivers/mfd/mt6358-irq.c:94:36: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      94 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c: In function 'pmic_irq_sync_unlock':
   drivers/mfd/mt6358-irq.c:102:36: warning: initialization of 'struct mt6397_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     102 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c: At top level:
>> drivers/mfd/mt6358-irq.c:130:15: error: variable 'mt6358_irq_chip' has initializer but incomplete type
     130 | static struct irq_chip mt6358_irq_chip = {
         |               ^~~~~~~~
>> drivers/mfd/mt6358-irq.c:131:10: error: 'struct irq_chip' has no member named 'name'
     131 |         .name = "mt6358-irq",
         |          ^~~~
>> drivers/mfd/mt6358-irq.c:131:17: warning: excess elements in struct initializer
     131 |         .name = "mt6358-irq",
         |                 ^~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:131:17: note: (near initialization for 'mt6358_irq_chip')
>> drivers/mfd/mt6358-irq.c:132:10: error: 'struct irq_chip' has no member named 'flags'
     132 |         .flags = IRQCHIP_SKIP_SET_WAKE,
         |          ^~~~~
>> drivers/mfd/mt6358-irq.c:132:18: error: 'IRQCHIP_SKIP_SET_WAKE' undeclared here (not in a function)
     132 |         .flags = IRQCHIP_SKIP_SET_WAKE,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:132:18: warning: excess elements in struct initializer
   drivers/mfd/mt6358-irq.c:132:18: note: (near initialization for 'mt6358_irq_chip')
>> drivers/mfd/mt6358-irq.c:133:10: error: 'struct irq_chip' has no member named 'irq_enable'
     133 |         .irq_enable = pmic_irq_enable,
         |          ^~~~~~~~~~
   drivers/mfd/mt6358-irq.c:133:23: warning: excess elements in struct initializer
     133 |         .irq_enable = pmic_irq_enable,
         |                       ^~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:133:23: note: (near initialization for 'mt6358_irq_chip')
>> drivers/mfd/mt6358-irq.c:134:10: error: 'struct irq_chip' has no member named 'irq_disable'
     134 |         .irq_disable = pmic_irq_disable,
         |          ^~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:134:24: warning: excess elements in struct initializer
     134 |         .irq_disable = pmic_irq_disable,
         |                        ^~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:134:24: note: (near initialization for 'mt6358_irq_chip')
>> drivers/mfd/mt6358-irq.c:135:10: error: 'struct irq_chip' has no member named 'irq_bus_lock'
     135 |         .irq_bus_lock = pmic_irq_lock,
         |          ^~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:135:25: warning: excess elements in struct initializer
     135 |         .irq_bus_lock = pmic_irq_lock,
         |                         ^~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:135:25: note: (near initialization for 'mt6358_irq_chip')
>> drivers/mfd/mt6358-irq.c:136:10: error: 'struct irq_chip' has no member named 'irq_bus_sync_unlock'
     136 |         .irq_bus_sync_unlock = pmic_irq_sync_unlock,
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:136:32: warning: excess elements in struct initializer
     136 |         .irq_bus_sync_unlock = pmic_irq_sync_unlock,
         |                                ^~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:136:32: note: (near initialization for 'mt6358_irq_chip')
   drivers/mfd/mt6358-irq.c: In function 'mt6358_irq_sp_handler':
>> drivers/mfd/mt6358-irq.c:170:33: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
     170 |                                 handle_nested_irq(virq);
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c: In function 'pmic_irq_domain_map':
>> drivers/mfd/mt6358-irq.c:213:9: error: implicit declaration of function 'irq_set_chip_data'; did you mean 'irq_set_irqchip_state'? [-Werror=implicit-function-declaration]
     213 |         irq_set_chip_data(irq, mt6397);
         |         ^~~~~~~~~~~~~~~~~
         |         irq_set_irqchip_state
>> drivers/mfd/mt6358-irq.c:214:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
     214 |         irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6358-irq.c:214:57: error: 'handle_level_irq' undeclared (first use in this function)
     214 |         irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
         |                                                         ^~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:214:57: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/mfd/mt6358-irq.c:215:9: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
     215 |         irq_set_nested_thread(irq, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6358-irq.c:216:9: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
     216 |         irq_set_noprobe(irq);
         |         ^~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c: In function 'mt6358_irq_init':
>> drivers/mfd/mt6358-irq.c:284:56: error: invalid use of undefined type 'struct irq_chip'
     284 |                                         mt6358_irq_chip.name, chip);
         |                                                        ^
   drivers/mfd/mt6358-irq.c: At top level:
>> drivers/mfd/mt6358-irq.c:130:24: error: storage size of 'mt6358_irq_chip' isn't known
     130 | static struct irq_chip mt6358_irq_chip = {
         |                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +20 drivers/mfd/mt6397-irq.c

a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   17  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   18  static void mt6397_irq_lock(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   19  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @20  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   21  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   22  	mutex_lock(&mt6397->irqlock);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   23  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   24  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   25  static void mt6397_irq_sync_unlock(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   26  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   27  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   28  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   29  	regmap_write(mt6397->regmap, mt6397->int_con[0],
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   30  		     mt6397->irq_masks_cur[0]);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   31  	regmap_write(mt6397->regmap, mt6397->int_con[1],
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   32  		     mt6397->irq_masks_cur[1]);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   33  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   34  	mutex_unlock(&mt6397->irqlock);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   35  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   36  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   37  static void mt6397_irq_disable(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   38  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   39  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @40  	int shift = data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   41  	int reg = data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   42  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   43  	mt6397->irq_masks_cur[reg] &= ~BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   44  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   45  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   46  static void mt6397_irq_enable(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   47  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   48  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   49  	int shift = data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   50  	int reg = data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   51  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   52  	mt6397->irq_masks_cur[reg] |= BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   53  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   54  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   55  static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   56  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   57  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @58  	int shift = irq_data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @59  	int reg = irq_data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   60  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   61  	if (on)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   62  		mt6397->wake_mask[reg] |= BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   63  	else
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   64  		mt6397->wake_mask[reg] &= ~BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   65  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   66  	return 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   67  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   68  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @69  static struct irq_chip mt6397_irq_chip = {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @70  	.name = "mt6397-irq",
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @71  	.irq_bus_lock = mt6397_irq_lock,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @72  	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @73  	.irq_enable = mt6397_irq_enable,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @74  	.irq_disable = mt6397_irq_disable,
e1243e0d72185c Paul Cercueil    2022-10-23  @75  	.irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   76  };
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   77  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   78  static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   79  				  int irqbase)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   80  {
4e2e7cfec13afa Hsin-Hsiung Wang 2020-04-21   81  	unsigned int status = 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   82  	int i, irq, ret;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   83  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   84  	ret = regmap_read(mt6397->regmap, reg, &status);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   85  	if (ret) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   86  		dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   87  		return;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   88  	}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   89  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   90  	for (i = 0; i < 16; i++) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   91  		if (status & BIT(i)) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   92  			irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   93  			if (irq)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @94  				handle_nested_irq(irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   95  		}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   96  	}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   97  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   98  	regmap_write(mt6397->regmap, reg, status);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   99  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  100  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  101  static irqreturn_t mt6397_irq_thread(int irq, void *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  102  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  103  	struct mt6397_chip *mt6397 = data;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  104  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  105  	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  106  	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  107  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  108  	return IRQ_HANDLED;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  109  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  110  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  111  static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  112  				 irq_hw_number_t hw)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  113  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  114  	struct mt6397_chip *mt6397 = d->host_data;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  115  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05 @116  	irq_set_chip_data(irq, mt6397);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05 @117  	irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05 @118  	irq_set_nested_thread(irq, 1);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05 @119  	irq_set_noprobe(irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  120  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  121  	return 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  122  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  123  

:::::: The code at line 20 was first introduced by commit
:::::: a4872e80ce7d2a1844328176dbf279d0a2b89bdb mfd: mt6397: Extract IRQ related code from core driver

:::::: TO: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
