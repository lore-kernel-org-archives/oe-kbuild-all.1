Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CBC204F94
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738709953; cv=none; b=KmJOBek0Oo0rcMsv9cAbbiOe2KyZ43soyohdx2hRptUfnc8N3jBOrlKzlfl6PoP7V9X8QGYs9NDmzDtVZp/75t2q2DcWx4bWiInoFy9zJXO7wEOqaUL+YVTvLYf/c+p7dPq8Xbgov5VuqG3sKOlY4ITbbQMUOQacGf/VoGv/eYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738709953; c=relaxed/simple;
	bh=OWt/98fs8t9rjdNquYhNN6rEZ26dCdi0OWej8q4cvRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ai33VSjexXI8ZYG8KnTttq7Ggc6RNEBUOMDwPkO0UFH2nnPgovW+8MS726vaN1c99MfF/IKkg4rw7aBdWdv5xoS0xgolehrF8rdC3J9nHayPpMUChgkExxvi8x12zmw6dQK/v/QeSSIhsgdjvKu9WkgegqlDyr/TZ/8gMXng4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4L9i2ea; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4L9i2ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738709952; x=1770245952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWt/98fs8t9rjdNquYhNN6rEZ26dCdi0OWej8q4cvRA=;
  b=A4L9i2eaoR1Qe/2uLTtIiwN+D6/FMvlk/zOdpDKUX/r4BnIOTDMJye1d
   CbRcsTsizMsounpF2qVALSWzVtq7uXbh1NrJwietTwk8ZUPpYMNPOJV+Z
   xqnkOnCPoWoL8jVIQGH7VOYI1tO2R/+uCMK8qY9sVHDhYRR2Mq4zLW8lO
   0pTgfMfB1wlWrCzaZIcjPnpzsb4aqgJfKNvs7xs8ThnuKWBBC/z8P89fE
   ogYxOo0hbMo+2eZdg9S21v3uIEAViIcndZelFxe4S450/o+fjF5ru/Lg9
   mWyzGK4v7qEEsGdHxengXWpsVAm8wn7ddXCuelWRVCQwu4iz0sCil+RRw
   A==;
X-CSE-ConnectionGUID: K/zOkt1MRDezhxvJdEh1Qg==
X-CSE-MsgGUID: Sm4fLY+FSXSiDag80SJYrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49877713"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="49877713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 14:59:09 -0800
X-CSE-ConnectionGUID: WAAmVx4ERWu/750rNqu8Ew==
X-CSE-MsgGUID: RLFb73AZRsqFgU5JAOF+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111602023"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 14:59:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfRsn-000t8Z-19;
	Tue, 04 Feb 2025 22:59:05 +0000
Date: Wed, 5 Feb 2025 06:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/31] vmlinux.o: warning: objtool:
 set_ftrace_ops_ro+0x48: relocation to !ENDBR: ftrace_regs_caller+0x154
Message-ID: <202502050610.sk5WmcV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   9df9c6e64b331989df081c840685e2477a50c06a
commit: 0f6935944500071e1401fa2fab3499380e41d348 [10/31] treewide: Harden against integer overflows in DIV_ROUND_UP()
config: x86_64-buildonly-randconfig-002-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050610.sk5WmcV0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050610.sk5WmcV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050610.sk5WmcV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
   vmlinux.o: warning: objtool: __se_sys_waitid+0x289: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __ia32_compat_sys_waitid+0x229: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_wake_op+0x534: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_get_bitmap+0xb8: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_put_bitmap+0xb8: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: ftrace_likely_update+0xc1: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: ___bpf_prog_run+0x86: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __rseq_handle_notify_resume+0xa59: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_writeable+0xe9: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_readable+0x10a: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fillonedir+0x215: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir+0x312: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir64+0x312: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_fillonedir+0x276: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_filldir+0x37b: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __ia32_compat_sys_pselect6_time64+0x114: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __ia32_compat_sys_pselect6_time32+0x114: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: do_sys_poll+0xec4: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: io_get_ext_arg+0x15b: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: io_msg_copy_hdr+0x145: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: io_waitid_finish+0x2be: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_compat_iovec_from_user+0xa7: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_iovec_from_user+0xaa: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: check_zeroed_user+0xf3: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strncpy_from_user+0x1c2: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strnlen_user+0x118: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: i915_gem_execbuffer2_ioctl+0x160f: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: eb_relocate_parse_slow+0x51f: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_perf_config_registers_or_number+0xe9: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: put_cmsg+0x275: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_mc_fragile_handle_tail+0x82: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: csum_and_copy_from_user+0xb2: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: csum_and_copy_to_user+0xb2: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: do_syscall_64+0x96: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_int80_emulation+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_user+0x180: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_extint+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_hwexc+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_kernel+0x97: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x9f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_exc_nmi+0x18: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x6f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __static_call_update_early+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_exc_machine_check+0x7a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0xd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x64: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x64: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x48: relocation to !ENDBR: ftrace_regs_caller+0x154

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
