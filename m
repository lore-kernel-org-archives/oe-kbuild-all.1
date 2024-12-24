Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59C1465B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735071191; cv=none; b=qXGwSBmKI0FVuRrFzaU9BtH5UuZVK81trU/b3AfMKCAdD9xuxSd6s6nZ/jZlCTLbgiAJpZYHRt3vVMOmZzACOd5lqXxlh9P+6hEz/P7rj/EGZCAtTCYa0JxmBkEnWd/Ke+DEhLnDpfkM8graG9Np7ScZztnEX8X/0gfMKxU4ies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735071191; c=relaxed/simple;
	bh=u8XYUadebGZt2lVN4wfzhhDsB7m1B7KyhWi+XkMfcTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ueURdKG3FArNZZOwJTMQzlfMxONZT1XUu9IV6++pKXR7r153OOPDNk3e8uPx1KdR9+oGjUqcrhE+3+O+aX8s366q5xFhySKtNakFZYL+xvI2T9yJApjcGaIki1BpU+Yvt2QTw0dfK8YUYSFcv9nG6HKGjVbUphHzTbkMoeR1nX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HiR4F2So; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HiR4F2So"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735071189; x=1766607189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8XYUadebGZt2lVN4wfzhhDsB7m1B7KyhWi+XkMfcTw=;
  b=HiR4F2SoQph6JogMdVubV9InAmZ3KYQlC0kVOBB6+JwwCn52zfM60JkY
   pI3RLqiD6syIbRXJ3gYYtGEnhK1MLxK/WBtDTXANrK04ZVtbX0Z5VzqNu
   X8ZJYGMFVkW787lGa/0FcwEglgKNpnnfzQsxDJpBB0AvUasogJ8GqmlEg
   sY6Vk79Ac4xyGifN/663yPRFh716diZ/M4u/QPQbwpYsnVrv65fX8r2A7
   l9ookvPdJudb0uOjeeU8c4CDPbGDZa8dylUcbm2T8tjBz883rsd3CaWwX
   AaXW5DQliWJqTFjGnYnOwrMlHJOv++K2jC3ucL8HDrSA68YL9+syuK+6d
   A==;
X-CSE-ConnectionGUID: ClxpIArCSn6ak1Y9EQCu9A==
X-CSE-MsgGUID: PLEC9SnYSaSyOVCfJbQOBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="60923691"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="60923691"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 12:13:08 -0800
X-CSE-ConnectionGUID: +ttabicZSMG+5iGz/adupQ==
X-CSE-MsgGUID: Z8ItCzaxRL2p2xP7YaaXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="130409378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2024 12:13:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQBH6-0001QJ-2X;
	Tue, 24 Dec 2024 20:13:04 +0000
Date: Wed, 25 Dec 2024 04:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] kernel/sys_ni.c:50:1: sparse:
 sparse: symbol '__arm64_compat_sys_io_pgetevents_time64' was not declared.
 Should it be static?
Message-ID: <202412250428.VBb8nMJm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   4c2d86d81fa6053d5c6537b6e602270903156869
commit: e1b88ac1fe65a5e9f7ecbf7ca72bd48f317fa2fb [2/2] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: arm64-randconfig-r132-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250428.VBb8nMJm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241225/202412250428.VBb8nMJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250428.VBb8nMJm-lkp@intel.com/

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
