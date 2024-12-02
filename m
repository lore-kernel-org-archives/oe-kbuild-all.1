Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D521F8AF6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733121651; cv=none; b=OS6fJDPFrGCKn2a+zbvh7WUPTlY1Gywj8efPz4Yg8hNWSs5mZg6GEyzbK4BMm9KrjqYSlvWkNi/6atDUAH+uk3XfOnwuHS7klOTVKfDCPFEvTjeFULHNEDFmQJmiHsSCY1+HaJdqPE8eGZ8yPdW7aeHvUDQeffOdgmltOnM+Q20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733121651; c=relaxed/simple;
	bh=2mDNcFacOxZBppEPocW1czO7GBgsGPM7MT0U5ArOiuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVMb6KjWniCYRm8h3fSkJuXRAEiaGBuMXOBjZNhmDnIpFTDbv9s0D/7XUx7nsTc2ycDJ/nTtXbUCGV2es72gYbjqNW9TPSULbkgJo2Q/FqDAJAGqro2FTEVQxx+znO+A/bBp+2uIvX24sKYSjjon7QDshATEG6HU4XrsmRRfc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKmA7lJk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKmA7lJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733121649; x=1764657649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mDNcFacOxZBppEPocW1czO7GBgsGPM7MT0U5ArOiuc=;
  b=hKmA7lJkwpHemApR33Jd+vG2PBwa/SlH/ffASmSmaAEWABd/RlUUF1Dz
   9YdQdf2BAYGbTWci0bvIfuzbPYhDV1JTQFfWKcUxDPkj3FBzSylWvKudu
   gqffdBqwYYRhmhg1YQN3tIKzqJn3b/s89RVXy87X/ANV0JXvwXIzIzdxw
   hXv3bzZ1EOZqDDLM/EVdr3+H/NyvTx1mITzi97vfYRRYmvFhiutm3a8Vy
   07DclxHNWFFubvbO+NrkXFyKwT89Ugz1Oe8/aV6fEAph7zFDMaM5JXAB2
   wNAqlF9zSJmi1zCtXfQ5/LQXidwVJrE0Zq+6mqVVdHewoI+5C+dUq9Fef
   w==;
X-CSE-ConnectionGUID: 8h6nVmDnQUuSlnUtevNcrQ==
X-CSE-MsgGUID: YHRx0PvMS7qC1r37avy5+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33153205"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33153205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 22:40:49 -0800
X-CSE-ConnectionGUID: qCJ+DMjHRcad5wmJLxfIgw==
X-CSE-MsgGUID: DJk+gHIwQlKI3115cfHDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="123872851"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2024 22:40:47 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI06u-00029B-3B;
	Mon, 02 Dec 2024 06:40:44 +0000
Date: Mon, 2 Dec 2024 14:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1/1] kernel/sys_ni.c:50:1:
 sparse: sparse: symbol '__ia32_compat_sys_io_pgetevents_time64' was not
 declared. Should it be static?
Message-ID: <202412021425.nXSolxTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   41c0c4731ef0e1dd9af23593d3b52f4051166bd7
commit: eda496b71ba25af137e1c3a28a89c6c77eb30397 [1/1] ANDROID: Reapply changes from previously skipped merge 'android12-5.10.223_r00'
config: x86_64-randconfig-121-20241201 (https://download.01.org/0day-ci/archive/20241202/202412021425.nXSolxTn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021425.nXSolxTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021425.nXSolxTn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__x64_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__ia32_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:40:1: sparse: sparse: symbol '__ia32_compat_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__x64_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__ia32_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__x64_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__ia32_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:43:1: sparse: sparse: symbol '__ia32_compat_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:44:1: sparse: sparse: symbol '__x64_sys_io_cancel' was not declared. Should it be static?
   kernel/sys_ni.c:44:1: sparse: sparse: symbol '__ia32_sys_io_cancel' was not declared. Should it be static?
   kernel/sys_ni.c:45:1: sparse: sparse: symbol '__x64_sys_io_getevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:45:1: sparse: sparse: symbol '__ia32_sys_io_getevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:46:1: sparse: sparse: symbol '__x64_sys_io_getevents' was not declared. Should it be static?
   kernel/sys_ni.c:46:1: sparse: sparse: symbol '__ia32_sys_io_getevents' was not declared. Should it be static?
   kernel/sys_ni.c:47:1: sparse: sparse: symbol '__x64_sys_io_pgetevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:47:1: sparse: sparse: symbol '__ia32_sys_io_pgetevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:48:1: sparse: sparse: symbol '__x64_sys_io_pgetevents' was not declared. Should it be static?
   kernel/sys_ni.c:48:1: sparse: sparse: symbol '__ia32_sys_io_pgetevents' was not declared. Should it be static?
   kernel/sys_ni.c:49:1: sparse: sparse: symbol '__ia32_compat_sys_io_pgetevents' was not declared. Should it be static?
>> kernel/sys_ni.c:50:1: sparse: sparse: symbol '__ia32_compat_sys_io_pgetevents_time64' was not declared. Should it be static?
   kernel/sys_ni.c:51:1: sparse: sparse: symbol '__x64_sys_io_uring_setup' was not declared. Should it be static?
   kernel/sys_ni.c:51:1: sparse: sparse: symbol '__ia32_sys_io_uring_setup' was not declared. Should it be static?
   kernel/sys_ni.c:52:1: sparse: sparse: symbol '__x64_sys_io_uring_enter' was not declared. Should it be static?
   kernel/sys_ni.c:52:1: sparse: sparse: symbol '__ia32_sys_io_uring_enter' was not declared. Should it be static?
   kernel/sys_ni.c:53:1: sparse: sparse: symbol '__x64_sys_io_uring_register' was not declared. Should it be static?
   kernel/sys_ni.c:53:1: sparse: sparse: symbol '__ia32_sys_io_uring_register' was not declared. Should it be static?
   kernel/sys_ni.c:60:1: sparse: sparse: symbol '__x64_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:60:1: sparse: sparse: symbol '__ia32_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:61:1: sparse: sparse: symbol '__ia32_compat_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__x64_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__ia32_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:67:1: sparse: sparse: symbol '__x64_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:67:1: sparse: sparse: symbol '__ia32_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:68:1: sparse: sparse: symbol '__x64_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:68:1: sparse: sparse: symbol '__ia32_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:69:1: sparse: sparse: symbol '__x64_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:69:1: sparse: sparse: symbol '__ia32_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:70:1: sparse: sparse: symbol '__ia32_compat_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:75:1: sparse: sparse: symbol '__x64_sys_inotify_init1' was not declared. Should it be static?
   kernel/sys_ni.c:75:1: sparse: sparse: symbol '__ia32_sys_inotify_init1' was not declared. Should it be static?
   kernel/sys_ni.c:76:1: sparse: sparse: symbol '__x64_sys_inotify_add_watch' was not declared. Should it be static?
   kernel/sys_ni.c:76:1: sparse: sparse: symbol '__ia32_sys_inotify_add_watch' was not declared. Should it be static?
   kernel/sys_ni.c:77:1: sparse: sparse: symbol '__x64_sys_inotify_rm_watch' was not declared. Should it be static?
   kernel/sys_ni.c:77:1: sparse: sparse: symbol '__ia32_sys_inotify_rm_watch' was not declared. Should it be static?
   kernel/sys_ni.c:82:1: sparse: sparse: symbol '__x64_sys_ioprio_set' was not declared. Should it be static?
   kernel/sys_ni.c:82:1: sparse: sparse: symbol '__ia32_sys_ioprio_set' was not declared. Should it be static?
   kernel/sys_ni.c:83:1: sparse: sparse: symbol '__x64_sys_ioprio_get' was not declared. Should it be static?
   kernel/sys_ni.c:83:1: sparse: sparse: symbol '__ia32_sys_ioprio_get' was not declared. Should it be static?
   kernel/sys_ni.c:86:1: sparse: sparse: symbol '__x64_sys_flock' was not declared. Should it be static?
   kernel/sys_ni.c:86:1: sparse: sparse: symbol '__ia32_sys_flock' was not declared. Should it be static?
   kernel/sys_ni.c:99:1: sparse: sparse: symbol '__x64_sys_quotactl' was not declared. Should it be static?
   kernel/sys_ni.c:99:1: sparse: sparse: symbol '__ia32_sys_quotactl' was not declared. Should it be static?
   kernel/sys_ni.c:110:1: sparse: sparse: symbol '__x64_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:110:1: sparse: sparse: symbol '__ia32_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:111:1: sparse: sparse: symbol '__ia32_compat_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:120:1: sparse: sparse: symbol '__x64_sys_timerfd_create' was not declared. Should it be static?
   kernel/sys_ni.c:120:1: sparse: sparse: symbol '__ia32_sys_timerfd_create' was not declared. Should it be static?
   kernel/sys_ni.c:121:1: sparse: sparse: symbol '__x64_sys_timerfd_settime' was not declared. Should it be static?
   kernel/sys_ni.c:121:1: sparse: sparse: symbol '__ia32_sys_timerfd_settime' was not declared. Should it be static?
   kernel/sys_ni.c:122:1: sparse: sparse: symbol '__x64_sys_timerfd_settime32' was not declared. Should it be static?
   kernel/sys_ni.c:122:1: sparse: sparse: symbol '__ia32_sys_timerfd_settime32' was not declared. Should it be static?
   kernel/sys_ni.c:123:1: sparse: sparse: symbol '__x64_sys_timerfd_gettime' was not declared. Should it be static?
   kernel/sys_ni.c:123:1: sparse: sparse: symbol '__ia32_sys_timerfd_gettime' was not declared. Should it be static?
   kernel/sys_ni.c:124:1: sparse: sparse: symbol '__x64_sys_timerfd_gettime32' was not declared. Should it be static?
   kernel/sys_ni.c:124:1: sparse: sparse: symbol '__ia32_sys_timerfd_gettime32' was not declared. Should it be static?
   kernel/sys_ni.c:129:1: sparse: sparse: symbol '__x64_sys_acct' was not declared. Should it be static?
   kernel/sys_ni.c:129:1: sparse: sparse: symbol '__ia32_sys_acct' was not declared. Should it be static?
   kernel/sys_ni.c:132:1: sparse: sparse: symbol '__x64_sys_capget' was not declared. Should it be static?
   kernel/sys_ni.c:132:1: sparse: sparse: symbol '__ia32_sys_capget' was not declared. Should it be static?
   kernel/sys_ni.c:133:1: sparse: sparse: symbol '__x64_sys_capset' was not declared. Should it be static?
   kernel/sys_ni.c:133:1: sparse: sparse: symbol '__ia32_sys_capset' was not declared. Should it be static?
   kernel/sys_ni.c:141:1: sparse: sparse: symbol '__x64_sys_clone3' was not declared. Should it be static?
   kernel/sys_ni.c:141:1: sparse: sparse: symbol '__ia32_sys_clone3' was not declared. Should it be static?
   kernel/sys_ni.c:144:1: sparse: sparse: symbol '__x64_sys_futex' was not declared. Should it be static?
   kernel/sys_ni.c:144:1: sparse: sparse: symbol '__ia32_sys_futex' was not declared. Should it be static?
   kernel/sys_ni.c:145:1: sparse: sparse: symbol '__x64_sys_futex_time32' was not declared. Should it be static?
   kernel/sys_ni.c:145:1: sparse: sparse: symbol '__ia32_sys_futex_time32' was not declared. Should it be static?
   kernel/sys_ni.c:146:1: sparse: sparse: symbol '__x64_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:146:1: sparse: sparse: symbol '__ia32_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:147:1: sparse: sparse: symbol '__ia32_compat_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:148:1: sparse: sparse: symbol '__x64_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:148:1: sparse: sparse: symbol '__ia32_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:149:1: sparse: sparse: symbol '__ia32_compat_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:156:1: sparse: sparse: symbol '__x64_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:156:1: sparse: sparse: symbol '__ia32_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:157:1: sparse: sparse: symbol '__ia32_compat_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:160:1: sparse: sparse: symbol '__ia32_sys_init_module' was not declared. Should it be static?
   kernel/sys_ni.c:161:1: sparse: sparse: symbol '__x64_sys_delete_module' was not declared. Should it be static?
   kernel/sys_ni.c:161:1: sparse: sparse: symbol '__ia32_sys_delete_module' was not declared. Should it be static?
   kernel/sys_ni.c:166:1: sparse: sparse: symbol '__x64_sys_syslog' was not declared. Should it be static?
   kernel/sys_ni.c:166:1: sparse: sparse: symbol '__ia32_sys_syslog' was not declared. Should it be static?
   kernel/sys_ni.c:173:1: sparse: sparse: symbol '__x64_sys_setregid' was not declared. Should it be static?
   kernel/sys_ni.c:174:1: sparse: sparse: symbol '__x64_sys_setgid' was not declared. Should it be static?
   kernel/sys_ni.c:175:1: sparse: sparse: symbol '__x64_sys_setreuid' was not declared. Should it be static?
   kernel/sys_ni.c:176:1: sparse: sparse: symbol '__x64_sys_setuid' was not declared. Should it be static?
   kernel/sys_ni.c:179:1: sparse: sparse: symbol '__x64_sys_setresgid' was not declared. Should it be static?
   kernel/sys_ni.c:180:1: sparse: sparse: symbol '__x64_sys_getresgid' was not declared. Should it be static?
   kernel/sys_ni.c:191:1: sparse: sparse: symbol '__ia32_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:192:1: sparse: sparse: symbol '__ia32_compat_sys_mq_open' was not declared. Should it be static?

vim +/__ia32_compat_sys_io_pgetevents_time64 +50 kernel/sys_ni.c

    32	
    33	/*
    34	 * This list is kept in the same order as include/uapi/asm-generic/unistd.h.
    35	 * Architecture specific entries go below, followed by deprecated or obsolete
    36	 * system calls.
    37	 */
    38	
    39	COND_SYSCALL(io_setup);
    40	COND_SYSCALL_COMPAT(io_setup);
    41	COND_SYSCALL(io_destroy);
    42	COND_SYSCALL(io_submit);
    43	COND_SYSCALL_COMPAT(io_submit);
    44	COND_SYSCALL(io_cancel);
  > 45	COND_SYSCALL(io_getevents_time32);
    46	COND_SYSCALL(io_getevents);
    47	COND_SYSCALL(io_pgetevents_time32);
    48	COND_SYSCALL(io_pgetevents);
    49	COND_SYSCALL_COMPAT(io_pgetevents);
  > 50	COND_SYSCALL_COMPAT(io_pgetevents_time64);
    51	COND_SYSCALL(io_uring_setup);
    52	COND_SYSCALL(io_uring_enter);
    53	COND_SYSCALL(io_uring_register);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
