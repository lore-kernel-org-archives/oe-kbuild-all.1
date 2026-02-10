Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666A1EEA3C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688876; cv=none; b=Vfn73GwS5Xivig5vdnec6RlM/HLMFvuSMaYF88M7tsPbNQDI5ysT7/i9+HWw5tt3ANZ39nBhrgmNx4m1YnFezhAjcfNp9Q9pFWikkxa8AHv3gWKIJfpgvpPL0Fe5/QczNLDDgJ+FICZww8dWLR66tXqHgZe6xBnji0XIlCBR/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688876; c=relaxed/simple;
	bh=iwBWBk7jB8JaFx42b9mcvmxoUxoP5+K6ThbXnVIOKv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7zr70xeVWOg7PISiQGukrCkI5mf76yaZWaPE18EF0WJibfv3IouGFjD8dXf19fmdwDtGlxTOfCkXTegOErzfKbT2fEqmwED1WKqQjAv2wVF3IoTvcU8LiNGiUjeEDvOq3axOtPNriADIkve0uPZUBoWIT8tE0+0Nt9xhMh5oKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv7WG5lo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv7WG5lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770688874; x=1802224874;
  h=date:from:to:cc:subject:message-id;
  bh=iwBWBk7jB8JaFx42b9mcvmxoUxoP5+K6ThbXnVIOKv4=;
  b=Hv7WG5loD61lUYnmydjQXEdYaVItHdVA3MOyeyCRJSWyT9Gx4ZwPaGgF
   rs73hKm2/pTDJcqawAWx6Y0VVuDRcFtGJh7nq2fgb7sxj7+ytfaOWHDQ6
   NYtorWKDKAy6UihULYHAeRhwDTg5fT4Bfg5DJviZfjTKo1zTEOJJYOT5Z
   MIToWAnWZTzSEyPlrduI5eRIaiTrJ9KLlusKShO33W8Tf0MvZidT12sHy
   mYJ44w8tmsqQQaC4+hWwhCH0tvTpHxKr+cugnFAWJE54cBic4nZAPN1/I
   LRYDFLb+vDFIZO4ZHCiBdUoXZ5m78dUffcdpEfoINF+9vroZ253219iLn
   g==;
X-CSE-ConnectionGUID: tDN7hw8tTb2P5w5f47n2gA==
X-CSE-MsgGUID: ikZoHVDQQ76aJvGI/WB0oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71877863"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71877863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:01:13 -0800
X-CSE-ConnectionGUID: lp5ByHs3TQ6yeVvgBb/dYA==
X-CSE-MsgGUID: AbPqIAaXRAW5s1V3Gjl3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234721038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 18:01:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpd3s-00000000oVo-0vtT;
	Tue, 10 Feb 2026 02:01:08 +0000
Date: Tue, 10 Feb 2026 10:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 9883/12313]
 include/linux/entry-common.h:33:34: error: 'SYSCALL_WORK_SECCOMP' undeclared;
 did you mean 'SYSCALL_WORK_EXIT'?
Message-ID: <202602100954.BAVYq6aC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: 026d70dcfe5de1543bb8edb8e50d22dc16863e6b [9883/12313] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: um-randconfig-r134-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100954.BAVYq6aC-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100954.BAVYq6aC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100954.BAVYq6aC-lkp@intel.com/

Note: the linux-next/master HEAD 132737e360b4c0daa7f473faf0f55cb04ee3e15c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:581:27: note: in definition of macro '__unqual_scalar_typeof'
     581 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380:
   include/linux/entry-common.h:75:61: error: 'struct thread_info' has no member named 'syscall_work'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/entry-common.h:75:30: note: in expansion of macro 'READ_ONCE'
      75 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
>> include/linux/entry-common.h:33:34: error: 'SYSCALL_WORK_SECCOMP' undeclared (first use in this function); did you mean 'SYSCALL_WORK_EXIT'?
      33 | #define SYSCALL_WORK_ENTER      (SYSCALL_WORK_SECCOMP |                 \
         |                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:34:34: error: 'SYSCALL_WORK_SYSCALL_TRACEPOINT' undeclared (first use in this function)
      34 |                                  SYSCALL_WORK_SYSCALL_TRACEPOINT |      \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:35:34: error: 'SYSCALL_WORK_SYSCALL_TRACE' undeclared (first use in this function)
      35 |                                  SYSCALL_WORK_SYSCALL_TRACE |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:36:34: error: 'SYSCALL_WORK_SYSCALL_EMU' undeclared (first use in this function)
      36 |                                  SYSCALL_WORK_SYSCALL_EMU |             \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:37:34: error: 'SYSCALL_WORK_SYSCALL_AUDIT' undeclared (first use in this function)
      37 |                                  SYSCALL_WORK_SYSCALL_AUDIT |           \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:38:34: error: 'SYSCALL_WORK_SYSCALL_USER_DISPATCH' undeclared (first use in this function)
      38 |                                  SYSCALL_WORK_SYSCALL_USER_DISPATCH |   \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:77:20: note: in expansion of macro 'SYSCALL_WORK_ENTER'
      77 |         if (work & SYSCALL_WORK_ENTER)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h: In function 'syscall_exit_to_user_mode_work':
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                                                             ^~
   include/linux/compiler_types.h:611:23: note: in definition of macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h:139:30: note: in expansion of macro 'READ_ONCE'
     139 |         unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
         |                              ^~~~~~~~~
   include/linux/entry-common.h:139:61: error: 'struct thread_info' has no member named 'syscall_work'


vim +33 include/linux/entry-common.h

a9f3a74a29af09 Thomas Gleixner         2020-07-22  32  
524666cb5de7c3 Gabriel Krisman Bertazi 2020-11-16 @33  #define SYSCALL_WORK_ENTER	(SYSCALL_WORK_SECCOMP |			\
64c19ba29b66e9 Gabriel Krisman Bertazi 2020-11-16  34  				 SYSCALL_WORK_SYSCALL_TRACEPOINT |	\
64eb35f701f04b Gabriel Krisman Bertazi 2020-11-16  35  				 SYSCALL_WORK_SYSCALL_TRACE |		\
785dc4eb7fd74e Gabriel Krisman Bertazi 2020-11-16  36  				 SYSCALL_WORK_SYSCALL_EMU |		\
2991552447707d Gabriel Krisman Bertazi 2020-11-16  37  				 SYSCALL_WORK_SYSCALL_AUDIT |		\
11894468e39def Gabriel Krisman Bertazi 2020-11-27  38  				 SYSCALL_WORK_SYSCALL_USER_DISPATCH |	\
2991552447707d Gabriel Krisman Bertazi 2020-11-16  39  				 ARCH_SYSCALL_WORK_ENTER)
5204be16790f30 Thomas Gleixner         2025-10-27  40  

:::::: The code at line 33 was first introduced by commit
:::::: 524666cb5de7c38a1925e7401a6e59d68682dd8c tracepoints: Migrate to use SYSCALL_WORK flag

:::::: TO: Gabriel Krisman Bertazi <krisman@collabora.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
