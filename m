Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567F186614
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726058215; cv=none; b=D4rh5gVwd9xV68tZRd4IlMw91rVIIaU2FgjSeUjmbaNeHaoyRtmPQmKHBhMhLg6yYY+a8LVk5oQtpJaacpK7nbLLM5PYMa0vbcEqWf7mRntL30jm9dFsx/jxwhGcnRTq6HbyAMtibBLLCAJBGuGw+16uR1My/fdy8pxMWFSX69c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726058215; c=relaxed/simple;
	bh=UcDkFYjiWs7WWABWaGsH5SaDcdIA9p1DQmDRgL4tTbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBraqn9L7vpevOgfv4N3xKX+QzLPZNEhsi6HEoO51DUhjaRnTD2EHCnfw/DiyLA3mv+vMLSXxJ31Ex7D3yAyI79w5tuuoDQQHKXW14Z1/3iYu/7BHIwqNjVPqi+GNsYJrLizpeY2FAXg5viONmRzuuuYUX+DjFAaHUAGiZQMw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6Xikv6s; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6Xikv6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726058214; x=1757594214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcDkFYjiWs7WWABWaGsH5SaDcdIA9p1DQmDRgL4tTbo=;
  b=j6Xikv6sR443BJNiOFykrXdBq9D2J0DWxIyVxeSfbk4G+yCsl6sWqL4B
   Es2Xxe/vrFMB7al21ZinjSldmB+vDAhOnoYTJqM3LwfEYPy7MKgZwehhC
   95IiVRuUtI4sRDI3vr4ug4PQAuoR6NKMHT86DLBUgvD/yfdbNcU9iKbZP
   QJzKtIMp7aY10NM5ex1r5N9TCk3hTTSCwEzY/8OFqxANRIdVy6cOisfD1
   Vp3ZXtRHiwlqY5Mp4+ApC/UQMMQJhH81tolncJW5rJI03Hl7Pt44ogwLP
   Or/V6k5wVDOfoThLvr4EqBUUr2uWOqdozW3fuB9NvowwY6xGHMXJfYk47
   Q==;
X-CSE-ConnectionGUID: p9P45WEqSm6ki9KYgpDicQ==
X-CSE-MsgGUID: mnEe60VqTeCEYG+/pBXtFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24956661"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24956661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 05:36:53 -0700
X-CSE-ConnectionGUID: EIh3dGraRcaF9Tf8ACo4sA==
X-CSE-MsgGUID: LEjx+HRWQHi22i0JMrA8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="104821555"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2024 05:36:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soMaX-0003YM-1R;
	Wed, 11 Sep 2024 12:36:49 +0000
Date: Wed, 11 Sep 2024 20:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14827/30000] kernel/sys_ni.c:268:1: sparse:
 sparse: symbol '__x64_sys_landlock_create_ruleset' was not declared. Should
 it be static?
Message-ID: <202409112049.JSlQcsk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fb74b7c6ee60eaba8d843255f6a09f6d1d6b8c33
commit: 21dd31f58b64b122a2d9fb62669d6191d1cf2c0f [14827/30000] landlock: Add syscall implementations
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240911/202409112049.JSlQcsk7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112049.JSlQcsk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112049.JSlQcsk7-lkp@intel.com/

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
