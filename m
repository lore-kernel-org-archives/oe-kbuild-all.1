Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5247D286AF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VibcrqWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701699181; x=1733235181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXhTUKskcobwCrPLD/euScyvX+4fETPObP25ded9Org=;
  b=VibcrqWEhXNz3dX7PGcVe/WcPGJhgu5Yh0pppQ9J35QVDWZAlKFo1qhZ
   XHoD6xT4Z31pUEVHYMDHIohvQ674zWisaecbPp1/tAxJURPAeBOYY8uxO
   uJEdfjOdpPXCOZNbeO4ID16AI76sIhXYnPfUku5OLNwnP3soPhNCHg09q
   hKB6XHuaOo5yH8UJ19ie20dtaZg02cjKuhRyiR+f8n5SuLMcL1T3T03LB
   xsjZ21EpvKKUseSESpUesleP46NE2ugpmRaklSdQ82ShSi0Oqq6Rj+SZw
   hBUaYECj847tJqf58bV6z8lIZ8m3Epd9PWMXhmr0NrrXL9ckU+XxIBOcT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458059597"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="458059597"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888540359"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="888540359"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2023 06:12:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA9gr-0007ni-29;
	Mon, 04 Dec 2023 14:12:53 +0000
Date: Mon, 4 Dec 2023 22:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202312042150.BH4sJFe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline for __chk_{user,io}_ptr()
date:   3 years, 3 months ago
config: sh-randconfig-r111-20231117 (https://download.01.org/0day-ci/archive/20231204/202312042150.BH4sJFe4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312042150.BH4sJFe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312042150.BH4sJFe4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:144:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:144:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:144:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:156:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:156:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:156:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:134:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:134:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:134:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:144:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:144:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:144:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:156:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:156:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:156:9: sparse:     got unsigned int
   drivers/watchdog/shwdt.c: note: in included file (through arch/sh/include/asm/watchdog.h):
>> arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:44:16: sparse:     got unsigned int
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh2/cpu/watchdog.h:62:9: sparse:     got unsigned int
   drivers/watchdog/shwdt.c: note: in included file:
   arch/sh/include/asm/watchdog.h:144:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:144:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:144:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:156:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:156:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:156:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:144:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:144:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:144:16: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:156:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:156:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:156:9: sparse:     got unsigned int
   arch/sh/include/asm/watchdog.h:134:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/watchdog.h:134:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/include/asm/watchdog.h:134:9: sparse:     got unsigned int

vim +44 arch/sh/include/cpu-sh2/cpu/watchdog.h

^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  33  
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  34  /**
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  35   * 	sh_wdt_read_rstcsr - Read from Reset Control/Status Register
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  36   *
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  37   *	Reads back the RSTCSR value.
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  38   */
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  39  static inline __u8 sh_wdt_read_rstcsr(void)
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  40  {
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  41  	/*
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  42  	 * Same read/write brain-damage as for WTCNT here..
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  43  	 */
9d56dd3b083a3b arch/sh/include/cpu-sh2/cpu/watchdog.h Paul Mundt     2010-01-26 @44  	return __raw_readb(RSTCSR_R);
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  45  }
^1da177e4c3f41 include/asm-sh/cpu-sh2/watchdog.h      Linus Torvalds 2005-04-16  46  

:::::: The code at line 44 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
