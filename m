Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669A1D88A6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733097380; cv=none; b=fOX9mklUt6jdusUucplqtmNbZe0B7f160laruIC+pgZP4ebJSBLdZYp/rd6owssQN7/FUa1QR6ey3SaacBcVflUbFv7SDzTPL/667DA8VcI30x55WKTw9MEyFHaoZwIguyP+H3yd1adnPVEy4VChJohhz8YVPaDQ8RYb+IY+FLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733097380; c=relaxed/simple;
	bh=Lg6HDsZXaqzlsi7F3WaXgQBV8QkBb8SbGRXmZ6TcnH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaFKfyhN22Q8njKzgDG2jhwbEyGaGRoX8way2CK88nG3vJM4UNq/PLLZGHx7eg+Z1JFO8PED+Wcfc8udWtk/bbLwH7afRZxE6Q52T3zWsrFn+vMFMMp1qP6fstAP/uXEioS3Zh8y9KxyK1cHet80Hh5FSB//sT4Nh4J+c6r4rdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlTE2XGv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlTE2XGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733097379; x=1764633379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lg6HDsZXaqzlsi7F3WaXgQBV8QkBb8SbGRXmZ6TcnH4=;
  b=SlTE2XGvRKvHq5QWUiEWT6F1+AqZpJpUz4dsuAsD7Uhgs4VXeKSQnAMm
   WjSewJ1J/pXMfzQcYtl4bY76nlWwgnZxAvhdbIJOHzmcXm0S5fk6Yn/Bi
   wwUh4sD0/hwVlq6ooSK6BviP07YOarlufrl+etUlmtwfTblbmhI6CSEEW
   w9DAa/T3tJWC83uTjCxugzBMf0InUmE0NZN1aDBaaTEGRx7RAmcNABG6S
   efKWhl3KIr7Yh0HSf08L/zkP40XJvzrgUglJwPwfro5+dGQgXPpIR26/m
   wxEFkBCIsdv1KanQt8BBGFTQiGfGxE2zni8CkePNZQ15qpB/OQ4hdj8BE
   A==;
X-CSE-ConnectionGUID: yFXzewP0QrGEQfzv25s8Lg==
X-CSE-MsgGUID: kY2WKlD5TSe2X6BjEcRf/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43865593"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43865593"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 15:56:18 -0800
X-CSE-ConnectionGUID: bn8WX0U3SWeX78JTWcB5ww==
X-CSE-MsgGUID: VOxJhErOSOq/NpBB88TrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="116215814"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2024 15:56:17 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHtnS-0001wj-2g;
	Sun, 01 Dec 2024 23:56:14 +0000
Date: Mon, 2 Dec 2024 07:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/7] kernel/sys_ni.c:284:1: sparse:
 sparse: symbol '__x64_sys_process_mrelease' was not declared. Should it be
 static?
Message-ID: <202412020749.T88GGoer-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   b0e9b554c383a988e7185baf9fdee7d959b8de3e
commit: fe50dcab7ae21c88bdde199e04978903b3ebff4d [3/7] UPSTREAM: mm: wire up syscall process_mrelease
config: x86_64-randconfig-121-20241201 (https://download.01.org/0day-ci/archive/20241202/202412020749.T88GGoer-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020749.T88GGoer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020749.T88GGoer-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__ia32_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__ia32_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__ia32_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__ia32_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__x64_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__ia32_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:217:1: sparse: sparse: symbol '__ia32_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__ia32_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__ia32_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__x64_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__ia32_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:222:1: sparse: sparse: symbol '__ia32_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__x64_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__ia32_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:227:1: sparse: sparse: symbol '__ia32_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__ia32_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__ia32_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__ia32_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__ia32_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__ia32_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__ia32_compat_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:245:1: sparse: sparse: symbol '__ia32_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__ia32_compat_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:249:1: sparse: sparse: symbol '__ia32_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:250:1: sparse: sparse: symbol '__ia32_compat_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:251:1: sparse: sparse: symbol '__ia32_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:252:1: sparse: sparse: symbol '__ia32_compat_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:253:1: sparse: sparse: symbol '__ia32_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:254:1: sparse: sparse: symbol '__ia32_compat_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:264:1: sparse: sparse: symbol '__ia32_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:265:1: sparse: sparse: symbol '__ia32_compat_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__x64_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__ia32_sys_fadvise64_64' was not declared. Should it be static?
>> kernel/sys_ni.c:284:1: sparse: sparse: symbol '__x64_sys_process_mrelease' was not declared. Should it be static?
>> kernel/sys_ni.c:284:1: sparse: sparse: symbol '__ia32_sys_process_mrelease' was not declared. Should it be static?
   kernel/sys_ni.c:287:1: sparse: sparse: symbol '__ia32_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:288:1: sparse: sparse: symbol '__ia32_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:289:1: sparse: sparse: symbol '__ia32_compat_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:291:1: sparse: sparse: symbol '__ia32_compat_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:293:1: sparse: sparse: symbol '__ia32_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:294:1: sparse: sparse: symbol '__ia32_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:295:1: sparse: sparse: symbol '__ia32_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__ia32_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__x64_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__ia32_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:301:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:302:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:310:1: sparse: sparse: symbol '__ia32_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:314:1: sparse: sparse: symbol '__ia32_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:315:1: sparse: sparse: symbol '__ia32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:317:1: sparse: sparse: symbol '__ia32_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:318:1: sparse: sparse: symbol '__ia32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:319:1: sparse: sparse: symbol '__ia32_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:321:1: sparse: sparse: symbol '__ia32_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:322:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:338:1: sparse: sparse: symbol '__ia32_sys_execveat' was not declared. Should it be static?
   kernel/sys_ni.c:360:1: sparse: sparse: symbol '__x64_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:360:1: sparse: sparse: symbol '__ia32_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:361:1: sparse: sparse: symbol '__x64_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:361:1: sparse: sparse: symbol '__ia32_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:362:1: sparse: sparse: symbol '__x64_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:362:1: sparse: sparse: symbol '__ia32_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__x64_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__ia32_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__ia32_compat_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:369:1: sparse: sparse: symbol '__ia32_compat_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__x64_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__ia32_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:374:1: sparse: sparse: symbol '__x64_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:374:1: sparse: sparse: symbol '__ia32_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:375:1: sparse: sparse: symbol '__ia32_sys_kexec_file_load' was not declared. Should it be static?
   kernel/sys_ni.c:378:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:378:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:379:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:379:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__x64_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__ia32_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:381:1: sparse: sparse: symbol '__ia32_compat_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:384:1: sparse: sparse: symbol '__x64_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:384:1: sparse: sparse: symbol '__ia32_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__x64_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__ia32_sys_spu_run' was not declared. Should it be static?

vim +/__x64_sys_process_mrelease +284 kernel/sys_ni.c

   271	
   272	/* mm/, CONFIG_MMU only */
   273	COND_SYSCALL(swapon);
   274	COND_SYSCALL(swapoff);
   275	COND_SYSCALL(mprotect);
   276	COND_SYSCALL(msync);
   277	COND_SYSCALL(mlock);
   278	COND_SYSCALL(munlock);
   279	COND_SYSCALL(mlockall);
   280	COND_SYSCALL(munlockall);
   281	COND_SYSCALL(mincore);
   282	COND_SYSCALL(madvise);
   283	COND_SYSCALL(process_madvise);
 > 284	COND_SYSCALL(process_mrelease);
   285	COND_SYSCALL(remap_file_pages);
   286	COND_SYSCALL(mbind);
   287	COND_SYSCALL_COMPAT(mbind);
   288	COND_SYSCALL(get_mempolicy);
   289	COND_SYSCALL_COMPAT(get_mempolicy);
   290	COND_SYSCALL(set_mempolicy);
   291	COND_SYSCALL_COMPAT(set_mempolicy);
   292	COND_SYSCALL(migrate_pages);
   293	COND_SYSCALL_COMPAT(migrate_pages);
   294	COND_SYSCALL(move_pages);
   295	COND_SYSCALL_COMPAT(move_pages);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
