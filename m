Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99B29D287
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764321; cv=none; b=iJ77aAHFx4WwRbxEatHeC84Hz0F8V8/PLohGw5f6I2y9Gxt4fJPl00epUX3vBni/a6wC5/3r8+/T5hz4YJa8EHVhodaX28V1tsJ/9b9xnGRXDaX+YIvx330wq7WbtgDg9UMwx4JSpJEilc5OCB+Eg7yjCqKWevuHW62/uf2ix0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764321; c=relaxed/simple;
	bh=k4oEwTjVYf43rMGx8qJl3QPloHzIciTkwmJoIevQdH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLZrGDtiL4wy2xgmuV8nEdd+jrbI4KrwIPnfAfwNNLqN4546WxfzQvlxSu7JF2bJFkUKHzgAzuPFvwjhOotdQZ8xc/8FysrCyNNAf3H20cVyhQVYbQN1ya4FF+itaZDvRoo4JVZXYqUmzes0+oKT9Uhkpo83QDCIUePQohyjfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHImx66y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHImx66y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764764320; x=1796300320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4oEwTjVYf43rMGx8qJl3QPloHzIciTkwmJoIevQdH4=;
  b=KHImx66yIgurLNDvjFIYhWrsaEJ1YPeksvlzhlc4wD2P0xopA7IehoOz
   qgQfCuEgCBxxKRvBRIDIT6Lg0Xw5DdOr50hUleOGgx7u5fkT/nNsYriVC
   6kysThECixeoGT5StCo/g6MilmCl6Gq7hnbwWXHAoTxOMdoWuV9I/Q3UB
   OCHhBBjihjhDCLnGq+k8Y6v3GjLHN6guITrvKXZdvTmrO5OxwFIXSQ9jU
   9pmV/CgdDrRixLRgf5hIaZpFGS7NrxX0jMdS49oH4RL4NyeywpUhndNk3
   asyi7KWnJKit+EDGEuAVp4XAJGJnL2TXuzdlU4QhfuIbGlhbvN50cy/XS
   w==;
X-CSE-ConnectionGUID: g7CnkMubQ/m04D45z/8itA==
X-CSE-MsgGUID: RQtWjWb6RVSjxZaZC33+zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84154023"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="84154023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:18:37 -0800
X-CSE-ConnectionGUID: 55APLAduQN6pu86UUluEvg==
X-CSE-MsgGUID: L05ptMRQQxSu+B6Zh1PhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199620719"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2025 04:18:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQloW-00000000Axd-0xxR;
	Wed, 03 Dec 2025 12:18:32 +0000
Date: Wed, 3 Dec 2025 20:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Kai <liukai284@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3450/3450] kernel/xsched/vstream.c:660:1: error:
 conflicting types for 'sys_xsched_setattr'
Message-ID: <202512032006.udjnn6SV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c22cbd025b67d03da84cc988561b6a758e882ee
commit: 7d2bb3c7646cf1ebe76de965c3b31d7bc2b89845 [3450/3450] xsched: fix compile error when CONFIG_XCU_SCHEDULER is disabled
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251203/202512032006.udjnn6SV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032006.udjnn6SV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032006.udjnn6SV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:21:
   include/linux/syscalls.h:954:54: warning: declaration of 'struct xsched_attr' will not be visible outside of this function [-Wvisibility]
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^
   include/linux/syscalls.h:955:54: warning: declaration of 'struct xsched_attr' will not be visible outside of this function [-Wvisibility]
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^
>> kernel/xsched/vstream.c:660:1: error: conflicting types for 'sys_xsched_setattr'
     660 | SYSCALL_DEFINE2(xsched_setattr, pid_t, pid, struct xsched_attr __user *, arg)
         | ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFINE2'
     222 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:232:2: note: expanded from macro 'SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DEFINEx'
     246 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^
   <scratch space>:72:1: note: expanded from here
      72 | sys_xsched_setattr
         | ^
   include/linux/syscalls.h:954:17: note: previous declaration is here
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                 ^
>> kernel/xsched/vstream.c:665:1: error: conflicting types for 'sys_xsched_getattr'
     665 | SYSCALL_DEFINE2(xsched_getattr, pid_t, pid, struct xsched_attr __user *, arg)
         | ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFINE2'
     222 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:232:2: note: expanded from macro 'SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DEFINEx'
     246 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^
   <scratch space>:127:1: note: expanded from here
     127 | sys_xsched_getattr
         | ^
   include/linux/syscalls.h:955:17: note: previous declaration is here
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                 ^
   2 warnings and 2 errors generated.


vim +/sys_xsched_setattr +660 kernel/xsched/vstream.c

   659	
 > 660	SYSCALL_DEFINE2(xsched_setattr, pid_t, pid, struct xsched_attr __user *, arg)
   661	{
   662		return 0;
   663	}
   664	
 > 665	SYSCALL_DEFINE2(xsched_getattr, pid_t, pid, struct xsched_attr __user *, arg)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
