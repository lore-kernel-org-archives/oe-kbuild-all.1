Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE093ECBDE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863290; cv=none; b=ccsT5H6D7fuDmenFfUgq0BwSmNdlHvlo7e2ZPfD0xc41GSuw48IntBkyaC9WiVbnHAMOpdfygi+HPj30jzTMajIHPfk8VvstFv+QIGsm8bVrXBW1UhF7kTLZHxzqf+AVi40HIgifdSdvhMyNIugwRmVvmGHgleVQ7zE1YFfVcqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863290; c=relaxed/simple;
	bh=0TNtIG+2OoHgZi7w18M+Yhl2LXKqauKQ1R0ycxP/udU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LsIWhjEnlWUM4+ZpFA8DGiFOiq0/oCKFSqLlela/NS1JOICYjLvGZewC2zGESgaKBCAcXzIbW+GOQkbMFsghwHxnigofaThywyKagBu7cKhfXVM02B0Rwjcusa6l+XxhayppH5208FFAsLDyFKmJ0Ihhyal8pvztFQAoGzIG4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHgWQ1AS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHgWQ1AS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767863282; x=1799399282;
  h=date:from:to:cc:subject:message-id;
  bh=0TNtIG+2OoHgZi7w18M+Yhl2LXKqauKQ1R0ycxP/udU=;
  b=CHgWQ1ASIc+mY8dlS/NhjYxBjCvdgN37rwc+c50F+PVNbMEPfqi7O1us
   0pKMtoe6j9kK/aueBCgZx2I4d4y/p+S9dEvg8w6iJ38hMGKfn+dVj8eCv
   MwKWTbypTxUOuikv3Dfw9TGiGNnWX0KBIS/eZsIKbxANn0Nwp0gh3VacH
   OCDNW/w28UuYmdf/afHuwe9woJ5S5ylq0BUssFYLl4k7Dk0Fb96Xcz4vW
   Jf1XnsljqFh3nLSntrHD1JKAKpLvzh1azMsDglycI9G29xqFRGb5p4/Fu
   NjkVBvGUaRCHA8BPoQNzclF9kOWpmIfch4/8jXGlZqmQkhkFI/H+XBVPr
   g==;
X-CSE-ConnectionGUID: NZzjOVWmRHSApWA5dl2lUA==
X-CSE-MsgGUID: 4f07YEg9Ro+ENmIduvdrBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79879047"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79879047"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 01:07:47 -0800
X-CSE-ConnectionGUID: bHRxgd/1Tp+hNMzWBKsDxA==
X-CSE-MsgGUID: WuNCRBLySA6CfOJBsEAlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202355405"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2026 01:07:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdlza-000000004XI-1guV;
	Thu, 08 Jan 2026 09:07:42 +0000
Date: Thu, 08 Jan 2026 17:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/tty/serial/8250/8250_core.c:330:48: warning:
 parameter 'line' set but not used
Message-ID: <202601081607.yrciuDfu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Caleb,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   8 months ago
config: mips-randconfig-r051-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081607.yrciuDfu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081607.yrciuDfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081607.yrciuDfu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_core.c:39:
   drivers/tty/serial/8250/8250.h:97:17: error: 'CONFIG_SERIAL_8250_NR_UARTS' undeclared here (not in a function); did you mean 'CONFIG_SERIAL_8250'?
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:316:47: note: in expansion of macro 'UART_NR'
     316 | static struct uart_8250_port serial8250_ports[UART_NR];
         |                                               ^~~~~~~
   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_get_port':
>> drivers/tty/serial/8250/8250_core.c:330:48: warning: parameter 'line' set but not used [-Wunused-but-set-parameter]
     330 | struct uart_8250_port *serial8250_get_port(int line)
         |                                            ~~~~^~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/tty/serial/8250/8250_core.c:15:
   drivers/tty/serial/8250/8250_core.c: In function 'early_serial_setup':
   include/linux/compiler.h:197:77: error: expression in static assertion is not an integer
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
>> drivers/tty/serial/8250/8250_core.c:333:1: warning: control reaches end of non-void function [-Wreturn-type]
     333 | }
         | ^
   At top level:
>> drivers/tty/serial/8250/8250_core.c:316:30: warning: 'serial8250_ports' defined but not used [-Wunused-variable]
     316 | static struct uart_8250_port serial8250_ports[UART_NR];
         |                              ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]


vim +/line +330 drivers/tty/serial/8250/8250_core.c

a4416cd1ac7b48 drivers/tty/serial/8250/8250_core.c Peter Hurley              2015-02-24  315  
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds            2005-04-16 @316  static struct uart_8250_port serial8250_ports[UART_NR];
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds            2005-04-16  317  
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  318  /**
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  319   * serial8250_get_port - retrieve struct uart_8250_port
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  320   * @line: serial line number
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  321   *
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  322   * This function retrieves struct uart_8250_port for the specific line.
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  323   * This struct *must* *not* be used to perform a 8250 or serial core operation
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  324   * which is not accessible otherwise. Its only purpose is to make the struct
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  325   * accessible to the runtime-pm callbacks for context suspend/restore.
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  326   * The lock assumption made here is none because runtime-pm suspend/resume
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  327   * callbacks should not be invoked if there is any operation performed on the
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  328   * port.
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  329   */
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05 @330  struct uart_8250_port *serial8250_get_port(int line)
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  331  {
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  332  	return &serial8250_ports[line];
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05 @333  }
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  334  EXPORT_SYMBOL_GPL(serial8250_get_port);
ae14a7954f5124 drivers/tty/serial/8250/8250_core.c Sebastian Andrzej Siewior 2014-09-05  335  

:::::: The code at line 330 was first introduced by commit
:::::: ae14a7954f5124208e6e93cafb3099f83acd43f5 tty: serial: 8250_core: provide a function to export uart_8250_port

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
