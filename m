Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC518A93F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775870872; cv=none; b=Q+AK4NB+KBA9akLp3BLFT2NnBDMqEBJv/BtBs4lfs4QMdPGpH6tC9F44un+hVS+258op2L/0zPWGTLfCNLLMBERaqNpNisasJOg9+agnrhthVwqNxb3EY8eRoRpLuVGMYSMhm+qLcH3TbJdP2zaLaW4UAHmE+4JobPSh6YKgCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775870872; c=relaxed/simple;
	bh=dCoexFrbxARPRQYSW3TncuX9yKCV6BhlSPxsJD6PtbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tIIJjPB+zpJcG4Fn1kdv/gvE28a1xe8hp/P0J6yx+Cpahs2s4MzjKzC+z6UygAe4GKGQGAZ6ZkLBqO9siSZrNDzTx65w2G9alXLnioAJbNj+sIyuNyyel9qdix+mMMptVVIp/VMnOXp6VPKQCGYySEkw6kQiViUUEKMHTPw5Nwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9iovSPz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9iovSPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775870872; x=1807406872;
  h=date:from:to:cc:subject:message-id;
  bh=dCoexFrbxARPRQYSW3TncuX9yKCV6BhlSPxsJD6PtbI=;
  b=L9iovSPzn3Xo1qGvhipBr4ErGRk1/GExZgMFFy1Yy1tdunUqi432r5Mh
   pUhGBPHpLub3dkhTejxo1ZQsjfpmkQbUSEraFTNt+XEwINVBnnyHc07nG
   qVe8wPb3lspyDmyeG1aF9qKrCMX1qrlQIODvE5iM+CJFg6F2yClGuagFy
   YaUc3IrauYI+Aek5HKhaSo6MKD4GLoc8S9gYnLgkLjypMt4KdabkEu/4L
   kVn5MYzTVBOjXp1DLGVYV5PSIGJMlaeZUdFtYPdbxBdQGAo9Ds16AIaLA
   6wL3Ld9m/ItQ2Eo73iMBStzu9EKEpKk7Sxo7AO/krVD85FhdxQf6hv2Bu
   Q==;
X-CSE-ConnectionGUID: +P15Esz+RE2HtJB2APRIlw==
X-CSE-MsgGUID: ZPI8/9MlQ5Kw/ID9quAkOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76913020"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76913020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:27:52 -0700
X-CSE-ConnectionGUID: 6s31zDKzQdKa0NQH0D3+Bw==
X-CSE-MsgGUID: Z0n6mqUhQCCLgYMWdCxyLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="234179566"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 18:27:50 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBN8V-000000000Zn-3DbN;
	Sat, 11 Apr 2026 01:27:47 +0000
Date: Sat, 11 Apr 2026 09:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lindholm-alpha:entry 6/6]
 kernel/trace/trace_syscalls.c:1329:31: error: 'sys_call_table' undeclared;
 did you mean 'syscall_args'?
Message-ID: <202604110917.wbLT5RlZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Magnus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git entry
head:   4bb73d9a56dfa80e74d48a8631fa456561adb534
commit: dd381ec93e43e70caf8dcc4bbad69a43aefb11cb [6/6] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110917.wbLT5RlZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110917.wbLT5RlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110917.wbLT5RlZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/trace/trace_syscalls.c: In function 'arch_syscall_addr':
>> kernel/trace/trace_syscalls.c:1329:31: error: 'sys_call_table' undeclared (first use in this function); did you mean 'syscall_args'?
    1329 |         return (unsigned long)sys_call_table[nr];
         |                               ^~~~~~~~~~~~~~
         |                               syscall_args
   kernel/trace/trace_syscalls.c:1329:31: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace_syscalls.c:1327:51: warning: parameter 'nr' set but not used [-Wunused-but-set-parameter]
    1327 | unsigned long __init __weak arch_syscall_addr(int nr)
         |                                               ~~~~^~


vim +1329 kernel/trace/trace_syscalls.c

6f86ab9fcaef12 Vaibhav Nagarnaik 2012-06-07  1326  
c763ba06bd9b5d Ian Munsie        2011-02-03 @1327  unsigned long __init __weak arch_syscall_addr(int nr)
e7b8e675d9c71b Mike Frysinger    2010-01-26  1328  {
e7b8e675d9c71b Mike Frysinger    2010-01-26 @1329  	return (unsigned long)sys_call_table[nr];
e7b8e675d9c71b Mike Frysinger    2010-01-26  1330  }
e7b8e675d9c71b Mike Frysinger    2010-01-26  1331  

:::::: The code at line 1329 was first introduced by commit
:::::: e7b8e675d9c71b868b66f62f725a948047514719 tracing: Unify arch_syscall_addr() implementations

:::::: TO: Mike Frysinger <vapier@gentoo.org>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
