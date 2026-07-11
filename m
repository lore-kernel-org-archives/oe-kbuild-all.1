Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197381C3F31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 03:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739550; cv=none; b=LUirMteBheja9Xpk1cXtNrdQb7LkBHgCQvcJ5IY0QcaBLHGeEgALRQqSRqOpoH1kwHcRi9biXjmNUyhIT8FtH77Ymj3IdEFmfN9Idqy0vqoJenPM5+Gd57+G87ZNs0mE6rraVW5gEvMg1vIPGw8wB60l3MkYj5EXlbSYhGndwjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739550; c=relaxed/simple;
	bh=4JbO2OMYTZoSGibXGDIBwRzxXPtxvD4HSeT5+HlZ1Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VOETCYCiKi9LsmhfuJn1RuktfsHUWdphNQBzk6aXi0n/8VknlfgAQ3N4ljjSypewEVpUUBJ6jR9OvKTth73gcJh8tmAGcmrIlV0FEZhvtKKRQsJSgfpQWIL6C+sk8xr3IQxOF0ucMgX2C0dW+yO2UYfJUOsi1+FPlTNm5FAlZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sm/AIK3P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sm/AIK3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783739548; x=1815275548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JbO2OMYTZoSGibXGDIBwRzxXPtxvD4HSeT5+HlZ1Bo=;
  b=Sm/AIK3Pzy1LUmWBTBuqwzP+obHTCvne9qpQ3P/u1kjrDVZtqax9M3s+
   Ml6ilcZehE8mQCLWrn8unUHCmeQh8YhtTXTocUzUZkaELWEcJSd2L+Q3f
   ThNvYnUQI2kDKkQdC8zDwgmMajzCQSlI6jNd61V9bqApRVvyHbk6kZC+4
   h7CCw2h39ewyoibWnygYkQSi1mmcpgu5ztM+4eMD7hvVqmg2GwKfWWOvS
   5b0nR8QMxShga+Ol/LTTiSBb2bkUgcUQb+pF2LrGLTzPc+Gh7LeFM1nj3
   3epvu9i9zDI7vvjBHl7fu36D+Uoc4+T9zFRBXEySR8omyBN8cYhiCwXw7
   w==;
X-CSE-ConnectionGUID: D273Cc9DQgyecxHoFR51SA==
X-CSE-MsgGUID: 4rqV2ioYSkODJEddjsfw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84216928"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84216928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 20:12:27 -0700
X-CSE-ConnectionGUID: O6NIMTBpTcm/PbVUoNyuLg==
X-CSE-MsgGUID: J5+KOHQGSEaTcv/LyJm3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252409674"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2026 20:12:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiO8c-00000000Jge-3oIY;
	Sat, 11 Jul 2026 03:12:22 +0000
Date: Sat, 11 Jul 2026 11:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Michal =?utf-8?Q?Such=C3=A1nek"?= <msuchanek@suse.de>
Subject: [powerpc:fixes-test 12/12]
 arch/powerpc/include/asm/ptrace.h:245:23: error: call to undeclared function
 'BIT'; ISO C99 and later do not support implicit function declarations
Message-ID: <202607111027.VbonWf7Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
head:   afc2830892a128a13a65f677271a0a48aeb61b5e
commit: afc2830892a128a13a65f677271a0a48aeb61b5e [12/12] powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
config: powerpc-randconfig-r112-20260711 (https://download.01.org/0day-ci/archive/20260711/202607111027.VbonWf7Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111027.VbonWf7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111027.VbonWf7Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:5:
   In file included from include/linux/user.h:1:
   In file included from arch/powerpc/include/asm/user.h:5:
>> arch/powerpc/include/asm/ptrace.h:245:23: error: call to undeclared function 'BIT'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     245 |         regs->entry_flags |= SYSCALL_ENTRY_RET_SET;
         |                              ^
   arch/powerpc/include/asm/ptrace.h:241:31: note: expanded from macro 'SYSCALL_ENTRY_RET_SET'
     241 | #define SYSCALL_ENTRY_RET_SET   BIT(0)
         |                                 ^
   arch/powerpc/include/asm/ptrace.h:250:36: error: call to undeclared function 'BIT'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     250 |         bool set = !!(regs->entry_flags & SYSCALL_ENTRY_RET_SET);
         |                                           ^
   arch/powerpc/include/asm/ptrace.h:241:31: note: expanded from macro 'SYSCALL_ENTRY_RET_SET'
     241 | #define SYSCALL_ENTRY_RET_SET   BIT(0)
         |                                 ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/of/fdt.c:11:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'


vim +/BIT +245 arch/powerpc/include/asm/ptrace.h

   242	
   243	static inline void set_syscall_entry_ret(struct pt_regs *regs)
   244	{
 > 245		regs->entry_flags |= SYSCALL_ENTRY_RET_SET;
   246	}
   247	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
