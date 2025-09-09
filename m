Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B038218AC1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757380306; cv=none; b=YD7FD/EOdYOWGgWLz3QYpT/pvbBjo05t4Q1SGumgoHHRGJwBbvJr8ShqwqtkRM7gfQxzUI1LYBlsUu01S9JC4CrMgiYy6RDLiAOglTQYh9xlJyHeWTSq5ueNmP14PsLBPP5waVG+ni+HEjEw9GCNsVa+xQP2hfyEwpEezjfMnu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757380306; c=relaxed/simple;
	bh=NKA4J0QtiAs+3PkPqnRqL7O8XXFgO6tEccrRdeWaAzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QLlwMhG/hhdOv3Gwf8n1Qo++QkICL0svCb1QCKKRmtoRas3J3z8z3Px0hojRxwXkowFPgMqniAf8CiuGI23mOP0y7xD07BEDtTLZpdUmetM7V4uew8YkWAE2f2NnuvGQGfEbhq45ViKPHf0II33ozTkj5uPiGzry4Z3e50wyDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9lYd9WF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9lYd9WF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757380304; x=1788916304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKA4J0QtiAs+3PkPqnRqL7O8XXFgO6tEccrRdeWaAzU=;
  b=A9lYd9WFF7LMu7EwrrsQ+358fq+v379TVyp6TUAgmNTIzjmVH6YHLFyT
   yeg1o7/ghiX9vrrl296/pQ+PhgEP8eQ92t2mrIDJjkDzI7JycQrx9mXJJ
   Y3JnasUk32FNH0DIfXMB7xLQOx+Ap0oWd5AGMVfWdTTm8SAKodSao8OHz
   z91Z7LIN3KVcVIPdImk9HoXxUh5AG+XNjakH2bmhYYYWj+rt7yIk7u7DY
   nARmmUsT5cIjX6DDtYJIvox7+lIeQKhlIIBkguKsjwQKalp1cFhuCsSEB
   NwymMpDYEUktwuTbnN1nswBCHBp0ArzpAbO/GclB8ZEkLjRYYNeryigcJ
   g==;
X-CSE-ConnectionGUID: bbAaGI6OSumICgnTQM+jyQ==
X-CSE-MsgGUID: h+nDWjAZQSqUveiyheo1RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59512857"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59512857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:11:42 -0700
X-CSE-ConnectionGUID: 79xfsXjjSwGoGwRKx8z8AQ==
X-CSE-MsgGUID: 4UDCd+s0S1uNMFJklwgc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172119939"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 18:11:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvmtX-0004IX-21;
	Tue, 09 Sep 2025 01:11:39 +0000
Date: Tue, 9 Sep 2025 09:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 52/58]
 ./arch/arc/include/generated/asm/syscall_table_32.h:471:16: error:
 'sys_rseq_sched_yield' undeclared here (not in a function); did you mean
 'sys_rseq_slice_yield'?
Message-ID: <202509090936.FSl9ynmI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   a2e41ac0ef0218895394b1ac12abe5b67d6d62d0
commit: e10fa02843f1a0c8abe9ea4953b04cbe9e11abca [52/58] rseq: Implement sys_rseq_slice_yield()
config: arc-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090936.FSl9ynmI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090936.FSl9ynmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090936.FSl9ynmI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> <stdin>:1624:2: warning: #warning syscall rseq_slice_yield not implemented [-Wcpp]
--
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:462:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(461, sys_lsm_list_modules)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:463:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(462, sys_mseal)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[462]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:463:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(462, sys_mseal)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:464:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(463, sys_setxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[463]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:464:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(463, sys_setxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:465:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(464, sys_getxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[464]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:465:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(464, sys_getxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:466:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(465, sys_listxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[465]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:466:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(465, sys_listxattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:467:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(466, sys_removexattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[466]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:467:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(466, sys_removexattrat)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:468:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(467, sys_open_tree_attr)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[467]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:468:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(467, sys_open_tree_attr)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:469:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(468, sys_file_getattr)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[468]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:469:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(468, sys_file_getattr)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: warning: initialized field overwritten [-Woverride-init]
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:470:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(469, sys_file_setattr)
    ^~~~~~~~~
   arch/arc/kernel/sys.c:13:36: note: (near initialization for 'sys_call_table[469]')
    #define __SYSCALL(nr, call) [nr] = (call),
                                       ^
   ./arch/arc/include/generated/asm/syscall_table_32.h:470:1: note: in expansion of macro '__SYSCALL'
    __SYSCALL(469, sys_file_setattr)
    ^~~~~~~~~
>> ./arch/arc/include/generated/asm/syscall_table_32.h:471:16: error: 'sys_rseq_sched_yield' undeclared here (not in a function); did you mean 'sys_rseq_slice_yield'?
    __SYSCALL(470, sys_rseq_sched_yield)
                   ^~~~~~~~~~~~~~~~~~~~
   arch/arc/kernel/sys.c:13:37: note: in definition of macro '__SYSCALL'
    #define __SYSCALL(nr, call) [nr] = (call),
                                        ^~~~
--
>> <stdin>:1624:2: warning: #warning syscall rseq_slice_yield not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
