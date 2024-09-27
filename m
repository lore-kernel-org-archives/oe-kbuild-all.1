Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835904C74
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727398133; cv=none; b=CXmhDvlS594iknTIrl/tAxUf9t+yEj+FLzior+yQ4SkYbwhSMJAG+Zefx9xA8I4HipD6hME8ssbcJRYF6TobvcwNGDHXnQZty3vT4YvO4qRW82o5MAUagrvwpM1k3N0JPc8rSuht+GiQiolTNDgr0or6UTe4oZASKaGx1B0m1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727398133; c=relaxed/simple;
	bh=qzjcpl2i59jb2pfI6xZv0v/mIWFeZ/tamXxhvkp1Lxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txPJdDpHC5Gljp3TlFKkYs1xTuNw2hvRNidwOi5ydwFbFiF17xqxp2K57RB0MTHU6Zd9BsTr4c2P2vDVu1s/oJ5SvqsXX6PXBou3tj6zFGwCQUqNIrD56/zwTipNRWoo7QJDrnApLD4PMkgds4X/LtauKNUIUjaoGcoluedMVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgR/zd5l; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgR/zd5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727398132; x=1758934132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzjcpl2i59jb2pfI6xZv0v/mIWFeZ/tamXxhvkp1Lxc=;
  b=cgR/zd5lMVb+p9GaaHZj0OAR5HDnlgyyN0AmnAXZrf3eRzrE7pmTHO66
   XCAfccpq9Cl+MiEWb2znfh2+cp79ooDRoW3pVGZxTbLqUjfNxt5/kE0/m
   gW/4PftFNheJSO8c+knIn5mzGcYrLg0lkx0zNa2Nh22jDSzw2UVplv1cb
   nex6JK3RRyuYxmU31eK/lFntMEr8PxCRsDm1Q0qUtXEi/ytPmbRfUz/XM
   5We3PpZazOkEN2bMkF+2kPrEhnZilV+7Dy6mhX5L46bbwdnqf1l8TuRKJ
   vFUkt1qUremuQpYiUTskH2QcjKjILn84yf2m8KiVDVKBNydLX+oGUJyj3
   g==;
X-CSE-ConnectionGUID: DsEsRN7iTgaJnsQ8sSPHjA==
X-CSE-MsgGUID: urRE120EQQmbwUzY4FdWbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26662506"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26662506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:48:51 -0700
X-CSE-ConnectionGUID: iPeYk3UERlO3K8L1ZOxvOg==
X-CSE-MsgGUID: ZpIzJSLjSvySpb+lG9T1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="77182261"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Sep 2024 17:48:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzA7-000LKl-2J;
	Fri, 27 Sep 2024 00:48:47 +0000
Date: Fri, 27 Sep 2024 08:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] vmlinux.o: warning: objtool:
 .text.tick_sched_timer: unexpected end of section
Message-ID: <202409270847.9lI2Fb7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   04612a82bcfa574a944f47923d992b6b4870a4fb
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: x86_64-buildonly-randconfig-005-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270847.9lI2Fb7V-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270847.9lI2Fb7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270847.9lI2Fb7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x72: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x23: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x23: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x26: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpuidle_enter_state+0x434: return with instrumentation enabled
   vmlinux.o: warning: objtool: mwait_idle+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x7f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __x64_sys_waitid+0x3be: call to __tsan_unaligned_read_write8() with UACCESS enabled
>> vmlinux.o: warning: objtool: .text.tick_sched_timer: unexpected end of section
   vmlinux.o: warning: objtool: futex_cmpxchg_value_locked+0xc4: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_wake_op+0x4a3: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp1+0xf: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp2+0x12: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp4+0x12: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp8+0xf: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp1+0x12: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp2+0x12: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp4+0x12: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp8+0xf: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_switch+0x50: call to write_comp_data.llvm.13943419661926544032() with UACCESS enabled
   vmlinux.o: warning: objtool: __rseq_handle_notify_resume+0xd80: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: shrink_node+0xde0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: fault_in_writeable+0x11b: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_readable+0x11c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fillonedir+0x1d2: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir+0x359: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir64+0x359: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __x64_sys_pselect6+0x123: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: do_sys_poll+0xd56: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section
   vmlinux.o: warning: objtool: copy_compat_iovec_from_user+0xdb: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_iovec_from_user+0xd4: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: check_zeroed_user+0x125: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strncpy_from_user+0x24c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strnlen_user+0x1fa: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: csum_and_copy_from_user+0xee: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: csum_and_copy_to_user+0xee: call to __tsan_unaligned_read_write8() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
