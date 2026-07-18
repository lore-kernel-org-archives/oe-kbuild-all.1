Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E42E7657
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784359253; cv=none; b=b01Z7iRNIGN8530lgxGIfk49rR3+G/ec0G+vyc6QyaJVprkVrCs4aPM6hA7YqvpeQAHVC74tnzdS23l3p//nWNRQ3DzHCi5pOhyA7wz125KA0LarQiLGeMaEekYaSaGoZLeeH9cDY0iL+nl17bJYNuSNp2tzdzxz22xmzFJkph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784359253; c=relaxed/simple;
	bh=2NU/RqOYFFwCGfonihXIbUf3xr4Iek7CYldW70gF598=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJXaVSWPCLlb7TEmIB0UpGdzRQmH5nzaynIw0IL6ukJs4Wl40eGQub3Nr2aBEMNXEZREs7z3G+4G2IiAlafr1cRY2QsvbIss3Xz9S9thfrTCerp3Lm5UvQ9Nb/KOJ73gOm2SvzmVOoYt3kucp1CLCfuIuqSTIpKUm48XTLgW6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnQCX1WE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnQCX1WE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784359252; x=1815895252;
  h=date:from:to:cc:subject:message-id;
  bh=2NU/RqOYFFwCGfonihXIbUf3xr4Iek7CYldW70gF598=;
  b=JnQCX1WESGR8rypGttgtzx+B372bK7EO4hLk3nBI0Lqnnv4a6SHB4+Pi
   IBh/DMnbdNecYmJVYDMSYDrDo5yQFmby9vqp3y19jd4UbZ4XNviuBkc53
   c74zK9VFOYgWa+KS7xPGQXdXhVOh6yOYWCxw+zlw4V2r7SCHj+0zliYI7
   4TYH/ILvydeD4lSb6s2sdl/yQQkizsBtHyzSxTe5lgJ3sh1Nwssp7Twut
   eFVC1X2Y0YOoHkutffrS3v4FvmNVc76xNPWspEyPu+78BlfuCZeGnyDzg
   y54MiAXBeFKLEnGte/3/rU0SsJgbHHtlzESdBFebZQenEupko1a5HvoNS
   g==;
X-CSE-ConnectionGUID: ZRrwZ7Q2SveVg+xk30sIMg==
X-CSE-MsgGUID: CF9HIWzDTxijJ/8lrlxbtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84793522"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84793522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:20:51 -0700
X-CSE-ConnectionGUID: K6Y+F4jIRH+EaXtpuCTO2w==
X-CSE-MsgGUID: xj8tFsRdSnCCoHjZ3yS6YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="295168609"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2026 00:20:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzLq-00000000TY7-3jGs;
	Sat, 18 Jul 2026 07:20:46 +0000
Date: Sat, 18 Jul 2026 15:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [tip:core/entry 20/23]
 include/linux/entry-common.h:109:undefined reference to `syscall_enter_audit'
Message-ID: <202607181530.2nx8zb3J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   39109e76c19bcce2041fa1884dbbb8b01f6f38d2
commit: ff2b9a905930db22494690d219724822db443d7a [20/23] entry: Rework syscall_audit_enter()
config: s390-randconfig-001-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181530.2nx8zb3J-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181530.2nx8zb3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181530.2nx8zb3J-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/syscall.o: in function `syscall_trace_enter':
>> include/linux/entry-common.h:109:(.noinstr.text+0x2e6): undefined reference to `syscall_enter_audit'


vim +109 include/linux/entry-common.h

    64	
    65	static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
    66							long syscall)
    67	{
    68		/*
    69		 * Handle Syscall User Dispatch.  This must comes first, since
    70		 * the ABI here can be something that doesn't make sense for
    71		 * other syscall_work features.
    72		 */
    73		if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
    74			if (syscall_user_dispatch(regs))
    75				return -1L;
    76		}
    77	
    78		/*
    79		 * User space got a time slice extension granted and relinquishes
    80		 * the CPU. The work stops the slice timer to avoid an extra round
    81		 * through hrtimer_interrupt().
    82		 */
    83		if (work & SYSCALL_WORK_SYSCALL_RSEQ_SLICE)
    84			rseq_syscall_enter_work(syscall);
    85	
    86		/* Handle ptrace */
    87		if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
    88			if (!arch_ptrace_report_syscall_permit_entry(regs) ||
    89			    (work & SYSCALL_WORK_SYSCALL_EMU))
    90				return -1L;
    91	
    92			/* ptrace might have changed work flags */
    93			work = READ_ONCE(current_thread_info()->syscall_work);
    94		}
    95	
    96		/* Do seccomp after ptrace, to catch any tracer changes. */
    97		if (work & SYSCALL_WORK_SECCOMP) {
    98			if (!__seccomp_permit_syscall())
    99				return -1L;
   100		}
   101	
   102		/* Either of the above might have changed the syscall number */
   103		syscall = syscall_get_nr(current, regs);
   104	
   105		if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
   106			syscall = trace_syscall_enter(regs, syscall);
   107	
   108		if (unlikely(audit_context()))
 > 109			syscall_enter_audit(regs);
   110	
   111		return syscall;
   112	}
   113	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
