Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C21DA3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BspCWsmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702935681; x=1734471681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBhs6Jaf3zxgS2QGUf8d4TRv7lKMINojHQzSayYO3aI=;
  b=BspCWsmdjTc44jlsGu2do1qqDNSk2J6dC4Vn8om0lqTzOYxsFsiN1QQa
   zXRDA/O7k3fareKlXSnXYqdfM7e/tVrlIQNbqKik+xPCn8AcUZ2hWFjvl
   p8G1ADOUttjn3+DdSjeeoyPuYvsNLST17PcsOO2byK5z/ZiDZfAlPtdWA
   Qfrpqw36P36yw4yR279DHi+Ca/Cdp1O8JpFX9pcaBqc5nJ/gIHzky1xHL
   zJX0DwPanoiwhCuaIvZ3HlX+Iq4+SVI4+y33Ug1RC2a/hAXBotwVJRam+
   wYnGkx/VfZoAt3JBY3TeI6A8jmhVeYgDjaM9ViQ53wUScfjCkZiBz6W4m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459906777"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="459906777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 13:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="23934926"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2023 13:41:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFLMT-0004YX-1w;
	Mon, 18 Dec 2023 21:41:17 +0000
Date: Tue, 19 Dec 2023 05:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 23/49] arch/x86/um/sysrq_64.c:20:58: error:
 implicit declaration of function 'task_pid_nr'
Message-ID: <202312190556.mWZp28Yn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 3a152ecfd5ccaf1204e4b486600de199c2c0eadd [23/49] sched.h: move pid helpers to pid.h
config: um-randconfig-002-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190556.mWZp28Yn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190556.mWZp28Yn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190556.mWZp28Yn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from arch/x86/um/sysrq_64.c:7:
   arch/x86/um/sysrq_64.c: In function 'show_regs':
>> arch/x86/um/sysrq_64.c:20:58: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
      20 |         printk(KERN_INFO "Pid: %d, comm: %.20s %s %s\n", task_pid_nr(current),
         |                                                          ^~~~~~~~~~~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/x86/um/sysrq_64.c:20:9: note: in expansion of macro 'printk'
      20 |         printk(KERN_INFO "Pid: %d, comm: %.20s %s %s\n", task_pid_nr(current),
         |         ^~~~~~
   cc1: some warnings being treated as errors


vim +/task_pid_nr +20 arch/x86/um/sysrq_64.c

^1da177e4c3f415 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  15  
9d1ee8ce92e16c6 arch/x86/um/sysrq_64.c     Richard Weinberger 2013-09-23  16  void show_regs(struct pt_regs *regs)
^1da177e4c3f415 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  17  {
^1da177e4c3f415 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  18  	printk("\n");
^1da177e4c3f415 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  19  	print_modules();
95906b24fbe4d22 arch/um/sys-x86_64/sysrq.c Jeff Dike          2008-02-04 @20  	printk(KERN_INFO "Pid: %d, comm: %.20s %s %s\n", task_pid_nr(current),

:::::: The code at line 20 was first introduced by commit
:::::: 95906b24fbe4d22e5861f67fe1e8274c7ecfeda1 uml: style fixes in arch/um/sys-x86_64

:::::: TO: Jeff Dike <jdike@addtoit.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
