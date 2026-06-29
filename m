Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D03C3453
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746219; cv=none; b=lcNrO188cwuiqjF6BL/pYFjGGx/BvMoIXM/1ROzevhI1Wc6WWEBmYviZhxfK2mq1L8PKbCd8SoN1Wu+LhYyc+r4PefDTicKAclsS+7oWTjaOO89z3aon3q69lpzJT29809eGoJ0WhKlam71wK+bgvjhG2NntClg+HrRoHNxWPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746219; c=relaxed/simple;
	bh=zQnxT4l2dZhMPlAbql4i3T9EUXhfJQcU8nmCPrvmKLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eGKil22L/Hwrwttn07EphfbCEU20XH4++aFG0Ey/oU/0+An3/BGmwkBnVKXXfuLnP5xF7SO+n0xXCZXpPBopAPP+sjoRdSjeAYjIxKBDNPZ6ZyRwLPmk6WqYJxVl2xqq4BjGhKmd65X6gTgdVxKYh5JxWsVRYnaCwp9IGUAWPEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n72JyNpf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n72JyNpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746217; x=1814282217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQnxT4l2dZhMPlAbql4i3T9EUXhfJQcU8nmCPrvmKLg=;
  b=n72JyNpfzSKar8zRrjiuQ1HHRFYezO+e/pSNNx7iZGQxrQeuH1Qbblwi
   EwmDOeNA3lxbz72e0YLu5MG+0tT9eMjxC66fhSNMclTsfONMrvuNGcCLH
   3kscgUOJ9gjkQ9hfktTw6YlSi6KO0C+ryvG8zUOep/rawi81C6peEHYXj
   2t6u4nyCgP6G9frNBbslex5CKtJ/VARgWzyjFZAymkO/EG/E95Q8vr+ib
   CBRCercnaHI1bRgwJgdCi+8e3rbgzqdj6Z+tvVIVCR0IP40MTjqvSj5wn
   c8x641w4LArV3LiDjCIp7cX/28aZnzo+UydpJVNmhZuRLR695otm0bV7h
   A==;
X-CSE-ConnectionGUID: 6iCHotGgTH25+STUo6HK4g==
X-CSE-MsgGUID: uNKkjndlRwmNr7H/PcxBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83314344"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83314344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:16:57 -0700
X-CSE-ConnectionGUID: pjgeydf2RsaliPvoDdswMQ==
X-CSE-MsgGUID: 3ncD4/cZS5CZvRvLNAZfeQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 08:16:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weDjB-000000007VB-17DR;
	Mon, 29 Jun 2026 15:16:53 +0000
Date: Mon, 29 Jun 2026 23:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 6/11]
 include/linux/irqflags.h:44:22: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202606292348.gUm6aNCM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   e7540d8e6298bea30315e7fd29f5da9400aa6e9b
commit: d24aaca1864c88c09969af091d9e73559f47f5dd [6/11] percpu
config: x86_64-randconfig-122-20260629 (https://download.01.org/0day-ci/archive/20260629/202606292348.gUm6aNCM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606292348.gUm6aNCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292348.gUm6aNCM-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:6:
   In file included from arch/x86/include/asm/percpu.h:593:
   In file included from include/asm-generic/percpu.h:8:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
>> arch/x86/include/asm/nospec-branch.h:537:23: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     537 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         |                       ^
         |                       int
   arch/x86/include/asm/nospec-branch.h:537:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     537 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
         | int
   arch/x86/include/asm/nospec-branch.h:548:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     548 | DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
         |                      ^
         |                      int
   arch/x86/include/asm/nospec-branch.h:548:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     548 | DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
         | ^
         | int
>> arch/x86/include/asm/nospec-branch.h:548:1: error: conflicting types for 'DECLARE_PER_CPU'
   arch/x86/include/asm/nospec-branch.h:537:1: note: previous declaration is here
     537 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:6:
   In file included from arch/x86/include/asm/percpu.h:593:
   In file included from include/asm-generic/percpu.h:8:
>> include/linux/irqflags.h:44:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      44 | DECLARE_PER_CPU(int, hardirqs_enabled);
         |                      ^
         |                      int
   include/linux/irqflags.h:44:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      44 | DECLARE_PER_CPU(int, hardirqs_enabled);
         | ^
         | int
>> include/linux/irqflags.h:44:1: error: conflicting types for 'DECLARE_PER_CPU'
   arch/x86/include/asm/nospec-branch.h:537:1: note: previous declaration is here
     537 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:6:
   In file included from arch/x86/include/asm/percpu.h:593:
   In file included from include/asm-generic/percpu.h:8:
   include/linux/irqflags.h:45:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      45 | DECLARE_PER_CPU(int, hardirq_context);
         |                      ^
         |                      int
   include/linux/irqflags.h:45:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      45 | DECLARE_PER_CPU(int, hardirq_context);
         | ^
         | int
   include/linux/irqflags.h:45:1: error: conflicting types for 'DECLARE_PER_CPU'
   arch/x86/include/asm/nospec-branch.h:537:1: note: previous declaration is here
     537 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/int +44 include/linux/irqflags.h

a21ee6055c30ce Peter Zijlstra 2020-05-25  43  
a21ee6055c30ce Peter Zijlstra 2020-05-25 @44  DECLARE_PER_CPU(int, hardirqs_enabled);
a21ee6055c30ce Peter Zijlstra 2020-05-25  45  DECLARE_PER_CPU(int, hardirq_context);
a21ee6055c30ce Peter Zijlstra 2020-05-25  46  

:::::: The code at line 44 was first introduced by commit
:::::: a21ee6055c30ce68c4e201c6496f0ed2a1936230 lockdep: Change hardirq{s_enabled,_context} to per-cpu variables

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
