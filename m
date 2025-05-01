Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046DD215182
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119705; cv=none; b=C8VuSZ+tDj3/D9nV/OqXTKO7A8Y1KlgY7qgLBfZzsovB09dYrVmWevAd885IuNtbPWI3xJhgJRIPseiV2W9oxvgRy9mD5ewKpGTAcsCQ/9H4Dv6ICCeKmb//TWo20uomUwi9iagiwP4K+HQi/4+ajDzpWx8Vp9btvfBpn+H4GEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119705; c=relaxed/simple;
	bh=FkbHLtr83Kg6O13137ZmQE4n+vaND3J0/AHnKZDkHZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eofn3nulmae7cvi/H5WZ/K8taiG8nyAkEvpdsNTJbgJvEJjMPNh0O+onN4v8OMylLsx78Gv4ee4VrKqwKfGxs3zquxRBKW4RgPypBSD41MOsQiN+DKMigFwM7uoFQqoKvaa6RSHMFhiiHqdXEL9Ba5AJvaNAQc9KjC3gOVMIZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmlCFTCQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmlCFTCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119703; x=1777655703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkbHLtr83Kg6O13137ZmQE4n+vaND3J0/AHnKZDkHZY=;
  b=WmlCFTCQ/va0mSRxWDEp+ojZ6TD2nepOIHNdikT6Jc9jQDaHv17kULvJ
   qwVtOCMD2G8VYPS55AdOdoZ7ZYATkR9vq8PnmWEVi/gw1dsuGqYFw5otE
   F/5Rnubg+daijNuP4P/0iscKnQAQL+0z8fBKIUjAmXZ8q+vuP2yL4p5db
   xznmVqyt26uhIOwMCHWLucA9uEafVn/wj/rGO2n5Z2BF43kwAC5fPtrp+
   DVt/hsuRjjKFSL+HQoOSz4RQF5uJQpVbGto5ZaTncP30FNuu5CdLyTChf
   MYgbxSTIIFTdElXDsj+fd/fMuy5EeRBAe+J4SAqzwqfdDtVPqC0/QNF59
   A==;
X-CSE-ConnectionGUID: TU4mWCywRz+WQtJlCmKG9w==
X-CSE-MsgGUID: HeLavHGkRbefOouAy9SmpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58428670"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58428670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:15:02 -0700
X-CSE-ConnectionGUID: npdvAFpyRZKNT1Iu4D5otg==
X-CSE-MsgGUID: OD/xio4ATn+KqoIsvz2mRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="135411183"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 May 2025 10:15:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAXUw-0004Hh-0V;
	Thu, 01 May 2025 17:14:58 +0000
Date: Fri, 2 May 2025 01:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/7]
 kernel/sys_ni.c:50:1: sparse: sparse: symbol
 '__x32_compat_sys_io_pgetevents_time64' was not declared. Should it be
 static?
Message-ID: <202505020100.Ra1QeOxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a5dd34cc79ba9654a63fc26c7187ce9dddbe583f
commit: d5f75f01994e399500264a07585935adab948ee5 [0/7] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: x86_64-randconfig-123-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020100.Ra1QeOxx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020100.Ra1QeOxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020100.Ra1QeOxx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__x64_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__ia32_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:40:1: sparse: sparse: symbol '__ia32_compat_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:40:1: sparse: sparse: symbol '__x32_compat_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__x64_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__ia32_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__x64_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__ia32_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:43:1: sparse: sparse: symbol '__ia32_compat_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:43:1: sparse: sparse: symbol '__x32_compat_sys_io_submit' was not declared. Should it be static?
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
   kernel/sys_ni.c:49:1: sparse: sparse: symbol '__x32_compat_sys_io_pgetevents' was not declared. Should it be static?
   kernel/sys_ni.c:50:1: sparse: sparse: symbol '__ia32_compat_sys_io_pgetevents_time64' was not declared. Should it be static?
>> kernel/sys_ni.c:50:1: sparse: sparse: symbol '__x32_compat_sys_io_pgetevents_time64' was not declared. Should it be static?
   kernel/sys_ni.c:51:1: sparse: sparse: symbol '__x64_sys_io_uring_setup' was not declared. Should it be static?
   kernel/sys_ni.c:51:1: sparse: sparse: symbol '__ia32_sys_io_uring_setup' was not declared. Should it be static?
   kernel/sys_ni.c:52:1: sparse: sparse: symbol '__x64_sys_io_uring_enter' was not declared. Should it be static?
   kernel/sys_ni.c:52:1: sparse: sparse: symbol '__ia32_sys_io_uring_enter' was not declared. Should it be static?
   kernel/sys_ni.c:53:1: sparse: sparse: symbol '__x64_sys_io_uring_register' was not declared. Should it be static?
   kernel/sys_ni.c:53:1: sparse: sparse: symbol '__ia32_sys_io_uring_register' was not declared. Should it be static?
   kernel/sys_ni.c:60:1: sparse: sparse: symbol '__x64_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:60:1: sparse: sparse: symbol '__ia32_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:61:1: sparse: sparse: symbol '__ia32_compat_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:61:1: sparse: sparse: symbol '__x32_compat_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__x64_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__ia32_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:67:1: sparse: sparse: symbol '__x64_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:67:1: sparse: sparse: symbol '__ia32_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:68:1: sparse: sparse: symbol '__x64_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:68:1: sparse: sparse: symbol '__ia32_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:69:1: sparse: sparse: symbol '__x64_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:69:1: sparse: sparse: symbol '__ia32_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:70:1: sparse: sparse: symbol '__ia32_compat_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:70:1: sparse: sparse: symbol '__x32_compat_sys_epoll_pwait' was not declared. Should it be static?
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
   kernel/sys_ni.c:111:1: sparse: sparse: symbol '__x32_compat_sys_signalfd4' was not declared. Should it be static?
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
   kernel/sys_ni.c:147:1: sparse: sparse: symbol '__x32_compat_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:148:1: sparse: sparse: symbol '__x64_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:148:1: sparse: sparse: symbol '__ia32_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:149:1: sparse: sparse: symbol '__ia32_compat_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:149:1: sparse: sparse: symbol '__x32_compat_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:156:1: sparse: sparse: symbol '__x64_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:156:1: sparse: sparse: symbol '__ia32_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:157:1: sparse: sparse: symbol '__ia32_compat_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:157:1: sparse: sparse: symbol '__x32_compat_sys_kexec_load' was not declared. Should it be static?
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

vim +/__x32_compat_sys_io_pgetevents_time64 +50 kernel/sys_ni.c

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
    45	COND_SYSCALL(io_getevents_time32);
  > 46	COND_SYSCALL(io_getevents);
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
