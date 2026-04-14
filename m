Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF181313E07
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776205696; cv=none; b=SOkL8ArNOCtRMluUsslX6BRxXXPQgocgEJzGdVdRHPgNZGDlcqNb/SdqLkB+eAO7r/bYhbBkI1HQfNNgFefaXARm2l2ZjiSuzA4tTzUCI8tCL5J71k2Iv1l3AtT/2FVta5g340NLuhMS2vm6TAFYtdCcDqDhitsJYGqIwSBrStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776205696; c=relaxed/simple;
	bh=0X5cAWwH5s58fR4xcMoejOjPMqJLuMohgedZ6ne3MAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udKtwKf4S0Y/xOIFVSs5A2/jUmYACChGkQ3jdmOhPgH4yEgeiLQCE8Invs2Y7W6GPTR3HI3EvcljnJ4QA4zXzWql/PE8Cn0n3qSKioamIzhoapF6nxaubi4424blpk0Aq4sNvL6Nxcsw+KNr5+0/P3c7B4cJB96Hpaap78wwH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsGONuiJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsGONuiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776205694; x=1807741694;
  h=date:from:to:cc:subject:message-id;
  bh=0X5cAWwH5s58fR4xcMoejOjPMqJLuMohgedZ6ne3MAs=;
  b=hsGONuiJ0lo05+2c0RhQYzvpMJhP8u3i4/nhePFhRbw7rGU0pFRL2Jin
   LTOHMWRl+2yCTlmP7NmJnnl57jWYEDlXmCimkvekdtTDlJrAZyIr5yvQD
   JRmiY8Duz6j9i4o7hIVoZL1YVS27MvOc5m0I4RZ9JFpoqubWAOBBZnJb8
   xMB5w75OTt/LDH+cwEuNUTFqHZ2RM0SYZacnqWprwlbotFHff1ThmdEXx
   2EYM/nfmyIH7k0lt6hDg5Sb6kOG+TD62jXwBW6MEz0jvxM9510cXlu/pq
   YJbpEKP6Bdqa7N83lRqur6jFO9xpg+sngymWWDHe0scRzXXt+of4yiB/0
   Q==;
X-CSE-ConnectionGUID: Ud/blaawS+Sa/hlu2EICYw==
X-CSE-MsgGUID: jjPcKRohTxm4Itsk0yajBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76341876"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76341876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 15:28:14 -0700
X-CSE-ConnectionGUID: +p4OxaBuQH69lhINrxTiOA==
X-CSE-MsgGUID: bg+AXWc+QMKA4wekJj/g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225526020"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 15:28:12 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCmEs-000000001v9-1srr;
	Tue, 14 Apr 2026 22:28:10 +0000
Date: Wed, 15 Apr 2026 06:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-03 1/1]
 kernel/sys_ni.c:50:1: sparse: sparse: symbol
 '__arm64_compat_sys_io_pgetevents_time64' was not declared. Should it be
 static?
Message-ID: <202604150621.Q8bOfObE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-03
head:   5e8b0cffebd18f2c1879da63ec93f52301d9b571
commit: e1b88ac1fe65a5e9f7ecbf7ca72bd48f317fa2fb [1/1] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: arm64-randconfig-r133-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150621.Q8bOfObE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150621.Q8bOfObE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150621.Q8bOfObE-lkp@intel.com/

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
   kernel/sys_ni.c:153:1: sparse: sparse: symbol '__arm64_sys_futex_waitv' was not declared. Should it be static?
   kernel/sys_ni.c:160:1: sparse: sparse: symbol '__arm64_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:161:1: sparse: sparse: symbol '__arm64_compat_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:164:1: sparse: sparse: symbol '__arm64_sys_init_module' was not declared. Should it be static?
   kernel/sys_ni.c:165:1: sparse: sparse: symbol '__arm64_sys_delete_module' was not declared. Should it be static?
   kernel/sys_ni.c:170:1: sparse: sparse: symbol '__arm64_sys_syslog' was not declared. Should it be static?
   kernel/sys_ni.c:177:1: sparse: sparse: symbol '__arm64_sys_setregid' was not declared. Should it be static?
   kernel/sys_ni.c:178:1: sparse: sparse: symbol '__arm64_sys_setgid' was not declared. Should it be static?
   kernel/sys_ni.c:179:1: sparse: sparse: symbol '__arm64_sys_setreuid' was not declared. Should it be static?
   kernel/sys_ni.c:180:1: sparse: sparse: symbol '__arm64_sys_setuid' was not declared. Should it be static?
   kernel/sys_ni.c:181:1: sparse: sparse: symbol '__arm64_sys_setresuid' was not declared. Should it be static?
   kernel/sys_ni.c:182:1: sparse: sparse: symbol '__arm64_sys_getresuid' was not declared. Should it be static?
   kernel/sys_ni.c:183:1: sparse: sparse: symbol '__arm64_sys_setresgid' was not declared. Should it be static?
   kernel/sys_ni.c:184:1: sparse: sparse: symbol '__arm64_sys_getresgid' was not declared. Should it be static?
   kernel/sys_ni.c:185:1: sparse: sparse: symbol '__arm64_sys_setfsuid' was not declared. Should it be static?
   kernel/sys_ni.c:186:1: sparse: sparse: symbol '__arm64_sys_setfsgid' was not declared. Should it be static?
   kernel/sys_ni.c:187:1: sparse: sparse: symbol '__arm64_sys_setgroups' was not declared. Should it be static?
   kernel/sys_ni.c:188:1: sparse: sparse: symbol '__arm64_sys_getgroups' was not declared. Should it be static?
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__arm64_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:196:1: sparse: sparse: symbol '__arm64_compat_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:197:1: sparse: sparse: symbol '__arm64_sys_mq_unlink' was not declared. Should it be static?
   kernel/sys_ni.c:198:1: sparse: sparse: symbol '__arm64_sys_mq_timedsend' was not declared. Should it be static?
   kernel/sys_ni.c:199:1: sparse: sparse: symbol '__arm64_sys_mq_timedsend_time32' was not declared. Should it be static?
   kernel/sys_ni.c:200:1: sparse: sparse: symbol '__arm64_sys_mq_timedreceive' was not declared. Should it be static?
   kernel/sys_ni.c:201:1: sparse: sparse: symbol '__arm64_sys_mq_timedreceive_time32' was not declared. Should it be static?
   kernel/sys_ni.c:202:1: sparse: sparse: symbol '__arm64_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:203:1: sparse: sparse: symbol '__arm64_compat_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:204:1: sparse: sparse: symbol '__arm64_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__arm64_compat_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__arm64_sys_msgget' was not declared. Should it be static?
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__arm64_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__arm64_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__arm64_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__arm64_compat_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:213:1: sparse: sparse: symbol '__arm64_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:214:1: sparse: sparse: symbol '__arm64_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:215:1: sparse: sparse: symbol '__arm64_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__arm64_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__arm64_sys_semget' was not declared. Should it be static?
   kernel/sys_ni.c:220:1: sparse: sparse: symbol '__arm64_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__arm64_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:222:1: sparse: sparse: symbol '__arm64_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:223:1: sparse: sparse: symbol '__arm64_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:224:1: sparse: sparse: symbol '__arm64_sys_semtimedop' was not declared. Should it be static?
   kernel/sys_ni.c:225:1: sparse: sparse: symbol '__arm64_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__arm64_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__arm64_sys_shmget' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__arm64_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__arm64_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:232:1: sparse: sparse: symbol '__arm64_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:233:1: sparse: sparse: symbol '__arm64_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:234:1: sparse: sparse: symbol '__arm64_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:235:1: sparse: sparse: symbol '__arm64_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:236:1: sparse: sparse: symbol '__arm64_sys_shmdt' was not declared. Should it be static?
   kernel/sys_ni.c:239:1: sparse: sparse: symbol '__arm64_sys_socket' was not declared. Should it be static?
   kernel/sys_ni.c:240:1: sparse: sparse: symbol '__arm64_sys_socketpair' was not declared. Should it be static?
   kernel/sys_ni.c:241:1: sparse: sparse: symbol '__arm64_sys_bind' was not declared. Should it be static?
   kernel/sys_ni.c:242:1: sparse: sparse: symbol '__arm64_sys_listen' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__arm64_sys_accept' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__arm64_sys_connect' was not declared. Should it be static?
   kernel/sys_ni.c:245:1: sparse: sparse: symbol '__arm64_sys_getsockname' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__arm64_sys_getpeername' was not declared. Should it be static?
   kernel/sys_ni.c:247:1: sparse: sparse: symbol '__arm64_sys_setsockopt' was not declared. Should it be static?

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
    41	COND_SYSCALL(io_destroy);
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
