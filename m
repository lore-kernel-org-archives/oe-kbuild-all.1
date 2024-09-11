Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314DF1B2ECE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726075570; cv=none; b=jtwSiYVDAVEZNXqXwJbyCmxnkmHS3cwQ0pPKqs4Uxgl83IS8kf9mOQZv5mkWzE6Ub4lyebegc7j/BIlC98e/4WC+BQHqZyFXRDslHl1urwjQc2ScqE1n7JrKbeVAwbvy/a4imBjFiOQLB6lMwOdiuG0jU1snoPaXVSqNZArpDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726075570; c=relaxed/simple;
	bh=ecB3H0hsGH+5els2GrFnTuQUKaP772AYOWtt6okIhog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYGu+Nurq8kpJqTVZ4F1/UFNBTQmhJfPUncSPbsJmisJBEovfh9w++KPZ3AYMzTMgW2LPgFxRJLbxJzefHFLLD5eqBZpli5ebDRCKWmpVAK/sy+TTI4HcBFdzgOXLXex+LSscujXlqo9osy8w9AyhYaBrxW8hzXuSM9E8zrPREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjv7v6WW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjv7v6WW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726075569; x=1757611569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecB3H0hsGH+5els2GrFnTuQUKaP772AYOWtt6okIhog=;
  b=bjv7v6WWhjTTMTJ66QzO9q2PHqwGCp5dzQ+n39eEx+7akfrCqb5HkcQw
   ODsqDESgDCyS33wqBw1aswuMBpGGs3QtSIKUY525wq2LleP5QxmBnOPQv
   0+NsVfD6qAuZIGoqFRrR92u8cJM9W3WsZHPmdu7U561MAP16V2wvHX+Gl
   EFEnM/I1DxjZyNTW0ZyrSxs8HjUKW8yBp+z/yohFcuLDeCw91FDm7RZtA
   CdtWtjdhBhbleqxS2QK1GoqxKMps4PjIsAq4d17D713bU4CBYu2VZzLsL
   /JIvNw8NyKqrj49htH8jy5/H11Pr+EJdpuzlCD1Y5ml84raOkQYHWjzXC
   Q==;
X-CSE-ConnectionGUID: jb1briD7T6umFNJtVi6o0w==
X-CSE-MsgGUID: GV02KrJ6QhqvmirpNFPagw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36246208"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36246208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 10:26:08 -0700
X-CSE-ConnectionGUID: 7JAuNQ6DQfeE43OHrktztw==
X-CSE-MsgGUID: a7CosC92TEe6Jw8pbPLm0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67270071"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 10:26:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soR6S-0003tq-0p;
	Wed, 11 Sep 2024 17:26:04 +0000
Date: Thu, 12 Sep 2024 01:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15762/30000] kernel/sys_ni.c:301:1: sparse:
 sparse: symbol '__x64_sys_set_mempolicy_home_node' was not declared. Should
 it be static?
Message-ID: <202409120147.RVcM1s31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: 1e3451e075c8d91e3be398e395b9cfc9cf487d6d [15762/30000] mm/mempolicy: wire up syscall set_mempolicy_home_node
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409120147.RVcM1s31-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120147.RVcM1s31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120147.RVcM1s31-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sys_ni.c:268:1: sparse: sparse: symbol '__x64_sys_landlock_create_ruleset' was not declared. Should it be static?
   kernel/sys_ni.c:268:1: sparse: sparse: symbol '__ia32_sys_landlock_create_ruleset' was not declared. Should it be static?
   kernel/sys_ni.c:269:1: sparse: sparse: symbol '__x64_sys_landlock_add_rule' was not declared. Should it be static?
   kernel/sys_ni.c:269:1: sparse: sparse: symbol '__ia32_sys_landlock_add_rule' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__x64_sys_landlock_restrict_self' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__ia32_sys_landlock_restrict_self' was not declared. Should it be static?
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
>> kernel/sys_ni.c:301:1: sparse: sparse: symbol '__x64_sys_set_mempolicy_home_node' was not declared. Should it be static?
>> kernel/sys_ni.c:301:1: sparse: sparse: symbol '__ia32_sys_set_mempolicy_home_node' was not declared. Should it be static?
   kernel/sys_ni.c:305:1: sparse: sparse: symbol '__ia32_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:306:1: sparse: sparse: symbol '__x64_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:306:1: sparse: sparse: symbol '__ia32_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:307:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:308:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:316:1: sparse: sparse: symbol '__ia32_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__ia32_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:321:1: sparse: sparse: symbol '__ia32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:323:1: sparse: sparse: symbol '__ia32_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:324:1: sparse: sparse: symbol '__ia32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:325:1: sparse: sparse: symbol '__ia32_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:326:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:327:1: sparse: sparse: symbol '__ia32_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:328:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:344:1: sparse: sparse: symbol '__ia32_sys_execveat' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__x64_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:366:1: sparse: sparse: symbol '__ia32_sys_pciconfig_read' was not declared. Should it be static?
   kernel/sys_ni.c:367:1: sparse: sparse: symbol '__x64_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:367:1: sparse: sparse: symbol '__ia32_sys_pciconfig_write' was not declared. Should it be static?
   kernel/sys_ni.c:368:1: sparse: sparse: symbol '__x64_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:368:1: sparse: sparse: symbol '__ia32_sys_pciconfig_iobase' was not declared. Should it be static?
   kernel/sys_ni.c:371:1: sparse: sparse: symbol '__x64_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:371:1: sparse: sparse: symbol '__ia32_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:372:1: sparse: sparse: symbol '__ia32_compat_sys_socketcall' was not declared. Should it be static?
   kernel/sys_ni.c:375:1: sparse: sparse: symbol '__ia32_compat_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:378:1: sparse: sparse: symbol '__x64_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:378:1: sparse: sparse: symbol '__ia32_sys_vm86old' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__x64_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:380:1: sparse: sparse: symbol '__ia32_sys_vm86' was not declared. Should it be static?
   kernel/sys_ni.c:381:1: sparse: sparse: symbol '__ia32_sys_kexec_file_load' was not declared. Should it be static?
   kernel/sys_ni.c:384:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:384:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_read' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__x64_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:385:1: sparse: sparse: symbol '__ia32_sys_s390_pci_mmio_write' was not declared. Should it be static?
   kernel/sys_ni.c:386:1: sparse: sparse: symbol '__x64_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:386:1: sparse: sparse: symbol '__ia32_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:387:1: sparse: sparse: symbol '__ia32_compat_sys_s390_ipc' was not declared. Should it be static?
   kernel/sys_ni.c:390:1: sparse: sparse: symbol '__x64_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:390:1: sparse: sparse: symbol '__ia32_sys_rtas' was not declared. Should it be static?
   kernel/sys_ni.c:391:1: sparse: sparse: symbol '__x64_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:391:1: sparse: sparse: symbol '__ia32_sys_spu_run' was not declared. Should it be static?
   kernel/sys_ni.c:392:1: sparse: sparse: symbol '__x64_sys_spu_create' was not declared. Should it be static?
   kernel/sys_ni.c:392:1: sparse: sparse: symbol '__ia32_sys_spu_create' was not declared. Should it be static?
   kernel/sys_ni.c:393:1: sparse: sparse: symbol '__x64_sys_subpage_prot' was not declared. Should it be static?
   kernel/sys_ni.c:393:1: sparse: sparse: symbol '__ia32_sys_subpage_prot' was not declared. Should it be static?
   kernel/sys_ni.c:405:1: sparse: sparse: symbol '__ia32_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:406:1: sparse: sparse: symbol '__ia32_compat_sys_signalfd' was not declared. Should it be static?
   kernel/sys_ni.c:409:1: sparse: sparse: symbol '__ia32_sys_fadvise64' was not declared. Should it be static?

vim +/__x64_sys_set_mempolicy_home_node +301 kernel/sys_ni.c

   277	
   278	/* mm/, CONFIG_MMU only */
   279	COND_SYSCALL(swapon);
   280	COND_SYSCALL(swapoff);
   281	COND_SYSCALL(mprotect);
   282	COND_SYSCALL(msync);
   283	COND_SYSCALL(mlock);
   284	COND_SYSCALL(munlock);
   285	COND_SYSCALL(mlockall);
   286	COND_SYSCALL(munlockall);
   287	COND_SYSCALL(mincore);
   288	COND_SYSCALL(madvise);
   289	COND_SYSCALL(process_madvise);
   290	COND_SYSCALL(remap_file_pages);
   291	COND_SYSCALL(mbind);
   292	COND_SYSCALL_COMPAT(mbind);
   293	COND_SYSCALL(get_mempolicy);
   294	COND_SYSCALL_COMPAT(get_mempolicy);
   295	COND_SYSCALL(set_mempolicy);
   296	COND_SYSCALL_COMPAT(set_mempolicy);
   297	COND_SYSCALL(migrate_pages);
   298	COND_SYSCALL_COMPAT(migrate_pages);
   299	COND_SYSCALL(move_pages);
   300	COND_SYSCALL_COMPAT(move_pages);
 > 301	COND_SYSCALL(set_mempolicy_home_node);
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
