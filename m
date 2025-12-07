Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977427A47F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143876; cv=none; b=q7OxVFe4QdtGPKc6ezkYC5Cu7PConpUnUPjtJ+yQl6Ij1fMe7BqZIh3dMg+W0DMmYJg0KC1enZsYtf7hsl5xFP3VcLNzF2xiKDa+38hxqo2HFiuCvufrpHTQfH0Ft5MG9UfxcAZll7djWv8P5zBx9B6Qodjv7jJ6hC78enBfWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143876; c=relaxed/simple;
	bh=NREdCqeBpaaXFQ4CD9ethOxVpGA0OTt5Ess7k/cMBS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9TTxZ8af9hA2f9zYJpuLApGx4W2Z0MS/Mg/g+V2qpgh7NcGELNBi+FS6IoFbMjb/NNx/kdcc74KtDvXJD5Ac3jw/ZsDlQrojq5KMUpjL7FmBmjLqrQX8nQLtwsRwB90tOv3YzK+Jx6Ph2kqjJs1bkU1+caos7ugQOIvMtRn+fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVK78+xE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVK78+xE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765143874; x=1796679874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NREdCqeBpaaXFQ4CD9ethOxVpGA0OTt5Ess7k/cMBS8=;
  b=jVK78+xEVv8csNnw/AQlPNB/iAimzGIpUmhTCcP8GhcIgiIESgVkCo4a
   ctXItIub80pK0UCyamNJDcUrRFVgxa+aTDl7Oe0BQQeOszKgYuPSAyepN
   D0WE7WYvPYlsY4QfCucf7GVCTVHwxs05PQprPTYTj0/wc22xaFopHNArb
   ew+BuEQaPOSI9UNKO6E++Dy65egVPXffMrvlP1OhWEMskZecu9JCC2qll
   +xvtOUyC83GWnGVkonJE8laliBMsEu6QEI98VLpDEF1mmbUQcOlZB2uTG
   K66313Yw/Ia0d6WZvErhK6OrIYpGRePo+HUon/ghovsD+PQ9R5Qy94Jh0
   Q==;
X-CSE-ConnectionGUID: 7eJrWhb2T7+gSzstQBB0Qg==
X-CSE-MsgGUID: wRX9RqHPT5iSeY5SxXpZQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66987550"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66987550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:44:32 -0800
X-CSE-ConnectionGUID: Oq4dnfSgT0eOJELchwO8RQ==
X-CSE-MsgGUID: lkkQ6YmDTzOmWRSiFkBjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195682184"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 13:44:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSMYP-00000000JfF-03Z6;
	Sun, 07 Dec 2025 21:44:29 +0000
Date: Mon, 8 Dec 2025 05:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/kernel/skas/stub_exe.c:180:23-24: WARNING: Use ARRAY_SIZE
Message-ID: <202512080556.BbmGuwU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a454e6b1c604555c04501c77b7fedc5d98a779
commit: 406d17c6c370a33cfb54067d9e205305293d4604 um: Implement kernel side of SECCOMP based process handling
date:   6 months ago
config: um-randconfig-r064-20251207 (https://download.01.org/0day-ci/archive/20251208/202512080556.BbmGuwU4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080556.BbmGuwU4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/um/kernel/skas/stub_exe.c:180:23-24: WARNING: Use ARRAY_SIZE

vim +180 arch/um/kernel/skas/stub_exe.c

    11	
    12	noinline static void real_init(void)
    13	{
    14		struct stub_init_data init_data;
    15		unsigned long res;
    16		struct {
    17			void  *ss_sp;
    18			int    ss_flags;
    19			size_t ss_size;
    20		} stack = {
    21			.ss_size = STUB_DATA_PAGES * UM_KERN_PAGE_SIZE,
    22		};
    23		struct {
    24			void *sa_handler_;
    25			unsigned long sa_flags;
    26			void *sa_restorer;
    27			unsigned long long sa_mask;
    28		} sa = {
    29			/* Need to set SA_RESTORER (but the handler never returns) */
    30			.sa_flags = SA_ONSTACK | SA_NODEFER | SA_SIGINFO | 0x04000000,
    31		};
    32	
    33		/* set a nice name */
    34		stub_syscall2(__NR_prctl, PR_SET_NAME, (unsigned long)"uml-userspace");
    35	
    36		/* Make sure this process dies if the kernel dies */
    37		stub_syscall2(__NR_prctl, PR_SET_PDEATHSIG, SIGKILL);
    38	
    39		/* Needed in SECCOMP mode (and safe to do anyway) */
    40		stub_syscall5(__NR_prctl, PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
    41	
    42		/* read information from STDIN and close it */
    43		res = stub_syscall3(__NR_read, 0,
    44				    (unsigned long)&init_data, sizeof(init_data));
    45		if (res != sizeof(init_data))
    46			stub_syscall1(__NR_exit, 10);
    47	
    48		stub_syscall1(__NR_close, 0);
    49	
    50		/* map stub code + data */
    51		res = stub_syscall6(STUB_MMAP_NR,
    52				    init_data.stub_start, UM_KERN_PAGE_SIZE,
    53				    PROT_READ | PROT_EXEC, MAP_FIXED | MAP_SHARED,
    54				    init_data.stub_code_fd, init_data.stub_code_offset);
    55		if (res != init_data.stub_start)
    56			stub_syscall1(__NR_exit, 11);
    57	
    58		res = stub_syscall6(STUB_MMAP_NR,
    59				    init_data.stub_start + UM_KERN_PAGE_SIZE,
    60				    STUB_DATA_PAGES * UM_KERN_PAGE_SIZE,
    61				    PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
    62				    init_data.stub_data_fd, init_data.stub_data_offset);
    63		if (res != init_data.stub_start + UM_KERN_PAGE_SIZE)
    64			stub_syscall1(__NR_exit, 12);
    65	
    66		/* setup signal stack inside stub data */
    67		stack.ss_sp = (void *)init_data.stub_start + UM_KERN_PAGE_SIZE;
    68		stub_syscall2(__NR_sigaltstack, (unsigned long)&stack, 0);
    69	
    70		/* register signal handlers */
    71		sa.sa_handler_ = (void *) init_data.signal_handler;
    72		sa.sa_restorer = (void *) init_data.signal_restorer;
    73		if (!init_data.seccomp) {
    74			/* In ptrace mode, the SIGSEGV handler never returns */
    75			sa.sa_mask = 0;
    76	
    77			res = stub_syscall4(__NR_rt_sigaction, SIGSEGV,
    78					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
    79			if (res != 0)
    80				stub_syscall1(__NR_exit, 13);
    81		} else {
    82			/* SECCOMP mode uses rt_sigreturn, need to mask all signals */
    83			sa.sa_mask = ~0ULL;
    84	
    85			res = stub_syscall4(__NR_rt_sigaction, SIGSEGV,
    86					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
    87			if (res != 0)
    88				stub_syscall1(__NR_exit, 14);
    89	
    90			res = stub_syscall4(__NR_rt_sigaction, SIGSYS,
    91					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
    92			if (res != 0)
    93				stub_syscall1(__NR_exit, 15);
    94	
    95			res = stub_syscall4(__NR_rt_sigaction, SIGALRM,
    96					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
    97			if (res != 0)
    98				stub_syscall1(__NR_exit, 16);
    99	
   100			res = stub_syscall4(__NR_rt_sigaction, SIGTRAP,
   101					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
   102			if (res != 0)
   103				stub_syscall1(__NR_exit, 17);
   104	
   105			res = stub_syscall4(__NR_rt_sigaction, SIGILL,
   106					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
   107			if (res != 0)
   108				stub_syscall1(__NR_exit, 18);
   109	
   110			res = stub_syscall4(__NR_rt_sigaction, SIGFPE,
   111					    (unsigned long)&sa, 0, sizeof(sa.sa_mask));
   112			if (res != 0)
   113				stub_syscall1(__NR_exit, 19);
   114		}
   115	
   116		/*
   117		 * If in seccomp mode, install the SECCOMP filter and trigger a syscall.
   118		 * Otherwise set PTRACE_TRACEME and do a SIGSTOP.
   119		 */
   120		if (init_data.seccomp) {
   121			struct sock_filter filter[] = {
   122	#if __BITS_PER_LONG > 32
   123				/* [0] Load upper 32bit of instruction pointer from seccomp_data */
   124				BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
   125					 (offsetof(struct seccomp_data, instruction_pointer) + 4)),
   126	
   127				/* [1] Jump forward 3 instructions if the upper address is not identical */
   128				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, (init_data.stub_start) >> 32, 0, 3),
   129	#endif
   130				/* [2] Load lower 32bit of instruction pointer from seccomp_data */
   131				BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
   132					 (offsetof(struct seccomp_data, instruction_pointer))),
   133	
   134				/* [3] Mask out lower bits */
   135				BPF_STMT(BPF_ALU | BPF_AND | BPF_K, 0xfffff000),
   136	
   137				/* [4] Jump to [6] if the lower bits are not on the expected page */
   138				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, (init_data.stub_start) & 0xfffff000, 1, 0),
   139	
   140				/* [5] Trap call, allow */
   141				BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_TRAP),
   142	
   143				/* [6,7] Check architecture */
   144				BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
   145					 offsetof(struct seccomp_data, arch)),
   146				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K,
   147					 UM_SECCOMP_ARCH_NATIVE, 1, 0),
   148	
   149				/* [8] Kill (for architecture check) */
   150				BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL_PROCESS),
   151	
   152				/* [9] Load syscall number */
   153				BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
   154					 offsetof(struct seccomp_data, nr)),
   155	
   156				/* [10-14] Check against permitted syscalls */
   157				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_futex,
   158					 5, 0),
   159				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, STUB_MMAP_NR,
   160					 4, 0),
   161				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_munmap,
   162					 3, 0),
   163	#ifdef __i386__
   164				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_set_thread_area,
   165					 2, 0),
   166	#else
   167				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_arch_prctl,
   168					 2, 0),
   169	#endif
   170				BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_rt_sigreturn,
   171					 1, 0),
   172	
   173				/* [15] Not one of the permitted syscalls */
   174				BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL_PROCESS),
   175	
   176				/* [16] Permitted call for the stub */
   177				BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
   178			};
   179			struct sock_fprog prog = {
 > 180				.len = sizeof(filter) / sizeof(filter[0]),
   181				.filter = filter,
   182			};
   183	
   184			if (stub_syscall3(__NR_seccomp, SECCOMP_SET_MODE_FILTER,
   185					  SECCOMP_FILTER_FLAG_TSYNC,
   186					  (unsigned long)&prog) != 0)
   187				stub_syscall1(__NR_exit, 20);
   188	
   189			/* Fall through, the exit syscall will cause SIGSYS */
   190		} else {
   191			stub_syscall4(__NR_ptrace, PTRACE_TRACEME, 0, 0, 0);
   192	
   193			stub_syscall2(__NR_kill, stub_syscall0(__NR_getpid), SIGSTOP);
   194		}
   195	
   196		stub_syscall1(__NR_exit, 30);
   197	
   198		__builtin_unreachable();
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
