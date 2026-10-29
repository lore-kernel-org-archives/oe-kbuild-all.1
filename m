Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295603;
	b=XOWiTm3VbalBo25CWzHaHF8bWFP0Kl7r8KQz/FYqLKdPzxgHQGXe+Et6ShzObyr0WY38
	 uXpmxXr+86qyORcehh9yOx9zQYhSgMf9yHiLFqsCA3jYzqpMI7syoYCt/JWq0E8KvNTS6
	 N4HU3qCDlxqTr8tdiFwYR8CxrXg/7GJdH5df2GKU06MXHyh/v8Cj+SWAicje11UhTY5NW
	 8frKDWNp4lHh/ylZlBw+r0lHdKtwxJ/+klgnNyCjmJ1j5vgNpN+VS4HmM2y4fX6FADmxU
	 rxw3MRJWFwW8hDyeTzNUFbto+DC5ScZaSZjwAlWqOyXGi+VhjFRYF2R9CgJalD5+m0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SJJ0w0XdUu/k7IIeBX0GP9mpk0gjf0LoC9anZJ5zF0g=;
	b=M+WxW95/cIYhG5H3XVNx+HWxh8xseTMLkkTPtx7qyAdJKhin66sKHLy9Nt7zGJ2agHzI
	 RM/rWBEMzNDLvLFWZnvXVvynoOOZOFWBT4WXIqoE/chmdx3N36XGVtnOC6sw668eTwQMN
	 fUU1by4BsdDa0KWORzUNhfbgdAI8iILIedeen5/8ar35QZzITuO90AjvXDd34zXXn6AuP
	 bnOQTSaZY+ZGbj2xFCFG2TB+eLQuumHMwXz7PeKfRpuD9ZeUGV2VgglhD2eZUx04sYTDC
	 sAnkj3tf0VgkcjR5TzR095v3wsmdOv/KOe/ssEJPde9aMIfW6eA51uSJOBUMs9FDzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEEJ6lWF;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B77606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 17:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEEJ6lWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793295603; x=1824831603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u5HgmBDXOyRzkbzPzJO/zNpaoshpQohePkHMlutc62w=;
  b=PEEJ6lWFvNcNnXlWrT1ieP7zPS/4i01wFGejZzsHJuxVHesW9yat0G85
   2gU+J7bfduQHC0zDglHiS9D40CwuhJtxCw03mn1lAoTRs55Xrp9j3hqpN
   4Tz3gbRSaE7Njr7ftslraybfjJaWOaqydDFXm+R/DQ2bYfQlLyefF0+KL
   F6njav3b+S6r/PHeangvBu29x/6ISsb+j7nC5GS8J07m/IDHHRxSMPihP
   44YvmoDvXpR0SSxqhcXg6J/2NAHmY3YrwHhdwh5+ucXClR5zrR9JrdhA8
   iIu2XorJEKmhdwvSDlRf0qjcBObCwH2vXq7XSU2gbj236s1RPmnQZJs6P
   Q==;
X-CSE-ConnectionGUID: JKYHmUP7ThC3EwLjNp4tXw==
X-CSE-MsgGUID: N4ETE5JNSdyA/28TOgSDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1942678"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1942678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 10:40:03 -0700
X-CSE-ConnectionGUID: b0t9rBAKQTSltmUgAs8C0g==
X-CSE-MsgGUID: EhTHyW6gThuvv48y1Mo4VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5336277"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2026 10:40:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMU6Y-000000005Ir-43jF;
	Thu, 29 Oct 2026 17:39:58 +0000
Date: Thu, 29 Oct 2026 18:39:17 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 4/5] kernel/sys_ni.c:354:1: error:
 conflicting types for '__x64_sys_gettimeofday'
Message-ID: <202610291828.0Bgo0RWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x8=
6/syscall
head:   57a2da426dba48424406ee52c0c931c6d024138a
commit: 91b5c0df2a770d3c281a82da51feb9b488bd7ace [4/5] x86_64/entry: Mark a=
ll syscalls __noendbr
config: x86_64-randconfig-2200-20261029 (https://download.01.org/0day-ci/ar=
chive/20261029/202610291828.0Bgo0RWM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261029/202610291828.0Bgo0RWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291828.0Bgo0RWM-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> kernel/sys_ni.c:354:1: error: conflicting types for '__x64_sys_gettimeof=
day'
     354 | COND_SYSCALL(gettimeofday);
         | ^
   arch/x86/include/asm/syscall_wrapper.h:253:2: note: expanded from macro =
'COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                =
        \
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:116:2: note: expanded from macro =
'__X64_COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:101:14: note: expanded from macro=
 '__COND_SYSCALL'
     101 |         __weak long __##abi##_##name(const struct pt_regs *__unu=
sed);   \
         |                     ^
   <scratch space>:93:1: note: expanded from here
      93 | __x64_sys_gettimeofday
         | ^
   arch/x86/include/asm/syscall_wrapper.h:262:16: note: previous declaratio=
n is here
     262 | long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs=
);
         |                ^
>> kernel/sys_ni.c:354:1: error: conflicting types for '__x64_sys_gettimeof=
day'
     354 | COND_SYSCALL(gettimeofday);
         | ^
   arch/x86/include/asm/syscall_wrapper.h:253:2: note: expanded from macro =
'COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                =
        \
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:116:2: note: expanded from macro =
'__X64_COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:102:14: note: expanded from macro=
 '__COND_SYSCALL'
     102 |         __weak long __##abi##_##name(const struct pt_regs *__unu=
sed)    \
         |                     ^
   <scratch space>:96:1: note: expanded from here
      96 | __x64_sys_gettimeofday
         | ^
   arch/x86/include/asm/syscall_wrapper.h:262:16: note: previous declaratio=
n is here
     262 | long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs=
);
         |                ^
>> kernel/sys_ni.c:356:1: error: conflicting types for '__x64_sys_time'
     356 | COND_SYSCALL(time);
         | ^
   arch/x86/include/asm/syscall_wrapper.h:253:2: note: expanded from macro =
'COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                =
        \
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:116:2: note: expanded from macro =
'__X64_COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:101:14: note: expanded from macro=
 '__COND_SYSCALL'
     101 |         __weak long __##abi##_##name(const struct pt_regs *__unu=
sed);   \
         |                     ^
   <scratch space>:114:1: note: expanded from here
     114 | __x64_sys_time
         | ^
   arch/x86/include/asm/syscall_wrapper.h:263:16: note: previous declaratio=
n is here
     263 | long __noendbr __x64_sys_time(const struct pt_regs *regs);
         |                ^
>> kernel/sys_ni.c:356:1: error: conflicting types for '__x64_sys_time'
     356 | COND_SYSCALL(time);
         | ^
   arch/x86/include/asm/syscall_wrapper.h:253:2: note: expanded from macro =
'COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                =
        \
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:116:2: note: expanded from macro =
'__X64_COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^
   arch/x86/include/asm/syscall_wrapper.h:102:14: note: expanded from macro=
 '__COND_SYSCALL'
     102 |         __weak long __##abi##_##name(const struct pt_regs *__unu=
sed)    \
         |                     ^
   <scratch space>:117:1: note: expanded from here
     117 | __x64_sys_time
         | ^
   arch/x86/include/asm/syscall_wrapper.h:263:16: note: previous declaratio=
n is here
     263 | long __noendbr __x64_sys_time(const struct pt_regs *regs);
         |                ^
   4 errors generated.


vim +/__x64_sys_gettimeofday +354 kernel/sys_ni.c

70dd4b3160798b Dominik Brodowski 2018-03-06  330 =20
942437c97fd9ff Arnd Bergmann     2019-07-15  331  /* optional: time32 */
942437c97fd9ff Arnd Bergmann     2019-07-15  332  COND_SYSCALL(time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  333  COND_SYSCALL(stime32);
942437c97fd9ff Arnd Bergmann     2019-07-15  334  COND_SYSCALL(utime32);
942437c97fd9ff Arnd Bergmann     2019-07-15  335  COND_SYSCALL(adjtimex_tim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  336  COND_SYSCALL(sched_rr_get=
_interval_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  337  COND_SYSCALL(nanosleep_ti=
me32);
942437c97fd9ff Arnd Bergmann     2019-07-15  338  COND_SYSCALL(rt_sigtimedw=
ait_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  339  COND_SYSCALL_COMPAT(rt_si=
gtimedwait_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  340  COND_SYSCALL(timer_settim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  341  COND_SYSCALL(timer_gettim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  342  COND_SYSCALL(clock_settim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  343  COND_SYSCALL(clock_gettim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  344  COND_SYSCALL(clock_getres=
_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  345  COND_SYSCALL(clock_nanosl=
eep_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  346  COND_SYSCALL(utimes_time3=
2);
942437c97fd9ff Arnd Bergmann     2019-07-15  347  COND_SYSCALL(futimesat_ti=
me32);
942437c97fd9ff Arnd Bergmann     2019-07-15  348  COND_SYSCALL(pselect6_tim=
e32);
942437c97fd9ff Arnd Bergmann     2019-07-15  349  COND_SYSCALL_COMPAT(psele=
ct6_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  350  COND_SYSCALL(ppoll_time32=
);
942437c97fd9ff Arnd Bergmann     2019-07-15  351  COND_SYSCALL_COMPAT(ppoll=
_time32);
942437c97fd9ff Arnd Bergmann     2019-07-15  352  COND_SYSCALL(utimensat_ti=
me32);
942437c97fd9ff Arnd Bergmann     2019-07-15  353  COND_SYSCALL(clock_adjtim=
e32);
dce21fb3d57016 Thomas Wei=C3=9Fschuh  2026-07-02 @354  COND_SYSCALL(gettime=
ofday);
dce21fb3d57016 Thomas Wei=C3=9Fschuh  2026-07-02  355  COND_SYSCALL_COMPAT(=
gettimeofday);
dce21fb3d57016 Thomas Wei=C3=9Fschuh  2026-07-02 @356  COND_SYSCALL(time);
dce21fb3d57016 Thomas Wei=C3=9Fschuh  2026-07-02  357  COND_SYSCALL(stime);
70dd4b3160798b Dominik Brodowski 2018-03-06  358 =20

:::::: The code at line 354 was first introduced by commit
:::::: dce21fb3d570169388e2e9d8a60e8d42c1c82a51 time: Respect COMPAT_32BIT_=
TIME for old time type functions

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
