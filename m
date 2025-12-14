Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F706299A90
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765699204; cv=none; b=Rg3oWONV1sHaV5ouFfiguVpG/Et/3X4i0D+HwG9evBx+zGFJDvJwbHGv6Sem7kkBA5AcnbEYmHueIXir54D1wqvFZHteDR55pWc0H+y0zIsOol9HX4JqrpW2c6JCGzkoglxq9oJu3seMc/36cQNodYV4zTzS/R9iE2K13520h3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765699204; c=relaxed/simple;
	bh=yMC9SvWOMETaVlNCXMZ0JyJLQp2wVS6w2Ao6R74SLHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msq9Rc/ReC+Om8xYp1eSM+quuRwsLu/+n3DkMPzT62UPvARGuJK3wHuaZ6rjIK4w5IxrXHR0j6fYhgilQ20kZ4BxFKkbSLWZBDunl96W1Wi3NscbcSjpRIFound7Fs3fxk2NSK/MDnk5i6aqXfnRfj9lY+BEyd3TzhGwzEtkwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7ihS1GG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7ihS1GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765699202; x=1797235202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMC9SvWOMETaVlNCXMZ0JyJLQp2wVS6w2Ao6R74SLHM=;
  b=n7ihS1GGEnJdtsnRe6hY7T5upvHAS2wPZIPMG9J3ZTGbfVIi4jwSaKHf
   8UZ2/m7d+THQQ/7GzgJiQk1jj2WLofu7odjOE+GRJmxIK8T+joPky4otH
   vD80gC+HLTjjCMOS92Kwjpz/mCmlWpmqIebjTLNzLioL+6B948ziQ+ozd
   giulgyQAtALOnaNmpUmcRJtbkllblLceUwLiDHB0zOZrVpyO5BFharGqV
   IzEmnL4s/rrr4K2+7XDfcDI1Gtp4xCoHOJCy0/nTaukUKgu1ywH0tt0r/
   buyHv68UZC6z6C0J9/m6Gtt+0kCY/uAzJfSE0L6ZEAmsdS9dnRmCXorNk
   A==;
X-CSE-ConnectionGUID: fmrdld5rR6yFkvX3d20Rnw==
X-CSE-MsgGUID: JgjhVxXaSTGHmCWfL6I6Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="55197635"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="55197635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:59:59 -0800
X-CSE-ConnectionGUID: 8JZXon3nRKW3sptG7tSTOA==
X-CSE-MsgGUID: xLzyyRGsR+6OZ9zcYZnIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197223726"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 23:59:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUh1H-000000008qJ-2eyp;
	Sun, 14 Dec 2025 07:59:55 +0000
Date: Sun, 14 Dec 2025 15:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3408/3408] kernel/sys_ni.c:268:1: sparse:
 sparse: symbol '__x64_sys_landlock_create_ruleset' was not declared. Should
 it be static?
Message-ID: <202512141511.RqzYxh3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 21dd31f58b64b122a2d9fb62669d6191d1cf2c0f [3408/3408] landlock: Add syscall implementations
config: x86_64-randconfig-121-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141511.RqzYxh3e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141511.RqzYxh3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141511.RqzYxh3e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:195:1: sparse: sparse: symbol '__x64_sys_mq_timedsend_time32' was not declared. Should it be static?
   kernel/sys_ni.c:197:1: sparse: sparse: symbol '__x64_sys_mq_timedreceive_time32' was not declared. Should it be static?
   kernel/sys_ni.c:198:1: sparse: sparse: symbol '__ia32_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:199:1: sparse: sparse: symbol '__ia32_compat_sys_mq_notify' was not declared. Should it be static?
   kernel/sys_ni.c:200:1: sparse: sparse: symbol '__ia32_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:201:1: sparse: sparse: symbol '__ia32_compat_sys_mq_getsetattr' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__x64_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__ia32_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:206:1: sparse: sparse: symbol '__ia32_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:207:1: sparse: sparse: symbol '__ia32_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__ia32_compat_sys_old_msgctl' was not declared. Should it be static?
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
>> kernel/sys_ni.c:268:1: sparse: sparse: symbol '__x64_sys_landlock_create_ruleset' was not declared. Should it be static?
>> kernel/sys_ni.c:268:1: sparse: sparse: symbol '__ia32_sys_landlock_create_ruleset' was not declared. Should it be static?
>> kernel/sys_ni.c:269:1: sparse: sparse: symbol '__x64_sys_landlock_add_rule' was not declared. Should it be static?
>> kernel/sys_ni.c:269:1: sparse: sparse: symbol '__ia32_sys_landlock_add_rule' was not declared. Should it be static?
>> kernel/sys_ni.c:270:1: sparse: sparse: symbol '__x64_sys_landlock_restrict_self' was not declared. Should it be static?
>> kernel/sys_ni.c:270:1: sparse: sparse: symbol '__ia32_sys_landlock_restrict_self' was not declared. Should it be static?
   kernel/sys_ni.c:275:1: sparse: sparse: symbol '__x64_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:275:1: sparse: sparse: symbol '__ia32_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:276:1: sparse: sparse: symbol '__ia32_compat_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:292:1: sparse: sparse: symbol '__ia32_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:293:1: sparse: sparse: symbol '__ia32_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:294:1: sparse: sparse: symbol '__ia32_compat_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:296:1: sparse: sparse: symbol '__ia32_compat_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:298:1: sparse: sparse: symbol '__ia32_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__ia32_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__ia32_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:304:1: sparse: sparse: symbol '__ia32_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:305:1: sparse: sparse: symbol '__x64_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:305:1: sparse: sparse: symbol '__ia32_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:306:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:307:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:315:1: sparse: sparse: symbol '__ia32_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:319:1: sparse: sparse: symbol '__ia32_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__ia32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:322:1: sparse: sparse: symbol '__ia32_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:323:1: sparse: sparse: symbol '__ia32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:324:1: sparse: sparse: symbol '__ia32_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:325:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:326:1: sparse: sparse: symbol '__ia32_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:327:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:343:1: sparse: sparse: symbol '__ia32_sys_execveat' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__x64_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:365:1: sparse: sparse: symbol '__ia32_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__x64_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__ia32_sys_pciconfig_write' was not declared. Should it be static?

vim +/__x64_sys_landlock_create_ruleset +268 kernel/sys_ni.c

   257	
   258	/* mm/nommu.c, also with MMU */
 > 259	COND_SYSCALL(mremap);
   260	
   261	/* security/keys/keyctl.c */
 > 262	COND_SYSCALL(add_key);
 > 263	COND_SYSCALL(request_key);
   264	COND_SYSCALL(keyctl);
   265	COND_SYSCALL_COMPAT(keyctl);
   266	
   267	/* security/landlock/syscalls.c */
 > 268	COND_SYSCALL(landlock_create_ruleset);
 > 269	COND_SYSCALL(landlock_add_rule);
 > 270	COND_SYSCALL(landlock_restrict_self);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
