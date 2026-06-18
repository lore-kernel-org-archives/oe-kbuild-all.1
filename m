Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7E1A680F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781822554; cv=none; b=AxzeKp7gttQymwXOdyKomt1u8EYROuqbpKAObQ7pECHC/a+ZazWIPOk2vSAuBHyGKnOhXfpQtLDUlD4Yz+Q8sg8Ur1zIU1ATTZ97IaBEvqtIoATGXp+S5VlbnFBM3GySBDJ4neAfwBeoemKu4lPEKlb8fi2usyaNcuqiM7sOQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781822554; c=relaxed/simple;
	bh=uENp/azN5x5nnvUPozCQozAjPZNUrnfd41iEsHPZudU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=udmKQeL7fRnIoW3WKECoWsOmqorMS8AHwuHHfmdBXU6/HwaCQWSQ6qoiIppaBN+gJllhdaUj2Irzd778yBQpGcjHJahgi+gJsq0FzlvvfZZ+hQNKkhHRngPwoFUDqUJV7R9w1Wrr5WHbxBADxwnmySplM6Qcak9qz9+tjYbtxa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEN7JY7R; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEN7JY7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781822553; x=1813358553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uENp/azN5x5nnvUPozCQozAjPZNUrnfd41iEsHPZudU=;
  b=gEN7JY7R5R8dyPoFYsCDlYMlKcHJPCNVFmlGpfKfITumqNKV9AFXapZm
   ZrGGd7VstHcZQ62jy6vEOiuit49HyknIvcRec8VFmGcHKQmxhtD7aR6nK
   hr2RSZBYGwk0EkscDMddg086QNW5eLUcxLsvH6dkRFjg+ZEcqgrkngqCj
   eenqY2g+rU16S7+z+9VwKWeV+eqPVDdaT7DbHX6UitEvKw3bHPHWzlhG6
   vFrbrjmlrJDck8cctGJ0J8Am5K241oADRamvm18JPhzdJDYCk9/PQ1YQZ
   CQW+Guza9xJi2xBcLFZmFHBiwc6GKPePJeKXrs7PwuVtE4uV/ZN2DKquY
   A==;
X-CSE-ConnectionGUID: a2Xs76EtTO24j8gmzvV05Q==
X-CSE-MsgGUID: TTczh44aRmGntVRQyln1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82555375"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="82555375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 15:42:32 -0700
X-CSE-ConnectionGUID: 9vX+SS0LRbyMnMPBSTu/VQ==
X-CSE-MsgGUID: d38q/ISzRwqeKsDAju6z7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="248564093"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2026 15:42:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waLRI-000000005cD-0vK5;
	Thu, 18 Jun 2026 22:42:24 +0000
Date: Fri, 19 Jun 2026 00:42:18 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 6/7]
 usr/include/asm/sigcontext.h:31:8: error: redefinition of 'struct sigcontext'
Message-ID: <202606190005.bY8QVJPF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   83b42de6c40c2677c747eb1d255ff74d47bc99b5
commit: d7b93ca7defb9c670d1ff0f371128dad92249849 [6/7] treewide: uapi: Add necessary includes to ucontext.h
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260619/202606190005.bY8QVJPF-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606190005.bY8QVJPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606190005.bY8QVJPF-lkp@intel.com/

Note: the thomas-weissschuh/b4/uapi-ucontext HEAD 83b42de6c40c2677c747eb1d255ff74d47bc99b5 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from usr/include/asm/ucontext.h:13,
                    from cbo.c:17:
>> usr/include/asm/sigcontext.h:31:8: error: redefinition of 'struct sigcontext'
      31 | struct sigcontext {
         |        ^~~~~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/signal.h:301,
                    from cbo.c:13:
   /usr/riscv64-linux-gnu/include/bits/sigcontext.h:25:8: note: originally defined here
      25 | struct sigcontext {
         |        ^~~~~~~~~~
   In file included from usr/include/asm/signal.h:1,
                    from usr/include/asm/ucontext.h:14:
>> usr/include/asm-generic/signal.h:63:3: error: conflicting types for 'sigset_t'; have 'struct <anonymous>'
      63 | } sigset_t;
         |   ^~~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/signal.h:35:
   /usr/riscv64-linux-gnu/include/bits/types/sigset_t.h:7:20: note: previous declaration of 'sigset_t' with type 'sigset_t'
       7 | typedef __sigset_t sigset_t;
         |                    ^~~~~~~~
>> usr/include/asm-generic/signal.h:74:8: error: redefinition of 'struct sigaction'
      74 | struct sigaction {
         |        ^~~~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/signal.h:229:
   /usr/riscv64-linux-gnu/include/bits/sigaction.h:27:8: note: originally defined here
      27 | struct sigaction
         |        ^~~~~~~~~
>> usr/include/asm-generic/signal.h:75:24: error: expected ':', ',', ';', '}' or '__attribute__' before '.' token
      75 |         __sighandler_t sa_handler;
         |                        ^~~~~~~~~~
>> usr/include/asm-generic/signal.h:87:3: error: conflicting types for 'stack_t'; have 'struct sigaltstack'
      87 | } stack_t;
         |   ^~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/signal.h:313:
   /usr/riscv64-linux-gnu/include/bits/types/stack_t.h:31:5: note: previous declaration of 'stack_t' with type 'stack_t'
      31 |   } stack_t;
         |     ^~~~~~~
   cbo.c: In function 'test_zicbop':
>> cbo.c:113:18: error: 'struct sigaction' has no member named '__sigaction_handler'
     113 |                 .sa_sigaction = &fault_handler,
         |                  ^~~~~~~~~~~~
>> cbo.c:113:33: warning: excess elements in struct initializer
     113 |                 .sa_sigaction = &fault_handler,
         |                                 ^
   cbo.c:113:33: note: (near initialization for 'act')
>> cbo.c:114:18: error: 'struct sigaction' has no member named 'sa_flags'
     114 |                 .sa_flags = SA_SIGINFO
         |                  ^~~~~~~~
   cbo.c:114:29: warning: excess elements in struct initializer
     114 |                 .sa_flags = SA_SIGINFO
         |                             ^~~~~~~~~~
   cbo.c:114:29: note: (near initialization for 'act')
   cbo.c:117:18: error: 'struct sigaction' has no member named '__sigaction_handler'
     117 |                 .sa_handler = SIG_DFL
         |                  ^~~~~~~~~~
   cbo.c:117:31: warning: excess elements in struct initializer
     117 |                 .sa_handler = SIG_DFL
         |                               ^~~~~~~
   cbo.c:117:31: note: (near initialization for 'dfl')
>> cbo.c:123:33: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     123 |         rc = sigaction(SIGSEGV, &act, NULL);
         |                                 ^~~~
         |                                 |
         |                                 struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cbo.c:125:32: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     125 |         rc = sigaction(SIGBUS, &act, NULL);
         |                                ^~~~
         |                                |
         |                                struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cbo.c:146:32: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     146 |         rc = sigaction(SIGBUS, &dfl, NULL);
         |                                ^~~~
         |                                |
         |                                struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cbo.c:148:33: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     148 |         rc = sigaction(SIGSEGV, &dfl, NULL);
         |                                 ^~~~
         |                                 |
         |                                 struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cbo.c: In function 'main':
   cbo.c:298:18: error: 'struct sigaction' has no member named '__sigaction_handler'
     298 |                 .sa_sigaction = &fault_handler,
         |                  ^~~~~~~~~~~~
   cbo.c:298:33: warning: excess elements in struct initializer
     298 |                 .sa_sigaction = &fault_handler,
         |                                 ^
   cbo.c:298:33: note: (near initialization for 'act')
   cbo.c:299:18: error: 'struct sigaction' has no member named 'sa_flags'
     299 |                 .sa_flags = SA_SIGINFO,
         |                  ^~~~~~~~
   cbo.c:299:29: warning: excess elements in struct initializer
     299 |                 .sa_flags = SA_SIGINFO,
         |                             ^~~~~~~~~~
   cbo.c:299:29: note: (near initialization for 'act')
   cbo.c:314:48: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     314 |                         rc = sigaction(SIGILL, &act, NULL);
         |                                                ^~~~
         |                                                |
         |                                                struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cbo.c:320:48: error: passing argument 2 of 'sigaction' from incompatible pointer type [-Wincompatible-pointer-types]
     320 |                         rc = sigaction(SIGILL, &act, NULL);
         |                                                ^~~~
         |                                                |
         |                                                struct sigaction *
   /usr/riscv64-linux-gnu/include/signal.h:243:69: note: expected 'const struct sigaction * restrict' but argument is of type 'struct sigaction *'
     243 | extern int sigaction (int __sig, const struct sigaction *__restrict __act,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
