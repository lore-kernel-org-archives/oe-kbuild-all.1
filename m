Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703949DB9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916511; cv=none; b=mc5eenyFXTgoiJMHssl7kqI9+bpPx+xCKVkESeuxgcoX3rtn9o8xHRbD5JUeMxwdNMGMFw62IuiYtK5NK1CUDEa3JMBXDReVH+E9g5ngORzamXWay+TotMdw+v+8asUVJI3yD/lDhvP7/UtWivRSOm2lsrLtC3WWqzj49Me9VD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916511; c=relaxed/simple;
	bh=UgZn4RtKMpqqsfQMb7NqlRy2ktHWuzeShvnYjlCYsK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BtQhGfWFJ/cn6vKkX5aWCul/tpHnleRb8zfnfgFz88gsSJceDnOGO6dD92gk0URFriEqUKVD8GIgP+Y8cJc5JCu1TrIhme2tOlR0bzxPA6k2+lnOEl6D96ZJk/mWTEY74+nZ9hkQIBPdi9eSqOEiY6ynDlvSSXyuMTnfLAiVPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHKuB5rH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHKuB5rH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791916509; x=1823452509;
  h=date:from:to:cc:subject:message-id;
  bh=UgZn4RtKMpqqsfQMb7NqlRy2ktHWuzeShvnYjlCYsK0=;
  b=HHKuB5rHtIJs0/F0JWd7U5gkz3Ckt73FOAqVgc3CpZUT7EArRycVoFLw
   9JX4pU60HkLBvWof6wE4suMCyKOUqXMNrr6VDvyss4XCCdChnrxxLT1qf
   gwQMAbjP4xuyBwdqj+zlJ7PfFM/nJvdZQhc2DXPT35WyEBdyxUdaB0khU
   5tI7gg/hqFrGN6RusBjlrg6UbwY0aDMkgcYeJgxRdOz+9raaLeGBLsGJQ
   DdmR7CtByi4dvJzt0OWp4Yz/qtWQtfsC1MCGKlGadxbce9NyWqhEkZPav
   xPCNMA3xtcBWUoKkNgHeDemTJpu7D0S4457QiesIiDGoY48D1Iel5cZRy
   Q==;
X-CSE-ConnectionGUID: U7zfOn7sT5Sv3FhRcPLnwQ==
X-CSE-MsgGUID: LFa6iXosRHy3CeUR5P/qww==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="552804"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="552804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:35:08 -0700
X-CSE-ConnectionGUID: 4pLOSggMTfKnczaHJIXijg==
X-CSE-MsgGUID: sZnFamayRUiREgOrJy9gQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1569246"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2026 11:35:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGhL5-00000000AcJ-3oBc;
	Tue, 13 Oct 2026 18:35:04 +0000
Date: Tue, 13 Oct 2026 20:34:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1]
 include/trace/hooks/security.h:25:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202610132025.r4suFAMV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8ae25af0371be0b65ba79e7787c6c1fc4e2eb4fe
commit: fa573af4b2ab4a7c778dfaf0bb0a081ed59327f8 [0/1] ANDROID: vendor_hooks: add hooks for process authenticator security module
config: x86_64-randconfig-2302-20261013 (https://download.01.org/0day-ci/archive/20261013/202610132025.r4suFAMV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610132025.r4suFAMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610132025.r4suFAMV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/lsm_hook_defs.h:194:1: sparse: sparse: symbol 'security_hook_active_file_ioctl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:196:1: sparse: sparse: symbol 'security_hook_active_file_ioctl_compat_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:198:1: sparse: sparse: symbol 'security_hook_active_mmap_addr_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:199:1: sparse: sparse: symbol 'security_hook_active_mmap_file_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:201:1: sparse: sparse: symbol 'security_hook_active_file_mprotect_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:203:1: sparse: sparse: symbol 'security_hook_active_file_lock_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:204:1: sparse: sparse: symbol 'security_hook_active_file_fcntl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:206:1: sparse: sparse: symbol 'security_hook_active_file_set_fowner_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:207:1: sparse: sparse: symbol 'security_hook_active_file_send_sigiotask_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:209:1: sparse: sparse: symbol 'security_hook_active_file_receive_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:210:1: sparse: sparse: symbol 'security_hook_active_file_open_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:211:1: sparse: sparse: symbol 'security_hook_active_file_post_open_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:212:1: sparse: sparse: symbol 'security_hook_active_file_truncate_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:213:1: sparse: sparse: symbol 'security_hook_active_task_alloc_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:215:1: sparse: sparse: symbol 'security_hook_active_task_free_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:216:1: sparse: sparse: symbol 'security_hook_active_cred_alloc_blank_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:217:1: sparse: sparse: symbol 'security_hook_active_cred_free_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:218:1: sparse: sparse: symbol 'security_hook_active_cred_prepare_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:220:1: sparse: sparse: symbol 'security_hook_active_cred_transfer_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:222:1: sparse: sparse: symbol 'security_hook_active_cred_getsecid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:223:1: sparse: sparse: symbol 'security_hook_active_cred_getlsmprop_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:225:1: sparse: sparse: symbol 'security_hook_active_kernel_act_as_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:226:1: sparse: sparse: symbol 'security_hook_active_kernel_create_files_as_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:227:1: sparse: sparse: symbol 'security_hook_active_kernel_module_request_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:228:1: sparse: sparse: symbol 'security_hook_active_kernel_load_data_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:229:1: sparse: sparse: symbol 'security_hook_active_kernel_post_load_data_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:231:1: sparse: sparse: symbol 'security_hook_active_kernel_read_file_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:233:1: sparse: sparse: symbol 'security_hook_active_kernel_post_read_file_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:235:1: sparse: sparse: symbol 'security_hook_active_task_fix_setuid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:237:1: sparse: sparse: symbol 'security_hook_active_task_fix_setgid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:239:1: sparse: sparse: symbol 'security_hook_active_task_fix_setgroups_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:240:1: sparse: sparse: symbol 'security_hook_active_task_setpgid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:241:1: sparse: sparse: symbol 'security_hook_active_task_getpgid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:242:1: sparse: sparse: symbol 'security_hook_active_task_getsid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:243:1: sparse: sparse: symbol 'security_hook_active_current_getlsmprop_subj_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:244:1: sparse: sparse: symbol 'security_hook_active_task_getlsmprop_obj_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:246:1: sparse: sparse: symbol 'security_hook_active_task_setnice_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:247:1: sparse: sparse: symbol 'security_hook_active_task_setioprio_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:248:1: sparse: sparse: symbol 'security_hook_active_task_getioprio_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:249:1: sparse: sparse: symbol 'security_hook_active_task_prlimit_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:251:1: sparse: sparse: symbol 'security_hook_active_task_setrlimit_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:253:1: sparse: sparse: symbol 'security_hook_active_task_setscheduler_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:254:1: sparse: sparse: symbol 'security_hook_active_task_getscheduler_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:255:1: sparse: sparse: symbol 'security_hook_active_task_movememory_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:256:1: sparse: sparse: symbol 'security_hook_active_task_kill_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:258:1: sparse: sparse: symbol 'security_hook_active_task_prctl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:260:1: sparse: sparse: symbol 'security_hook_active_task_to_inode_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:262:1: sparse: sparse: symbol 'security_hook_active_userns_create_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:263:1: sparse: sparse: symbol 'security_hook_active_ipc_permission_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:264:1: sparse: sparse: symbol 'security_hook_active_ipc_getlsmprop_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:266:1: sparse: sparse: symbol 'security_hook_active_msg_msg_alloc_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:267:1: sparse: sparse: symbol 'security_hook_active_msg_msg_free_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:268:1: sparse: sparse: symbol 'security_hook_active_msg_queue_alloc_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:269:1: sparse: sparse: symbol 'security_hook_active_msg_queue_free_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:271:1: sparse: sparse: symbol 'security_hook_active_msg_queue_associate_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:272:1: sparse: sparse: symbol 'security_hook_active_msg_queue_msgctl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:273:1: sparse: sparse: symbol 'security_hook_active_msg_queue_msgsnd_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:275:1: sparse: sparse: symbol 'security_hook_active_msg_queue_msgrcv_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:277:1: sparse: sparse: symbol 'security_hook_active_shm_alloc_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:278:1: sparse: sparse: symbol 'security_hook_active_shm_free_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:279:1: sparse: sparse: symbol 'security_hook_active_shm_associate_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:280:1: sparse: sparse: symbol 'security_hook_active_shm_shmctl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:281:1: sparse: sparse: symbol 'security_hook_active_shm_shmat_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:283:1: sparse: sparse: symbol 'security_hook_active_sem_alloc_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:284:1: sparse: sparse: symbol 'security_hook_active_sem_free_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:285:1: sparse: sparse: symbol 'security_hook_active_sem_associate_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:286:1: sparse: sparse: symbol 'security_hook_active_sem_semctl_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:287:1: sparse: sparse: symbol 'security_hook_active_sem_semop_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:289:1: sparse: sparse: symbol 'security_hook_active_netlink_send_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:290:1: sparse: sparse: symbol 'security_hook_active_d_instantiate_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:292:1: sparse: sparse: symbol 'security_hook_active_getselfattr_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:294:1: sparse: sparse: symbol 'security_hook_active_setselfattr_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:296:1: sparse: sparse: symbol 'security_hook_active_getprocattr_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:298:1: sparse: sparse: symbol 'security_hook_active_setprocattr_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:299:1: sparse: sparse: symbol 'security_hook_active_ismaclabel_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:300:1: sparse: sparse: symbol 'security_hook_active_secid_to_secctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:301:1: sparse: sparse: symbol 'security_hook_active_lsmprop_to_secctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:303:1: sparse: sparse: symbol 'security_hook_active_secctx_to_secid_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:304:1: sparse: sparse: symbol 'security_hook_active_release_secctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:305:1: sparse: sparse: symbol 'security_hook_active_inode_invalidate_secctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:306:1: sparse: sparse: symbol 'security_hook_active_inode_notifysecctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:307:1: sparse: sparse: symbol 'security_hook_active_inode_setsecctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:308:1: sparse: sparse: symbol 'security_hook_active_inode_getsecctx_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:312:1: sparse: sparse: symbol 'security_hook_active_post_notification_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:317:1: sparse: sparse: symbol 'security_hook_active_watch_key_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:411:1: sparse: sparse: symbol 'security_hook_active_key_alloc_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:413:1: sparse: sparse: symbol 'security_hook_active_key_permission_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:415:1: sparse: sparse: symbol 'security_hook_active_key_getsecurity_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:416:1: sparse: sparse: symbol 'security_hook_active_key_post_create_or_update_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:447:1: sparse: sparse: symbol 'security_hook_active_locked_down_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:450:1: sparse: sparse: symbol 'security_hook_active_perf_event_open_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:451:1: sparse: sparse: symbol 'security_hook_active_perf_event_alloc_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:452:1: sparse: sparse: symbol 'security_hook_active_perf_event_read_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:453:1: sparse: sparse: symbol 'security_hook_active_perf_event_write_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:463:1: sparse: sparse: symbol 'security_hook_active_initramfs_populated_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:465:1: sparse: sparse: symbol 'security_hook_active_bdev_alloc_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:466:1: sparse: sparse: symbol 'security_hook_active_bdev_free_security_0' was not declared. Should it be static?
   include/linux/lsm_hook_defs.h:467:1: sparse: sparse: symbol 'security_hook_active_bdev_setintegrity_0' was not declared. Should it be static?
   security/security.c:506:25: sparse: sparse: cast removes address space '__rcu' of expression
   security/security.c: note: in included file:
>> include/trace/hooks/security.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/security.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/security.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/security.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/security.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/security.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/security.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/security.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/security.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/security.h:37:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/security.h:37:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/security.h:37:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/security.h:40:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/security.h:40:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/security.h:40:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   kernel/ptrace.c:56:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:56:22: sparse:    struct task_struct *
   kernel/ptrace.c:56:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:75:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:75:23: sparse:     expected struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:75:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:76:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *ptracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:76:29: sparse:     expected struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:76:29: sparse:     got struct cred const *
   kernel/ptrace.c:130:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:130:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:130:18: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:134:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:134:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:134:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:161:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:161:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:161:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:193:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:193:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:193:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:199:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:199:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:199:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:252:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:252:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:252:44: sparse:    struct task_struct *
   kernel/ptrace.c:505:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:505:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:505:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:513:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:513:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:513:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:561:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:561:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:561:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:563:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:563:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:563:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:754:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:754:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:754:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:762:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:762:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:762:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:873:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:873:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:873:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:877:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:877:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:877:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1232:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1232:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1232:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1234:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1234:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1234:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/signal.h:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:762:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:762:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:391:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:391:30: sparse:     expected struct spinlock [usertype] *l
   kernel/ptrace.c:391:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:420:12: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:511:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:762:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:762:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:701:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:762:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:762:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:717:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:762:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:762:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:762:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:762:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1395:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
   kernel/ptrace.c: note: in included file:
>> include/trace/hooks/ptrace.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ptrace.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ptrace.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/ptrace.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ptrace.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ptrace.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/ptrace.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ptrace.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ptrace.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/ptrace.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ptrace.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ptrace.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +25 include/trace/hooks/security.h

    24	
  > 25	DECLARE_RESTRICTED_HOOK(android_rvh_security_inode_free,
    26		TP_PROTO(struct inode *inode),
    27		TP_ARGS(inode), 1);
    28	DECLARE_RESTRICTED_HOOK(android_rvh_security_file_open,
    29		TP_PROTO(struct file *file, int *rc),
    30		TP_ARGS(file, rc), 1);
    31	DECLARE_RESTRICTED_HOOK(android_rvh_security_file_free,
    32		TP_PROTO(struct file *file),
    33		TP_ARGS(file), 1);
    34	DECLARE_RESTRICTED_HOOK(android_rvh_security_mmap_file,
    35		TP_PROTO(struct file *file, unsigned long prot, unsigned long flags, int *rc),
    36		TP_ARGS(file, prot, flags, rc), 1);
    37	DECLARE_RESTRICTED_HOOK(android_rvh_security_task_alloc,
    38		TP_PROTO(struct task_struct *task, unsigned long clone_flags, int *rc),
    39		TP_ARGS(task, clone_flags, rc), 1);
    40	DECLARE_RESTRICTED_HOOK(android_rvh_security_task_free,
    41		TP_PROTO(struct task_struct *task),
    42		TP_ARGS(task), 1);
    43	DECLARE_RESTRICTED_HOOK(android_rvh_copy_process_integrity,
    44		TP_PROTO(unsigned long clone_flags, struct task_struct *p, int *retval),
    45		TP_ARGS(clone_flags, p, retval), 1);
    46	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
