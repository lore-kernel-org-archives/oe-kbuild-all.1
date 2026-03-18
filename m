Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A56175A91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799750; cv=none; b=BrWvFd1XwDEgfsh9N2gnnmAtVulXL+d6/17xFydAcAGfHYnnT5gZ6Ni/xynCUQMAxLOoxDMLi/S7u2wLi3bvT+/8Q6hFzTCPyGct9+BFkTfb0wfGeILT6gmw6JlZxXancuEcZVfeaeNOPJxGu4vo6iZ3pOIrGkx3kbO2ZZr0QKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799750; c=relaxed/simple;
	bh=HVEELyYm2+kFF4KD6ZL+3g/yyrhj5uT8Jd+o1wBj1SA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GCv9iNDlns6CvCyF1ZBYqfs17U3G2ptXvG5oRKLOp17uJMLPBJKPYobEc/8ztBNsaWrLcRxOVV6O9MUctxKsMKloHXDVhBdghz4iSCmVFivjcQFbbhcTKYhLslylls1b3hPeQM4WowB2byhToWTxXPNM2zPaANHPLNdVxlUduHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAmrSnqF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAmrSnqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773799750; x=1805335750;
  h=date:from:to:cc:subject:message-id;
  bh=HVEELyYm2+kFF4KD6ZL+3g/yyrhj5uT8Jd+o1wBj1SA=;
  b=dAmrSnqFyqb71WFUhehEsFQA67Hn7APQB7GvLuelNrnAPrll0do8lq9O
   LJT+PQDOaVtcWIB9SYFgpeyxoU+TWcfyexrEJP1B8ntR+XdkpmFtEdyBM
   +9PrRWoKiCavsqlWQH/t79+V8pZJbRTvEhSzac26OtSJ8NitkkyvZNaIq
   NxQfZ6a2rS0Qc9wfSnj45dVOBbbMJxfbQ1WHOjFP/HH3ZiWAItv0qPyJN
   AqaXMlSsMP752MORbybR89aXAERBiBoMrSqhf0klbvTeSfiQveGaf9qpy
   bVJh9Q1SZiYDEdWu7f/BRcc8ABxXPCWMZWx8QuvnzYu3ssIODJRHl4xdi
   w==;
X-CSE-ConnectionGUID: LsliueyeQnauajUMRJ/NKg==
X-CSE-MsgGUID: teNuNxfLTKeSQPP5QjKAYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74879967"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74879967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:09:09 -0700
X-CSE-ConnectionGUID: /IMyNTEPRlG/jhHHL5Sl3g==
X-CSE-MsgGUID: 9zwbq92gR/6wRp2+9Wblnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="260350978"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2026 19:09:07 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gLI-000000002LF-29Ut;
	Wed, 18 Mar 2026 02:09:04 +0000
Date: Wed, 18 Mar 2026 10:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] vmlinux.o: warning:
 objtool: set_ftrace_ops_ro+0x38: relocation to !ENDBR:
 machine_kexec_prepare+0x494
Message-ID: <202603181037.m2GyBtDu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1b7e439a4c990cd33e42bae516a236b91efc8475
commit: 06a0e2a320a5ac8bed253ab36ee2077ae2040dae [0/1] x86/kexec: Allocate PGD for x86_64 transition page tables separately
config: x86_64-buildonly-randconfig-005-20260317 (https://download.01.org/0day-ci/archive/20260318/202603181037.m2GyBtDu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181037.m2GyBtDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181037.m2GyBtDu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __x64_sys_waitid+0x3a6: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_cmpxchg_value_locked+0xd7: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_wake_op+0x41c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_writeable+0xf7: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_readable+0x107: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fillonedir+0x23a: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir+0x356: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir64+0x356: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: do_sys_poll+0xc84: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: io_waitid_finish+0x11c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_compat_iovec_from_user+0xb9: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_iovec_from_user+0xb8: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: check_zeroed_user+0x104: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strncpy_from_user+0x1cf: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strnlen_user+0x131: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: rk806_set_mode_dcdc() falls through to next function rk8xx_is_enabled_wmsk_regmap()
   vmlinux.o: warning: objtool: copy_mc_fragile_handle_tail+0x8f: call to __tsan_unaligned_read_write8() with UACCESS enabled
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x38: relocation to !ENDBR: machine_kexec_prepare+0x494

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
