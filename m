Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A8F9D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732070141; cv=none; b=p6nrJPzTB+YWMuBp3fZjZtfWNM3rgQi3GdyHx/tUlIYuIofO+r98yFQbfmrzMwl0Tk0NSf5xhiqEdk3Ko2zeRpktVyMWjKF6FaT7z32Wnc2Akd5YokpsHGyA6bT/lZwZW9gndmxTipUpoUHZPURikvtpl4eYu1gRVc8gq7DnV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732070141; c=relaxed/simple;
	bh=NRVUAxN3NmimXHcy7DWTmyUyQ8v2Ze4mURzquOvOJ1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEaFkBiLsr83uJgVFPrqjljwk0h1Q+WqV3drAccseuip2e0wn+CxYXYQPwwK/3y1V1+H4lnqYjNaUmJCR0EFhLVCAVITY/w1a8k5/80RSnWTyQx9T91I7TwfT9zC491ZqYdSIyGx6ioqkCcBJQEioaZ9fjNI2VmtR4ndP1FayyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcCoNCAi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcCoNCAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732070138; x=1763606138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRVUAxN3NmimXHcy7DWTmyUyQ8v2Ze4mURzquOvOJ1I=;
  b=YcCoNCAinarp6t+9J5jAaWxTEfpsAPMrDW8ifThJmbmI+eASqlZV3arG
   4V7aLJLmXeWw2/t6y335xo5CLg155DOmQg+OdvmdGzdkemnSU/Tq7YmFB
   CyRP4LH6ujysoczZ1t3u8baQK5BFjrhaoNgezXLpxhzbGnkB0qPwhs1Zi
   A0Bdruw0RI8Rr4mecQquN+QwxIfwkK8BVQBohJ4xeWL8YoDese9bP/jOQ
   B72bWcmD3T6K0mWK1lKmVTylO0ibSQVtUDeVLGB9T6/KIXXCE3UKjYFkP
   MjxtxALvuauljEYF7QetjgnF04HZSZ2XRTvkynQA4hMtOZlwGpImiPHFz
   g==;
X-CSE-ConnectionGUID: 26q9YP3jTM2SbhhOB9AR7w==
X-CSE-MsgGUID: zHOvfnZWQ5miQ08F3jqrgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32359968"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="32359968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 18:35:38 -0800
X-CSE-ConnectionGUID: cYjkNR15R2W6+BQxC6gCJg==
X-CSE-MsgGUID: uaAopuYXS8CbeAVOthdLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="120617644"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2024 18:35:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDaZ4-0000S9-0N;
	Wed, 20 Nov 2024 02:35:34 +0000
Date: Wed, 20 Nov 2024 10:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] kernel/sys_ni.c:271:1: sparse:
 sparse: symbol '__x32_compat_sys_fadvise64_64' was not declared. Should it
 be static?
Message-ID: <202411201047.0almZYd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e74aedc9df70f84e50a280478b93d98b3a622bc3
commit: 57d1e11f97da27878e7c1f810a5f10257a043e10 [2430/2430] kernel/sys_ni: add compat entry for fadvise64_64
config: x86_64-randconfig-121-20241114 (https://download.01.org/0day-ci/archive/20241120/202411201047.0almZYd0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201047.0almZYd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201047.0almZYd0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys_ni.c:205:1: sparse: sparse: symbol '__ia32_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:206:1: sparse: sparse: symbol '__ia32_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:207:1: sparse: sparse: symbol '__ia32_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:207:1: sparse: sparse: symbol '__x32_compat_sys_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__ia32_compat_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:208:1: sparse: sparse: symbol '__x32_compat_sys_old_msgctl' was not declared. Should it be static?
   kernel/sys_ni.c:209:1: sparse: sparse: symbol '__ia32_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__ia32_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:210:1: sparse: sparse: symbol '__x32_compat_sys_msgrcv' was not declared. Should it be static?
   kernel/sys_ni.c:211:1: sparse: sparse: symbol '__ia32_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__ia32_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:212:1: sparse: sparse: symbol '__x32_compat_sys_msgsnd' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__x64_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:216:1: sparse: sparse: symbol '__ia32_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:217:1: sparse: sparse: symbol '__ia32_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__ia32_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:218:1: sparse: sparse: symbol '__x32_compat_sys_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__ia32_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:219:1: sparse: sparse: symbol '__x32_compat_sys_old_semctl' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__x64_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:221:1: sparse: sparse: symbol '__ia32_sys_semtimedop_time32' was not declared. Should it be static?
   kernel/sys_ni.c:222:1: sparse: sparse: symbol '__ia32_sys_semop' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__x64_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:226:1: sparse: sparse: symbol '__ia32_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:227:1: sparse: sparse: symbol '__ia32_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__ia32_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:228:1: sparse: sparse: symbol '__x32_compat_sys_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__ia32_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:229:1: sparse: sparse: symbol '__x32_compat_sys_old_shmctl' was not declared. Should it be static?
   kernel/sys_ni.c:230:1: sparse: sparse: symbol '__ia32_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__ia32_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:231:1: sparse: sparse: symbol '__x32_compat_sys_shmat' was not declared. Should it be static?
   kernel/sys_ni.c:243:1: sparse: sparse: symbol '__ia32_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__ia32_compat_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:244:1: sparse: sparse: symbol '__x32_compat_sys_setsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:245:1: sparse: sparse: symbol '__ia32_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__ia32_compat_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:246:1: sparse: sparse: symbol '__x32_compat_sys_getsockopt' was not declared. Should it be static?
   kernel/sys_ni.c:249:1: sparse: sparse: symbol '__ia32_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:250:1: sparse: sparse: symbol '__ia32_compat_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:250:1: sparse: sparse: symbol '__x32_compat_sys_recvfrom' was not declared. Should it be static?
   kernel/sys_ni.c:251:1: sparse: sparse: symbol '__ia32_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:252:1: sparse: sparse: symbol '__ia32_compat_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:252:1: sparse: sparse: symbol '__x32_compat_sys_sendmsg' was not declared. Should it be static?
   kernel/sys_ni.c:253:1: sparse: sparse: symbol '__ia32_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:254:1: sparse: sparse: symbol '__ia32_compat_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:254:1: sparse: sparse: symbol '__x32_compat_sys_recvmsg' was not declared. Should it be static?
   kernel/sys_ni.c:264:1: sparse: sparse: symbol '__ia32_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:265:1: sparse: sparse: symbol '__ia32_compat_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:265:1: sparse: sparse: symbol '__x32_compat_sys_keyctl' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__x64_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:270:1: sparse: sparse: symbol '__ia32_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:271:1: sparse: sparse: symbol '__ia32_compat_sys_fadvise64_64' was not declared. Should it be static?
>> kernel/sys_ni.c:271:1: sparse: sparse: symbol '__x32_compat_sys_fadvise64_64' was not declared. Should it be static?
   kernel/sys_ni.c:287:1: sparse: sparse: symbol '__ia32_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:287:1: sparse: sparse: symbol '__x32_compat_sys_mbind' was not declared. Should it be static?
   kernel/sys_ni.c:288:1: sparse: sparse: symbol '__ia32_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:289:1: sparse: sparse: symbol '__ia32_compat_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:289:1: sparse: sparse: symbol '__x32_compat_sys_get_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:291:1: sparse: sparse: symbol '__ia32_compat_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:291:1: sparse: sparse: symbol '__x32_compat_sys_set_mempolicy' was not declared. Should it be static?
   kernel/sys_ni.c:293:1: sparse: sparse: symbol '__ia32_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:293:1: sparse: sparse: symbol '__x32_compat_sys_migrate_pages' was not declared. Should it be static?
   kernel/sys_ni.c:294:1: sparse: sparse: symbol '__ia32_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:295:1: sparse: sparse: symbol '__ia32_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:295:1: sparse: sparse: symbol '__x32_compat_sys_move_pages' was not declared. Should it be static?
   kernel/sys_ni.c:299:1: sparse: sparse: symbol '__ia32_sys_recvmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__x64_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:300:1: sparse: sparse: symbol '__ia32_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:301:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:301:1: sparse: sparse: symbol '__x32_compat_sys_recvmmsg_time32' was not declared. Should it be static?
   kernel/sys_ni.c:302:1: sparse: sparse: symbol '__ia32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:302:1: sparse: sparse: symbol '__x32_compat_sys_recvmmsg_time64' was not declared. Should it be static?
   kernel/sys_ni.c:310:1: sparse: sparse: symbol '__ia32_sys_fanotify_mark' was not declared. Should it be static?
   kernel/sys_ni.c:314:1: sparse: sparse: symbol '__ia32_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:315:1: sparse: sparse: symbol '__ia32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:315:1: sparse: sparse: symbol '__x32_compat_sys_open_by_handle_at' was not declared. Should it be static?
   kernel/sys_ni.c:317:1: sparse: sparse: symbol '__ia32_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:318:1: sparse: sparse: symbol '__ia32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:318:1: sparse: sparse: symbol '__x32_compat_sys_sendmmsg' was not declared. Should it be static?
   kernel/sys_ni.c:319:1: sparse: sparse: symbol '__ia32_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:320:1: sparse: sparse: symbol '__x32_compat_sys_process_vm_readv' was not declared. Should it be static?
   kernel/sys_ni.c:321:1: sparse: sparse: symbol '__ia32_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:322:1: sparse: sparse: symbol '__ia32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:322:1: sparse: sparse: symbol '__x32_compat_sys_process_vm_writev' was not declared. Should it be static?
   kernel/sys_ni.c:338:1: sparse: sparse: symbol '__ia32_sys_execveat' was not declared. Should it be static?

vim +/__x32_compat_sys_fadvise64_64 +271 kernel/sys_ni.c

   268	
   269	/* mm/fadvise.c */
   270	COND_SYSCALL(fadvise64_64);
 > 271	COND_SYSCALL_COMPAT(fadvise64_64);
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
