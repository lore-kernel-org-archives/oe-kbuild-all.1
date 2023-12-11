Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C655C3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk2g11lD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702334050; x=1733870050;
  h=date:from:cc:subject:message-id:mime-version;
  bh=aT62+WR9hvlXtI1ZX8Q87yOvPSZnEHzmWEBfqeTEgCM=;
  b=Tk2g11lDVPL4k6KJSTsHqqBwJxvGS71AQOwyBnyjE6eLh2N28BdRon4Y
   I3Ig1B8ZaaugMCqoPlnv+01M5v6sjVMlRHaLHU7Mvok4uObmNMvC7LKia
   AWLPd3LBQTfePC7d0pQnU931mXR3sFREEojYDhOspz18nosj/ORe1CVBy
   V5y0ATwJs/2hasNFxT52RU/rnjIS64zS0LPsRYKeF7QnqvoRc0Lxh8eWY
   J9742Eu08k1PAFbUb+795Zo+SIeSWEuldWad+zBLbdpIwT+1GM2wCC2+C
   cWQopL4GlW6KydzS8zOnce0tOALbJIcgwphxit5A6Br/s5jNlXRwHmpSd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374877562"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374877562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 14:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="14688129"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2023 14:34:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCoqj-000IXG-2y
	for oe-kbuild-all@lists.linux.dev;
	Mon, 11 Dec 2023 22:34:05 +0000
Date: Tue, 12 Dec 2023 06:33:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 5094/30000] kernel/sys_ni.c:47:1: sparse:
 sparse: symbol '__arm64_compat_sys_io_getevents' was not declared. Should it
 be static?
Message-ID: <202312120608.sRrJLvv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a45f8ae6659a25c2743eb4a9bc5ee7954a00d784
commit: fa8bbd2c074d298fd9b43b78296203b773e931f5 [5094/30000] ANDROID: arm64: fix function types in COND_SYSCALL
config: arm64-randconfig-r121-20231209 (https://download.01.org/0day-ci/archive/20231212/202312120608.sRrJLvv1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120608.sRrJLvv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120608.sRrJLvv1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:39:1: sparse: sparse: symbol '__arm64_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:40:1: sparse: sparse: symbol '__arm64_compat_sys_io_setup' was not declared. Should it be static?
   kernel/sys_ni.c:41:1: sparse: sparse: symbol '__arm64_sys_io_destroy' was not declared. Should it be static?
   kernel/sys_ni.c:42:1: sparse: sparse: symbol '__arm64_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:43:1: sparse: sparse: symbol '__arm64_compat_sys_io_submit' was not declared. Should it be static?
   kernel/sys_ni.c:44:1: sparse: sparse: symbol '__arm64_sys_io_cancel' was not declared. Should it be static?
   kernel/sys_ni.c:45:1: sparse: sparse: symbol '__arm64_sys_io_getevents' was not declared. Should it be static?
   kernel/sys_ni.c:46:1: sparse: sparse: symbol '__arm64_sys_io_pgetevents' was not declared. Should it be static?
>> kernel/sys_ni.c:47:1: sparse: sparse: symbol '__arm64_compat_sys_io_getevents' was not declared. Should it be static?
   kernel/sys_ni.c:48:1: sparse: sparse: symbol '__arm64_compat_sys_io_pgetevents' was not declared. Should it be static?
   kernel/sys_ni.c:55:1: sparse: sparse: symbol '__arm64_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:56:1: sparse: sparse: symbol '__arm64_compat_sys_lookup_dcookie' was not declared. Should it be static?
   kernel/sys_ni.c:59:1: sparse: sparse: symbol '__arm64_sys_eventfd2' was not declared. Should it be static?
   kernel/sys_ni.c:62:1: sparse: sparse: symbol '__arm64_sys_epoll_create1' was not declared. Should it be static?
   kernel/sys_ni.c:63:1: sparse: sparse: symbol '__arm64_sys_epoll_ctl' was not declared. Should it be static?
   kernel/sys_ni.c:64:1: sparse: sparse: symbol '__arm64_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:65:1: sparse: sparse: symbol '__arm64_compat_sys_epoll_pwait' was not declared. Should it be static?
   kernel/sys_ni.c:70:1: sparse: sparse: symbol '__arm64_sys_inotify_init1' was not declared. Should it be static?
   kernel/sys_ni.c:71:1: sparse: sparse: symbol '__arm64_sys_inotify_add_watch' was not declared. Should it be static?
   kernel/sys_ni.c:72:1: sparse: sparse: symbol '__arm64_sys_inotify_rm_watch' was not declared. Should it be static?
   kernel/sys_ni.c:77:1: sparse: sparse: symbol '__arm64_sys_ioprio_set' was not declared. Should it be static?
   kernel/sys_ni.c:78:1: sparse: sparse: symbol '__arm64_sys_ioprio_get' was not declared. Should it be static?
   kernel/sys_ni.c:81:1: sparse: sparse: symbol '__arm64_sys_flock' was not declared. Should it be static?
   kernel/sys_ni.c:94:1: sparse: sparse: symbol '__arm64_sys_quotactl' was not declared. Should it be static?
   kernel/sys_ni.c:105:1: sparse: sparse: symbol '__arm64_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:106:1: sparse: sparse: symbol '__arm64_compat_sys_signalfd4' was not declared. Should it be static?
   kernel/sys_ni.c:115:1: sparse: sparse: symbol '__arm64_sys_timerfd_create' was not declared. Should it be static?
   kernel/sys_ni.c:116:1: sparse: sparse: symbol '__arm64_sys_timerfd_settime' was not declared. Should it be static?
>> kernel/sys_ni.c:117:1: sparse: sparse: symbol '__arm64_compat_sys_timerfd_settime' was not declared. Should it be static?
   kernel/sys_ni.c:118:1: sparse: sparse: symbol '__arm64_sys_timerfd_gettime' was not declared. Should it be static?
>> kernel/sys_ni.c:119:1: sparse: sparse: symbol '__arm64_compat_sys_timerfd_gettime' was not declared. Should it be static?
   kernel/sys_ni.c:124:1: sparse: sparse: symbol '__arm64_sys_acct' was not declared. Should it be static?
   kernel/sys_ni.c:127:1: sparse: sparse: symbol '__arm64_sys_capget' was not declared. Should it be static?
   kernel/sys_ni.c:128:1: sparse: sparse: symbol '__arm64_sys_capset' was not declared. Should it be static?
   kernel/sys_ni.c:137:1: sparse: sparse: symbol '__arm64_sys_futex' was not declared. Should it be static?
>> kernel/sys_ni.c:138:1: sparse: sparse: symbol '__arm64_compat_sys_futex' was not declared. Should it be static?
   kernel/sys_ni.c:139:1: sparse: sparse: symbol '__arm64_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:140:1: sparse: sparse: symbol '__arm64_compat_sys_set_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:141:1: sparse: sparse: symbol '__arm64_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:142:1: sparse: sparse: symbol '__arm64_compat_sys_get_robust_list' was not declared. Should it be static?
   kernel/sys_ni.c:149:1: sparse: sparse: symbol '__arm64_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:150:1: sparse: sparse: symbol '__arm64_compat_sys_kexec_load' was not declared. Should it be static?
   kernel/sys_ni.c:153:1: sparse: sparse: symbol '__arm64_sys_init_module' was not declared. Should it be static?
   kernel/sys_ni.c:154:1: sparse: sparse: symbol '__arm64_sys_delete_module' was not declared. Should it be static?
   kernel/sys_ni.c:159:1: sparse: sparse: symbol '__arm64_sys_syslog' was not declared. Should it be static?
   kernel/sys_ni.c:168:1: sparse: sparse: symbol '__arm64_sys_setregid' was not declared. Should it be static?
   kernel/sys_ni.c:169:1: sparse: sparse: symbol '__arm64_sys_setgid' was not declared. Should it be static?
   kernel/sys_ni.c:170:1: sparse: sparse: symbol '__arm64_sys_setreuid' was not declared. Should it be static?
   kernel/sys_ni.c:171:1: sparse: sparse: symbol '__arm64_sys_setuid' was not declared. Should it be static?
   kernel/sys_ni.c:172:1: sparse: sparse: symbol '__arm64_sys_setresuid' was not declared. Should it be static?
   kernel/sys_ni.c:173:1: sparse: sparse: symbol '__arm64_sys_getresuid' was not declared. Should it be static?
   kernel/sys_ni.c:174:1: sparse: sparse: symbol '__arm64_sys_setresgid' was not declared. Should it be static?
   kernel/sys_ni.c:175:1: sparse: sparse: symbol '__arm64_sys_getresgid' was not declared. Should it be static?
   kernel/sys_ni.c:176:1: sparse: sparse: symbol '__arm64_sys_setfsuid' was not declared. Should it be static?
   kernel/sys_ni.c:177:1: sparse: sparse: symbol '__arm64_sys_setfsgid' was not declared. Should it be static?
   kernel/sys_ni.c:178:1: sparse: sparse: symbol '__arm64_sys_setgroups' was not declared. Should it be static?
   kernel/sys_ni.c:179:1: sparse: sparse: symbol '__arm64_sys_getgroups' was not declared. Should it be static?
   kernel/sys_ni.c:186:1: sparse: sparse: symbol '__arm64_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:187:1: sparse: sparse: symbol '__arm64_compat_sys_mq_open' was not declared. Should it be static?
   kernel/sys_ni.c:188:1: sparse: sparse: symbol '__arm64_sys_mq_unlink' was not declared. Should it be static?
   kernel/sys_ni.c:189:1: sparse: sparse: symbol '__arm64_sys_mq_timedsend' was not declared. Should it be static?
>> kernel/sys_ni.c:190:1: sparse: sparse: symbol '__arm64_compat_sys_mq_timedsend' was not declared. Should it be static?
   kernel/sys_ni.c:191:1: sparse: sparse: symbol '__arm64_sys_mq_timedreceive' was not declared. Should it be static?
>> kernel/sys_ni.c:192:1: sparse: sparse: symbol '__arm64_compat_sys_mq_timedreceive' was not declared. Should it be static?
   kernel/sys_ni.c:193:1: sparse: sparse: symbol '__arm64_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:194:1: sparse: sparse: symbol '__arm64_compat_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__arm64_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:196:1: sparse: sparse: symbol '__arm64_compat_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:199:1: sparse: sparse: symbol '__arm64_sys_msgget' was not declared. Should it be static?
   kernel/sys_ni.c:200:1: sparse: sparse: symbol '__arm64_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:201:1: sparse: sparse: symbol '__arm64_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:202:1: sparse: sparse: symbol '__arm64_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:203:1: sparse: sparse: symbol '__arm64_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:204:1: sparse: sparse: symbol '__arm64_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__arm64_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__arm64_sys_semget' was not declared. Should it be static?
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__arm64_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__arm64_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__arm64_sys_semtimedop' was not declared. Should it be static?
>> kernel/sys_ni.c:212:1: sparse: sparse: symbol '__arm64_compat_sys_semtimedop' was not declared. Should it be static?
   kernel/sys_ni.c:213:1: sparse: sparse: symbol '__arm64_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__arm64_sys_shmget' was not declared. Should it be static?
   kernel/sys_ni.c:217:1: sparse: sparse: symbol '__arm64_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__arm64_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__arm64_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:220:1: sparse: sparse: symbol '__arm64_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__arm64_sys_shmdt' was not declared. Should it be static?
   kernel/sys_ni.c:224:1: sparse: sparse: symbol '__arm64_sys_socket' was not declared. Should it be static?
   kernel/sys_ni.c:225:1: sparse: sparse: symbol '__arm64_sys_socketpair' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__arm64_sys_bind' was not declared. Should it be static?
   kernel/sys_ni.c:227:1: sparse: sparse: symbol '__arm64_sys_listen' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__arm64_sys_accept' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__arm64_sys_connect' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__arm64_sys_getsockname' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__arm64_sys_getpeername' was not declared. Should it be static?
   kernel/sys_ni.c:232:1: sparse: sparse: symbol '__arm64_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:233:1: sparse: sparse: symbol '__arm64_compat_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:234:1: sparse: sparse: symbol '__arm64_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:235:1: sparse: sparse: symbol '__arm64_compat_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:236:1: sparse: sparse: symbol '__arm64_sys_sendto' was not declared. Should it be static?
   kernel/sys_ni.c:237:1: sparse: sparse: symbol '__arm64_sys_shutdown' was not declared. Should it be static?
   kernel/sys_ni.c:238:1: sparse: sparse: symbol '__arm64_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:239:1: sparse: sparse: symbol '__arm64_compat_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:240:1: sparse: sparse: symbol '__arm64_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:241:1: sparse: sparse: symbol '__arm64_compat_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:242:1: sparse: sparse: symbol '__arm64_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__arm64_compat_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:248:1: sparse: sparse: symbol '__arm64_sys_mremap' was not declared. Should it be static?
   kernel/sys_ni.c:251:1: sparse: sparse: symbol '__arm64_sys_add_key' was not declared. Should it be static?
   kernel/sys_ni.c:252:1: sparse: sparse: symbol '__arm64_sys_request_key' was not declared. Should it be static?
   kernel/sys_ni.c:253:1: sparse: sparse: symbol '__arm64_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:254:1: sparse: sparse: symbol '__arm64_compat_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:259:1: sparse: sparse: symbol '__arm64_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:262:1: sparse: sparse: symbol '__arm64_sys_swapon' was not declared. Should it be static?
   kernel/sys_ni.c:263:1: sparse: sparse: symbol '__arm64_sys_swapoff' was not declared. Should it be static?
   kernel/sys_ni.c:264:1: sparse: sparse: symbol '__arm64_sys_mprotect' was not declared. Should it be static?
   kernel/sys_ni.c:265:1: sparse: sparse: symbol '__arm64_sys_msync' was not declared. Should it be static?
   kernel/sys_ni.c:266:1: sparse: sparse: symbol '__arm64_sys_mlock' was not declared. Should it be static?
   kernel/sys_ni.c:267:1: sparse: sparse: symbol '__arm64_sys_munlock' was not declared. Should it be static?
   kernel/sys_ni.c:268:1: sparse: sparse: symbol '__arm64_sys_mlockall' was not declared. Should it be static?
   kernel/sys_ni.c:269:1: sparse: sparse: symbol '__arm64_sys_munlockall' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__arm64_sys_mincore' was not declared. Should it be static?
   kernel/sys_ni.c:271:1: sparse: sparse: symbol '__arm64_sys_madvise' was not declared. Should it be static?
   kernel/sys_ni.c:272:1: sparse: sparse: symbol '__arm64_sys_remap_file_pages' was not declared. Should it be static?
   kernel/sys_ni.c:273:1: sparse: sparse: symbol '__arm64_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:274:1: sparse: sparse: symbol '__arm64_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:275:1: sparse: sparse: symbol '__arm64_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:276:1: sparse: sparse: symbol '__arm64_compat_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:277:1: sparse: sparse: symbol '__arm64_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:278:1: sparse: sparse: symbol '__arm64_compat_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:279:1: sparse: sparse: symbol '__arm64_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:280:1: sparse: sparse: symbol '__arm64_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:281:1: sparse: sparse: symbol '__arm64_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:282:1: sparse: sparse: symbol '__arm64_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:284:1: sparse: sparse: symbol '__arm64_sys_perf_event_open' was not declared. Should it be static?
   kernel/sys_ni.c:285:1: sparse: sparse: symbol '__arm64_sys_accept4' was not declared. Should it be static?
   kernel/sys_ni.c:286:1: sparse: sparse: symbol '__arm64_sys_recvmmsg' was not declared. Should it be static?
>> kernel/sys_ni.c:287:1: sparse: sparse: symbol '__arm64_compat_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:294:1: sparse: sparse: symbol '__arm64_sys_fanotify_init' was not declared. Should it be static?
   kernel/sys_ni.c:295:1: sparse: sparse: symbol '__arm64_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:298:1: sparse: sparse: symbol '__arm64_sys_name_to_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__arm64_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__arm64_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:302:1: sparse: sparse: symbol '__arm64_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:303:1: sparse: sparse: symbol '__arm64_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:304:1: sparse: sparse: symbol '__arm64_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:305:1: sparse: sparse: symbol '__arm64_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:306:1: sparse: sparse: symbol '__arm64_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:307:1: sparse: sparse: symbol '__arm64_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:310:1: sparse: sparse: symbol '__arm64_sys_kcmp' was not declared. Should it be static?
   kernel/sys_ni.c:312:1: sparse: sparse: symbol '__arm64_sys_finit_module' was not declared. Should it be static?
   kernel/sys_ni.c:315:1: sparse: sparse: symbol '__arm64_sys_seccomp' was not declared. Should it be static?
   kernel/sys_ni.c:317:1: sparse: sparse: symbol '__arm64_sys_memfd_create' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__arm64_sys_bpf' was not declared. Should it be static?
   kernel/sys_ni.c:323:1: sparse: sparse: symbol '__arm64_sys_execveat' was not declared. Should it be static?
   kernel/sys_ni.c:325:1: sparse: sparse: symbol '__arm64_sys_userfaultfd' was not declared. Should it be static?
   kernel/sys_ni.c:328:1: sparse: sparse: symbol '__arm64_sys_membarrier' was not declared. Should it be static?
   kernel/sys_ni.c:330:1: sparse: sparse: symbol '__arm64_sys_mlock2' was not declared. Should it be static?
   kernel/sys_ni.c:332:1: sparse: sparse: symbol '__arm64_sys_copy_file_range' was not declared. Should it be static?
   kernel/sys_ni.c:335:1: sparse: sparse: symbol '__arm64_sys_pkey_mprotect' was not declared. Should it be static?
   kernel/sys_ni.c:336:1: sparse: sparse: symbol '__arm64_sys_pkey_alloc' was not declared. Should it be static?
   kernel/sys_ni.c:337:1: sparse: sparse: symbol '__arm64_sys_pkey_free' was not declared. Should it be static?
   kernel/sys_ni.c:345:1: sparse: sparse: symbol '__arm64_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:346:1: sparse: sparse: symbol '__arm64_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:347:1: sparse: sparse: symbol '__arm64_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:350:1: sparse: sparse: symbol '__arm64_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:351:1: sparse: sparse: symbol '__arm64_compat_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:354:1: sparse: sparse: symbol '__arm64_compat_sys_sysctl' was not declared. Should it be static?
   kernel/sys_ni.c:355:1: sparse: sparse: symbol '__arm64_compat_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:358:1: sparse: sparse: symbol '__arm64_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:359:1: sparse: sparse: symbol '__arm64_sys_modify_ldt' was not declared. Should it be static?
   kernel/sys_ni.c:360:1: sparse: sparse: symbol '__arm64_compat_sys_quotactl32' was not declared. Should it be static?
   kernel/sys_ni.c:361:1: sparse: sparse: symbol '__arm64_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:362:1: sparse: sparse: symbol '__arm64_sys_kexec_file_load' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__arm64_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__arm64_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:367:1: sparse: sparse: symbol '__arm64_compat_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:370:1: sparse: sparse: symbol '__arm64_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:371:1: sparse: sparse: symbol '__arm64_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__arm64_sys_spu_create' was not declared. Should it be static?
   kernel/sys_ni.c:373:1: sparse: sparse: symbol '__arm64_sys_subpage_prot' was not declared. Should it be static?
   kernel/sys_ni.c:382:1: sparse: sparse: symbol '__arm64_sys_epoll_create' was not declared. Should it be static?
   kernel/sys_ni.c:383:1: sparse: sparse: symbol '__arm64_sys_inotify_init' was not declared. Should it be static?
   kernel/sys_ni.c:384:1: sparse: sparse: symbol '__arm64_sys_eventfd' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__arm64_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:386:1: sparse: sparse: symbol '__arm64_compat_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:389:1: sparse: sparse: symbol '__arm64_sys_fadvise64' was not declared. Should it be static?
   kernel/sys_ni.c:392:1: sparse: sparse: symbol '__arm64_sys_epoll_wait' was not declared. Should it be static?
   kernel/sys_ni.c:393:1: sparse: sparse: symbol '__arm64_sys_recv' was not declared. Should it be static?
   kernel/sys_ni.c:394:1: sparse: sparse: symbol '__arm64_compat_sys_recv' was not declared. Should it be static?
   kernel/sys_ni.c:395:1: sparse: sparse: symbol '__arm64_sys_send' was not declared. Should it be static?
   kernel/sys_ni.c:396:1: sparse: sparse: symbol '__arm64_sys_bdflush' was not declared. Should it be static?
   kernel/sys_ni.c:397:1: sparse: sparse: symbol '__arm64_sys_uselib' was not declared. Should it be static?
   kernel/sys_ni.c:405:1: sparse: sparse: symbol '__arm64_sys_sgetmask' was not declared. Should it be static?
   kernel/sys_ni.c:406:1: sparse: sparse: symbol '__arm64_sys_ssetmask' was not declared. Should it be static?
   kernel/sys_ni.c:409:1: sparse: sparse: symbol '__arm64_sys_sysfs' was not declared. Should it be static?
   kernel/sys_ni.c:412:1: sparse: sparse: symbol '__arm64_sys_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:413:1: sparse: sparse: symbol '__arm64_compat_sys_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:416:1: sparse: sparse: symbol '__arm64_sys_chown16' was not declared. Should it be static?
   kernel/sys_ni.c:417:1: sparse: sparse: symbol '__arm64_sys_fchown16' was not declared. Should it be static?
   kernel/sys_ni.c:418:1: sparse: sparse: symbol '__arm64_sys_getegid16' was not declared. Should it be static?
   kernel/sys_ni.c:419:1: sparse: sparse: symbol '__arm64_sys_geteuid16' was not declared. Should it be static?
   kernel/sys_ni.c:420:1: sparse: sparse: symbol '__arm64_sys_getgid16' was not declared. Should it be static?
   kernel/sys_ni.c:421:1: sparse: sparse: symbol '__arm64_sys_getgroups16' was not declared. Should it be static?
   kernel/sys_ni.c:422:1: sparse: sparse: symbol '__arm64_sys_getresgid16' was not declared. Should it be static?
   kernel/sys_ni.c:423:1: sparse: sparse: symbol '__arm64_sys_getresuid16' was not declared. Should it be static?
   kernel/sys_ni.c:424:1: sparse: sparse: symbol '__arm64_sys_getuid16' was not declared. Should it be static?
   kernel/sys_ni.c:425:1: sparse: sparse: symbol '__arm64_sys_lchown16' was not declared. Should it be static?
   kernel/sys_ni.c:426:1: sparse: sparse: symbol '__arm64_sys_setfsgid16' was not declared. Should it be static?
   kernel/sys_ni.c:427:1: sparse: sparse: symbol '__arm64_sys_setfsuid16' was not declared. Should it be static?
   kernel/sys_ni.c:428:1: sparse: sparse: symbol '__arm64_sys_setgid16' was not declared. Should it be static?
   kernel/sys_ni.c:429:1: sparse: sparse: symbol '__arm64_sys_setgroups16' was not declared. Should it be static?
   kernel/sys_ni.c:430:1: sparse: sparse: symbol '__arm64_sys_setregid16' was not declared. Should it be static?
   kernel/sys_ni.c:431:1: sparse: sparse: symbol '__arm64_sys_setresgid16' was not declared. Should it be static?
   kernel/sys_ni.c:432:1: sparse: sparse: symbol '__arm64_sys_setresuid16' was not declared. Should it be static?
   kernel/sys_ni.c:433:1: sparse: sparse: symbol '__arm64_sys_setreuid16' was not declared. Should it be static?
   kernel/sys_ni.c:434:1: sparse: sparse: symbol '__arm64_sys_setuid16' was not declared. Should it be static?
   kernel/sys_ni.c:437:1: sparse: sparse: symbol '__arm64_sys_rseq' was not declared. Should it be static?
   In file included from kernel/sys_ni.c:10:
   arch/arm64/include/asm/syscall_wrapper.h:79:32: warning: no previous prototype for '__arm64_sys_io_setup' [-Wmissing-prototypes]
      79 |         asmlinkage __weak long __arm64_sys_##name(const struct pt_regs *regs)   222-      |                                ^~~~~~~~~~~~
   kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
      39 | COND_SYSCALL(io_setup);
         | ^~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:41:32: warning: no previous prototype for '__arm64_compat_sys_io_setup' [-Wmissing-prototypes]
      41 |         asmlinkage __weak long __arm64_compat_sys_##name(const struct pt_regs *__unused)228-      |                                ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:40:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
      40 | COND_SYSCALL_COMPAT(io_setup);
         | ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:79:32: warning: no previous prototype for '__arm64_sys_io_destroy' [-Wmissing-prototypes]
      79 |         asmlinkage __weak long __arm64_sys_##name(const struct pt_regs *regs)   234-      |                                ^~~~~~~~~~~~
   kernel/sys_ni.c:41:1: note: in expansion of macro 'COND_SYSCALL'
      41 | COND_SYSCALL(io_destroy);
         | ^~~~~~~~~~~~
   arch/arm64/include/asm/syscall_wrapper.h:79:32: warning: no previous prototype for '__arm64_sys_io_submit' [-Wmissing-prototypes]

vim +/__arm64_compat_sys_io_getevents +47 kernel/sys_ni.c

67a7acd3773a94 Dominik Brodowski 2018-03-04   32  
70dd4b3160798b Dominik Brodowski 2018-03-06   33  /*
70dd4b3160798b Dominik Brodowski 2018-03-06   34   * This list is kept in the same order as include/uapi/asm-generic/unistd.h.
70dd4b3160798b Dominik Brodowski 2018-03-06   35   * Architecture specific entries go below, followed by deprecated or obsolete
70dd4b3160798b Dominik Brodowski 2018-03-06   36   * system calls.
70dd4b3160798b Dominik Brodowski 2018-03-06   37   */
70dd4b3160798b Dominik Brodowski 2018-03-06   38  
67a7acd3773a94 Dominik Brodowski 2018-03-04   39  COND_SYSCALL(io_setup);
67a7acd3773a94 Dominik Brodowski 2018-03-04   40  COND_SYSCALL_COMPAT(io_setup);
67a7acd3773a94 Dominik Brodowski 2018-03-04   41  COND_SYSCALL(io_destroy);
67a7acd3773a94 Dominik Brodowski 2018-03-04   42  COND_SYSCALL(io_submit);
67a7acd3773a94 Dominik Brodowski 2018-03-04   43  COND_SYSCALL_COMPAT(io_submit);
67a7acd3773a94 Dominik Brodowski 2018-03-04   44  COND_SYSCALL(io_cancel);
67a7acd3773a94 Dominik Brodowski 2018-03-04   45  COND_SYSCALL(io_getevents);
7a074e96dee625 Christoph Hellwig 2018-05-02   46  COND_SYSCALL(io_pgetevents);
67a7acd3773a94 Dominik Brodowski 2018-03-04  @47  COND_SYSCALL_COMPAT(io_getevents);
7a074e96dee625 Christoph Hellwig 2018-05-02   48  COND_SYSCALL_COMPAT(io_pgetevents);
70dd4b3160798b Dominik Brodowski 2018-03-06   49  
70dd4b3160798b Dominik Brodowski 2018-03-06   50  /* fs/xattr.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   51  
70dd4b3160798b Dominik Brodowski 2018-03-06   52  /* fs/dcache.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   53  
70dd4b3160798b Dominik Brodowski 2018-03-06   54  /* fs/cookies.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   55  COND_SYSCALL(lookup_dcookie);
67a7acd3773a94 Dominik Brodowski 2018-03-04   56  COND_SYSCALL_COMPAT(lookup_dcookie);
70dd4b3160798b Dominik Brodowski 2018-03-06   57  
70dd4b3160798b Dominik Brodowski 2018-03-06   58  /* fs/eventfd.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   59  COND_SYSCALL(eventfd2);
70dd4b3160798b Dominik Brodowski 2018-03-06   60  
70dd4b3160798b Dominik Brodowski 2018-03-06   61  /* fs/eventfd.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   62  COND_SYSCALL(epoll_create1);
67a7acd3773a94 Dominik Brodowski 2018-03-04   63  COND_SYSCALL(epoll_ctl);
67a7acd3773a94 Dominik Brodowski 2018-03-04   64  COND_SYSCALL(epoll_pwait);
67a7acd3773a94 Dominik Brodowski 2018-03-04   65  COND_SYSCALL_COMPAT(epoll_pwait);
70dd4b3160798b Dominik Brodowski 2018-03-06   66  
70dd4b3160798b Dominik Brodowski 2018-03-06   67  /* fs/fcntl.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   68  
70dd4b3160798b Dominik Brodowski 2018-03-06   69  /* fs/inotify_user.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   70  COND_SYSCALL(inotify_init1);
67a7acd3773a94 Dominik Brodowski 2018-03-04   71  COND_SYSCALL(inotify_add_watch);
67a7acd3773a94 Dominik Brodowski 2018-03-04   72  COND_SYSCALL(inotify_rm_watch);
70dd4b3160798b Dominik Brodowski 2018-03-06   73  
70dd4b3160798b Dominik Brodowski 2018-03-06   74  /* fs/ioctl.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   75  
70dd4b3160798b Dominik Brodowski 2018-03-06   76  /* fs/ioprio.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   77  COND_SYSCALL(ioprio_set);
67a7acd3773a94 Dominik Brodowski 2018-03-04   78  COND_SYSCALL(ioprio_get);
70dd4b3160798b Dominik Brodowski 2018-03-06   79  
70dd4b3160798b Dominik Brodowski 2018-03-06   80  /* fs/locks.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   81  COND_SYSCALL(flock);
70dd4b3160798b Dominik Brodowski 2018-03-06   82  
70dd4b3160798b Dominik Brodowski 2018-03-06   83  /* fs/namei.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   84  
70dd4b3160798b Dominik Brodowski 2018-03-06   85  /* fs/namespace.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   86  
70dd4b3160798b Dominik Brodowski 2018-03-06   87  /* fs/nfsctl.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   88  
70dd4b3160798b Dominik Brodowski 2018-03-06   89  /* fs/open.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   90  
70dd4b3160798b Dominik Brodowski 2018-03-06   91  /* fs/pipe.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   92  
70dd4b3160798b Dominik Brodowski 2018-03-06   93  /* fs/quota.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04   94  COND_SYSCALL(quotactl);
70dd4b3160798b Dominik Brodowski 2018-03-06   95  
70dd4b3160798b Dominik Brodowski 2018-03-06   96  /* fs/readdir.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   97  
70dd4b3160798b Dominik Brodowski 2018-03-06   98  /* fs/read_write.c */
70dd4b3160798b Dominik Brodowski 2018-03-06   99  
70dd4b3160798b Dominik Brodowski 2018-03-06  100  /* fs/sendfile.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  101  
70dd4b3160798b Dominik Brodowski 2018-03-06  102  /* fs/select.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  103  
70dd4b3160798b Dominik Brodowski 2018-03-06  104  /* fs/signalfd.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  105  COND_SYSCALL(signalfd4);
67a7acd3773a94 Dominik Brodowski 2018-03-04  106  COND_SYSCALL_COMPAT(signalfd4);
70dd4b3160798b Dominik Brodowski 2018-03-06  107  
70dd4b3160798b Dominik Brodowski 2018-03-06  108  /* fs/splice.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  109  
70dd4b3160798b Dominik Brodowski 2018-03-06  110  /* fs/stat.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  111  
70dd4b3160798b Dominik Brodowski 2018-03-06  112  /* fs/sync.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  113  
70dd4b3160798b Dominik Brodowski 2018-03-06  114  /* fs/timerfd.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  115  COND_SYSCALL(timerfd_create);
67a7acd3773a94 Dominik Brodowski 2018-03-04  116  COND_SYSCALL(timerfd_settime);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @117  COND_SYSCALL_COMPAT(timerfd_settime);
67a7acd3773a94 Dominik Brodowski 2018-03-04  118  COND_SYSCALL(timerfd_gettime);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @119  COND_SYSCALL_COMPAT(timerfd_gettime);
70dd4b3160798b Dominik Brodowski 2018-03-06  120  
70dd4b3160798b Dominik Brodowski 2018-03-06  121  /* fs/utimes.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  122  
70dd4b3160798b Dominik Brodowski 2018-03-06  123  /* kernel/acct.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  124  COND_SYSCALL(acct);
70dd4b3160798b Dominik Brodowski 2018-03-06  125  
70dd4b3160798b Dominik Brodowski 2018-03-06  126  /* kernel/capability.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  127  COND_SYSCALL(capget);
67a7acd3773a94 Dominik Brodowski 2018-03-04  128  COND_SYSCALL(capset);
70dd4b3160798b Dominik Brodowski 2018-03-06  129  
70dd4b3160798b Dominik Brodowski 2018-03-06  130  /* kernel/exec_domain.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  131  
70dd4b3160798b Dominik Brodowski 2018-03-06  132  /* kernel/exit.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  133  
70dd4b3160798b Dominik Brodowski 2018-03-06  134  /* kernel/fork.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  135  
70dd4b3160798b Dominik Brodowski 2018-03-06  136  /* kernel/futex.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  137  COND_SYSCALL(futex);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @138  COND_SYSCALL_COMPAT(futex);
67a7acd3773a94 Dominik Brodowski 2018-03-04  139  COND_SYSCALL(set_robust_list);
67a7acd3773a94 Dominik Brodowski 2018-03-04  140  COND_SYSCALL_COMPAT(set_robust_list);
67a7acd3773a94 Dominik Brodowski 2018-03-04  141  COND_SYSCALL(get_robust_list);
67a7acd3773a94 Dominik Brodowski 2018-03-04  142  COND_SYSCALL_COMPAT(get_robust_list);
70dd4b3160798b Dominik Brodowski 2018-03-06  143  
70dd4b3160798b Dominik Brodowski 2018-03-06  144  /* kernel/hrtimer.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  145  
70dd4b3160798b Dominik Brodowski 2018-03-06  146  /* kernel/itimer.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  147  
70dd4b3160798b Dominik Brodowski 2018-03-06  148  /* kernel/kexec.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  149  COND_SYSCALL(kexec_load);
67a7acd3773a94 Dominik Brodowski 2018-03-04  150  COND_SYSCALL_COMPAT(kexec_load);
70dd4b3160798b Dominik Brodowski 2018-03-06  151  
70dd4b3160798b Dominik Brodowski 2018-03-06  152  /* kernel/module.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  153  COND_SYSCALL(init_module);
67a7acd3773a94 Dominik Brodowski 2018-03-04  154  COND_SYSCALL(delete_module);
70dd4b3160798b Dominik Brodowski 2018-03-06  155  
70dd4b3160798b Dominik Brodowski 2018-03-06  156  /* kernel/posix-timers.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  157  
70dd4b3160798b Dominik Brodowski 2018-03-06  158  /* kernel/printk.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  159  COND_SYSCALL(syslog);
70dd4b3160798b Dominik Brodowski 2018-03-06  160  
70dd4b3160798b Dominik Brodowski 2018-03-06  161  /* kernel/ptrace.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  162  
70dd4b3160798b Dominik Brodowski 2018-03-06  163  /* kernel/sched/core.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  164  
70dd4b3160798b Dominik Brodowski 2018-03-06  165  /* kernel/signal.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  166  
70dd4b3160798b Dominik Brodowski 2018-03-06  167  /* kernel/sys.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  168  COND_SYSCALL(setregid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  169  COND_SYSCALL(setgid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  170  COND_SYSCALL(setreuid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  171  COND_SYSCALL(setuid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  172  COND_SYSCALL(setresuid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  173  COND_SYSCALL(getresuid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  174  COND_SYSCALL(setresgid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  175  COND_SYSCALL(getresgid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  176  COND_SYSCALL(setfsuid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  177  COND_SYSCALL(setfsgid);
67a7acd3773a94 Dominik Brodowski 2018-03-04  178  COND_SYSCALL(setgroups);
67a7acd3773a94 Dominik Brodowski 2018-03-04  179  COND_SYSCALL(getgroups);
70dd4b3160798b Dominik Brodowski 2018-03-06  180  
70dd4b3160798b Dominik Brodowski 2018-03-06  181  /* kernel/time.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  182  
70dd4b3160798b Dominik Brodowski 2018-03-06  183  /* kernel/timer.c */
70dd4b3160798b Dominik Brodowski 2018-03-06  184  
70dd4b3160798b Dominik Brodowski 2018-03-06  185  /* ipc/mqueue.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  186  COND_SYSCALL(mq_open);
67a7acd3773a94 Dominik Brodowski 2018-03-04  187  COND_SYSCALL_COMPAT(mq_open);
67a7acd3773a94 Dominik Brodowski 2018-03-04  188  COND_SYSCALL(mq_unlink);
67a7acd3773a94 Dominik Brodowski 2018-03-04  189  COND_SYSCALL(mq_timedsend);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @190  COND_SYSCALL_COMPAT(mq_timedsend);
67a7acd3773a94 Dominik Brodowski 2018-03-04  191  COND_SYSCALL(mq_timedreceive);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @192  COND_SYSCALL_COMPAT(mq_timedreceive);
67a7acd3773a94 Dominik Brodowski 2018-03-04  193  COND_SYSCALL(mq_notify);
67a7acd3773a94 Dominik Brodowski 2018-03-04  194  COND_SYSCALL_COMPAT(mq_notify);
67a7acd3773a94 Dominik Brodowski 2018-03-04  195  COND_SYSCALL(mq_getsetattr);
67a7acd3773a94 Dominik Brodowski 2018-03-04  196  COND_SYSCALL_COMPAT(mq_getsetattr);
70dd4b3160798b Dominik Brodowski 2018-03-06  197  
70dd4b3160798b Dominik Brodowski 2018-03-06  198  /* ipc/msg.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  199  COND_SYSCALL(msgget);
67a7acd3773a94 Dominik Brodowski 2018-03-04  200  COND_SYSCALL(msgctl);
67a7acd3773a94 Dominik Brodowski 2018-03-04  201  COND_SYSCALL_COMPAT(msgctl);
67a7acd3773a94 Dominik Brodowski 2018-03-04  202  COND_SYSCALL(msgrcv);
67a7acd3773a94 Dominik Brodowski 2018-03-04  203  COND_SYSCALL_COMPAT(msgrcv);
67a7acd3773a94 Dominik Brodowski 2018-03-04  204  COND_SYSCALL(msgsnd);
67a7acd3773a94 Dominik Brodowski 2018-03-04  205  COND_SYSCALL_COMPAT(msgsnd);
70dd4b3160798b Dominik Brodowski 2018-03-06  206  
70dd4b3160798b Dominik Brodowski 2018-03-06  207  /* ipc/sem.c */
67a7acd3773a94 Dominik Brodowski 2018-03-04  208  COND_SYSCALL(semget);
67a7acd3773a94 Dominik Brodowski 2018-03-04  209  COND_SYSCALL(semctl);
67a7acd3773a94 Dominik Brodowski 2018-03-04  210  COND_SYSCALL_COMPAT(semctl);
67a7acd3773a94 Dominik Brodowski 2018-03-04  211  COND_SYSCALL(semtimedop);
67a7acd3773a94 Dominik Brodowski 2018-03-04 @212  COND_SYSCALL_COMPAT(semtimedop);
67a7acd3773a94 Dominik Brodowski 2018-03-04  213  COND_SYSCALL(semop);
70dd4b3160798b Dominik Brodowski 2018-03-06  214  

:::::: The code at line 47 was first introduced by commit
:::::: 67a7acd3773a94df2e671601a288685485463cf9 kernel/sys_ni: remove {sys_,sys_compat} from cond_syscall definitions

:::::: TO: Dominik Brodowski <linux@dominikbrodowski.net>
:::::: CC: Dominik Brodowski <linux@dominikbrodowski.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
