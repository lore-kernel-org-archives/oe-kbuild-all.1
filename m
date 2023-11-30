Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12054BDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dvs7AoxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701360937; x=1732896937;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bCe5zCtvx+UAMkXeVkCEla1aeS+6YolPZZG+fgCf2c4=;
  b=Dvs7AoxSvRiDFG2E0tmQ9VmHrGHyywu5U/NKzJeuuhW7mEx8nA/qdWvx
   PCBeIm4d6DROrUrUslo7qWCV0YQ/tQxLjliiW4QD43SgkYKLLr9FZZ9kh
   pnI+tFg8z05m17Gz0QNAoAXxOXtT9PJbAHW5MPp7XZqSb/BtE23yKjlBS
   kzXH2pzxsponMWj1GYvjE4PNr+JIQGaBc/Qt1P52hh9sg1kOK3ckU34Cz
   5ta/4N0fpgoIoOLyGCe9/d4Vv782AqnRXn2n1uVDaXzv9O1QWR17cW7DJ
   T4/e+B5JEDsAo0Mzrqb/OJo101U/ewRkkmIOku1rhOdMPNmu9S3Xlbit1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="337351"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="337351"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719176951"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719176951"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 08:15:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jhK-0002Jk-0c;
	Thu, 30 Nov 2023 16:15:30 +0000
Date: Fri, 1 Dec 2023 00:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 15107/29935] kernel/sys_ni.c:208:1:
 sparse: sparse: symbol '__ia32_compat_sys_old_msgctl' was not declared.
 Should it be static?
Message-ID: <202312010005.25r6WoMN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   891e39829ab7df9faf12329d2bc3740504fc819f
commit: c4d3c4ac7919d73354edf72e9b236d6e27977f6f [15107/29935] ANDROID: syscalls/x86: use a weak function for IA32 compat syscalls
config: x86_64-randconfig-122-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010005.25r6WoMN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010005.25r6WoMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010005.25r6WoMN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sys_ni.c:177:1: sparse: sparse: symbol '__x64_sys_setresuid' was not declared. Should it be static?
   kernel/sys_ni.c:178:1: sparse: sparse: symbol '__x64_sys_getresuid' was not declared. Should it be static?
   kernel/sys_ni.c:179:1: sparse: sparse: symbol '__x64_sys_setresgid' was not declared. Should it be static?
   kernel/sys_ni.c:180:1: sparse: sparse: symbol '__x64_sys_getresgid' was not declared. Should it be static?
   kernel/sys_ni.c:181:1: sparse: sparse: symbol '__x64_sys_setfsuid' was not declared. Should it be static?
   kernel/sys_ni.c:191:1: sparse: sparse: symbol '__ia32_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:192:1: sparse: sparse: symbol '__ia32_compat_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:193:1: sparse: sparse: symbol '__ia32_sys_mq_unlink' was not declared. Should it be static?
   kernel/sys_ni.c:194:1: sparse: sparse: symbol '__ia32_sys_mq_timedsend' was not declared. Should it be static?
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__x64_sys_mq_timedsend_time32' was not declared. Should it be static?
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__ia32_sys_mq_timedsend_time32' was not declared. Should it be static?
   kernel/sys_ni.c:196:1: sparse: sparse: symbol '__ia32_sys_mq_timedreceive' was not declared. Should it be static?
   kernel/sys_ni.c:197:1: sparse: sparse: symbol '__x64_sys_mq_timedreceive_time32' was not declared. Should it be static?
   kernel/sys_ni.c:197:1: sparse: sparse: symbol '__ia32_sys_mq_timedreceive_time32' was not declared. Should it be static?
   kernel/sys_ni.c:198:1: sparse: sparse: symbol '__ia32_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:199:1: sparse: sparse: symbol '__ia32_compat_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:200:1: sparse: sparse: symbol '__ia32_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:201:1: sparse: sparse: symbol '__ia32_compat_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:204:1: sparse: sparse: symbol '__ia32_sys_msgget' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__x64_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__ia32_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:206:1: sparse: sparse: symbol '__ia32_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:207:1: sparse: sparse: symbol '__ia32_compat_sys_msgctl' was not declared. Should it be static?
>> kernel/sys_ni.c:208:1: sparse: sparse: symbol '__ia32_compat_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__ia32_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__ia32_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__ia32_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__ia32_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:215:1: sparse: sparse: symbol '__ia32_sys_semget' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__x64_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__ia32_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:217:1: sparse: sparse: symbol '__ia32_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__ia32_compat_sys_semctl' was not declared. Should it be static?
>> kernel/sys_ni.c:219:1: sparse: sparse: symbol '__ia32_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:220:1: sparse: sparse: symbol '__ia32_sys_semtimedop' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__x64_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__ia32_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:222:1: sparse: sparse: symbol '__ia32_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:225:1: sparse: sparse: symbol '__ia32_sys_shmget' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__x64_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__ia32_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:227:1: sparse: sparse: symbol '__ia32_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__ia32_compat_sys_shmctl' was not declared. Should it be static?
>> kernel/sys_ni.c:229:1: sparse: sparse: symbol '__ia32_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__ia32_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__ia32_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:232:1: sparse: sparse: symbol '__ia32_sys_shmdt' was not declared. Should it be static?
   kernel/sys_ni.c:235:1: sparse: sparse: symbol '__ia32_sys_socket' was not declared. Should it be static?
   kernel/sys_ni.c:236:1: sparse: sparse: symbol '__ia32_sys_socketpair' was not declared. Should it be static?
   kernel/sys_ni.c:237:1: sparse: sparse: symbol '__ia32_sys_bind' was not declared. Should it be static?
   kernel/sys_ni.c:238:1: sparse: sparse: symbol '__ia32_sys_listen' was not declared. Should it be static?
   kernel/sys_ni.c:240:1: sparse: sparse: symbol '__ia32_sys_connect' was not declared. Should it be static?
   kernel/sys_ni.c:241:1: sparse: sparse: symbol '__ia32_sys_getsockname' was not declared. Should it be static?
   kernel/sys_ni.c:242:1: sparse: sparse: symbol '__ia32_sys_getpeername' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__ia32_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__ia32_compat_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:245:1: sparse: sparse: symbol '__ia32_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__ia32_compat_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:247:1: sparse: sparse: symbol '__ia32_sys_sendto' was not declared. Should it be static?
   kernel/sys_ni.c:248:1: sparse: sparse: symbol '__ia32_sys_shutdown' was not declared. Should it be static?
   kernel/sys_ni.c:249:1: sparse: sparse: symbol '__ia32_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:250:1: sparse: sparse: symbol '__ia32_compat_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:251:1: sparse: sparse: symbol '__ia32_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:252:1: sparse: sparse: symbol '__ia32_compat_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:253:1: sparse: sparse: symbol '__ia32_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:254:1: sparse: sparse: symbol '__ia32_compat_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:259:1: sparse: sparse: symbol '__ia32_sys_mremap' was not declared. Should it be static?
   kernel/sys_ni.c:262:1: sparse: sparse: symbol '__ia32_sys_add_key' was not declared. Should it be static?
   kernel/sys_ni.c:263:1: sparse: sparse: symbol '__ia32_sys_request_key' was not declared. Should it be static?
   kernel/sys_ni.c:264:1: sparse: sparse: symbol '__ia32_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:265:1: sparse: sparse: symbol '__ia32_compat_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__x64_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__ia32_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:273:1: sparse: sparse: symbol '__ia32_sys_swapon' was not declared. Should it be static?
   kernel/sys_ni.c:274:1: sparse: sparse: symbol '__ia32_sys_swapoff' was not declared. Should it be static?
>> kernel/sys_ni.c:286:1: sparse: sparse: symbol '__ia32_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:287:1: sparse: sparse: symbol '__ia32_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:288:1: sparse: sparse: symbol '__ia32_compat_sys_get_mempolicy' was not declared. Should it be static?
>> kernel/sys_ni.c:290:1: sparse: sparse: symbol '__ia32_compat_sys_set_mempolicy' was not declared. Should it be static?
>> kernel/sys_ni.c:292:1: sparse: sparse: symbol '__ia32_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:293:1: sparse: sparse: symbol '__ia32_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:294:1: sparse: sparse: symbol '__ia32_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:298:1: sparse: sparse: symbol '__ia32_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__x64_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__ia32_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:301:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:309:1: sparse: sparse: symbol '__ia32_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:313:1: sparse: sparse: symbol '__ia32_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:314:1: sparse: sparse: symbol '__ia32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:316:1: sparse: sparse: symbol '__ia32_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:317:1: sparse: sparse: symbol '__ia32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:318:1: sparse: sparse: symbol '__ia32_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:319:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__ia32_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:321:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:337:1: sparse: sparse: symbol '__ia32_sys_execveat' was not declared. Should it be static?
   kernel/sys_ni.c:359:1: sparse: sparse: symbol '__x64_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:359:1: sparse: sparse: symbol '__ia32_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:360:1: sparse: sparse: symbol '__x64_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:360:1: sparse: sparse: symbol '__ia32_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:361:1: sparse: sparse: symbol '__x64_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:361:1: sparse: sparse: symbol '__ia32_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:364:1: sparse: sparse: symbol '__x64_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:364:1: sparse: sparse: symbol '__ia32_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__ia32_compat_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:368:1: sparse: sparse: symbol '__ia32_compat_sys_sysctl' was not declared. Should it be static?
   kernel/sys_ni.c:369:1: sparse: sparse: symbol '__ia32_compat_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__x64_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__ia32_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:374:1: sparse: sparse: symbol '__ia32_compat_sys_quotactl32' was not declared. Should it be static?
   kernel/sys_ni.c:375:1: sparse: sparse: symbol '__x64_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:375:1: sparse: sparse: symbol '__ia32_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:376:1: sparse: sparse: symbol '__ia32_sys_kexec_file_load' was not declared. Should it be static?
   kernel/sys_ni.c:379:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:379:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:381:1: sparse: sparse: symbol '__x64_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:381:1: sparse: sparse: symbol '__ia32_sys_s390_ipc' was not declared. Should it be static?
>> kernel/sys_ni.c:382:1: sparse: sparse: symbol '__ia32_compat_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__x64_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__ia32_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:386:1: sparse: sparse: symbol '__x64_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:386:1: sparse: sparse: symbol '__ia32_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:387:1: sparse: sparse: symbol '__x64_sys_spu_create' was not declared. Should it be static?
   kernel/sys_ni.c:387:1: sparse: sparse: symbol '__ia32_sys_spu_create' was not declared. Should it be static?
   kernel/sys_ni.c:388:1: sparse: sparse: symbol '__x64_sys_subpage_prot' was not declared. Should it be static?
   kernel/sys_ni.c:388:1: sparse: sparse: symbol '__ia32_sys_subpage_prot' was not declared. Should it be static?
   kernel/sys_ni.c:400:1: sparse: sparse: symbol '__ia32_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:401:1: sparse: sparse: symbol '__ia32_compat_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:404:1: sparse: sparse: symbol '__ia32_sys_fadvise64' was not declared. Should it be static?
   kernel/sys_ni.c:408:1: sparse: sparse: symbol '__ia32_sys_recv' was not declared. Should it be static?
>> kernel/sys_ni.c:409:1: sparse: sparse: symbol '__ia32_compat_sys_recv' was not declared. Should it be static?
   kernel/sys_ni.c:410:1: sparse: sparse: symbol '__ia32_sys_send' was not declared. Should it be static?
   kernel/sys_ni.c:411:1: sparse: sparse: symbol '__x64_sys_bdflush' was not declared. Should it be static?
   kernel/sys_ni.c:412:1: sparse: sparse: symbol '__x64_sys_uselib' was not declared. Should it be static?
   kernel/sys_ni.c:420:1: sparse: sparse: symbol '__x64_sys_sgetmask' was not declared. Should it be static?
   kernel/sys_ni.c:421:1: sparse: sparse: symbol '__x64_sys_ssetmask' was not declared. Should it be static?
   kernel/sys_ni.c:427:1: sparse: sparse: symbol '__x64_sys_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:427:1: sparse: sparse: symbol '__ia32_sys_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:428:1: sparse: sparse: symbol '__ia32_compat_sys_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:431:1: sparse: sparse: symbol '__x64_sys_chown16' was not declared. Should it be static?
   kernel/sys_ni.c:432:1: sparse: sparse: symbol '__x64_sys_fchown16' was not declared. Should it be static?
   kernel/sys_ni.c:433:1: sparse: sparse: symbol '__x64_sys_getegid16' was not declared. Should it be static?
   kernel/sys_ni.c:434:1: sparse: sparse: symbol '__x64_sys_geteuid16' was not declared. Should it be static?
   kernel/sys_ni.c:435:1: sparse: sparse: symbol '__x64_sys_getgid16' was not declared. Should it be static?
   kernel/sys_ni.c:436:1: sparse: sparse: symbol '__x64_sys_getgroups16' was not declared. Should it be static?
   kernel/sys_ni.c:437:1: sparse: sparse: symbol '__x64_sys_getresgid16' was not declared. Should it be static?
   kernel/sys_ni.c:438:1: sparse: sparse: symbol '__x64_sys_getresuid16' was not declared. Should it be static?
   kernel/sys_ni.c:439:1: sparse: sparse: symbol '__x64_sys_getuid16' was not declared. Should it be static?
   kernel/sys_ni.c:440:1: sparse: sparse: symbol '__x64_sys_lchown16' was not declared. Should it be static?
   kernel/sys_ni.c:441:1: sparse: sparse: symbol '__x64_sys_setfsgid16' was not declared. Should it be static?
   kernel/sys_ni.c:442:1: sparse: sparse: symbol '__x64_sys_setfsuid16' was not declared. Should it be static?
   kernel/sys_ni.c:443:1: sparse: sparse: symbol '__x64_sys_setgid16' was not declared. Should it be static?
   kernel/sys_ni.c:444:1: sparse: sparse: symbol '__x64_sys_setgroups16' was not declared. Should it be static?
   kernel/sys_ni.c:445:1: sparse: sparse: symbol '__x64_sys_setregid16' was not declared. Should it be static?
   kernel/sys_ni.c:446:1: sparse: sparse: symbol '__x64_sys_setresgid16' was not declared. Should it be static?
   kernel/sys_ni.c:447:1: sparse: sparse: symbol '__x64_sys_setresuid16' was not declared. Should it be static?
   kernel/sys_ni.c:448:1: sparse: sparse: symbol '__x64_sys_setreuid16' was not declared. Should it be static?
   kernel/sys_ni.c:449:1: sparse: sparse: symbol '__x64_sys_setuid16' was not declared. Should it be static?

vim +/__ia32_compat_sys_old_msgctl +208 kernel/sys_ni.c

70dd4b3160798b6 Dominik Brodowski    2018-03-06  189  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  190  /* ipc/mqueue.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  191  COND_SYSCALL(mq_open);
67a7acd3773a94d Dominik Brodowski    2018-03-04  192  COND_SYSCALL_COMPAT(mq_open);
67a7acd3773a94d Dominik Brodowski    2018-03-04  193  COND_SYSCALL(mq_unlink);
67a7acd3773a94d Dominik Brodowski    2018-03-04  194  COND_SYSCALL(mq_timedsend);
8dabe7245bbc134 Arnd Bergmann        2019-01-07  195  COND_SYSCALL(mq_timedsend_time32);
67a7acd3773a94d Dominik Brodowski    2018-03-04  196  COND_SYSCALL(mq_timedreceive);
8dabe7245bbc134 Arnd Bergmann        2019-01-07  197  COND_SYSCALL(mq_timedreceive_time32);
67a7acd3773a94d Dominik Brodowski    2018-03-04  198  COND_SYSCALL(mq_notify);
67a7acd3773a94d Dominik Brodowski    2018-03-04  199  COND_SYSCALL_COMPAT(mq_notify);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @200  COND_SYSCALL(mq_getsetattr);
67a7acd3773a94d Dominik Brodowski    2018-03-04  201  COND_SYSCALL_COMPAT(mq_getsetattr);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  202  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  203  /* ipc/msg.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  204  COND_SYSCALL(msgget);
275f22148e8720e Arnd Bergmann        2018-12-31  205  COND_SYSCALL(old_msgctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  206  COND_SYSCALL(msgctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  207  COND_SYSCALL_COMPAT(msgctl);
7e89a37c477c4ca Arnd Bergmann        2019-02-28 @208  COND_SYSCALL_COMPAT(old_msgctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  209  COND_SYSCALL(msgrcv);
67a7acd3773a94d Dominik Brodowski    2018-03-04  210  COND_SYSCALL_COMPAT(msgrcv);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @211  COND_SYSCALL(msgsnd);
67a7acd3773a94d Dominik Brodowski    2018-03-04  212  COND_SYSCALL_COMPAT(msgsnd);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  213  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  214  /* ipc/sem.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  215  COND_SYSCALL(semget);
275f22148e8720e Arnd Bergmann        2018-12-31  216  COND_SYSCALL(old_semctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  217  COND_SYSCALL(semctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  218  COND_SYSCALL_COMPAT(semctl);
7e89a37c477c4ca Arnd Bergmann        2019-02-28 @219  COND_SYSCALL_COMPAT(old_semctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  220  COND_SYSCALL(semtimedop);
8dabe7245bbc134 Arnd Bergmann        2019-01-07  221  COND_SYSCALL(semtimedop_time32);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @222  COND_SYSCALL(semop);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  223  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  224  /* ipc/shm.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  225  COND_SYSCALL(shmget);
275f22148e8720e Arnd Bergmann        2018-12-31  226  COND_SYSCALL(old_shmctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  227  COND_SYSCALL(shmctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  228  COND_SYSCALL_COMPAT(shmctl);
7e89a37c477c4ca Arnd Bergmann        2019-02-28 @229  COND_SYSCALL_COMPAT(old_shmctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  230  COND_SYSCALL(shmat);
67a7acd3773a94d Dominik Brodowski    2018-03-04  231  COND_SYSCALL_COMPAT(shmat);
67a7acd3773a94d Dominik Brodowski    2018-03-04  232  COND_SYSCALL(shmdt);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  233  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  234  /* net/socket.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  235  COND_SYSCALL(socket);
67a7acd3773a94d Dominik Brodowski    2018-03-04  236  COND_SYSCALL(socketpair);
67a7acd3773a94d Dominik Brodowski    2018-03-04  237  COND_SYSCALL(bind);
67a7acd3773a94d Dominik Brodowski    2018-03-04  238  COND_SYSCALL(listen);
67a7acd3773a94d Dominik Brodowski    2018-03-04  239  COND_SYSCALL(accept);
67a7acd3773a94d Dominik Brodowski    2018-03-04  240  COND_SYSCALL(connect);
67a7acd3773a94d Dominik Brodowski    2018-03-04  241  COND_SYSCALL(getsockname);
67a7acd3773a94d Dominik Brodowski    2018-03-04  242  COND_SYSCALL(getpeername);
67a7acd3773a94d Dominik Brodowski    2018-03-04  243  COND_SYSCALL(setsockopt);
67a7acd3773a94d Dominik Brodowski    2018-03-04  244  COND_SYSCALL_COMPAT(setsockopt);
67a7acd3773a94d Dominik Brodowski    2018-03-04  245  COND_SYSCALL(getsockopt);
67a7acd3773a94d Dominik Brodowski    2018-03-04  246  COND_SYSCALL_COMPAT(getsockopt);
67a7acd3773a94d Dominik Brodowski    2018-03-04  247  COND_SYSCALL(sendto);
67a7acd3773a94d Dominik Brodowski    2018-03-04  248  COND_SYSCALL(shutdown);
67a7acd3773a94d Dominik Brodowski    2018-03-04  249  COND_SYSCALL(recvfrom);
67a7acd3773a94d Dominik Brodowski    2018-03-04  250  COND_SYSCALL_COMPAT(recvfrom);
67a7acd3773a94d Dominik Brodowski    2018-03-04  251  COND_SYSCALL(sendmsg);
67a7acd3773a94d Dominik Brodowski    2018-03-04  252  COND_SYSCALL_COMPAT(sendmsg);
67a7acd3773a94d Dominik Brodowski    2018-03-04  253  COND_SYSCALL(recvmsg);
67a7acd3773a94d Dominik Brodowski    2018-03-04  254  COND_SYSCALL_COMPAT(recvmsg);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  255  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  256  /* mm/filemap.c */
70dd4b3160798b6 Dominik Brodowski    2018-03-06  257  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  258  /* mm/nommu.c, also with MMU */
67a7acd3773a94d Dominik Brodowski    2018-03-04  259  COND_SYSCALL(mremap);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  260  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  261  /* security/keys/keyctl.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  262  COND_SYSCALL(add_key);
67a7acd3773a94d Dominik Brodowski    2018-03-04  263  COND_SYSCALL(request_key);
67a7acd3773a94d Dominik Brodowski    2018-03-04  264  COND_SYSCALL(keyctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  265  COND_SYSCALL_COMPAT(keyctl);
^1da177e4c3f415 Linus Torvalds       2005-04-16  266  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  267  /* arch/example/kernel/sys_example.c */
3016b421534e2fa Hyok S. Choi         2006-04-10  268  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  269  /* mm/fadvise.c */
67a7acd3773a94d Dominik Brodowski    2018-03-04  270  COND_SYSCALL(fadvise64_64);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  271  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  272  /* mm/, CONFIG_MMU only */
67a7acd3773a94d Dominik Brodowski    2018-03-04  273  COND_SYSCALL(swapon);
67a7acd3773a94d Dominik Brodowski    2018-03-04  274  COND_SYSCALL(swapoff);
67a7acd3773a94d Dominik Brodowski    2018-03-04  275  COND_SYSCALL(mprotect);
67a7acd3773a94d Dominik Brodowski    2018-03-04  276  COND_SYSCALL(msync);
67a7acd3773a94d Dominik Brodowski    2018-03-04  277  COND_SYSCALL(mlock);
67a7acd3773a94d Dominik Brodowski    2018-03-04  278  COND_SYSCALL(munlock);
67a7acd3773a94d Dominik Brodowski    2018-03-04  279  COND_SYSCALL(mlockall);
67a7acd3773a94d Dominik Brodowski    2018-03-04  280  COND_SYSCALL(munlockall);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @281  COND_SYSCALL(mincore);
67a7acd3773a94d Dominik Brodowski    2018-03-04  282  COND_SYSCALL(madvise);
ffb7cf5358371d0 Edgar Arriaga García 2020-04-30  283  COND_SYSCALL(process_madvise);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @284  COND_SYSCALL(remap_file_pages);
67a7acd3773a94d Dominik Brodowski    2018-03-04  285  COND_SYSCALL(mbind);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @286  COND_SYSCALL_COMPAT(mbind);
67a7acd3773a94d Dominik Brodowski    2018-03-04  287  COND_SYSCALL(get_mempolicy);
67a7acd3773a94d Dominik Brodowski    2018-03-04  288  COND_SYSCALL_COMPAT(get_mempolicy);
67a7acd3773a94d Dominik Brodowski    2018-03-04  289  COND_SYSCALL(set_mempolicy);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @290  COND_SYSCALL_COMPAT(set_mempolicy);
67a7acd3773a94d Dominik Brodowski    2018-03-04  291  COND_SYSCALL(migrate_pages);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @292  COND_SYSCALL_COMPAT(migrate_pages);
67a7acd3773a94d Dominik Brodowski    2018-03-04  293  COND_SYSCALL(move_pages);
67a7acd3773a94d Dominik Brodowski    2018-03-04  294  COND_SYSCALL_COMPAT(move_pages);
67a7acd3773a94d Dominik Brodowski    2018-03-04  295  
67a7acd3773a94d Dominik Brodowski    2018-03-04  296  COND_SYSCALL(perf_event_open);
67a7acd3773a94d Dominik Brodowski    2018-03-04  297  COND_SYSCALL(accept4);
67a7acd3773a94d Dominik Brodowski    2018-03-04  298  COND_SYSCALL(recvmmsg);
e11d4284e2f4de5 Arnd Bergmann        2018-04-18  299  COND_SYSCALL(recvmmsg_time32);
8dabe7245bbc134 Arnd Bergmann        2019-01-07  300  COND_SYSCALL_COMPAT(recvmmsg_time32);
e11d4284e2f4de5 Arnd Bergmann        2018-04-18  301  COND_SYSCALL_COMPAT(recvmmsg_time64);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  302  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  303  /*
70dd4b3160798b6 Dominik Brodowski    2018-03-06  304   * Architecture specific syscalls: see further below
70dd4b3160798b6 Dominik Brodowski    2018-03-06  305   */
11637e4b7dc098e Eric Paris           2009-12-17  306  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  307  /* fanotify */
67a7acd3773a94d Dominik Brodowski    2018-03-04  308  COND_SYSCALL(fanotify_init);
67a7acd3773a94d Dominik Brodowski    2018-03-04  309  COND_SYSCALL(fanotify_mark);
990d6c2d7aee921 Aneesh Kumar K.V     2011-01-29  310  
990d6c2d7aee921 Aneesh Kumar K.V     2011-01-29  311  /* open by handle */
67a7acd3773a94d Dominik Brodowski    2018-03-04  312  COND_SYSCALL(name_to_handle_at);
67a7acd3773a94d Dominik Brodowski    2018-03-04  313  COND_SYSCALL(open_by_handle_at);
67a7acd3773a94d Dominik Brodowski    2018-03-04  314  COND_SYSCALL_COMPAT(open_by_handle_at);
d97b46a64674a26 Cyrill Gorcunov      2012-05-31  315  
67a7acd3773a94d Dominik Brodowski    2018-03-04  316  COND_SYSCALL(sendmmsg);
67a7acd3773a94d Dominik Brodowski    2018-03-04  317  COND_SYSCALL_COMPAT(sendmmsg);
67a7acd3773a94d Dominik Brodowski    2018-03-04  318  COND_SYSCALL(process_vm_readv);
67a7acd3773a94d Dominik Brodowski    2018-03-04  319  COND_SYSCALL_COMPAT(process_vm_readv);
67a7acd3773a94d Dominik Brodowski    2018-03-04  320  COND_SYSCALL(process_vm_writev);
67a7acd3773a94d Dominik Brodowski    2018-03-04  321  COND_SYSCALL_COMPAT(process_vm_writev);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  322  
d97b46a64674a26 Cyrill Gorcunov      2012-05-31  323  /* compare kernel pointers */
67a7acd3773a94d Dominik Brodowski    2018-03-04  324  COND_SYSCALL(kcmp);
48dc92b9fc39268 Kees Cook            2014-06-25  325  
67a7acd3773a94d Dominik Brodowski    2018-03-04  326  COND_SYSCALL(finit_module);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  327  
48dc92b9fc39268 Kees Cook            2014-06-25  328  /* operate on Secure Computing state */
67a7acd3773a94d Dominik Brodowski    2018-03-04  329  COND_SYSCALL(seccomp);
749730ce42a2121 Alexei Starovoitov   2014-09-26  330  
67a7acd3773a94d Dominik Brodowski    2018-03-04  331  COND_SYSCALL(memfd_create);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  332  
749730ce42a2121 Alexei Starovoitov   2014-09-26  333  /* access BPF programs and maps */
67a7acd3773a94d Dominik Brodowski    2018-03-04  334  COND_SYSCALL(bpf);
51f39a1f0cea1ca David Drysdale       2014-12-12  335  
51f39a1f0cea1ca David Drysdale       2014-12-12  336  /* execveat */
67a7acd3773a94d Dominik Brodowski    2018-03-04  337  COND_SYSCALL(execveat);
5b25b13ab08f616 Mathieu Desnoyers    2015-09-11  338  
67a7acd3773a94d Dominik Brodowski    2018-03-04  339  COND_SYSCALL(userfaultfd);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  340  
5b25b13ab08f616 Mathieu Desnoyers    2015-09-11  341  /* membarrier */
67a7acd3773a94d Dominik Brodowski    2018-03-04  342  COND_SYSCALL(membarrier);
e2753293ac4bce8 Dave Hansen          2016-09-12  343  
67a7acd3773a94d Dominik Brodowski    2018-03-04  344  COND_SYSCALL(mlock2);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  345  
67a7acd3773a94d Dominik Brodowski    2018-03-04  346  COND_SYSCALL(copy_file_range);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  347  
e2753293ac4bce8 Dave Hansen          2016-09-12  348  /* memory protection keys */
67a7acd3773a94d Dominik Brodowski    2018-03-04  349  COND_SYSCALL(pkey_mprotect);
67a7acd3773a94d Dominik Brodowski    2018-03-04  350  COND_SYSCALL(pkey_alloc);
67a7acd3773a94d Dominik Brodowski    2018-03-04  351  COND_SYSCALL(pkey_free);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  352  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  353  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  354  /*
70dd4b3160798b6 Dominik Brodowski    2018-03-06  355   * Architecture specific weak syscall entries.
70dd4b3160798b6 Dominik Brodowski    2018-03-06  356   */
70dd4b3160798b6 Dominik Brodowski    2018-03-06  357  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  358  /* pciconfig: alpha, arm, arm64, ia64, sparc */
67a7acd3773a94d Dominik Brodowski    2018-03-04  359  COND_SYSCALL(pciconfig_read);
67a7acd3773a94d Dominik Brodowski    2018-03-04  360  COND_SYSCALL(pciconfig_write);
67a7acd3773a94d Dominik Brodowski    2018-03-04  361  COND_SYSCALL(pciconfig_iobase);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  362  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  363  /* sys_socketcall: arm, mips, x86, ... */
67a7acd3773a94d Dominik Brodowski    2018-03-04  364  COND_SYSCALL(socketcall);
67a7acd3773a94d Dominik Brodowski    2018-03-04  365  COND_SYSCALL_COMPAT(socketcall);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  366  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  367  /* compat syscalls for arm64, x86, ... */
67a7acd3773a94d Dominik Brodowski    2018-03-04  368  COND_SYSCALL_COMPAT(sysctl);
67a7acd3773a94d Dominik Brodowski    2018-03-04  369  COND_SYSCALL_COMPAT(fanotify_mark);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  370  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  371  /* x86 */
67a7acd3773a94d Dominik Brodowski    2018-03-04  372  COND_SYSCALL(vm86old);
67a7acd3773a94d Dominik Brodowski    2018-03-04  373  COND_SYSCALL(modify_ldt);
67a7acd3773a94d Dominik Brodowski    2018-03-04  374  COND_SYSCALL_COMPAT(quotactl32);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @375  COND_SYSCALL(vm86);
67a7acd3773a94d Dominik Brodowski    2018-03-04  376  COND_SYSCALL(kexec_file_load);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  377  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  378  /* s390 */
67a7acd3773a94d Dominik Brodowski    2018-03-04  379  COND_SYSCALL(s390_pci_mmio_read);
67a7acd3773a94d Dominik Brodowski    2018-03-04  380  COND_SYSCALL(s390_pci_mmio_write);
58fa4a410fc31af Arnd Bergmann        2019-01-16  381  COND_SYSCALL(s390_ipc);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @382  COND_SYSCALL_COMPAT(s390_ipc);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  383  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  384  /* powerpc */
4c392e6591e3257 Al Viro              2018-05-02  385  COND_SYSCALL(rtas);
67a7acd3773a94d Dominik Brodowski    2018-03-04  386  COND_SYSCALL(spu_run);
67a7acd3773a94d Dominik Brodowski    2018-03-04  387  COND_SYSCALL(spu_create);
67a7acd3773a94d Dominik Brodowski    2018-03-04  388  COND_SYSCALL(subpage_prot);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  389  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  390  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  391  /*
70dd4b3160798b6 Dominik Brodowski    2018-03-06  392   * Deprecated system calls which are still defined in
70dd4b3160798b6 Dominik Brodowski    2018-03-06  393   * include/uapi/asm-generic/unistd.h and wanted by >= 1 arch
70dd4b3160798b6 Dominik Brodowski    2018-03-06  394   */
70dd4b3160798b6 Dominik Brodowski    2018-03-06  395  
70dd4b3160798b6 Dominik Brodowski    2018-03-06  396  /* __ARCH_WANT_SYSCALL_NO_FLAGS */
67a7acd3773a94d Dominik Brodowski    2018-03-04  397  COND_SYSCALL(epoll_create);
67a7acd3773a94d Dominik Brodowski    2018-03-04  398  COND_SYSCALL(inotify_init);
67a7acd3773a94d Dominik Brodowski    2018-03-04  399  COND_SYSCALL(eventfd);
67a7acd3773a94d Dominik Brodowski    2018-03-04 @400  COND_SYSCALL(signalfd);
67a7acd3773a94d Dominik Brodowski    2018-03-04  401  COND_SYSCALL_COMPAT(signalfd);
70dd4b3160798b6 Dominik Brodowski    2018-03-06  402  

:::::: The code at line 208 was first introduced by commit
:::::: 7e89a37c477c4caacde7b511c64720e20104945f ipc: Fix building compat mode without sysvipc

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
