Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3D458CA5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881872; cv=none; b=OGcexnZOaOJDfDm1wV7w+zaMKrU9WRnA9DR4X6kzJsksrTYdjRU4xFNTe18lsvI3ckzV3bdho0sWy6diq9juR5mPekLQRa+oYK3ZkhkcAhhSl8OkKbSDwhNawJGOCbOkOyr/qUBaaf6UvXckWHD5Ayz+amon0+YHyJPbrIvImaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881872; c=relaxed/simple;
	bh=h9QC6YAgjXTIBkwQclw6CVblmxBl1ODQq0p4kLv6ZJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sOQlFFRaI7jLToMlYLZGIY9zcMu+1LXYeO2kYkLDjcMVt0UZvcXNRSxykW5jEs8NMbrmE8Nu0eBYyTZCcFR37xP1XKUK8Hqq5ZUGkNrFW2PJPvsL972HQ1X8ZmtsPs35vF1qXoyuEHB/ekaEIqDJztYAog0qHDlTwN1IqS/CRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go9ZQQ6m; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go9ZQQ6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767881870; x=1799417870;
  h=date:from:to:cc:subject:message-id;
  bh=h9QC6YAgjXTIBkwQclw6CVblmxBl1ODQq0p4kLv6ZJ8=;
  b=Go9ZQQ6m9336p5xfk/7q8TvrSb6SS4qwzC+kd8ekTowy1Z6bxBnIuvWn
   lK4UdujuLJT24+POT239gEPOQHK9BojEg+GFDHPtgvqKV/aE4gH0kjyYY
   k1yhyD/RN0s4y0poL/1hFFzV1xSBGz4CVKTA47Zk+OemQw8xm/d9qBG5o
   gU1LhC6gONCi03rZvBsXc7Yf/ogh3OqDKFPaSv30haYNBPddj4XTttKNp
   Fmovd8nIYqPKSH8Vu7Zr4dmVJ/1PVts3dhw71gbR3MgNkLrk8qcH6VoQp
   8K8X5aAzj874TOaFF4QF95tHANGIctaMED+zoMJaBTdR+Gx9oZobM+OzT
   A==;
X-CSE-ConnectionGUID: TsZQsgF1S1W7frqPKnbEUA==
X-CSE-MsgGUID: vmDweowpRqSWIcfVAoIUHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69309650"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69309650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 06:17:50 -0800
X-CSE-ConnectionGUID: 8lGnvJQWTAaayvZqMUibtA==
X-CSE-MsgGUID: aQ0Qi2gSRKSTwTfruKDXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203234704"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 06:17:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdqpd-000000004o2-27zF;
	Thu, 08 Jan 2026 14:17:45 +0000
Date: Thu, 08 Jan 2026 22:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/tty/serial/8250/8250.h:97:17: error:
 'CONFIG_SERIAL_8250_NR_UARTS' undeclared here (not in a function); did you
 mean 'CONFIG_SERIAL_8250'?
Message-ID: <202601082201.7PCJ7ecM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   8 months ago
config: mips-randconfig-r051-20260108 (https://download.01.org/0day-ci/archive/20260108/202601082201.7PCJ7ecM-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082201.7PCJ7ecM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082201.7PCJ7ecM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_core.c:39:
>> drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared here (not in a function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:316:47: note: in expansion of macro 'UART_NR'
     316 | static struct uart_8250_port serial8250_ports[UART_NR];
         |                                               ^~~~~~~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_get_port':
   drivers/tty/serial/8250/8250_core.c:330:48: warning: parameter 'line' set but not used [-Wunused-but-set-parameter]
     330 | struct uart_8250_port *serial8250_get_port(int line)
         |                                            ~~~~^~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/tty/serial/8250/8250_core.c:15:
   drivers/tty/serial/8250/8250_core.c: In function 'early_serial_setup':
>> include/linux/compiler.h:197:77: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:542:20: note: in expansion of macro 'ARRAY_SIZE'
     542 |  if (port->line >= ARRAY_SIZE(serial8250_ports) || nr_uarts == 0)
         |                    ^~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_suspend_port':
   drivers/tty/serial/8250/8250_core.c:580:34: warning: parameter 'line' set but not used [-Wunused-but-set-parameter]
     580 | void serial8250_suspend_port(int line)
         |                              ~~~~^~~~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_resume_port':
   drivers/tty/serial/8250/8250_core.c:604:33: warning: parameter 'line' set but not used [-Wunused-but-set-parameter]
     604 | void serial8250_resume_port(int line)
         |                             ~~~~^~~~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_get_port':
   drivers/tty/serial/8250/8250_core.c:333:1: warning: control reaches end of non-void function [-Wreturn-type]
     333 | }
         | ^
   At top level:
   drivers/tty/serial/8250/8250_core.c:316:30: warning: 'serial8250_ports' defined but not used [-Wunused-variable]
     316 | static struct uart_8250_port serial8250_ports[UART_NR];
         |                              ^~~~~~~~~~~~~~~~
--
>> drivers/tty/serial/8250/8250_platform.c:36:25: error: 'CONFIG_SERIAL_8250_RUNTIME_UARTS' undeclared here (not in a function)
      36 | unsigned int nr_uarts = CONFIG_SERIAL_8250_RUNTIME_UARTS;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/tty/serial/8250/8250_platform.c:25:
   drivers/tty/serial/8250/8250_platform.c: In function '__serial8250_isa_init_ports':
>> drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared (first use in this function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_platform.c:64:17: note: in expansion of macro 'UART_NR'
      64 |  if (nr_uarts > UART_NR)
         |                 ^~~~~~~
   drivers/tty/serial/8250/8250.h:97:17: note: each undeclared identifier is reported only once for each function it appears in
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_platform.c:64:17: note: in expansion of macro 'UART_NR'
      64 |  if (nr_uarts > UART_NR)
         |                 ^~~~~~~
   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_suspend':
>> drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared (first use in this function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_platform.c:247:18: note: in expansion of macro 'UART_NR'
     247 |  for (i = 0; i < UART_NR; i++) {
         |                  ^~~~~~~
   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_resume':
>> drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared (first use in this function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_platform.c:261:18: note: in expansion of macro 'UART_NR'
     261 |  for (i = 0; i < UART_NR; i++) {
         |                  ^~~~~~~
   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_init':
>> drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared (first use in this function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_platform.c:309:22: note: in expansion of macro 'UART_NR'
     309 |  serial8250_reg.nr = UART_NR;
         |                      ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]


vim +97 drivers/tty/serial/8250/8250.h

4ba5e35daa90871 drivers/serial/8250.h          Russell King    2005-06-23  95  
ffd8e8bd26e945a drivers/tty/serial/8250/8250.h Andy Shevchenko 2024-05-06  96  /* Module parameters */
ffd8e8bd26e945a drivers/tty/serial/8250/8250.h Andy Shevchenko 2024-05-06 @97  #define UART_NR	CONFIG_SERIAL_8250_NR_UARTS
ffd8e8bd26e945a drivers/tty/serial/8250/8250.h Andy Shevchenko 2024-05-06  98  

:::::: The code at line 97 was first introduced by commit
:::::: ffd8e8bd26e945a957e827427e8cbe8fa8e23d0d serial: 8250: Extract platform driver

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
