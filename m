Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F52A17D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 05:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682660782; x=1714196782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1Nao8m84M8eOfx2hMGyO7NEYBSzEms2mR7BdClpfvc=;
  b=CQsDvaLAgp4xQrLILgYmZvpC1VZLyXBkEgOmuDyzv/XZEMNrcjE1aJhb
   1Vpw1/ISYPVx2XNnCNDb2zuMysYm52TUf79RWikOF3WtItS3JwYAt8+TB
   Mz3FYoaZHIYusnXHsTDltr8Mu/7dTS7RLuSL0p4Wqak6D4LwwCIWbnAsQ
   X3bngBu6Gvm6d0YjmUni6ssoWPbZF5hwnpxoNSZN4dzubpS7T2dg8R9+h
   xYSrczN0tWB4m2+U15x1WpSP99IlypfAMdFiz0rVs6wAX/hd3lofMWz7h
   f1qdI/dzSkoEgCG9Q7EAsa62z4SEtvwLVzBs6//XSBlUSNraS1i/7JzHQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413040401"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="413040401"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 22:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806251620"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="806251620"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 22:46:20 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psGvz-00009t-2S;
	Fri, 28 Apr 2023 05:46:19 +0000
Date: Fri, 28 Apr 2023 13:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/57]
 drivers/pinctrl/pinctrl-at91.c:1290:41: warning: 'struct platform_device'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202304281306.atKiaQqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: a581a78403b6af4ee0aa9c6ee6701e92dc2555f6 [55/57] Use of_device_get_match_data
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304281306.atKiaQqi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/bus/ drivers/cpufreq/ drivers/crypto/stm32/ drivers/edac/ drivers/gpu/drm/armada/ drivers/gpu/drm/omapdrm/ drivers/gpu/drm/sti/ drivers/hsi/controllers/ drivers/memory/tegra/ drivers/mtd/maps/ drivers/pinctrl/ drivers/power/reset/ drivers/remoteproc/ drivers/reset/sti/ drivers/soc/tegra/fuse/ drivers/soc/ti/ drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281306.atKiaQqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-at91.c:1290:41: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1290 | static int at91_pinctrl_probe_dt(struct platform_device *pdev,
         |                                         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_probe_dt':
   drivers/pinctrl/pinctrl-at91.c:1296:38: error: invalid use of undefined type 'struct platform_device'
    1296 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/pinctrl/pinctrl-at91.c:1302:26: error: invalid use of undefined type 'struct platform_device'
    1302 |         info->dev = &pdev->dev;
         |                          ^~
   drivers/pinctrl/pinctrl-at91.c:1304:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
    1304 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
   drivers/pinctrl/pinctrl-at91.c:1304:61: error: invalid use of undefined type 'struct platform_device'
    1304 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                                                             ^~
   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:29,
                    from include/linux/clk.h:13,
                    from drivers/pinctrl/pinctrl-at91.c:8:
   drivers/pinctrl/pinctrl-at91.c:1323:22: error: invalid use of undefined type 'struct platform_device'
    1323 |         dev_dbg(&pdev->dev, "nmux = %d\n", info->nmux);
         |                      ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1323:9: note: in expansion of macro 'dev_dbg'
    1323 |         dev_dbg(&pdev->dev, "nmux = %d\n", info->nmux);
         |         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1325:22: error: invalid use of undefined type 'struct platform_device'
    1325 |         dev_dbg(&pdev->dev, "mux-mask\n");
         |                      ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1325:9: note: in expansion of macro 'dev_dbg'
    1325 |         dev_dbg(&pdev->dev, "mux-mask\n");
         |         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1329:38: error: invalid use of undefined type 'struct platform_device'
    1329 |                         dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
         |                                      ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1329:25: note: in expansion of macro 'dev_dbg'
    1329 |                         dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
         |                         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1333:22: error: invalid use of undefined type 'struct platform_device'
    1333 |         dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
         |                      ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1333:9: note: in expansion of macro 'dev_dbg'
    1333 |         dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
         |         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1334:22: error: invalid use of undefined type 'struct platform_device'
    1334 |         dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
         |                      ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
--
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1351:9: note: in expansion of macro 'dev_dbg'
    1351 |         dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
         |         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/gpio/driver.h:5,
                    from drivers/pinctrl/pinctrl-at91.c:10:
   drivers/pinctrl/pinctrl-at91.c:1360:38: error: invalid use of undefined type 'struct platform_device'
    1360 |                         dev_err(&pdev->dev, "failed to parse function\n");
         |                                      ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1360:25: note: in expansion of macro 'dev_err'
    1360 |                         dev_err(&pdev->dev, "failed to parse function\n");
         |                         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c: At top level:
   drivers/pinctrl/pinctrl-at91.c:1369:38: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1369 | static int at91_pinctrl_probe(struct platform_device *pdev)
         |                                      ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_probe':
   drivers/pinctrl/pinctrl-at91.c:1375:34: error: invalid use of undefined type 'struct platform_device'
    1375 |         info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
         |                                  ^~
   drivers/pinctrl/pinctrl-at91.c:1379:37: error: passing argument 1 of 'at91_pinctrl_probe_dt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1379 |         ret = at91_pinctrl_probe_dt(pdev, info);
         |                                     ^~~~
         |                                     |
         |                                     struct platform_device *
   drivers/pinctrl/pinctrl-at91.c:1290:58: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1290 | static int at91_pinctrl_probe_dt(struct platform_device *pdev,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/pinctrl/pinctrl-at91.c:1383:48: error: invalid use of undefined type 'struct platform_device'
    1383 |         at91_pinctrl_desc.name = dev_name(&pdev->dev);
         |                                                ^~
   drivers/pinctrl/pinctrl-at91.c:1386:35: error: invalid use of undefined type 'struct platform_device'
    1386 |                 devm_kcalloc(&pdev->dev,
         |                                   ^~
   drivers/pinctrl/pinctrl-at91.c:1401:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
    1401 |         platform_set_drvdata(pdev, info);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1402:49: error: invalid use of undefined type 'struct platform_device'
    1402 |         info->pctl = devm_pinctrl_register(&pdev->dev, &at91_pinctrl_desc,
         |                                                 ^~
   drivers/pinctrl/pinctrl-at91.c:1406:30: error: invalid use of undefined type 'struct platform_device'
    1406 |                 dev_err(&pdev->dev, "could not register AT91 pinctrl driver\n");
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1406:17: note: in expansion of macro 'dev_err'
    1406 |                 dev_err(&pdev->dev, "could not register AT91 pinctrl driver\n");
         |                 ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1415:23: error: invalid use of undefined type 'struct platform_device'
    1415 |         dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
         |                       ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1415:9: note: in expansion of macro 'dev_info'
    1415 |         dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
         |         ^~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: At top level:
   drivers/pinctrl/pinctrl-at91.c:1703:42: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1703 | static int at91_gpio_of_irq_setup(struct platform_device *pdev,
         |                                          ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_gpio_of_irq_setup':
   drivers/pinctrl/pinctrl-at91.c:1713:42: error: invalid use of undefined type 'struct platform_device'
    1713 |         gpio_irqchip = devm_kzalloc(&pdev->dev, sizeof(*gpio_irqchip),
         |                                          ^~
   drivers/pinctrl/pinctrl-at91.c:1750:51: error: invalid use of undefined type 'struct platform_device'
    1750 |                 girq->parents = devm_kcalloc(&pdev->dev, 1,
         |                                                   ^~
   drivers/pinctrl/pinctrl-at91.c: At top level:
   drivers/pinctrl/pinctrl-at91.c:1795:35: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1795 | static int at91_gpio_probe(struct platform_device *pdev)
         |                                   ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_gpio_probe':
   drivers/pinctrl/pinctrl-at91.c:1797:38: error: invalid use of undefined type 'struct platform_device'
    1797 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/pinctrl/pinctrl-at91.c:1813:15: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
    1813 |         irq = platform_get_irq(pdev, 0);
         |               ^~~~~~~~~~~~~~~~
         |               platform_notify
   drivers/pinctrl/pinctrl-at91.c:1819:39: error: invalid use of undefined type 'struct platform_device'
    1819 |         at91_chip = devm_kzalloc(&pdev->dev, sizeof(*at91_chip), GFP_KERNEL);
         |                                       ^~
   drivers/pinctrl/pinctrl-at91.c:1825:30: error: implicit declaration of function 'devm_platform_ioremap_resource'; did you mean 'devm_ioremap_resource'? [-Werror=implicit-function-declaration]
    1825 |         at91_chip->regbase = devm_platform_ioremap_resource(pdev, 0);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              devm_ioremap_resource
>> drivers/pinctrl/pinctrl-at91.c:1825:28: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1825 |         at91_chip->regbase = devm_platform_ioremap_resource(pdev, 0);
         |                            ^
   drivers/pinctrl/pinctrl-at91.c:1831:56: error: invalid use of undefined type 'struct platform_device'
    1831 |         at91_chip->ops = of_device_get_match_data(&pdev->dev);
         |                                                        ^~
   drivers/pinctrl/pinctrl-at91.c:1835:46: error: invalid use of undefined type 'struct platform_device'
    1835 |         at91_chip->clock = devm_clk_get(&pdev->dev, NULL);
         |                                              ^~
   drivers/pinctrl/pinctrl-at91.c:1837:30: error: invalid use of undefined type 'struct platform_device'
    1837 |                 dev_err(&pdev->dev, "failed to get clock, ignoring.\n");
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1837:17: note: in expansion of macro 'dev_err'
    1837 |                 dev_err(&pdev->dev, "failed to get clock, ignoring.\n");
         |                 ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1844:30: error: invalid use of undefined type 'struct platform_device'
    1844 |                 dev_err(&pdev->dev, "failed to prepare and enable clock, ignoring.\n");
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1844:17: note: in expansion of macro 'dev_err'
    1844 |                 dev_err(&pdev->dev, "failed to prepare and enable clock, ignoring.\n");
         |                 ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1852:37: error: invalid use of undefined type 'struct platform_device'
    1852 |         chip->label = dev_name(&pdev->dev);
         |                                     ^~
   drivers/pinctrl/pinctrl-at91.c:1853:29: error: invalid use of undefined type 'struct platform_device'
    1853 |         chip->parent = &pdev->dev;
         |                             ^~
   drivers/pinctrl/pinctrl-at91.c:1865:35: error: invalid use of undefined type 'struct platform_device'
    1865 |         names = devm_kcalloc(&pdev->dev, chip->ngpio, sizeof(char *),
         |                                   ^~
   drivers/pinctrl/pinctrl-at91.c:1874:48: error: invalid use of undefined type 'struct platform_device'
    1874 |                 names[i] = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pio%c%d", alias_idx + 'A', i);
         |                                                ^~
   drivers/pinctrl/pinctrl-at91.c:1886:38: error: passing argument 1 of 'at91_gpio_of_irq_setup' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1886 |         ret = at91_gpio_of_irq_setup(pdev, at91_chip);
         |                                      ^~~~
         |                                      |
         |                                      struct platform_device *
   drivers/pinctrl/pinctrl-at91.c:1703:59: note: expected 'struct platform_device *' but argument is of type 'struct platform_device *'
    1703 | static int at91_gpio_of_irq_setup(struct platform_device *pdev,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/pinctrl/pinctrl-at91.c:1898:23: error: invalid use of undefined type 'struct platform_device'
    1898 |         dev_info(&pdev->dev, "at address %p\n", at91_chip->regbase);
         |                       ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1898:9: note: in expansion of macro 'dev_info'
    1898 |         dev_info(&pdev->dev, "at address %p\n", at91_chip->regbase);
         |         ^~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1906:22: error: invalid use of undefined type 'struct platform_device'
    1906 |         dev_err(&pdev->dev, "Failure %i for GPIO %i\n", ret, alias_idx);
         |                      ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/pinctrl/pinctrl-at91.c:1906:9: note: in expansion of macro 'dev_err'
    1906 |         dev_err(&pdev->dev, "Failure %i for GPIO %i\n", ret, alias_idx);
         |         ^~~~~~~
   drivers/pinctrl/pinctrl-at91.c: At top level:
   drivers/pinctrl/pinctrl-at91.c:1915:15: error: variable 'at91_gpio_driver' has initializer but incomplete type
    1915 | static struct platform_driver at91_gpio_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1916:10: error: 'struct platform_driver' has no member named 'driver'
    1916 |         .driver = {
         |          ^~~~~~
   drivers/pinctrl/pinctrl-at91.c:1916:19: error: extra brace group at end of initializer
    1916 |         .driver = {
         |                   ^
   drivers/pinctrl/pinctrl-at91.c:1916:19: note: (near initialization for 'at91_gpio_driver')
>> drivers/pinctrl/pinctrl-at91.c:1916:19: warning: excess elements in struct initializer
   drivers/pinctrl/pinctrl-at91.c:1916:19: note: (near initialization for 'at91_gpio_driver')
   drivers/pinctrl/pinctrl-at91.c:1921:10: error: 'struct platform_driver' has no member named 'probe'
    1921 |         .probe = at91_gpio_probe,
         |          ^~~~~
   drivers/pinctrl/pinctrl-at91.c:1921:18: warning: excess elements in struct initializer
    1921 |         .probe = at91_gpio_probe,
         |                  ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1921:18: note: (near initialization for 'at91_gpio_driver')
   drivers/pinctrl/pinctrl-at91.c:1924:15: error: variable 'at91_pinctrl_driver' has initializer but incomplete type
    1924 | static struct platform_driver at91_pinctrl_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1925:10: error: 'struct platform_driver' has no member named 'driver'
    1925 |         .driver = {
         |          ^~~~~~
   drivers/pinctrl/pinctrl-at91.c:1925:19: error: extra brace group at end of initializer
    1925 |         .driver = {
         |                   ^
   drivers/pinctrl/pinctrl-at91.c:1925:19: note: (near initialization for 'at91_pinctrl_driver')
   drivers/pinctrl/pinctrl-at91.c:1925:19: warning: excess elements in struct initializer
   drivers/pinctrl/pinctrl-at91.c:1925:19: note: (near initialization for 'at91_pinctrl_driver')
   drivers/pinctrl/pinctrl-at91.c:1929:10: error: 'struct platform_driver' has no member named 'probe'
    1929 |         .probe = at91_pinctrl_probe,
         |          ^~~~~
   drivers/pinctrl/pinctrl-at91.c:1929:18: warning: excess elements in struct initializer
    1929 |         .probe = at91_pinctrl_probe,
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1929:18: note: (near initialization for 'at91_pinctrl_driver')
   drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_init':
   drivers/pinctrl/pinctrl-at91.c:1939:16: error: implicit declaration of function 'platform_register_drivers' [-Werror=implicit-function-declaration]
    1939 |         return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c: At top level:
   drivers/pinctrl/pinctrl-at91.c:1915:31: error: storage size of 'at91_gpio_driver' isn't known
    1915 | static struct platform_driver at91_gpio_driver = {
         |                               ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:1924:31: error: storage size of 'at91_pinctrl_driver' isn't known
    1924 | static struct platform_driver at91_pinctrl_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +1290 drivers/pinctrl/pinctrl-at91.c

6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1289  
150632b09aadf1 Greg Kroah-Hartman               2012-12-21 @1290  static int at91_pinctrl_probe_dt(struct platform_device *pdev,
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1291  				 struct at91_pinctrl *info)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1292  {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1293  	int ret = 0;
91da7032d86a2a Rob Herring                      2018-07-12  1294  	int i, j, ngpio_chips_enabled = 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1295  	uint32_t *tmp;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1296  	struct device_node *np = pdev->dev.of_node;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1297  	struct device_node *child;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1298  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1299  	if (!np)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1300  		return -ENODEV;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1301  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1302  	info->dev = &pdev->dev;
f56b273cd845a1 Rikard Falkeborn                 2021-05-12  1303  	info->ops = (const struct at91_pinctrl_mux_ops *)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1304  		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1305  	at91_pinctrl_child_count(info, np);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1306  
91da7032d86a2a Rob Herring                      2018-07-12  1307  	/*
91da7032d86a2a Rob Herring                      2018-07-12  1308  	 * We need all the GPIO drivers to probe FIRST, or we will not be able
91da7032d86a2a Rob Herring                      2018-07-12  1309  	 * to obtain references to the struct gpio_chip * for them, and we
91da7032d86a2a Rob Herring                      2018-07-12  1310  	 * need this to proceed.
91da7032d86a2a Rob Herring                      2018-07-12  1311  	 */
91da7032d86a2a Rob Herring                      2018-07-12  1312  	for (i = 0; i < MAX_GPIO_BANKS; i++)
91da7032d86a2a Rob Herring                      2018-07-12  1313  		if (gpio_chips[i])
91da7032d86a2a Rob Herring                      2018-07-12  1314  			ngpio_chips_enabled++;
91da7032d86a2a Rob Herring                      2018-07-12  1315  
91da7032d86a2a Rob Herring                      2018-07-12  1316  	if (ngpio_chips_enabled < info->nactive_banks)
91da7032d86a2a Rob Herring                      2018-07-12  1317  		return -EPROBE_DEFER;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1318  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1319  	ret = at91_pinctrl_mux_mask(info, np);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1320  	if (ret)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1321  		return ret;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1322  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1323  	dev_dbg(&pdev->dev, "nmux = %d\n", info->nmux);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1324  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1325  	dev_dbg(&pdev->dev, "mux-mask\n");
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1326  	tmp = info->mux_mask;
a0b957f306fa4d Jean-Christophe PLAGNIOL-VILLARD 2015-01-16  1327  	for (i = 0; i < gpio_banks; i++) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1328  		for (j = 0; j < info->nmux; j++, tmp++) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1329  			dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1330  		}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1331  	}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1332  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1333  	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1334  	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
a86854d0c599b3 Kees Cook                        2018-06-12  1335  	info->functions = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                        2018-06-12  1336  					info->nfunctions,
a86854d0c599b3 Kees Cook                        2018-06-12  1337  					sizeof(struct at91_pmx_func),
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1338  					GFP_KERNEL);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1339  	if (!info->functions)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1340  		return -ENOMEM;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1341  
a86854d0c599b3 Kees Cook                        2018-06-12  1342  	info->groups = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                        2018-06-12  1343  					info->ngroups,
a86854d0c599b3 Kees Cook                        2018-06-12  1344  					sizeof(struct at91_pin_group),
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1345  					GFP_KERNEL);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1346  	if (!info->groups)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1347  		return -ENOMEM;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1348  
a0b957f306fa4d Jean-Christophe PLAGNIOL-VILLARD 2015-01-16  1349  	dev_dbg(&pdev->dev, "nbanks = %d\n", gpio_banks);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1350  	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1351  	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1352  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1353  	i = 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1354  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1355  	for_each_child_of_node(np, child) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1356  		if (of_device_is_compatible(child, gpio_compat))
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1357  			continue;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1358  		ret = at91_pinctrl_parse_functions(child, info, i++);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1359  		if (ret) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1360  			dev_err(&pdev->dev, "failed to parse function\n");
d94b986aa734ef Julia Lawall                     2015-10-24  1361  			of_node_put(child);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1362  			return ret;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1363  		}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1364  	}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1365  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1366  	return 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1367  }
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1368  

:::::: The code at line 1290 was first introduced by commit
:::::: 150632b09aadf1996f5cb6c0c2620d63a01fe2de Drivers: pinctrl: remove __dev* attributes.

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
