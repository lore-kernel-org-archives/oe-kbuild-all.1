Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4301A315B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143956; cv=none; b=KbtXG0PRcthWRs2Qs7V1MeHPloFDmuZQo2BRehSgoFi3CiawNBCxHzKJlMMl3XO9quYdWKwPTNjANuqD62VkzW8FfE7hv4AlxZz0ApdP3DqVAzaj2eOnw+0fABLJ4MI7l4BQyTpGYQVtiuVriI22Ihn2rO830wvY7ajn/5QJdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143956; c=relaxed/simple;
	bh=o/PXwp4iX69YsFBXf0be9SrUjrjkudUCnzKBj9bYqOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ewb/g51Y9MNfEQXU82mQ6jr3uudsNYrISRrF9xUjqFS3oAo3+Zxf0CCRrzykIvyKtiB4Z4mbb5BNCic6C6GMfDHSJPLh6tXM/FKgYix/Q4QDCEnQs6WxeybiianZQGS1FBOn6e8Ti7+OQNf6AUC1xxnUhViK4WJTMPozj4F7ncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldLPIBEN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldLPIBEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741143954; x=1772679954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/PXwp4iX69YsFBXf0be9SrUjrjkudUCnzKBj9bYqOw=;
  b=ldLPIBENsmvY6tQEzQ5uimoBvfXcXndLgKOAfXyy9szm2gWZfbySFS9V
   0FkG+HksjzJQS3oQEqJxLSi5vpg/NzBi3aWc8r7+W6Di67FlzgfMTrRRE
   9XiiqfiZI9LXcW6DnSmV0aAnAKSTDvBVPamWvjqarSaIbK682l5WaDmfx
   Am7ChJYCAsdvENybtjdrA60lGXCVLcuDkDbyArE6k8KQ8zoXc95jxjl+a
   1Qs75LD6mlpTXcoGqmrByeBQIyK77T9cIbCc0skW93UY/MDz7l6gHVHti
   /RoqRVG7mfQwLc8rzav4kYz7eIOthdR6KyrJT7lWAz8yUQ0FI3tC4oTLy
   Q==;
X-CSE-ConnectionGUID: vJJjz58bQTug2APR7G+mdw==
X-CSE-MsgGUID: xLM8kcqLRV6IhZ1RsVgf0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41268894"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="41268894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:05:52 -0800
X-CSE-ConnectionGUID: FjcePD85SoqVZ2VFeiRsOg==
X-CSE-MsgGUID: 29uU+L5dSVqK/Jvus6FEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118278355"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 19:05:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpf4u-000KWS-2E;
	Wed, 05 Mar 2025 03:05:48 +0000
Date: Wed, 5 Mar 2025 11:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype
 for '__x64_sys_memfd_secret'
Message-ID: <202503051012.Zu2fDihZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9617212effd9a3b60c088190776217de5db549a4
commit: d3464b08c47fdca973c536375c5304ad3c9ed0ff [1/1] mm: introduce memfd_secret system call to create "secret" memory areas
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250305/202503051012.Zu2fDihZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051012.Zu2fDihZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051012.Zu2fDihZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:344:1: note: in expansion of macro 'COND_SYSCALL'
     344 | COND_SYSCALL(mlock2);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_copy_file_range' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:346:1: note: in expansion of macro 'COND_SYSCALL'
     346 | COND_SYSCALL(copy_file_range);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_copy_file_range' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:346:1: note: in expansion of macro 'COND_SYSCALL'
     346 | COND_SYSCALL(copy_file_range);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pkey_mprotect' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:349:1: note: in expansion of macro 'COND_SYSCALL'
     349 | COND_SYSCALL(pkey_mprotect);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pkey_mprotect' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:349:1: note: in expansion of macro 'COND_SYSCALL'
     349 | COND_SYSCALL(pkey_mprotect);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pkey_alloc' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:350:1: note: in expansion of macro 'COND_SYSCALL'
     350 | COND_SYSCALL(pkey_alloc);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pkey_alloc' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:350:1: note: in expansion of macro 'COND_SYSCALL'
     350 | COND_SYSCALL(pkey_alloc);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pkey_free' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:351:1: note: in expansion of macro 'COND_SYSCALL'
     351 | COND_SYSCALL(pkey_free);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pkey_free' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:351:1: note: in expansion of macro 'COND_SYSCALL'
     351 | COND_SYSCALL(pkey_free);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_memfd_secret' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:354:1: note: in expansion of macro 'COND_SYSCALL'
     354 | COND_SYSCALL(memfd_secret);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_memfd_secret' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:354:1: note: in expansion of macro 'COND_SYSCALL'
     354 | COND_SYSCALL(memfd_secret);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pciconfig_read' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:361:1: note: in expansion of macro 'COND_SYSCALL'
     361 | COND_SYSCALL(pciconfig_read);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pciconfig_read' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:361:1: note: in expansion of macro 'COND_SYSCALL'
     361 | COND_SYSCALL(pciconfig_read);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pciconfig_write' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:362:1: note: in expansion of macro 'COND_SYSCALL'
     362 | COND_SYSCALL(pciconfig_write);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pciconfig_write' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:362:1: note: in expansion of macro 'COND_SYSCALL'
     362 | COND_SYSCALL(pciconfig_write);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_pciconfig_iobase' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:363:1: note: in expansion of macro 'COND_SYSCALL'
     363 | COND_SYSCALL(pciconfig_iobase);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_pciconfig_iobase' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:363:1: note: in expansion of macro 'COND_SYSCALL'
     363 | COND_SYSCALL(pciconfig_iobase);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_socketcall' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:366:1: note: in expansion of macro 'COND_SYSCALL'
     366 | COND_SYSCALL(socketcall);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_socketcall' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)


vim +/__x64_sys_memfd_secret +83 arch/x86/include/asm/syscall_wrapper.h

cc42c045af1ff4 Brian Gerst       2020-03-13  13  
25c619e59b395a Brian Gerst       2020-03-13  14  /*
25c619e59b395a Brian Gerst       2020-03-13  15   * Instead of the generic __SYSCALL_DEFINEx() definition, the x86 version takes
25c619e59b395a Brian Gerst       2020-03-13  16   * struct pt_regs *regs as the only argument of the syscall stub(s) named as:
25c619e59b395a Brian Gerst       2020-03-13  17   * __x64_sys_*()         - 64-bit native syscall
25c619e59b395a Brian Gerst       2020-03-13  18   * __ia32_sys_*()        - 32-bit native syscall or common compat syscall
25c619e59b395a Brian Gerst       2020-03-13  19   * __ia32_compat_sys_*() - 32-bit compat syscall
25c619e59b395a Brian Gerst       2020-03-13  20   * __x32_compat_sys_*()  - 64-bit X32 compat syscall
25c619e59b395a Brian Gerst       2020-03-13  21   *
25c619e59b395a Brian Gerst       2020-03-13  22   * The registers are decoded according to the ABI:
25c619e59b395a Brian Gerst       2020-03-13  23   * 64-bit: RDI, RSI, RDX, R10, R8, R9
25c619e59b395a Brian Gerst       2020-03-13  24   * 32-bit: EBX, ECX, EDX, ESI, EDI, EBP
25c619e59b395a Brian Gerst       2020-03-13  25   *
25c619e59b395a Brian Gerst       2020-03-13  26   * The stub then passes the decoded arguments to the __se_sys_*() wrapper to
25c619e59b395a Brian Gerst       2020-03-13  27   * perform sign-extension (omitted for zero-argument syscalls).  Finally the
25c619e59b395a Brian Gerst       2020-03-13  28   * arguments are passed to the __do_sys_*() function which is the actual
25c619e59b395a Brian Gerst       2020-03-13  29   * syscall.  These wrappers are marked as inline so the compiler can optimize
25c619e59b395a Brian Gerst       2020-03-13  30   * the functions where appropriate.
25c619e59b395a Brian Gerst       2020-03-13  31   *
25c619e59b395a Brian Gerst       2020-03-13  32   * Example assembly (slightly re-ordered for better readability):
25c619e59b395a Brian Gerst       2020-03-13  33   *
25c619e59b395a Brian Gerst       2020-03-13  34   * <__x64_sys_recv>:		<-- syscall with 4 parameters
25c619e59b395a Brian Gerst       2020-03-13  35   *	callq	<__fentry__>
25c619e59b395a Brian Gerst       2020-03-13  36   *
25c619e59b395a Brian Gerst       2020-03-13  37   *	mov	0x70(%rdi),%rdi	<-- decode regs->di
25c619e59b395a Brian Gerst       2020-03-13  38   *	mov	0x68(%rdi),%rsi	<-- decode regs->si
25c619e59b395a Brian Gerst       2020-03-13  39   *	mov	0x60(%rdi),%rdx	<-- decode regs->dx
25c619e59b395a Brian Gerst       2020-03-13  40   *	mov	0x38(%rdi),%rcx	<-- decode regs->r10
25c619e59b395a Brian Gerst       2020-03-13  41   *
25c619e59b395a Brian Gerst       2020-03-13  42   *	xor	%r9d,%r9d	<-- clear %r9
25c619e59b395a Brian Gerst       2020-03-13  43   *	xor	%r8d,%r8d	<-- clear %r8
25c619e59b395a Brian Gerst       2020-03-13  44   *
25c619e59b395a Brian Gerst       2020-03-13  45   *	callq	__sys_recvfrom	<-- do the actual work in __sys_recvfrom()
25c619e59b395a Brian Gerst       2020-03-13  46   *				    which takes 6 arguments
25c619e59b395a Brian Gerst       2020-03-13  47   *
25c619e59b395a Brian Gerst       2020-03-13  48   *	cltq			<-- extend return value to 64-bit
25c619e59b395a Brian Gerst       2020-03-13  49   *	retq			<-- return
25c619e59b395a Brian Gerst       2020-03-13  50   *
25c619e59b395a Brian Gerst       2020-03-13  51   * This approach avoids leaking random user-provided register content down
25c619e59b395a Brian Gerst       2020-03-13  52   * the call chain.
25c619e59b395a Brian Gerst       2020-03-13  53   */
25c619e59b395a Brian Gerst       2020-03-13  54  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  55  /* Mapping of registers to parameters for syscalls on x86-64 and x32 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  56  #define SC_X86_64_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  57  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  58  		,,regs->di,,regs->si,,regs->dx				\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  59  		,,regs->r10,,regs->r8,,regs->r9)			\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  60  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  61  /* Mapping of registers to parameters for syscalls on i386 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  62  #define SC_IA32_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  63  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  64  	      ,,(unsigned int)regs->bx,,(unsigned int)regs->cx		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  65  	      ,,(unsigned int)regs->dx,,(unsigned int)regs->si		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  66  	      ,,(unsigned int)regs->di,,(unsigned int)regs->bp)
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  67  
d2b5de495ee983 Brian Gerst       2020-03-13  68  #define __SYS_STUB0(abi, name)						\
0f78ff17112d8b Brian Gerst       2020-03-13  69  	long __##abi##_##name(const struct pt_regs *regs);		\
d2b5de495ee983 Brian Gerst       2020-03-13  70  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  71  	long __##abi##_##name(const struct pt_regs *regs)		\
d2b5de495ee983 Brian Gerst       2020-03-13  72  		__alias(__do_##name);
d2b5de495ee983 Brian Gerst       2020-03-13  73  
4399e0cf494f73 Brian Gerst       2020-03-13  74  #define __SYS_STUBx(abi, name, ...)					\
0f78ff17112d8b Brian Gerst       2020-03-13  75  	long __##abi##_##name(const struct pt_regs *regs);		\
4399e0cf494f73 Brian Gerst       2020-03-13  76  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  77  	long __##abi##_##name(const struct pt_regs *regs)		\
4399e0cf494f73 Brian Gerst       2020-03-13  78  	{								\
4399e0cf494f73 Brian Gerst       2020-03-13  79  		return __se_##name(__VA_ARGS__);			\
4399e0cf494f73 Brian Gerst       2020-03-13  80  	}
4399e0cf494f73 Brian Gerst       2020-03-13  81  
6cc8d2b286d9e7 Brian Gerst       2020-03-13  82  #define __COND_SYSCALL(abi, name)					\
0f78ff17112d8b Brian Gerst       2020-03-13 @83  	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  84  	{								\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  85  		return sys_ni_syscall();				\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  86  	}
6cc8d2b286d9e7 Brian Gerst       2020-03-13  87  

:::::: The code at line 83 was first introduced by commit
:::::: 0f78ff17112d8b3469b805ff4ea9780cc1e5c93b x86/entry: Drop asmlinkage from syscalls

:::::: TO: Brian Gerst <brgerst@gmail.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
