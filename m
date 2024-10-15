Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A981CC16F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981702; cv=none; b=MyXvmKf5bb5kIq3NKJUs63R+HuHAjidXPvPAMJAugx3Cd2rTg4sk4jWbqes0eGXwVDrv4oM2uQpFSGrJK+EGOY+IYfSwB0BwnCcWJyRHqVbQgEhGL3DQ5kcMwW7WZJRU1b8+i4iHXtcG7cVMdM40vfxhn0jev9y8vD3zB/4Xrc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981702; c=relaxed/simple;
	bh=6d4koXpnu0hL1oW0hLbbVXcNxReL4feFM7pNcZJfACg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZdTYZTGi9G8RrhbtCcAjVVjZkTdDmofyNxQAPit12ARmrQjPDa1TiGhLwdgHf52r83emzpXw6z5aH9IqPN1EOfB56JL8l7MfeffZtTIcTggELx1oxg2APc2PoWA+Wag0EeIbrEtR/zGU/mE3FGFMyeFdDeynozB5x6fTja94L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv5JfU9j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv5JfU9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728981701; x=1760517701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6d4koXpnu0hL1oW0hLbbVXcNxReL4feFM7pNcZJfACg=;
  b=Dv5JfU9j+x+47p/Xcwn5AaUp2+ng8XdlLHW5yQpdX75g5Jvq77/hvcSv
   OZNicSTALhFKocR/Waf0eJBEVKUBr23Z4WKWYlxT1tSAgi5lmhGw1bBH6
   3IjJ9fBeTkr2vAR2NNzd6KwB1hejQncK3dn7KU7wBCEqdOBWffaulq9w0
   h5NFfiAu2p5TpfBcjFWlDUBHeda0G8z8n5nbaNrty0hDa711UXa2AtH9U
   gXlqYlBK+u3j1YnUNczBCnKC1mf+6d9VsC1SWmhbZgq1dmbMGpIHwyFnN
   EE1cJ+Clal4wNtmF8YpMO3GursCNHABrIgpAR6heZtBSIWsaoI96Rgg7m
   A==;
X-CSE-ConnectionGUID: l7sitZAiQ2y25w0ZeO08LQ==
X-CSE-MsgGUID: bdvvRUD3QHeNpPAKtlD5kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32053701"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32053701"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:41:41 -0700
X-CSE-ConnectionGUID: OSbGnr7cSHmUFk1efYXdHA==
X-CSE-MsgGUID: CRahdTQrRq62XyXOWdPfig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="81805940"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 01:41:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0d7Y-000Hpp-2V;
	Tue, 15 Oct 2024 08:41:36 +0000
Date: Tue, 15 Oct 2024 16:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:objtool-jump-table-annotations-v3 10/10] vmlinux.o: warning:
 objtool: crc_pcl+0x12e3: BP used as a scratch register
Message-ID: <202410151621.TnhgOYdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git objtool-jump-table-annotations-v3
head:   477193de52ecbc0367ed1db0439ae09f6396cf97
commit: 477193de52ecbc0367ed1db0439ae09f6396cf97 [10/10] crypto: x86/crc32c-intel - Tweaks to make objtool's life harder
config: x86_64-buildonly-randconfig-002-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151621.TnhgOYdf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151621.TnhgOYdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151621.TnhgOYdf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: crc_pcl+0x12e3: BP used as a scratch register
   vmlinux.o: warning: objtool: check_kcov_mode+0x1b: call to in_softirq_really() with UACCESS enabled
   vmlinux.o: warning: objtool: do_syscall_64+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_int80_emulation+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32+0x64: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_hwexc.constprop.0+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_extint.constprop.0+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_user+0x120: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_kernel+0xb5: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_exc_nmi+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x7d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x7a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x69: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x52: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x65: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x18: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x1f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x1f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x32: call to ftrace_likely_update() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
