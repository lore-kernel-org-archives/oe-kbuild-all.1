Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887863;
	b=XKcLU7KzVHdl0gyTvcL/z5EGDdl+PZQlYsR59W4w8Jp5HvkGXUnhcRdctUPCjqPOr2KH
	 nQ1WHiV70oKnRj62zhUyj5J0OJpBr0xlBj6k4yFHcyvO1haIHIhOTHASzbQLyX9UFZQnR
	 f04f/6p0H628fc72mFXD5c0kCuYRrCblZLEEAq+dfqSl0PEXNAofB5FiT+kZsnpQNwqvG
	 GFiKkmp+739YcvDRt2W/nyb52GvQoAduf/hmSAFSntpO+1x0GMxt9N1xd635QXjM958PM
	 B4dgck0Ha4Vw2qbdZJm6BbScuuesi0mgQB4jbj1jgydILVyB8VOt7WG5ZAobD+mJZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5y0+Mt4ZSY7nt5IUHilEY150jS23lZHaY9t/VkHhix8=;
	b=0N7Pgbves7u2ZpSj4x6T9wN6TbXzsr8/YEHOs1a/dn2bc0QqtY3t9U6005t2dmXlzc+b
	 hx31mkszh7CaVpsuy9v9uxR8eJ1Z4DZJm5tcmexrf8uhK9xbfqwebTSkL5h9jE7ckza9V
	 hYF1G4vvfFAPN5hl/ARFIH9Ywea1ly00CiZ4+zPCUWUZ3ppXYnwYiITgq0/bseCVCAPTU
	 geFihRDaQcaSLPwJfb7X5IttnHvmFV6LGRU0iuWWuf802d0U5TgmjkKFUoSvZLSzQ77Am
	 fxHYsR/X0rZFI2bu4lTdlD9H+WOwFKrb9cI5zbmne2SZhdmUFef0u/ART6w6QBHf7GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XFzW8kXV;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C140606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 03:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C140606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XFzW8kXV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794887863; x=1826423863;
  h=date:from:to:cc:subject:message-id;
  bh=NKjrJQS4FiO+BrqwZ3Ua9B6TSHs24e3Svk74LAJL7MY=;
  b=XFzW8kXVx+e4EbnNul90HVXzZcbnEFojEiMZ3GytWG5o2L4DmYxIXa51
   O6P51pY7FE9B9esGKVuGAHGHfBHez/SgHoCPT1npFyvfk1x2eQR45etpB
   whJG+/SkpPtZ2fh0Ozp1uFHKPjvAODqSgYV37cChQIpQU/Qc+x4DPkhXp
   WspH8uEIb4fPx35ilw5/QwKOYqiaf9eMzkyS4TXhUpoG9Seo5vQzC4vZU
   Q2ktCZqbSeMCqOufj5Vu+jDfkHNZeysYf3VI6i8bFUnmBaubIgN+BSDBO
   t9kt+wz01PLXyKXiFP/5+0q4EIuuLoDJpWVmqDlipBx9aIWz4Z/3ynqnJ
   w==;
X-CSE-ConnectionGUID: 3UAlEO9STBiI4t1NSyr9Qw==
X-CSE-MsgGUID: 3WLIgA54S4WQd3ovaT9ySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3642488"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3642488"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:57:42 -0800
X-CSE-ConnectionGUID: W8SfkAjMTJ+R9A0Pm7uNMw==
X-CSE-MsgGUID: mrGS+TJ2Sy+8jYPVtNq88w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11646821"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 16 Nov 2026 19:57:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTAK3-000000002xS-14NQ;
	Tue, 17 Nov 2026 03:57:31 +0000
Date: Tue, 17 Nov 2026 04:56:40 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-lts 2/2]
 kernel/sys_ni.c:50:1: sparse: sparse: symbol
 '__arm64_compat_sys_io_pgetevents_time64' was not declared. Should it be
 static?
Message-ID: <202611170441.wI826QTq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   941c2964a5c9c836e8db51429081fa86ba4b141b
commit: 16c0403b7dec2b255b5aaf2b6b203aa3b96a1775 [2/2] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: arm64-randconfig-r2305-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170441.wI826QTq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7864c0736a8a09670dfbfc513f1e9649799f2486)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170441.wI826QTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170441.wI826QTq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__arm64_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:40:1: sparse: sparse: symbol '__arm64_compat_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__arm64_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__arm64_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:43:1: sparse: sparse: symbol '__arm64_compat_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:44:1: sparse: sparse: symbol '__arm64_sys_io_cancel' was not declared. Should it be static?
   kernel/sys_ni.c:45:1: sparse: sparse: symbol '__arm64_sys_io_getevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:46:1: sparse: sparse: symbol '__arm64_sys_io_getevents' was not declared. Should it be static?
   kernel/sys_ni.c:47:1: sparse: sparse: symbol '__arm64_sys_io_pgetevents_time32' was not declared. Should it be static?
   kernel/sys_ni.c:48:1: sparse: sparse: symbol '__arm64_sys_io_pgetevents' was not declared. Should it be static?
   kernel/sys_ni.c:49:1: sparse: sparse: symbol '__arm64_compat_sys_io_pgetevents' was not declared. Should it be static?
>> kernel/sys_ni.c:50:1: sparse: sparse: symbol '__arm64_compat_sys_io_pgetevents_time64' was not declared. Should it be static?
   kernel/sys_ni.c:51:1: sparse: sparse: symbol '__arm64_sys_io_uring_setup' was not declared. Should it be static?
   kernel/sys_ni.c:52:1: sparse: sparse: symbol '__arm64_sys_io_uring_enter' was not declared. Should it be static?
   kernel/sys_ni.c:53:1: sparse: sparse: symbol '__arm64_sys_io_uring_register' was not declared. Should it be static?
   kernel/sys_ni.c:60:1: sparse: sparse: symbol '__arm64_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:61:1: sparse: sparse: symbol '__arm64_compat_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__arm64_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:67:1: sparse: sparse: symbol '__arm64_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:68:1: sparse: sparse: symbol '__arm64_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:69:1: sparse: sparse: symbol '__arm64_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:70:1: sparse: sparse: symbol '__arm64_compat_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:71:1: sparse: sparse: symbol '__arm64_sys_epoll_pwait2' was not declared. Should it be static?
   kernel/sys_ni.c:72:1: sparse: sparse: symbol '__arm64_compat_sys_epoll_pwait2' was not declared. Should it be static?
   kernel/sys_ni.c:77:1: sparse: sparse: symbol '__arm64_sys_inotify_init1' was not declared. Should it be static?
   kernel/sys_ni.c:78:1: sparse: sparse: symbol '__arm64_sys_inotify_add_watch' was not declared. Should it be static?
   kernel/sys_ni.c:79:1: sparse: sparse: symbol '__arm64_sys_inotify_rm_watch' was not declared. Should it be static?
   kernel/sys_ni.c:84:1: sparse: sparse: symbol '__arm64_sys_ioprio_set' was not declared. Should it be static?
   kernel/sys_ni.c:85:1: sparse: sparse: symbol '__arm64_sys_ioprio_get' was not declared. Should it be static?
   kernel/sys_ni.c:88:1: sparse: sparse: symbol '__arm64_sys_flock' was not declared. Should it be static?
   kernel/sys_ni.c:101:1: sparse: sparse: symbol '__arm64_sys_quotactl' was not declared. Should it be static?
   kernel/sys_ni.c:102:1: sparse: sparse: symbol '__arm64_sys_quotactl_fd' was not declared. Should it be static?
   kernel/sys_ni.c:113:1: sparse: sparse: symbol '__arm64_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:114:1: sparse: sparse: symbol '__arm64_compat_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:123:1: sparse: sparse: symbol '__arm64_sys_timerfd_create' was not declared. Should it be static?
   kernel/sys_ni.c:124:1: sparse: sparse: symbol '__arm64_sys_timerfd_settime' was not declared. Should it be static?
   kernel/sys_ni.c:125:1: sparse: sparse: symbol '__arm64_sys_timerfd_settime32' was not declared. Should it be static?
   kernel/sys_ni.c:126:1: sparse: sparse: symbol '__arm64_sys_timerfd_gettime' was not declared. Should it be static?
   kernel/sys_ni.c:127:1: sparse: sparse: symbol '__arm64_sys_timerfd_gettime32' was not declared. Should it be static?
   kernel/sys_ni.c:132:1: sparse: sparse: symbol '__arm64_sys_acct' was not declared. Should it be static?
   kernel/sys_ni.c:135:1: sparse: sparse: symbol '__arm64_sys_capget' was not declared. Should it be static?
   kernel/sys_ni.c:136:1: sparse: sparse: symbol '__arm64_sys_capset' was not declared. Should it be static?
   kernel/sys_ni.c:144:1: sparse: sparse: symbol '__arm64_sys_clone3' was not declared. Should it be static?
   kernel/sys_ni.c:147:1: sparse: sparse: symbol '__arm64_sys_futex' was not declared. Should it be static?
   kernel/sys_ni.c:148:1: sparse: sparse: symbol '__arm64_sys_futex_time32' was not declared. Should it be static?
   kernel/sys_ni.c:149:1: sparse: sparse: symbol '__arm64_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:150:1: sparse: sparse: symbol '__arm64_compat_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:151:1: sparse: sparse: symbol '__arm64_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:152:1: sparse: sparse: symbol '__arm64_compat_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:159:1: sparse: sparse: symbol '__arm64_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:160:1: sparse: sparse: symbol '__arm64_compat_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:163:1: sparse: sparse: symbol '__arm64_sys_init_module' was not declared. Should it be static?
   kernel/sys_ni.c:164:1: sparse: sparse: symbol '__arm64_sys_delete_module' was not declared. Should it be static?
   kernel/sys_ni.c:169:1: sparse: sparse: symbol '__arm64_sys_syslog' was not declared. Should it be static?
   kernel/sys_ni.c:176:1: sparse: sparse: symbol '__arm64_sys_setregid' was not declared. Should it be static?
   kernel/sys_ni.c:177:1: sparse: sparse: symbol '__arm64_sys_setgid' was not declared. Should it be static?
   kernel/sys_ni.c:178:1: sparse: sparse: symbol '__arm64_sys_setreuid' was not declared. Should it be static?
   kernel/sys_ni.c:179:1: sparse: sparse: symbol '__arm64_sys_setuid' was not declared. Should it be static?
   kernel/sys_ni.c:180:1: sparse: sparse: symbol '__arm64_sys_setresuid' was not declared. Should it be static?
   kernel/sys_ni.c:181:1: sparse: sparse: symbol '__arm64_sys_getresuid' was not declared. Should it be static?
   kernel/sys_ni.c:182:1: sparse: sparse: symbol '__arm64_sys_setresgid' was not declared. Should it be static?
   kernel/sys_ni.c:183:1: sparse: sparse: symbol '__arm64_sys_getresgid' was not declared. Should it be static?
   kernel/sys_ni.c:184:1: sparse: sparse: symbol '__arm64_sys_setfsuid' was not declared. Should it be static?
   kernel/sys_ni.c:185:1: sparse: sparse: symbol '__arm64_sys_setfsgid' was not declared. Should it be static?
   kernel/sys_ni.c:186:1: sparse: sparse: symbol '__arm64_sys_setgroups' was not declared. Should it be static?
   kernel/sys_ni.c:187:1: sparse: sparse: symbol '__arm64_sys_getgroups' was not declared. Should it be static?
   kernel/sys_ni.c:194:1: sparse: sparse: symbol '__arm64_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__arm64_compat_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:196:1: sparse: sparse: symbol '__arm64_sys_mq_unlink' was not declared. Should it be static?
   kernel/sys_ni.c:197:1: sparse: sparse: symbol '__arm64_sys_mq_timedsend' was not declared. Should it be static?
   kernel/sys_ni.c:198:1: sparse: sparse: symbol '__arm64_sys_mq_timedsend_time32' was not declared. Should it be static?
   kernel/sys_ni.c:199:1: sparse: sparse: symbol '__arm64_sys_mq_timedreceive' was not declared. Should it be static?
   kernel/sys_ni.c:200:1: sparse: sparse: symbol '__arm64_sys_mq_timedreceive_time32' was not declared. Should it be static?
   kernel/sys_ni.c:201:1: sparse: sparse: symbol '__arm64_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:202:1: sparse: sparse: symbol '__arm64_compat_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:203:1: sparse: sparse: symbol '__arm64_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:204:1: sparse: sparse: symbol '__arm64_compat_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:207:1: sparse: sparse: symbol '__arm64_sys_msgget' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__arm64_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__arm64_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__arm64_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__arm64_compat_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__arm64_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:213:1: sparse: sparse: symbol '__arm64_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:214:1: sparse: sparse: symbol '__arm64_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:215:1: sparse: sparse: symbol '__arm64_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__arm64_sys_semget' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__arm64_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:220:1: sparse: sparse: symbol '__arm64_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__arm64_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:222:1: sparse: sparse: symbol '__arm64_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:223:1: sparse: sparse: symbol '__arm64_sys_semtimedop' was not declared. Should it be static?
   kernel/sys_ni.c:224:1: sparse: sparse: symbol '__arm64_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:225:1: sparse: sparse: symbol '__arm64_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__arm64_sys_shmget' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__arm64_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__arm64_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__arm64_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:232:1: sparse: sparse: symbol '__arm64_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:233:1: sparse: sparse: symbol '__arm64_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:234:1: sparse: sparse: symbol '__arm64_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:235:1: sparse: sparse: symbol '__arm64_sys_shmdt' was not declared. Should it be static?
   kernel/sys_ni.c:238:1: sparse: sparse: symbol '__arm64_sys_socket' was not declared. Should it be static?
   kernel/sys_ni.c:239:1: sparse: sparse: symbol '__arm64_sys_socketpair' was not declared. Should it be static?
   kernel/sys_ni.c:240:1: sparse: sparse: symbol '__arm64_sys_bind' was not declared. Should it be static?
   kernel/sys_ni.c:241:1: sparse: sparse: symbol '__arm64_sys_listen' was not declared. Should it be static?
   kernel/sys_ni.c:242:1: sparse: sparse: symbol '__arm64_sys_accept' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__arm64_sys_connect' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__arm64_sys_getsockname' was not declared. Should it be static?
   kernel/sys_ni.c:245:1: sparse: sparse: symbol '__arm64_sys_getpeername' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__arm64_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:247:1: sparse: sparse: symbol '__arm64_compat_sys_setsockopt' was not declared. Should it be static?

vim +/__arm64_compat_sys_io_pgetevents_time64 +50 kernel/sys_ni.c

    32	
    33	/*
    34	 * This list is kept in the same order as include/uapi/asm-generic/unistd.h.
    35	 * Architecture specific entries go below, followed by deprecated or obsolete
    36	 * system calls.
    37	 */
    38	
    39	COND_SYSCALL(io_setup);
    40	COND_SYSCALL_COMPAT(io_setup);
  > 41	COND_SYSCALL(io_destroy);
    42	COND_SYSCALL(io_submit);
    43	COND_SYSCALL_COMPAT(io_submit);
    44	COND_SYSCALL(io_cancel);
    45	COND_SYSCALL(io_getevents_time32);
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
