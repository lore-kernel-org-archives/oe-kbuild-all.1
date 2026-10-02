Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37EC34BA24
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915335; cv=none; b=tz1LY/ZfYywuOO5yVo1/AM8iv619qy4T4gvGWjwbDBgHj6byAQacp7hCjg/2V7npNfZxb7QCPaaHLcGk51ye6vZJWuDDv3tAbS4Uk+HPmlLWTEAk+hXG+Us5ACRdVQIbUSbhH6RrvNbanMwJupBDC3gJ8M8KTWYDZNX8VmEM7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915335; c=relaxed/simple;
	bh=pt1zy+N7KXYD7E1bSQZqdAc98FdBGtEsjtqxWs4yQM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/MyFzJXznrE/MgDrMoCxV+Xq8W8y2IFxgWh3GFhOxoq756oMdI+eP0IkFZNoUbgA4T0mwnPDBt4v/iahHcB1dJAeA5uRa4YpUepw9F/5WcrFLLzLDcslwpdmbuMtXgLL/ldyLfAgrQJRH3C+vFcmobq+ofMbkOY6eLypztIbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKjxP52e; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKjxP52e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790915332; x=1822451332;
  h=date:from:to:cc:subject:message-id;
  bh=pt1zy+N7KXYD7E1bSQZqdAc98FdBGtEsjtqxWs4yQM0=;
  b=lKjxP52eqo48BI+lJMSayOLPw3rSs4hqNkiuKXBju8i5mJO8MCuHxwph
   +9a+SZ0+yBTpln8NyxIFUY9YsvwhM+AKPg+RiuLfwR7gCv6xRiFKBc5RT
   lcI8Rc7l1mxDNoKXxPAOWQQs6mrC10nQjz7Pt/h7QzAL3yapAi28Lve9+
   tnqM7wQTGRX3Gz5Axy7d9lElNSlET8VxulqKG47iQlosVPPeg6rmG/hDX
   lNEUDRiEqtHBDzSImFvFpwRbpT8yRlw+YFrihp8cQpIB8KeBSjpUq/Yt8
   IED9QG9LY9kHGMOToTlm/A61GKmmkhQDgpJ+jSc6VNQvf5Pr0jKAI+gkm
   A==;
X-CSE-ConnectionGUID: Oe4r8ETJTLeKnAAGV4N7vA==
X-CSE-MsgGUID: wDlH15SkQtCM2iNxy1NGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91702708"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91702708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:28:52 -0700
X-CSE-ConnectionGUID: VteHJHVsThu4g7I3EnMV7w==
X-CSE-MsgGUID: ILRldY1mT8eFKQhZlrAE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="273984004"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 21:28:51 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUt6-000000000PH-2XkV;
	Fri, 02 Oct 2026 04:28:48 +0000
Date: Fri, 02 Oct 2026 06:28:01 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 44/49] kernel/bpf/sys_exec.c:95:7: error:
 no member named 'orig_ax' in 'struct pt_regs'
Message-ID: <202610020656.nrkG1X7D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: e2bab659451cbffc692e22c852b4d323b3d46e4c [44/49] bpf: Add bpf_sys_exec() to run system calls from a BPF io thread
config: um-randconfig-2000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020656.nrkG1X7D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020656.nrkG1X7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020656.nrkG1X7D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/sys_exec.c:23:
   In file included from include/linux/bpf.h:34:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/bpf/sys_exec.c:95:7: error: no member named 'orig_ax' in 'struct pt_regs'
      95 |         regs.orig_ax = nr;
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:96:7: error: no member named 'di' in 'struct pt_regs'
      96 |         regs.di = args[0];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:97:7: error: no member named 'si' in 'struct pt_regs'
      97 |         regs.si = args[1];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:98:7: error: no member named 'dx' in 'struct pt_regs'
      98 |         regs.dx = args[2];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:99:7: error: no member named 'r10' in 'struct pt_regs'
      99 |         regs.r10 = args[3];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:100:7: error: no member named 'r8' in 'struct pt_regs'
     100 |         regs.r8 = args[4];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:101:7: error: no member named 'r9' in 'struct pt_regs'
     101 |         regs.r9 = args[5];
         |         ~~~~ ^
>> kernel/bpf/sys_exec.c:102:32: error: too few arguments to function call, expected 6, have 1
     102 |         ret = sys_call_table[nr](&regs);
         |               ~~~~~~~~~~~~~~~~~~      ^
   1 warning and 8 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


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
