Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1F125A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 04:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761280667; cv=none; b=AAb8irjg7kc9tpTj799YyUvHC1Mt5HKWDlXvKVcmjNTlq5rgSwDePASQ0RDEdbWHsdoGBMAdrjyj9PgDM1scsz1GeOSNWLrGOhtJ7OMc2vt5wdwYoC6cMJnYNOdnGM/XCM9qXDp1bZZdK91weAhfBqESWGNZD88BenfaLhzBdI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761280667; c=relaxed/simple;
	bh=0k0vWKDKw8mXDGJAB1jYDPkJiPW4QYkJ+YjnYQKyVqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mywccEJQWrYO5ee+J41VRMcZedrtHILJPKjeMgpcjx2HZDfGq3U/KlV/Vi43MvbzFORqvMmoXAFWEK5S2SCIlEY1JVCm36W409hlhR+8c4goQjFdyxMRHEvzSMpvqjihz1XgK2yF6O2vNL18Lf+99qu1MLvLkn8QfLmO8XEdTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwdyz1sc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwdyz1sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761280665; x=1792816665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0k0vWKDKw8mXDGJAB1jYDPkJiPW4QYkJ+YjnYQKyVqY=;
  b=mwdyz1sc0gykxDAoW+Kbh3szxwlxfdOtNy12HnFtgNH6mDuzHt4kwgfk
   cD9pmzcVS1j9N9SpAOmXqsFQhKg5jhaGPrMjccnCLeorshQaqcN6bphtt
   TsEKgp9RDojyCEG2lyhxBTJKAy9L7MP5v/N4oWoWulRG+liRG32XpVIEz
   a++VGrSBEoE0OOJrrSSNCjPpf02Qa/nS8jWcrHOZMtcsX4BPXrcCTrvWP
   6/u+mGOJQd+vYjRu5z1bZl+s31HPZE4s/j0pQEFPoYnsifu9ydr/6N7BV
   OZY8MsCX6EZStHpLxj6x+5Nz2Uvbb43idpvvhRCARYOga/oO4QAwxUYAe
   w==;
X-CSE-ConnectionGUID: H+lG7dObQPKXKonWmqdKqA==
X-CSE-MsgGUID: IrbWY3VrTOqZ4UrdDIHDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63164435"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63164435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 21:37:44 -0700
X-CSE-ConnectionGUID: 9jd3QafMTTy1Ttq2ONDUIg==
X-CSE-MsgGUID: KWjqjdTAQ0ivKs4rBK9EeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184230977"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 21:37:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC9Xp-000EBB-1I;
	Fri, 24 Oct 2025 04:37:00 +0000
Date: Fri, 24 Oct 2025 12:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 07/13] tracing: Allow syscall trace events to read
 more than one user parameter
Message-ID: <202510241227.GegWrQL7-lkp@intel.com>
References: <20251021005233.417553389@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021005233.417553389@kernel.org>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.18-rc2 next-20251023]
[cannot apply to trace/for-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Make-trace_user_fault_read-exposed-to-rest-of-tracing/20251021-085719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251021005233.417553389%40kernel.org
patch subject: [PATCH v4 07/13] tracing: Allow syscall trace events to read more than one user parameter
config: riscv-randconfig-r054-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241227.GegWrQL7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241227.GegWrQL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241227.GegWrQL7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   kernel/trace/trace_syscalls.c:877:7: error: use of undeclared identifier '__NR_mq_timedsend'
     877 |         case __NR_mq_timedsend:
         |              ^
   kernel/trace/trace_syscalls.c:898:7: error: use of undeclared identifier '__NR_access'
     898 |         case __NR_access:
         |              ^
   kernel/trace/trace_syscalls.c:901:7: error: use of undeclared identifier '__NR_chown'
     901 |         case __NR_chown:
         |              ^
   kernel/trace/trace_syscalls.c:902:7: error: use of undeclared identifier '__NR_chmod'
     902 |         case __NR_chmod:
         |              ^
   kernel/trace/trace_syscalls.c:904:7: error: use of undeclared identifier '__NR_creat'
     904 |         case __NR_creat:
         |              ^
   kernel/trace/trace_syscalls.c:908:7: error: use of undeclared identifier '__NR_lchown'
     908 |         case __NR_lchown:
         |              ^
   kernel/trace/trace_syscalls.c:909:7: error: use of undeclared identifier '__NR_open'
     909 |         case __NR_open:
         |              ^
   kernel/trace/trace_syscalls.c:911:7: error: use of undeclared identifier '__NR_mkdir'
     911 |         case __NR_mkdir:
         |              ^
   kernel/trace/trace_syscalls.c:912:7: error: use of undeclared identifier '__NR_mknod'
     912 |         case __NR_mknod:
         |              ^
   kernel/trace/trace_syscalls.c:915:7: error: use of undeclared identifier '__NR_readlink'
     915 |         case __NR_readlink:
         |              ^
   kernel/trace/trace_syscalls.c:916:7: error: use of undeclared identifier '__NR_rmdir'
     916 |         case __NR_rmdir:
         |              ^
   kernel/trace/trace_syscalls.c:918:7: error: use of undeclared identifier '__NR_statfs'
     918 |         case __NR_statfs:
         |              ^
   kernel/trace/trace_syscalls.c:921:7: error: use of undeclared identifier '__NR_truncate'
     921 |         case __NR_truncate:
         |              ^
   kernel/trace/trace_syscalls.c:922:7: error: use of undeclared identifier '__NR_unlink'
     922 |         case __NR_unlink:
         |              ^
   kernel/trace/trace_syscalls.c:924:7: error: use of undeclared identifier '__NR_utime'
     924 |         case __NR_utime:
         |              ^
   kernel/trace/trace_syscalls.c:925:7: error: use of undeclared identifier '__NR_utimes'
     925 |         case __NR_utimes:
         |              ^
   kernel/trace/trace_syscalls.c:941:7: error: use of undeclared identifier '__NR_futimesat'
     941 |         case __NR_futimesat:
         |              ^
>> kernel/trace/trace_syscalls.c:959:7: error: use of undeclared identifier '__NR_utimensat'
     959 |         case __NR_utimensat:
         |              ^
   kernel/trace/trace_syscalls.c:976:7: error: use of undeclared identifier '__NR_link'
     976 |         case __NR_link:
         |              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/__NR_utimensat +959 kernel/trace/trace_syscalls.c

ee08c6eccb7d12 Frederic Weisbecker 2009-03-07   857  
56cbdf4ab0c570 Steven Rostedt      2025-10-20   858  /*
56cbdf4ab0c570 Steven Rostedt      2025-10-20   859   * For system calls that reference user space memory that can
56cbdf4ab0c570 Steven Rostedt      2025-10-20   860   * be recorded into the event, set the system call meta data's user_mask
56cbdf4ab0c570 Steven Rostedt      2025-10-20   861   * to the "args" index that points to the user space memory to retrieve.
56cbdf4ab0c570 Steven Rostedt      2025-10-20   862   */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   863  static void check_faultable_syscall(struct trace_event_call *call, int nr)
56cbdf4ab0c570 Steven Rostedt      2025-10-20   864  {
56cbdf4ab0c570 Steven Rostedt      2025-10-20   865  	struct syscall_metadata *sys_data = call->data;
f5da5a4c232ae3 Steven Rostedt      2025-10-20   866  	unsigned long mask;
56cbdf4ab0c570 Steven Rostedt      2025-10-20   867  
56cbdf4ab0c570 Steven Rostedt      2025-10-20   868  	/* Only work on entry */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   869  	if (sys_data->enter_event != call)
56cbdf4ab0c570 Steven Rostedt      2025-10-20   870  		return;
56cbdf4ab0c570 Steven Rostedt      2025-10-20   871  
3255b2e71313ff Steven Rostedt      2025-10-20   872  	sys_data->user_arg_size = -1;
3255b2e71313ff Steven Rostedt      2025-10-20   873  
56cbdf4ab0c570 Steven Rostedt      2025-10-20   874  	switch (nr) {
3255b2e71313ff Steven Rostedt      2025-10-20   875  	/* user arg 1 with size arg at 2 */
3255b2e71313ff Steven Rostedt      2025-10-20   876  	case __NR_write:
3255b2e71313ff Steven Rostedt      2025-10-20   877  	case __NR_mq_timedsend:
3255b2e71313ff Steven Rostedt      2025-10-20   878  	case __NR_pwrite64:
3255b2e71313ff Steven Rostedt      2025-10-20   879  		sys_data->user_mask = BIT(1);
3255b2e71313ff Steven Rostedt      2025-10-20   880  		sys_data->user_arg_size = 2;
3255b2e71313ff Steven Rostedt      2025-10-20   881  		break;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   882  	/* user arg 0 with size arg at 1 as string */
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   883  	case __NR_setdomainname:
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   884  	case __NR_sethostname:
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   885  		sys_data->user_mask = BIT(0);
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   886  		sys_data->user_arg_size = 1;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   887  		sys_data->user_arg_is_str = 1;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   888  		break;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   889  #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   890  	/* user arg 4 with size arg at 3 as string */
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   891  	case __NR_kexec_file_load:
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   892  		sys_data->user_mask = BIT(4);
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   893  		sys_data->user_arg_size = 3;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   894  		sys_data->user_arg_is_str = 1;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   895  		break;
9eb1f5e9cf4f6f Steven Rostedt      2025-10-20   896  #endif
56cbdf4ab0c570 Steven Rostedt      2025-10-20   897  	/* user arg at position 0 */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   898  	case __NR_access:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   899  	case __NR_acct:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   900  	case __NR_chdir:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   901  	case __NR_chown:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   902  	case __NR_chmod:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   903  	case __NR_chroot:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   904  	case __NR_creat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   905  	case __NR_delete_module:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   906  	case __NR_execve:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   907  	case __NR_fsopen:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   908  	case __NR_lchown:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   909  	case __NR_open:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   910  	case __NR_memfd_create:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   911  	case __NR_mkdir:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   912  	case __NR_mknod:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   913  	case __NR_mq_open:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   914  	case __NR_mq_unlink:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   915  	case __NR_readlink:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   916  	case __NR_rmdir:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   917  	case __NR_shmdt:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   918  	case __NR_statfs:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   919  	case __NR_swapon:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   920  	case __NR_swapoff:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   921  	case __NR_truncate:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   922  	case __NR_unlink:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   923  	case __NR_umount2:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   924  	case __NR_utime:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   925  	case __NR_utimes:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   926  		sys_data->user_mask = BIT(0);
56cbdf4ab0c570 Steven Rostedt      2025-10-20   927  		break;
56cbdf4ab0c570 Steven Rostedt      2025-10-20   928  	/* user arg at position 1 */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   929  	case __NR_execveat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   930  	case __NR_faccessat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   931  	case __NR_faccessat2:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   932  	case __NR_finit_module:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   933  	case __NR_fchmodat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   934  	case __NR_fchmodat2:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   935  	case __NR_fchownat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   936  	case __NR_fgetxattr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   937  	case __NR_flistxattr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   938  	case __NR_fsetxattr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   939  	case __NR_fspick:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   940  	case __NR_fremovexattr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   941  	case __NR_futimesat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   942  	case __NR_inotify_add_watch:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   943  	case __NR_mkdirat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   944  	case __NR_mknodat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   945  	case __NR_mount_setattr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   946  	case __NR_name_to_handle_at:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   947  #if defined(__ARCH_WANT_NEW_STAT) || defined(__ARCH_WANT_STAT64)
56cbdf4ab0c570 Steven Rostedt      2025-10-20   948  	case __NR_newfstatat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   949  #endif
56cbdf4ab0c570 Steven Rostedt      2025-10-20   950  	case __NR_openat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   951  	case __NR_openat2:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   952  	case __NR_open_tree:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   953  	case __NR_open_tree_attr:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   954  	case __NR_readlinkat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   955  	case __NR_quotactl:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   956  	case __NR_syslog:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   957  	case __NR_statx:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   958  	case __NR_unlinkat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20  @959  	case __NR_utimensat:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   960  		sys_data->user_mask = BIT(1);
56cbdf4ab0c570 Steven Rostedt      2025-10-20   961  		break;
56cbdf4ab0c570 Steven Rostedt      2025-10-20   962  	/* user arg at position 2 */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   963  	case __NR_init_module:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   964  	case __NR_fsconfig:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   965  		sys_data->user_mask = BIT(2);
56cbdf4ab0c570 Steven Rostedt      2025-10-20   966  		break;
56cbdf4ab0c570 Steven Rostedt      2025-10-20   967  	/* user arg at position 4 */
56cbdf4ab0c570 Steven Rostedt      2025-10-20   968  	case __NR_fanotify_mark:
56cbdf4ab0c570 Steven Rostedt      2025-10-20   969  		sys_data->user_mask = BIT(4);
56cbdf4ab0c570 Steven Rostedt      2025-10-20   970  		break;
f5da5a4c232ae3 Steven Rostedt      2025-10-20   971  	/* 2 user args, 0 and 1 */
f5da5a4c232ae3 Steven Rostedt      2025-10-20   972  	case __NR_add_key:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   973  	case __NR_getxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   974  	case __NR_lgetxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   975  	case __NR_lremovexattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   976  	case __NR_link:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   977  	case __NR_listxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   978  	case __NR_llistxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   979  	case __NR_lsetxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   980  	case __NR_pivot_root:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   981  	case __NR_removexattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   982  	case __NR_rename:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   983  	case __NR_request_key:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   984  	case __NR_setxattr:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   985  	case __NR_symlink:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   986  		sys_data->user_mask = BIT(0) | BIT(1);
f5da5a4c232ae3 Steven Rostedt      2025-10-20   987  		break;
f5da5a4c232ae3 Steven Rostedt      2025-10-20   988  	/* 2 user args, 0 and 2 */
f5da5a4c232ae3 Steven Rostedt      2025-10-20   989  	case __NR_symlinkat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   990  		sys_data->user_mask = BIT(0) | BIT(2);
f5da5a4c232ae3 Steven Rostedt      2025-10-20   991  		break;
f5da5a4c232ae3 Steven Rostedt      2025-10-20   992  	/* 2 user args, 1 and 3 */
f5da5a4c232ae3 Steven Rostedt      2025-10-20   993  	case __NR_getxattrat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   994  	case __NR_linkat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   995  	case __NR_listxattrat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   996  	case __NR_move_mount:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   997  	case __NR_renameat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   998  	case __NR_renameat2:
f5da5a4c232ae3 Steven Rostedt      2025-10-20   999  	case __NR_removexattrat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1000  	case __NR_setxattrat:
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1001  		sys_data->user_mask = BIT(1) | BIT(3);
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1002  		break;
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1003  	case __NR_mount: /* Just dev_name and dir_name, TODO add type */
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1004  		sys_data->user_mask = BIT(0) | BIT(1) | BIT(2);
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1005  		break;
56cbdf4ab0c570 Steven Rostedt      2025-10-20  1006  	default:
56cbdf4ab0c570 Steven Rostedt      2025-10-20  1007  		sys_data->user_mask = 0;
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1008  		return;
56cbdf4ab0c570 Steven Rostedt      2025-10-20  1009  	}
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1010  
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1011  	if (sys_data->user_arg_size < 0)
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1012  		return;
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1013  
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1014  	/*
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1015  	 * The user_arg_size can only be used when the system call
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1016  	 * is reading only a single address from user space.
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1017  	 */
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1018  	mask = sys_data->user_mask;
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1019  	if (WARN_ON(mask & (mask - 1)))
f5da5a4c232ae3 Steven Rostedt      2025-10-20  1020  		sys_data->user_arg_size = -1;
56cbdf4ab0c570 Steven Rostedt      2025-10-20  1021  }
56cbdf4ab0c570 Steven Rostedt      2025-10-20  1022  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
