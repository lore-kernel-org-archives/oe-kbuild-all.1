Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F373F871A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370836; cv=none; b=jxHiUoiwdoapZ+ONlOjwKbYARBs335F9ZL7DfjuQA2+m66faQZykkJoKh5yBSiNu0fsCoZpxFNIFamBvkNsJvZNjpxO5mbJMFEvkhdtJ8hoPi407F2IKiMgWRcJBKp99dLwHrEJkJd27DDCTIKMgAcKHHJ2/yvyxZ1yWJLEo6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370836; c=relaxed/simple;
	bh=ft4POSmlQNc8C5wXPMMVppaKeE7MDnXoYya3cMP18ss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M7i+pKLPS9TwBrgyt07wgkZ4f92N020vhQSm0przHjdO+Sk6L/Fz+rhd6ZCM7ci8XZyvkPZsBM2P/KxFIhMbSLyFUexXSzBfZpVgXIMsk5bGpOjQTXeaVBZsiDEjUE/Q9UxsS4ziZKnqgHw0ct89Z+Mkhb315OOeVpff/18bHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkKF+zNE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkKF+zNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779370833; x=1810906833;
  h=date:from:to:cc:subject:message-id;
  bh=ft4POSmlQNc8C5wXPMMVppaKeE7MDnXoYya3cMP18ss=;
  b=nkKF+zNE3MBniHp/jWUfst6JlKB4K6IXGMxVAz7voM9NYJvpPk+DzXR/
   quZDzd7KZRIOa5yi6d5a7WzAVV8XiUgMF2xLQGDG1Ftzo68nXgbjPq4U6
   /FmuLwRgf+z5irFKXw8/chijnjjgmWO0sF+N1HrJe4tKKR16mf7PsDF4r
   qhhNiONJEmNHCgYVD9/nRnBzDr33xYg8GBYFWh1u5qnrXADLZOPwwlers
   591RGAWDGhcYtM8j9uiYs51/wqM5JmT2Fk828WIRYxDhr2EXns/OVcXvF
   bbIpGaP1v3ohHN3dcsPa9g3Z02YHvH/kQy+NwifxVwisX4z9SQsJr0elX
   w==;
X-CSE-ConnectionGUID: tO4RnFJjSC2LT69FiKeefg==
X-CSE-MsgGUID: 4B1daStOTtGdrh8iWDf90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321683"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80321683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:40:30 -0700
X-CSE-ConnectionGUID: S6ycXT01TEec3cfoEWvKuQ==
X-CSE-MsgGUID: 4SzrSoTzTPydHJfWQBgGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239517098"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 06:40:29 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3dS-000000000MX-07SX;
	Thu, 21 May 2026 13:40:26 +0000
Date: Thu, 21 May 2026 21:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 119/1130]
 kernel/signal.c:4475:67: error: passing argument 1 of '__put_user_ptr_fn'
 from incompatible pointer type
Message-ID: <202605212146.XRzwzdlt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 512f28310eef3c8b55b1d9362a5dddbdff952583 [119/1130] [CHERRY-PICK] kernel/signal: Use appropriate user pointer interfaces
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605212146.XRzwzdlt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212146.XRzwzdlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212146.XRzwzdlt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/task.h:13,
                    from kernel/signal.c:20:
   include/linux/uaccess.h:726:9: warning: 'get_user_ptr' redefined
     726 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^~~~~~~~~~~~
   In file included from arch/csky/include/asm/uaccess.h:201,
                    from include/linux/uaccess.h:12:
   include/asm-generic/uaccess.h:259:9: note: this is the location of the previous definition
     259 | #define get_user_ptr(x, ptr)                                    \
         |         ^~~~~~~~~~~~
   include/linux/uaccess.h:727:9: warning: 'put_user_ptr' redefined
     727 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^~~~~~~~~~~~
   include/asm-generic/uaccess.h:218:9: note: this is the location of the previous definition
     218 | #define put_user_ptr(x, ptr)                                    \
         |         ^~~~~~~~~~~~
   kernel/signal.c: In function '__save_altstack':
>> kernel/signal.c:4475:67: error: passing argument 1 of '__put_user_ptr_fn' from incompatible pointer type [-Wincompatible-pointer-types]
    4475 |         int err = __put_user_ptr(uaddr_to_user_ptr(t->sas_ss_sp), &uss->ss_sp) |
         |                                                                   ^~~~~~~~~~~
         |                                                                   |
         |                                                                   void **
   include/asm-generic/uaccess.h:245:51: note: in definition of macro '__put_user_ptr_fn'
     245 | #define __put_user_ptr_fn(u, k) __put_user_ptr_fn(u, k)
         |                                                   ^
   kernel/signal.c:4475:19: note: in expansion of macro '__put_user_ptr'
    4475 |         int err = __put_user_ptr(uaddr_to_user_ptr(t->sas_ss_sp), &uss->ss_sp) |
         |                   ^~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:238:47: note: expected 'const void **' but argument is of type 'void **'
     238 | __put_user_ptr_fn(const void __user * __user *ptr,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +/__put_user_ptr_fn +4475 kernel/signal.c

  4471	
  4472	int __save_altstack(stack_t __user *uss, unsigned long sp)
  4473	{
  4474		struct task_struct *t = current;
> 4475		int err = __put_user_ptr(uaddr_to_user_ptr(t->sas_ss_sp), &uss->ss_sp) |
  4476			__put_user(t->sas_ss_flags, &uss->ss_flags) |
  4477			__put_user(t->sas_ss_size, &uss->ss_size);
  4478		return err;
  4479	}
  4480	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
