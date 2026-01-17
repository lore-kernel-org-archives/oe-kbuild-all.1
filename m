Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086A2D7814
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768674679; cv=none; b=K1MWLS7tQbZ4FV598e1h+uUbMrbFnAioVzGD9301bMbajxG32TO8H9woD5nn85GKJFMNkiqS8b8rtApKalko7zDankm4DSG3GI2jhbklq38ziNIaOBm3JHTjDbSjQjzUnG3VM6idJK6n0LwsLYE1XpfAtiIEHlHfyYscYf0rvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768674679; c=relaxed/simple;
	bh=MagxBMzr2fGcSnxoSzPJKskkFXokd9bW3gfE2yK6BZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WnPZa+yP/LaTxDCYt+dRY/SUSvEIhKGV+RWVDlwiObMpfD/EbmLKU+G83rxLVc24KFAop972l6AoJh1QfgKlFFaBQhTk5kVzJy3TQ+ISoAyZrB/g+x5CxOdQKVjyESlugBfChvFf++oBelaktjoWGd+LXe1aGFk19KlODVuZ0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eo+0OOHL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eo+0OOHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768674678; x=1800210678;
  h=date:from:to:cc:subject:message-id;
  bh=MagxBMzr2fGcSnxoSzPJKskkFXokd9bW3gfE2yK6BZA=;
  b=eo+0OOHLiS/jWcMPjXlTsms2IDnsKo/oN017cXEUyOj7ZTCB4IoEJ9Ua
   U3lMO94VDVIWCMOQUBPQ57FpPaUtdavbw47dB5BQH3GtpROQbOo9xBuqh
   +CykhohlkXaI1ZQamMhi/S9yplq+tdWk1gJw5N6JgNUzYf2LDcR3VGESB
   hT4s2GWAfLxiB4sC9Qx7XQYlJ1oZRj5cawqTQ9gg2rVF4JPc2CAHaBBDs
   Ag67EcijQu5tF8mcWScPPjlFdnIqu/gqGJDfitDFY7WMNK301MyaxtJnq
   nYqb8V7nL+IavdFSH8yhX+ZKwR6HgR+dIg2Qy+clPf1DBhSl3XJrmCqU5
   g==;
X-CSE-ConnectionGUID: F7w43nmlQ2+glzHGrrWqSQ==
X-CSE-MsgGUID: dq6kELcvQqOXZHVcZyRdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69928036"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69928036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:31:14 -0800
X-CSE-ConnectionGUID: qbIDdJqfSrWbrCa1rr0hDA==
X-CSE-MsgGUID: 4L8ANn9CS/C122WptBJuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="209996344"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 10:31:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhB4o-00000000M8Q-0Rhz;
	Sat, 17 Jan 2026 18:31:10 +0000
Date: Sun, 18 Jan 2026 02:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:mips-compile-pic32-drivers 24/29]
 drivers/watchdog/pic32-wdt.c:125: Error: unrecognized instruction `nop'
Message-ID: <202601180236.BVy480We-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://github.com/masneyb/linux mips-compile-pic32-drivers
head:   a426e474e28b73078378d837ec86f55a5a2e7955
commit: cea2910f3fcc8d60410b0a0ef0ad76ba6c58fa8c [24/29] watchdog: pic32: allow drivers to be compiled on all architectures with COMPILE_TEST
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601180236.BVy480We-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180236.BVy480We-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180236.BVy480We-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/pic32-wdt.c: Assembler messages:
>> drivers/watchdog/pic32-wdt.c:125: Error: unrecognized instruction `nop'
--
   drivers/watchdog/pic32-dmt.c: Assembler messages:
>> drivers/watchdog/pic32-dmt.c:58: Error: unrecognized instruction `nop'


vim +125 drivers/watchdog/pic32-wdt.c

8f91fc56bc439a Joshua Henderson 2016-02-26  114  
8f91fc56bc439a Joshua Henderson 2016-02-26  115  static int pic32_wdt_stop(struct watchdog_device *wdd)
8f91fc56bc439a Joshua Henderson 2016-02-26  116  {
8f91fc56bc439a Joshua Henderson 2016-02-26  117  	struct pic32_wdt *wdt = watchdog_get_drvdata(wdd);
8f91fc56bc439a Joshua Henderson 2016-02-26  118  
8f91fc56bc439a Joshua Henderson 2016-02-26  119  	writel(WDTCON_ON, PIC32_CLR(wdt->regs + WDTCON_REG));
8f91fc56bc439a Joshua Henderson 2016-02-26  120  
8f91fc56bc439a Joshua Henderson 2016-02-26  121  	/*
8f91fc56bc439a Joshua Henderson 2016-02-26  122  	 * Cannot touch registers in the CPU cycle following clearing the
8f91fc56bc439a Joshua Henderson 2016-02-26  123  	 * ON bit.
8f91fc56bc439a Joshua Henderson 2016-02-26  124  	 */
8f91fc56bc439a Joshua Henderson 2016-02-26 @125  	nop();
8f91fc56bc439a Joshua Henderson 2016-02-26  126  
8f91fc56bc439a Joshua Henderson 2016-02-26  127  	return 0;
8f91fc56bc439a Joshua Henderson 2016-02-26  128  }
8f91fc56bc439a Joshua Henderson 2016-02-26  129  

:::::: The code at line 125 was first introduced by commit
:::::: 8f91fc56bc439a5baefae598040d263f48526596 watchdog: pic32-wdt: Add PIC32 watchdog driver

:::::: TO: Joshua Henderson <joshua.henderson@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
