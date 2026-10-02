Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58F3B9DA7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951982; cv=none; b=qInxrL0zVhMjXGyOv6QhRh0CqRz7l1ITefh/L++UQP6dVdS2De4qz/ZxgM/OmfiJ7YCaMTQV7i8cFZ9AOHJZDiKLlBDMvb8xjuUbTohaakdubd+1crJlNK6dnT1lrPxBV3bSKy3ETPeVyEiN7Mx84DgWpy7hOowqEhKuZ5s2r34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951982; c=relaxed/simple;
	bh=MNeeizOPPrgLglbvu5KF7n3gHSbIUlmUIPxC1AsqTzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8qAufDf5CyNEzFAJ3+znqsA4RpIMCgCtQ0ei0Raea4WO6vaNHuBZK5M0oj9MLl4IVpfTr0Uw+OOINq96kgyrhmqp/bdVaC3nc/T2wRQPVFCCclZ+Hhc+Cy8fmKRaJBKBeWyKm059obADLlcT/rbgs8Wr/vcTEtz2ASMXei4SPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZlHPA0K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZlHPA0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790951980; x=1822487980;
  h=date:from:to:cc:subject:message-id;
  bh=MNeeizOPPrgLglbvu5KF7n3gHSbIUlmUIPxC1AsqTzU=;
  b=hZlHPA0KtHuRXIBQzOFuD2Ahyk0UbBSdlOOg4TprRvpxSUJQYzPB6dzn
   VH3br1JJDJWs5rJIRbuz0hmd1nWM+SkWOX+gfXMPiZymnCmQ53uNBtiIR
   WVV9QIf4loNIfP5k7oecQzve0Yn5+6CzDazHCw51izgr3VR7hnaT7VWK7
   0T7Q4Lu625bqDNuV3gf4UlmqVapLGjg0vD/oaDGImV45R+ialK5TvJ5jt
   2Be49c/dyYyxWeFORonuLH8yL0EVhPgaiXN2jK3U3nU6fwyAQRQcLPozI
   zk8b6ISFwuaN5JmKMNZR0ywwr8iGHB4ahuiYlZ0rYoch4sPUJf7jWed/F
   g==;
X-CSE-ConnectionGUID: Xm4Hu+oZTY+MAUaTUSlKkA==
X-CSE-MsgGUID: Ds15fZNcS5iEKbapSonrcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="109202447"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="109202447"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 07:39:39 -0700
X-CSE-ConnectionGUID: HNpAVt3tRwae2WvBuCxHjg==
X-CSE-MsgGUID: Hgu65Q2TSTCsqmnC4Dz+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="268162"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 07:39:38 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCeQB-000000000bX-2rkh;
	Fri, 02 Oct 2026 14:39:35 +0000
Date: Fri, 02 Oct 2026 16:39:14 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 44/49] kernel/bpf/sys_exec.c:95:13:
 error: 'struct pt_regs' has no member named 'orig_ax'
Message-ID: <202610021643.upx1n4hU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: e2bab659451cbffc692e22c852b4d323b3d46e4c [44/49] bpf: Add bpf_sys_exec() to run system calls from a BPF io thread
config: um-randconfig-r2307-20261001 (https://download.01.org/0day-ci/archive/20261002/202610021643.upx1n4hU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021643.upx1n4hU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021643.upx1n4hU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/bpf/sys_exec.c: In function 'bpf_sys_exec':
>> kernel/bpf/sys_exec.c:95:13: error: 'struct pt_regs' has no member named 'orig_ax'
      95 |         regs.orig_ax = nr;
         |             ^
>> kernel/bpf/sys_exec.c:96:13: error: 'struct pt_regs' has no member named 'di'
      96 |         regs.di = args[0];
         |             ^
>> kernel/bpf/sys_exec.c:97:13: error: 'struct pt_regs' has no member named 'si'
      97 |         regs.si = args[1];
         |             ^
>> kernel/bpf/sys_exec.c:98:13: error: 'struct pt_regs' has no member named 'dx'
      98 |         regs.dx = args[2];
         |             ^
>> kernel/bpf/sys_exec.c:99:13: error: 'struct pt_regs' has no member named 'r10'
      99 |         regs.r10 = args[3];
         |             ^
>> kernel/bpf/sys_exec.c:100:13: error: 'struct pt_regs' has no member named 'r8'
     100 |         regs.r8 = args[4];
         |             ^
>> kernel/bpf/sys_exec.c:101:13: error: 'struct pt_regs' has no member named 'r9'
     101 |         regs.r9 = args[5];
         |             ^
>> kernel/bpf/sys_exec.c:102:34: warning: passing argument 1 of 'sys_call_table[nr]' makes integer from pointer without a cast [-Wint-conversion]
     102 |         ret = sys_call_table[nr](&regs);
         |                                  ^~~~~
         |                                  |
         |                                  struct pt_regs *
   kernel/bpf/sys_exec.c:102:34: note: expected 'long unsigned int' but argument is of type 'struct pt_regs *'
>> kernel/bpf/sys_exec.c:102:15: error: too few arguments to function 'sys_call_table[nr]'
     102 |         ret = sys_call_table[nr](&regs);
         |               ^~~~~~~~~~~~~~


vim +95 kernel/bpf/sys_exec.c

    71	
    72	/*
    73	 * Run system call @nr with the six arguments in @args on behalf of the
    74	 * process of the BPF io thread @kthread, which must be the calling thread.
    75	 * Returns the system call's result; a call interrupted by the thread's
    76	 * stop returns -EINTR, one not on the allowlist -ENOSYS, and a caller that
    77	 * is not the io thread gets -EPERM.
    78	 */
    79	__bpf_kfunc long bpf_sys_exec(struct bpf_kthread *kthread, u32 nr, const u64 *args,
    80				      u32 args__sz)
    81	{
    82		struct pt_regs regs = {};
    83		long ret;
    84	
    85		if (args__sz != 6 * sizeof(u64))
    86			return -EINVAL;
    87		if (!bpf_kthread_is_current_io(kthread))
    88			return -EPERM;
    89		if (nr >= NR_syscalls || !test_bit(nr, bpf_sys_exec_allowed))
    90			return -ENOSYS;
    91		if (fatal_signal_pending(current))
    92			return -EINTR;
    93		nr = array_index_nospec(nr, NR_syscalls);
    94	
  > 95		regs.orig_ax = nr;
  > 96		regs.di = args[0];
  > 97		regs.si = args[1];
  > 98		regs.dx = args[2];
  > 99		regs.r10 = args[3];
 > 100		regs.r8 = args[4];
 > 101		regs.r9 = args[5];
 > 102		ret = sys_call_table[nr](&regs);
   103	
   104		switch (ret) {
   105		case -ERESTARTSYS:
   106		case -ERESTARTNOINTR:
   107		case -ERESTARTNOHAND:
   108		case -ERESTART_RESTARTBLOCK:
   109			ret = -EINTR;
   110			break;
   111		}
   112		return ret;
   113	}
   114	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
