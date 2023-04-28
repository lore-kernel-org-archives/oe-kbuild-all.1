Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B017D5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682693259; x=1714229259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PY2JgP9bc992a47wfhzuBPjCA72+mowo9SP9JVCXvLo=;
  b=XIoAeCTEgOTgjeSaznebgjGF4FBHWV9Zpo+sQSreDLpKzbX1bCemUvWA
   LgEiBji46EqX0cU5R5r8f7K5Yk5S1AsP9A3JFF6qOFHG7YCcefyIy548U
   P9X6HNnfxe1ZaSiIAboOIXpPiMQbiaWpmyy5tVh0Bdme7ClQ+cmj2tdmz
   1Nuna30W0KQTBit1jW7SgdJaPVKLawqkxohfm/NAyraP1zHo1jXUoc/Ia
   Yx3lqaA569yaYVkPjd3AsKhlNvdrQDs0/Ee+eiGHUfO0hn1A80/Tyx30R
   qJUX2dY/JYwr53zKnH3FkVvmFx6Px3h/QxYcHlsGuWB2Tz2Zl3J8rNQc2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327390294"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="327390294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 07:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725377539"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="725377539"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 07:47:36 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psPNn-0000Vj-1W;
	Fri, 28 Apr 2023 14:47:35 +0000
Date: Fri, 28 Apr 2023 22:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [sudeep-holla:android13-5.10/ffa 8920/9999]
 arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype
 for '__x64_sys_process_mrelease'
Message-ID: <202304282223.x6FbxQD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 11a2f368e4bc4d124edb9ed23d88b9ee7aecbf65 [8920/9999] UPSTREAM: mm: wire up syscall process_mrelease
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230428/202304282223.x6FbxQD9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=11a2f368e4bc4d124edb9ed23d88b9ee7aecbf65
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.10/ffa
        git checkout 11a2f368e4bc4d124edb9ed23d88b9ee7aecbf65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304282223.x6FbxQD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:275:1: note: in expansion of macro 'COND_SYSCALL'
     275 | COND_SYSCALL(mprotect);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_msync' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:276:1: note: in expansion of macro 'COND_SYSCALL'
     276 | COND_SYSCALL(msync);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_mlock' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:277:1: note: in expansion of macro 'COND_SYSCALL'
     277 | COND_SYSCALL(mlock);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_munlock' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:278:1: note: in expansion of macro 'COND_SYSCALL'
     278 | COND_SYSCALL(munlock);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_mlockall' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:279:1: note: in expansion of macro 'COND_SYSCALL'
     279 | COND_SYSCALL(mlockall);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_munlockall' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:280:1: note: in expansion of macro 'COND_SYSCALL'
     280 | COND_SYSCALL(munlockall);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_mincore' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:281:1: note: in expansion of macro 'COND_SYSCALL'
     281 | COND_SYSCALL(mincore);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_madvise' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:282:1: note: in expansion of macro 'COND_SYSCALL'
     282 | COND_SYSCALL(madvise);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_process_madvise' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:283:1: note: in expansion of macro 'COND_SYSCALL'
     283 | COND_SYSCALL(process_madvise);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_process_mrelease' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:284:1: note: in expansion of macro 'COND_SYSCALL'
     284 | COND_SYSCALL(process_mrelease);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_remap_file_pages' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:285:1: note: in expansion of macro 'COND_SYSCALL'
     285 | COND_SYSCALL(remap_file_pages);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_mbind' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:286:1: note: in expansion of macro 'COND_SYSCALL'
     286 | COND_SYSCALL(mbind);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x32_compat_sys_mbind' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:175:9: note: in expansion of macro '__COND_SYSCALL'
     175 |         __COND_SYSCALL(x32, compat_sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:219:9: note: in expansion of macro '__X32_COMPAT_COND_SYSCALL'
     219 |         __X32_COMPAT_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:287:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
     287 | COND_SYSCALL_COMPAT(mbind);
         | ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_get_mempolicy' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:288:1: note: in expansion of macro 'COND_SYSCALL'
     288 | COND_SYSCALL(get_mempolicy);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x32_compat_sys_get_mempolicy' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:175:9: note: in expansion of macro '__COND_SYSCALL'
     175 |         __COND_SYSCALL(x32, compat_sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:219:9: note: in expansion of macro '__X32_COMPAT_COND_SYSCALL'
     219 |         __X32_COMPAT_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:289:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
     289 | COND_SYSCALL_COMPAT(get_mempolicy);
         | ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_set_mempolicy' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:290:1: note: in expansion of macro 'COND_SYSCALL'
     290 | COND_SYSCALL(set_mempolicy);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x32_compat_sys_set_mempolicy' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:175:9: note: in expansion of macro '__COND_SYSCALL'
     175 |         __COND_SYSCALL(x32, compat_sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:219:9: note: in expansion of macro '__X32_COMPAT_COND_SYSCALL'
     219 |         __X32_COMPAT_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:291:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
     291 | COND_SYSCALL_COMPAT(set_mempolicy);
         | ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_migrate_pages' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)


vim +/__x64_sys_process_mrelease +83 arch/x86/include/asm/syscall_wrapper.h

cc42c045af1ff4 Brian Gerst       2020-03-13  13  
25c619e59b395a Brian Gerst       2020-03-13  14  /*
25c619e59b395a Brian Gerst       2020-03-13  15   * Instead of the generic __SYSCALL_DEFINEx() definition, the x86 version takes
25c619e59b395a Brian Gerst       2020-03-13  16   * struct pt_regs *regs as the only argument of the syscall stub(s) named as:
25c619e59b395a Brian Gerst       2020-03-13  17   * __x64_sys_*()         - 64-bit native syscall
25c619e59b395a Brian Gerst       2020-03-13  18   * __ia32_sys_*()        - 32-bit native syscall or common compat syscall
25c619e59b395a Brian Gerst       2020-03-13  19   * __ia32_compat_sys_*() - 32-bit compat syscall
25c619e59b395a Brian Gerst       2020-03-13  20   * __x32_compat_sys_*()  - 64-bit X32 compat syscall
25c619e59b395a Brian Gerst       2020-03-13  21   *
25c619e59b395a Brian Gerst       2020-03-13  22   * The registers are decoded according to the ABI:
25c619e59b395a Brian Gerst       2020-03-13  23   * 64-bit: RDI, RSI, RDX, R10, R8, R9
25c619e59b395a Brian Gerst       2020-03-13  24   * 32-bit: EBX, ECX, EDX, ESI, EDI, EBP
25c619e59b395a Brian Gerst       2020-03-13  25   *
25c619e59b395a Brian Gerst       2020-03-13  26   * The stub then passes the decoded arguments to the __se_sys_*() wrapper to
25c619e59b395a Brian Gerst       2020-03-13  27   * perform sign-extension (omitted for zero-argument syscalls).  Finally the
25c619e59b395a Brian Gerst       2020-03-13  28   * arguments are passed to the __do_sys_*() function which is the actual
25c619e59b395a Brian Gerst       2020-03-13  29   * syscall.  These wrappers are marked as inline so the compiler can optimize
25c619e59b395a Brian Gerst       2020-03-13  30   * the functions where appropriate.
25c619e59b395a Brian Gerst       2020-03-13  31   *
25c619e59b395a Brian Gerst       2020-03-13  32   * Example assembly (slightly re-ordered for better readability):
25c619e59b395a Brian Gerst       2020-03-13  33   *
25c619e59b395a Brian Gerst       2020-03-13  34   * <__x64_sys_recv>:		<-- syscall with 4 parameters
25c619e59b395a Brian Gerst       2020-03-13  35   *	callq	<__fentry__>
25c619e59b395a Brian Gerst       2020-03-13  36   *
25c619e59b395a Brian Gerst       2020-03-13  37   *	mov	0x70(%rdi),%rdi	<-- decode regs->di
25c619e59b395a Brian Gerst       2020-03-13  38   *	mov	0x68(%rdi),%rsi	<-- decode regs->si
25c619e59b395a Brian Gerst       2020-03-13  39   *	mov	0x60(%rdi),%rdx	<-- decode regs->dx
25c619e59b395a Brian Gerst       2020-03-13  40   *	mov	0x38(%rdi),%rcx	<-- decode regs->r10
25c619e59b395a Brian Gerst       2020-03-13  41   *
25c619e59b395a Brian Gerst       2020-03-13  42   *	xor	%r9d,%r9d	<-- clear %r9
25c619e59b395a Brian Gerst       2020-03-13  43   *	xor	%r8d,%r8d	<-- clear %r8
25c619e59b395a Brian Gerst       2020-03-13  44   *
25c619e59b395a Brian Gerst       2020-03-13  45   *	callq	__sys_recvfrom	<-- do the actual work in __sys_recvfrom()
25c619e59b395a Brian Gerst       2020-03-13  46   *				    which takes 6 arguments
25c619e59b395a Brian Gerst       2020-03-13  47   *
25c619e59b395a Brian Gerst       2020-03-13  48   *	cltq			<-- extend return value to 64-bit
25c619e59b395a Brian Gerst       2020-03-13  49   *	retq			<-- return
25c619e59b395a Brian Gerst       2020-03-13  50   *
25c619e59b395a Brian Gerst       2020-03-13  51   * This approach avoids leaking random user-provided register content down
25c619e59b395a Brian Gerst       2020-03-13  52   * the call chain.
25c619e59b395a Brian Gerst       2020-03-13  53   */
25c619e59b395a Brian Gerst       2020-03-13  54  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  55  /* Mapping of registers to parameters for syscalls on x86-64 and x32 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  56  #define SC_X86_64_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  57  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  58  		,,regs->di,,regs->si,,regs->dx				\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  59  		,,regs->r10,,regs->r8,,regs->r9)			\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  60  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  61  /* Mapping of registers to parameters for syscalls on i386 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  62  #define SC_IA32_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  63  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  64  	      ,,(unsigned int)regs->bx,,(unsigned int)regs->cx		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  65  	      ,,(unsigned int)regs->dx,,(unsigned int)regs->si		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  66  	      ,,(unsigned int)regs->di,,(unsigned int)regs->bp)
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  67  
d2b5de495ee983 Brian Gerst       2020-03-13  68  #define __SYS_STUB0(abi, name)						\
0f78ff17112d8b Brian Gerst       2020-03-13  69  	long __##abi##_##name(const struct pt_regs *regs);		\
d2b5de495ee983 Brian Gerst       2020-03-13  70  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  71  	long __##abi##_##name(const struct pt_regs *regs)		\
d2b5de495ee983 Brian Gerst       2020-03-13  72  		__alias(__do_##name);
d2b5de495ee983 Brian Gerst       2020-03-13  73  
4399e0cf494f73 Brian Gerst       2020-03-13  74  #define __SYS_STUBx(abi, name, ...)					\
0f78ff17112d8b Brian Gerst       2020-03-13  75  	long __##abi##_##name(const struct pt_regs *regs);		\
4399e0cf494f73 Brian Gerst       2020-03-13  76  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  77  	long __##abi##_##name(const struct pt_regs *regs)		\
4399e0cf494f73 Brian Gerst       2020-03-13  78  	{								\
4399e0cf494f73 Brian Gerst       2020-03-13  79  		return __se_##name(__VA_ARGS__);			\
4399e0cf494f73 Brian Gerst       2020-03-13  80  	}
4399e0cf494f73 Brian Gerst       2020-03-13  81  
6cc8d2b286d9e7 Brian Gerst       2020-03-13  82  #define __COND_SYSCALL(abi, name)					\
0f78ff17112d8b Brian Gerst       2020-03-13 @83  	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  84  	{								\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  85  		return sys_ni_syscall();				\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  86  	}
6cc8d2b286d9e7 Brian Gerst       2020-03-13  87  

:::::: The code at line 83 was first introduced by commit
:::::: 0f78ff17112d8b3469b805ff4ea9780cc1e5c93b x86/entry: Drop asmlinkage from syscalls

:::::: TO: Brian Gerst <brgerst@gmail.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
