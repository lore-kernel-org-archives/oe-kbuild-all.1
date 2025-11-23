Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F841D555
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880964; cv=none; b=NKAjSvaBZsxJo48SM7CYkQ5x2R1VS/mLXNPLgHMvJxsOr2llfySN+VCtRh7Pe97MQZrzdMlO0ivI8xH5AiCTH5hv1egEpdtQkXUErIHKlOgWppLLy0xteCfzhp2VSb6vwjaes38jDVIvG30dnrH6OR3mWmdE/6P3TuLCpW43/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880964; c=relaxed/simple;
	bh=Cabmfwk/iLNW8qcznK2HYdx+hmAeXvtzM4vcu0vRd2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNXO3HDM8mYy6CBIsZAa64nsFtg9fMSdFEZDWrnxQpCK04cJNUasjJinDD+y3wcagq5JZqOjzrPsCj+X/Vm+g/OLp0NPuGtwNZ4E9WRyS9uZvsdWNfKh4Flc9ewu4mp16DFCBrusvg6oaTqXZhEMq0WzFNzzuOGxEM34IVJCePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9ElbtoJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9ElbtoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763880963; x=1795416963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cabmfwk/iLNW8qcznK2HYdx+hmAeXvtzM4vcu0vRd2M=;
  b=Z9ElbtoJw8Ac2BfRBWdqD9+v0OIBlDYO3NLPxy2GB+U1vLfLb8IC5AFP
   A628qSv1zF6M9DvTI2DcV0cjCqWzTM+Tp/mP2SxiIY7RvKQlUzQQnG2fD
   k5Dj2/kOdp/MtX2/WAMQCpcCF2KQ7GXDY60T7WYNCL9pMM9M5huAj19ow
   7z7QbM5XDp1KxEPwAo0KPUHFJf7Sx3cDOhC9GjgyluNQgPdXIt0LSb385
   PZS1U++s3MHQ/hNp9Y5l7WILIKzWR1wXQdf7ayySK11VZu3Ectgj+M9mQ
   3fh2NJQWfhAU1uprptxmRUxBXOUOOWFeHDC3LDM+qNf4amQ2ezko+LaEJ
   Q==;
X-CSE-ConnectionGUID: mrd6wVCzSo+pZHOlgjakkw==
X-CSE-MsgGUID: dNXVzCpqQ+i0c9NNJgPbIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="66076981"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="66076981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 22:56:03 -0800
X-CSE-ConnectionGUID: OGA8hjRATuu1e9dgaAloHA==
X-CSE-MsgGUID: A6aowUDVTsin66R/ZBPYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192156793"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2025 22:56:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN40t-00086p-0b;
	Sun, 23 Nov 2025 06:55:59 +0000
Date: Sun, 23 Nov 2025 14:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/tty/serial/8250/8250_core.c:316:47: error: use of undeclared
 identifier 'CONFIG_SERIAL_8250_NR_UARTS'
Message-ID: <202511231448.HFyKXID8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Caleb,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d13f3ac64efb868d09cb2726b1e84929afe90235
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   6 months ago
config: mips-randconfig-r134-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231448.HFyKXID8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231448.HFyKXID8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231448.HFyKXID8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_core.c:316:47: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
     316 | static struct uart_8250_port serial8250_ports[UART_NR];
         |                                               ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   drivers/tty/serial/8250/8250_core.c:345:15: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
     345 |         if (index >= UART_NR)
         |                      ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   2 errors generated.
--
>> drivers/tty/serial/8250/8250_platform.c:36:25: error: use of undeclared identifier 'CONFIG_SERIAL_8250_RUNTIME_UARTS'
      36 | unsigned int nr_uarts = CONFIG_SERIAL_8250_RUNTIME_UARTS;
         |                         ^
>> drivers/tty/serial/8250/8250_platform.c:64:17: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
      64 |         if (nr_uarts > UART_NR)
         |                        ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   drivers/tty/serial/8250/8250_platform.c:65:14: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
      65 |                 nr_uarts = UART_NR;
         |                            ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   drivers/tty/serial/8250/8250_platform.c:247:18: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
     247 |         for (i = 0; i < UART_NR; i++) {
         |                         ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   drivers/tty/serial/8250/8250_platform.c:261:18: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
     261 |         for (i = 0; i < UART_NR; i++) {
         |                         ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   drivers/tty/serial/8250/8250_platform.c:309:22: error: use of undeclared identifier 'CONFIG_SERIAL_8250_NR_UARTS'
     309 |         serial8250_reg.nr = UART_NR;
         |                             ^
   drivers/tty/serial/8250/8250.h:97:17: note: expanded from macro 'UART_NR'
      97 | #define UART_NR CONFIG_SERIAL_8250_NR_UARTS
         |                 ^
   6 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]


vim +/CONFIG_SERIAL_8250_NR_UARTS +316 drivers/tty/serial/8250/8250_core.c

a4416cd1ac7b48 drivers/tty/serial/8250/8250_core.c Peter Hurley   2015-02-24  315  
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds 2005-04-16 @316  static struct uart_8250_port serial8250_ports[UART_NR];
^1da177e4c3f41 drivers/serial/8250.c               Linus Torvalds 2005-04-16  317  

:::::: The code at line 316 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
