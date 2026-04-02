Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC673947A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122051; cv=none; b=eqQUM7nuFwQQBi2mK4yrB/W7Fyfl5Kx77oiAfwOt3pjyy9hc3hOGipM9NNZeYvOYahy3lIwNHMyglkDMxdchufet5vDK9wNo7j/HmDSLisNBtMISVuveF25yICq+EuBy/3sSU4rPQwSqKbj84QUd8KcOw+ggt9GQ62BN1jQsMzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122051; c=relaxed/simple;
	bh=lQRRf1eanUaQfz5bj1w7lPm0DIYtU9Lg2TjMBikg1uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ES5zDILv5HfIBWlxGlcUSxqHjjnpr2jm+NIs4+5PDZS6B1O6coaN7uYIW35Ejqnr5CxtWAck+rhgjSQMLnNEnFqaL8eCbKY3WpYmH9rRMRabfV88hsgAo27WkXkkaMpEqdqTSjdBSz5wCVYYd0cxsrs/UFtT+SdHfYOUMBtvzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJe7Vece; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJe7Vece"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775122042; x=1806658042;
  h=date:from:to:cc:subject:message-id;
  bh=lQRRf1eanUaQfz5bj1w7lPm0DIYtU9Lg2TjMBikg1uo=;
  b=OJe7VecemLzsQ5A1RYtqIbX1cmzch4KK00p7uql+Ev4WmQfFZOQzURRE
   1oHmNISXpt6j1F5OaeDW53MoqxVmr6qxkbJ//Vg+iERGLsUBzVirdHXPd
   AQ+ab9rLaQoBEq/jpqG+Cu4pAJvmLHvsQzyAUp1U7P4lANwLIUq/9RxH+
   RZwMs17apggTbSCrlmMrHPT94dfcGILiUVTlC2eZDiAHPbx4lmwC7t2jw
   vfHB3af8Fa+yUZTvYCPHhz/OL5EEAxMcBSa421FDMfuAw0WzzRgSj5Vr6
   Xmgvrgu/9Z1vzDYGE9aM9QtWhVGu9bAMWyryxYSbiIG5wtJCEXdaHCZ6E
   g==;
X-CSE-ConnectionGUID: UQ3b0WAkRRK78KpneUAPFw==
X-CSE-MsgGUID: SnukwBWuRjy00wWC/9RNzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86797078"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="86797078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 02:27:21 -0700
X-CSE-ConnectionGUID: Q3SMsSKqQJCqcgW8wHFIUA==
X-CSE-MsgGUID: AInqWctaTsW0rBx2lq81/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="250142038"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2026 02:27:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8EKa-0000000091t-4AG6;
	Thu, 02 Apr 2026 09:27:16 +0000
Date: Thu, 02 Apr 2026 11:26:32 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/entry/rework 2/11]
 include/linux/entry-common.h:324:9: error: implicit declaration of function
 'local_irq_disable_exit_to_user'
Message-ID: <202604021153.NOgYfLv4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/entry/rework
head:   1e10c666f8f7ec4524fd226186a6ae0ad495aad5
commit: be5c2d5a23beab5211c64f1237c238a1df622c47 [2/11] entry: Remove local_irq_{enable,disable}_exit_to_user()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260402/202604021153.NOgYfLv4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021153.NOgYfLv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021153.NOgYfLv4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/boot/startup/sev-startup.c:35:
   include/linux/entry-common.h: In function 'syscall_exit_to_user_mode':
>> include/linux/entry-common.h:324:9: error: implicit declaration of function 'local_irq_disable_exit_to_user' [-Wimplicit-function-declaration]
     324 |         local_irq_disable_exit_to_user();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/local_irq_disable_exit_to_user +324 include/linux/entry-common.h

c6156e1da633f2 Sven Schnelle     2020-12-01  288  
a9f3a74a29af09 Thomas Gleixner   2020-07-22  289  /**
a9f3a74a29af09 Thomas Gleixner   2020-07-22  290   * syscall_exit_to_user_mode - Handle work before returning to user mode
a9f3a74a29af09 Thomas Gleixner   2020-07-22  291   * @regs:	Pointer to currents pt_regs
a9f3a74a29af09 Thomas Gleixner   2020-07-22  292   *
e1647100c22eb7 Jinjie Ruan       2026-01-28  293   * Invoked with interrupts enabled and fully valid @regs. Returns with all
a9f3a74a29af09 Thomas Gleixner   2020-07-22  294   * work handled, interrupts disabled such that the caller can immediately
a9f3a74a29af09 Thomas Gleixner   2020-07-22  295   * switch to user mode. Called from architecture specific syscall and ret
a9f3a74a29af09 Thomas Gleixner   2020-07-22  296   * from fork code.
a9f3a74a29af09 Thomas Gleixner   2020-07-22  297   *
a9f3a74a29af09 Thomas Gleixner   2020-07-22  298   * The call order is:
a9f3a74a29af09 Thomas Gleixner   2020-07-22  299   *  1) One-time syscall exit work:
a9f3a74a29af09 Thomas Gleixner   2020-07-22  300   *	- rseq syscall exit
a9f3a74a29af09 Thomas Gleixner   2020-07-22  301   *      - audit
a9f3a74a29af09 Thomas Gleixner   2020-07-22  302   *	- syscall tracing
0cfcb2b9ef48bb Eric W. Biederman 2022-01-27  303   *	- ptrace (single stepping)
a9f3a74a29af09 Thomas Gleixner   2020-07-22  304   *
a9f3a74a29af09 Thomas Gleixner   2020-07-22  305   *  2) Preparatory work
e1647100c22eb7 Jinjie Ruan       2026-01-28  306   *	- Disable interrupts
a9f3a74a29af09 Thomas Gleixner   2020-07-22  307   *	- Exit to user mode loop (common TIF handling). Invokes
a9f3a74a29af09 Thomas Gleixner   2020-07-22  308   *	  arch_exit_to_user_mode_work() for architecture specific TIF work
a9f3a74a29af09 Thomas Gleixner   2020-07-22  309   *	- Architecture specific one time work arch_exit_to_user_mode_prepare()
a9f3a74a29af09 Thomas Gleixner   2020-07-22  310   *	- Address limit and lockdep checks
a9f3a74a29af09 Thomas Gleixner   2020-07-22  311   *
310de1a678b218 Sven Schnelle     2020-12-01  312   *  3) Final transition (lockdep, tracing, context tracking, RCU), i.e. the
310de1a678b218 Sven Schnelle     2020-12-01  313   *     functionality in exit_to_user_mode().
c6156e1da633f2 Sven Schnelle     2020-12-01  314   *
e1647100c22eb7 Jinjie Ruan       2026-01-28  315   * This is a combination of syscall_exit_to_user_mode_work() (1), disabling
e1647100c22eb7 Jinjie Ruan       2026-01-28  316   * interrupts followed by syscall_exit_to_user_mode_prepare() (2) and
e1647100c22eb7 Jinjie Ruan       2026-01-28  317   * exit_to_user_mode() (3). This function is preferred unless there is a
e1647100c22eb7 Jinjie Ruan       2026-01-28  318   * compelling architectural reason to invoke the functions separately.
a9f3a74a29af09 Thomas Gleixner   2020-07-22  319   */
e43b8bb56e537b Charlie Jenkins   2025-03-20  320  static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
e43b8bb56e537b Charlie Jenkins   2025-03-20  321  {
e43b8bb56e537b Charlie Jenkins   2025-03-20  322  	instrumentation_begin();
e43b8bb56e537b Charlie Jenkins   2025-03-20  323  	syscall_exit_to_user_mode_work(regs);
e1647100c22eb7 Jinjie Ruan       2026-01-28 @324  	local_irq_disable_exit_to_user();
e1647100c22eb7 Jinjie Ruan       2026-01-28  325  	syscall_exit_to_user_mode_prepare(regs);
e43b8bb56e537b Charlie Jenkins   2025-03-20  326  	instrumentation_end();
e43b8bb56e537b Charlie Jenkins   2025-03-20  327  	exit_to_user_mode();
e43b8bb56e537b Charlie Jenkins   2025-03-20  328  }
a9f3a74a29af09 Thomas Gleixner   2020-07-22  329  

:::::: The code at line 324 was first introduced by commit
:::::: e1647100c22eb718e9833211722cbb78e339047c entry: Rework syscall_exit_to_user_mode_work() for architecture reuse

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
