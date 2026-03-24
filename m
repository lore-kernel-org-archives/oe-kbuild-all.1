Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93362E091E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380731; cv=none; b=bq2HH7EM4R1qjlpvDjQMauV2URvKkVOUx+ujgUfCV2TET7WcVAiFKZib++1urVrjPiw1JX086C2M2N1nkYqa0TePyTKbH5lCd0+DU8RDpyNTGdinEU+D+fFMZKJ953fxE7b+XWVPVRD2CIp/9b2MM9Fg0TPaO2rMTVffOlP9bYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380731; c=relaxed/simple;
	bh=f7J/JiFcyoFHD4OqvndwTTakioFkiILpYeXHd2Zuq6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA2uYRGvKReyWXIfYRPARDMvemDhfU+v8Tfby+3wgeVvDmYA58ltTnZvaFCvu/MiJCtp+o+q4TzqDxmkQc6FXhGNcpFeJhLv74OWm/AhOLx4yPkTy42RRLsmf9YjWLfddbQZNIiOjpncURjcVZR8hncURDqKhN1C8lqF34d9Ojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBd9bj7r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBd9bj7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774380730; x=1805916730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f7J/JiFcyoFHD4OqvndwTTakioFkiILpYeXHd2Zuq6o=;
  b=kBd9bj7rFAFCCvN5JYXpYpnFsVfFgE8z5FeFqOkw+rtWqCEuCpvhAlm4
   G4GcSoIif0fRIPviywxpdcWvsOfeFAA7Xqmu+dJWUh7mdiCi/9AqBikzE
   ij2uL2+OcGbw0rlwYVWj9qZATLM7DsY+BaB9pb8nS2jZn/LNUzrCOsTrF
   pPZy3yi7dDV2h6Q7ZsxKWAM35gzF1/XM6vWZt3YAX6fu0Y/H7/IgPb3XH
   czid1iUwTt2N+ex4bELewfkJcyhGpiYH+JwwWgLAdeNMUCQsTQLFltiky
   cmtamTdpeODmrdUACGbtZ4FE+QrOz0rbkxK/6/syyM77l/mcVtXKZcODl
   g==;
X-CSE-ConnectionGUID: gbFwOpgwSRawnASzTn64EA==
X-CSE-MsgGUID: zimjqsrRQkKiz4r7GIcNFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92793516"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92793516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:32:07 -0700
X-CSE-ConnectionGUID: /Hw1MQHuRsmVhTBdJr8dow==
X-CSE-MsgGUID: d2x+2zmmTmau+CD3QJCchg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247502693"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 12:32:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w57Tu-000000005LZ-3ZTq;
	Tue, 24 Mar 2026 19:32:02 +0000
Date: Wed, 25 Mar 2026 03:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
Message-ID: <202603250309.qDLRVIn6-lkp@intel.com>
References: <20260323042510.3331778-5-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323042510.3331778-5-paul@paul-moore.com>

Hi Paul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on xiang-erofs/dev-test xiang-erofs/dev xiang-erofs/fixes linus/master v7.0-rc5 next-20260323]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Moore/lsm-add-backing_file-LSM-hooks/20260324-111550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20260323042510.3331778-5-paul%40paul-moore.com
patch subject: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603250309.qDLRVIn6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250309.qDLRVIn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250309.qDLRVIn6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/security.h:1149:5: warning: no previous prototype for 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1155:6: warning: no previous prototype for 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from arch/nios2/kernel/sys_nios2.c:15:
>> include/linux/security.h:1149:5: warning: no previous prototype for 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1155:6: warning: no previous prototype for 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/sys_nios2.c:21:16: warning: no previous prototype for 'sys_cacheflush' [-Wmissing-prototypes]
      21 | asmlinkage int sys_cacheflush(unsigned long addr, unsigned long len,
         |                ^~~~~~~~~~~~~~
   arch/nios2/kernel/sys_nios2.c:57:16: warning: no previous prototype for 'sys_getpagesize' [-Wmissing-prototypes]
      57 | asmlinkage int sys_getpagesize(void)
         |                ^~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from arch/nios2/kernel/syscall_table.c:6:
>> include/linux/security.h:1149:5: warning: no previous prototype for 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1155:6: warning: no previous prototype for 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[0]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[1]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[2]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[3]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[4]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[5]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[6]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
--
   nios2-linux-ld: init/do_mounts.o: in function `security_backing_file_alloc':
>> do_mounts.c:(.text+0x40): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: init/do_mounts.o: in function `security_backing_file_free':
>> do_mounts.c:(.text+0x80): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: init/noinitramfs.o: in function `security_backing_file_alloc':
   noinitramfs.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: init/noinitramfs.o: in function `security_backing_file_free':
   noinitramfs.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: arch/nios2/kernel/sys_nios2.o: in function `security_backing_file_alloc':
   sys_nios2.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: arch/nios2/kernel/sys_nios2.o: in function `security_backing_file_free':
   sys_nios2.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: arch/nios2/kernel/syscall_table.o: in function `security_backing_file_alloc':
   syscall_table.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: arch/nios2/kernel/syscall_table.o: in function `security_backing_file_free':
   syscall_table.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: arch/nios2/mm/fault.o: in function `security_backing_file_alloc':
   fault.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: arch/nios2/mm/fault.o: in function `security_backing_file_free':
   fault.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/fork.o: in function `security_backing_file_alloc':
   fork.c:(.text+0xe00): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/fork.o: in function `security_backing_file_free':
   fork.c:(.text+0xe40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/exec_domain.o: in function `security_backing_file_alloc':
   exec_domain.c:(.text+0x40): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/exec_domain.o: in function `security_backing_file_free':
   exec_domain.c:(.text+0x80): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/cpu.o: in function `security_backing_file_alloc':
   cpu.c:(.text+0x8c0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/cpu.o: in function `security_backing_file_free':
   cpu.c:(.text+0x900): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/exit.o: in function `security_backing_file_alloc':
   exit.c:(.text+0x8c0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/exit.o: in function `security_backing_file_free':
   exit.c:(.text+0x900): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/resource.o: in function `security_backing_file_alloc':
   resource.c:(.text+0x15c0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/resource.o: in function `security_backing_file_free':
   resource.c:(.text+0x1600): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/sysctl.o: in function `security_backing_file_alloc':
   sysctl.c:(.text+0x1940): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/sysctl.o: in function `security_backing_file_free':
   sysctl.c:(.text+0x1980): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/capability.o: in function `security_backing_file_alloc':
   capability.c:(.text+0x940): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/capability.o: in function `security_backing_file_free':
   capability.c:(.text+0x980): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/ptrace.o: in function `security_backing_file_alloc':
   ptrace.c:(.text+0xa80): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/ptrace.o: in function `security_backing_file_free':
   ptrace.c:(.text+0xac0): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/signal.o: in function `security_backing_file_alloc':
   signal.c:(.text+0x1900): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/signal.o: in function `security_backing_file_free':
   signal.c:(.text+0x1940): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/sys.o: in function `security_backing_file_alloc':
   sys.c:(.text+0x1540): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/sys.o: in function `security_backing_file_free':
   sys.c:(.text+0x1580): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/umh.o: in function `security_backing_file_alloc':
   umh.c:(.text+0x980): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/umh.o: in function `security_backing_file_free':
   umh.c:(.text+0x9c0): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/pid.o: in function `security_backing_file_alloc':
   pid.c:(.text+0x9c0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/pid.o: in function `security_backing_file_free':
   pid.c:(.text+0xa00): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/extable.o: in function `security_backing_file_alloc':
   extable.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/extable.o: in function `security_backing_file_free':
   extable.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/params.o: in function `security_backing_file_alloc':
   params.c:(.text+0x1040): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/params.o: in function `security_backing_file_free':
   params.c:(.text+0x1080): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/nsproxy.o: in function `security_backing_file_alloc':
   nsproxy.c:(.text+0x400): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/nsproxy.o: in function `security_backing_file_free':
   nsproxy.c:(.text+0x440): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/nstree.o: in function `security_backing_file_alloc':
   nstree.c:(.text+0xc00): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/nstree.o: in function `security_backing_file_free':
   nstree.c:(.text+0xc40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/cred.o: in function `security_backing_file_alloc':
   cred.c:(.text+0xa00): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/cred.o: in function `security_backing_file_free':
   cred.c:(.text+0xa40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/reboot.o: in function `security_backing_file_alloc':
   reboot.c:(.text+0xf40): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/reboot.o: in function `security_backing_file_free':
   reboot.c:(.text+0xf80): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/ksyms_common.o: in function `security_backing_file_alloc':
   ksyms_common.c:(.text+0x0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/ksyms_common.o: in function `security_backing_file_free':
   ksyms_common.c:(.text+0x40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/groups.o: in function `security_backing_file_alloc':
   groups.c:(.text+0x3c0): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/groups.o: in function `security_backing_file_free':
   groups.c:(.text+0x400): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
   nios2-linux-ld: kernel/sched/core.o: in function `security_backing_file_alloc':
   core.c:(.text+0xa00): multiple definition of `security_backing_file_alloc'; init/main.o:main.c:(.text+0x0): first defined here
   nios2-linux-ld: kernel/sched/core.o: in function `security_backing_file_free':
   core.c:(.text+0xa40): multiple definition of `security_backing_file_free'; init/main.o:main.c:(.text+0x40): first defined here
--
   In file included from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/security.h:1149:5: warning: no previous prototype for 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1155:6: warning: no previous prototype for 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
