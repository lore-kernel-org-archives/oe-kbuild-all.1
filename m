Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA716D9DF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295197; cv=none; b=s+NNqrGolRggmaxbwd5x9Ujq6egOldFWq4FOgUmIDsxExlYEE3ECa1Mr4oF72LGf5l9nHOge/vXLA4tipgVuN/xe9r44x0zUeEL6tXn//5uAIlSjnpTO5R0aA/b7i+wAfPYlUDuhPb/EkaynoGgHBjxUY5Vy0tFzg6tl+EpoEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295197; c=relaxed/simple;
	bh=5YYCieRHIKg56QqE8ef4y8DMm4Imld1dQElk1UjeBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saJY3xGAwNC98hbZZ1NuUUQv5cPLaw3/FI+q8xRA4+RrUadnV2LeBNr9OUeKuWECfz70bWY/7xscTuMg63hT4k1P0j/Y6jp6uX5ygGGkwZKZ9McuvPdD5g7W02XDtb00EXXyhqS5f0/kjyHSRQCX4ANHqw/EKooFGV3BcLOeML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCw+Yi1V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCw+Yi1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295194; x=1764831194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YYCieRHIKg56QqE8ef4y8DMm4Imld1dQElk1UjeBxw=;
  b=CCw+Yi1VV9FfUYb3mNvQgJOmQTW7EvwUoFTofqo61yKuCnZ+L9Q+a9mb
   KwVowgdWWpAw2OyTZFgiVQepHV8XA8MI8YA8XPUNqWQJjmiMB6aeacb7r
   isgemVwhSQiYxIn8I5bugP2DhcamKxa8wKgkLW18Jum2JERAFjYub728A
   tLhHBThvocSdkhkEcpsAj/NXuwOvZumX2qaMnzwI7JVgDpexqTmV2AkoK
   xUvQt4q4Diu/VtzYIlEiINFB9Yh2zwWNGcJ/iu/Q8ps9OAWS4Afs2exLm
   fis/HFl28XiWfAfqHvAtHm1gfn1pPQKG0d8WDdEtKdT1jZ0KFu6EAlZJY
   w==;
X-CSE-ConnectionGUID: 4Bv1DLkiRQuhBmYlRyXNBQ==
X-CSE-MsgGUID: bQV+E5XqQni0hKVToYU42A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44207998"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44207998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 22:53:13 -0800
X-CSE-ConnectionGUID: wnxh2ltsT1mM46iQ0pJ/Wg==
X-CSE-MsgGUID: O9NKtI9mQl6hOLVU/OeP9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98659431"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 22:53:12 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjFy-0002gL-0I;
	Wed, 04 Dec 2024 06:53:06 +0000
Date: Wed, 4 Dec 2024 14:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1320/1320]
 drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but
 not used
Message-ID: <202412041458.vwP2M34t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   98beb6bc5000f977169e4f633e450f4e3e9d84d1
commit: 1c30433d9fa5c5b48039990ba214c0e8e199a22d [1320/1320] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
config: arm64-randconfig-003 (https://download.01.org/0day-ci/archive/20241204/202412041458.vwP2M34t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041458.vwP2M34t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041458.vwP2M34t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_init':
>> drivers/tty/serial/sc16is7xx.c:1501:1: warning: label 'err_i2c' defined but not used [-Wunused-label]
    1501 | err_i2c:
         | ^~~~~~~
   In file included from drivers/tty/serial/sc16is7xx.c:17:
   drivers/tty/serial/sc16is7xx.c: At top level:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'sc16is7xx_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c:1518:1: note: in expansion of macro 'module_exit'
    1518 | module_exit(sc16is7xx_exit);
         | ^~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c:1507:20: note: 'cleanup_module' target declared here
    1507 | static void __exit sc16is7xx_exit(void)
         |                    ^~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'sc16is7xx_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c:1505:1: note: in expansion of macro 'module_init'
    1505 | module_init(sc16is7xx_init);
         | ^~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c:1470:19: note: 'init_module' target declared here
    1470 | static int __init sc16is7xx_init(void)
         |                   ^~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_remove.isra':
   drivers/tty/serial/sc16is7xx.c:1309:17: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
    1309 |                 uart_remove_one_port(&sc16is7xx_uart, &s->p[i].port);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   drivers/tty/serial/sc16is7xx.c:1310:31: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
    1310 |                 clear_bit(s->p[i].port.line, &sc16is7xx_lines);
         |                           ~~~~^~~
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   drivers/tty/serial/sc16is7xx.c:1309:60: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
    1309 |                 uart_remove_one_port(&sc16is7xx_uart, &s->p[i].port);
         |                                                        ~~~~^~~
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   In function 'sc16is7xx_port_irq',
       inlined from 'sc16is7xx_ist' at drivers/tty/serial/sc16is7xx.c:704:20:
   drivers/tty/serial/sc16is7xx.c:662:34: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
     662 |         struct uart_port *port = &s->p[portno].port;
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_ist':
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   In function 'sc16is7xx_port_irq',
       inlined from 'sc16is7xx_ist' at drivers/tty/serial/sc16is7xx.c:704:20:
   drivers/tty/serial/sc16is7xx.c:662:39: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
     662 |         struct uart_port *port = &s->p[portno].port;
         |                                   ~~~~^~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_ist':
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   In function 'sc16is7xx_port_irq',
       inlined from 'sc16is7xx_ist' at drivers/tty/serial/sc16is7xx.c:704:20:
   drivers/tty/serial/sc16is7xx.c:662:39: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
     662 |         struct uart_port *port = &s->p[portno].port;
         |                                   ~~~~^~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_ist':
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   In function 'sc16is7xx_port_irq',
       inlined from 'sc16is7xx_ist' at drivers/tty/serial/sc16is7xx.c:704:20:
   drivers/tty/serial/sc16is7xx.c:662:39: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
     662 |         struct uart_port *port = &s->p[portno].port;
         |                                   ~~~~^~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_ist':
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   In function 'sc16is7xx_port_irq',
       inlined from 'sc16is7xx_ist' at drivers/tty/serial/sc16is7xx.c:704:20:
   drivers/tty/serial/sc16is7xx.c:662:39: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
     662 |         struct uart_port *port = &s->p[portno].port;
         |                                   ~~~~^~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_ist':
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_probe':
   drivers/tty/serial/sc16is7xx.c:1223:21: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
    1223 |                 s->p[i].line            = i;
         |                 ~~~~^~~
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   drivers/tty/serial/sc16is7xx.c:1225:21: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]
    1225 |                 s->p[i].port.dev        = dev;
         |                 ~~~~^~~
   drivers/tty/serial/sc16is7xx.c:331:41: note: while referencing 'p'
     331 |         struct sc16is7xx_one            p[0];
         |                                         ^
   drivers/tty/serial/sc16is7xx.c:1226:21: warning: array subscript i is outside array bounds of 'struct sc16is7xx_one[0]' [-Warray-bounds=]


vim +/err_i2c +1501 drivers/tty/serial/sc16is7xx.c

  1487	
  1488	#ifdef CONFIG_SERIAL_SC16IS7XX_SPI
  1489		ret = spi_register_driver(&sc16is7xx_spi_uart_driver);
  1490		if (ret < 0) {
  1491			pr_err("failed to init sc16is7xx spi --> %d\n", ret);
  1492			goto err_spi;
  1493		}
  1494	#endif
  1495		return ret;
  1496	
  1497	err_spi:
  1498	#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
  1499		i2c_del_driver(&sc16is7xx_i2c_uart_driver);
  1500	#endif
> 1501	err_i2c:
  1502		uart_unregister_driver(&sc16is7xx_uart);
  1503		return ret;
  1504	}
  1505	module_init(sc16is7xx_init);
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
