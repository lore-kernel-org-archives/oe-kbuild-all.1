Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE140DFA5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025911; cv=none; b=lXR33q2jhtz3v4lc8M06paTX43n8ZI1/E3/LVMTR8WN5nPNk+G7KNjlP3u1lJqkOpa/vxsMqCPjuH0spKFkC6HXgLtDyZ1YtQXiP/L09YlhYfu/stYKCmp8yE12afGDSb8PXDgdQlOYGzWnX9ka+J3XAd/NV/UugjZS+LycdNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025911; c=relaxed/simple;
	bh=T3qiDZFoZnGYOsH+8PDLXfo8pr9pTnutodxdWdl4nGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPRmW2OvLj4GE3M77U0I5ha00k7mGlo4N0E01jtX/shqidNi9IhLbkIsveDCWHpuI258zeRsN7T/Upr4xXVsAD721IZgOI/YDrykakhXqG1ULcncMYOxSJui8q38vN4vIaG4p7JAi+LPB0oQ77rsK02xbYTrfeNeQgrk3okEi0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWbEGS+7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWbEGS+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778025909; x=1809561909;
  h=date:from:to:cc:subject:message-id;
  bh=T3qiDZFoZnGYOsH+8PDLXfo8pr9pTnutodxdWdl4nGg=;
  b=CWbEGS+7vu80CeKQ+6kQvnTDSo+PGtbl66GXEauzTQ7AJpdwh1YSqmdF
   zc9yQGrCaQ3E7SxtAEVhHt1dgbBi00Xr3ujxUqCusEO7u6OoHHD+v1AgU
   FRlFebuPvzltIOuva0KaiYmq3F4NY/xqTrkuHqUDPbVaJwLq8aQcHMQYH
   JiyuB41sz0fzg2ZiHwtnAy3N3ZkTIk6jQQeHl5ujCcfpc9A1EUXgwGsgl
   j7n4C3MkHvbEhPFRGkxMyYJRsBTMLtcw1NpTGqyf/UvRiDOafA/fd/Zk3
   ltMBUHptlUcfn9B58UAgk1ffFKzvclXc2fFk7lv1hNJ9WXCsjc/Ux4h1v
   A==;
X-CSE-ConnectionGUID: fVo11UN5TDyc5qICTeIIOA==
X-CSE-MsgGUID: lqvkljjZQ12AQZNf9hyAhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89219613"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="89219613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 17:05:09 -0700
X-CSE-ConnectionGUID: 8V+nQY7VR5C7EMyiBEi5ng==
X-CSE-MsgGUID: +mCgzLp0Qy6uQIL3w16lYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="274095190"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2026 17:05:08 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKPlB-000000000YP-1vRD;
	Wed, 06 May 2026 00:05:05 +0000
Date: Wed, 06 May 2026 08:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] arch/mips/kernel/traps.c:2002:2:
 warning: unused variable 'nesting'
Message-ID: <202605060744.4CMiPCaU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   082cc4c201e4450ff9456c9bd093fd70d103595a
commit: 40c3e04e2248c0e5d78d23e6767a1c58d5678eac [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: mips-randconfig-r072-20260506 (https://download.01.org/0day-ci/archive/20260506/202605060744.4CMiPCaU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060744.4CMiPCaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060744.4CMiPCaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kernel/traps.c:1592:17: warning: variable 'prev_state' set but not used [-Wunused-but-set-variable]
    1592 |         enum ctx_state prev_state;
         |                        ^
>> arch/mips/kernel/traps.c:2002:2: warning: unused variable 'nesting' [-Wunused-variable]
    2002 |         nmi_exit();
         |         ^~~~~~~~~~
   include/linux/hardirq.h:164:3: note: expanded from macro 'nmi_exit'
     164 |                 __nmi_exit();                                   \
         |                 ^~~~~~~~~~~~
   include/linux/hardirq.h:150:16: note: expanded from macro '__nmi_exit'
     150 |                 unsigned int nesting;                           \
         |                              ^~~~~~~
   2 warnings generated.


vim +/nesting +2002 arch/mips/kernel/traps.c

34bd92e27becdc Kevin Cernekee  2011-11-16  1990  
ff2d8b19a3a625 Joe Perches     2012-01-12  1991  void __noreturn nmi_exception_handler(struct pt_regs *regs)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1992  {
83e4da1ed45441 Leonid Yegoshin 2013-10-08  1993  	char str[100];
83e4da1ed45441 Leonid Yegoshin 2013-10-08  1994  
7963b3f127a748 Petri Gynther   2015-10-19  1995  	nmi_enter();
34bd92e27becdc Kevin Cernekee  2011-11-16  1996  	raw_notifier_call_chain(&nmi_chain, 0, regs);
41c594ab65fc89 Ralf Baechle    2006-04-05  1997  	bust_spinlocks(1);
83e4da1ed45441 Leonid Yegoshin 2013-10-08  1998  	snprintf(str, 100, "CPU%d NMI taken, CP0_EPC=%lx\n",
83e4da1ed45441 Leonid Yegoshin 2013-10-08  1999  		 smp_processor_id(), regs->cp0_epc);
83e4da1ed45441 Leonid Yegoshin 2013-10-08  2000  	regs->cp0_epc = read_c0_errorepc();
83e4da1ed45441 Leonid Yegoshin 2013-10-08  2001  	die(str, regs);
7963b3f127a748 Petri Gynther   2015-10-19 @2002  	nmi_exit();
^1da177e4c3f41 Linus Torvalds  2005-04-16  2003  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2004  

:::::: The code at line 2002 was first introduced by commit
:::::: 7963b3f127a7486815bc10639630c95c2792b811 MIPS: add nmi_enter() + nmi_exit() to nmi_exception_handler()

:::::: TO: Petri Gynther <pgynther@google.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
