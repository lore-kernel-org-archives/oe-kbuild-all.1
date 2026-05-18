Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DF384CEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130245; cv=none; b=T7MnccolnWc6x78a910vrSoMD8rhJ6C/POYi70KftciSFW189GoGucl3QKDxvRVrqQYLTELFg1tOj2jt9M49+u0VpFiP5N2k/GhQPCeTZ48Kv7spJYAklXhAMxmtelk/kj8e0RCj7NVaFBz0aYFU20EF+0rjX9zaP68NtXb/h0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130245; c=relaxed/simple;
	bh=i7BLZfkVXAOpmWJyd6GA6+xE20MAIF0yrjnJod7pgEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g/lFQyzIiPGjItTX+Unkaf7OCQNhqixt2TDoMN6t4LzmSGCbPZXPJPojVgKlg3Uqtc6LsUKgtvwJrn3YdCJC3KfJWTQgQDSMyQecSZLORZl6tjvMHOzlbUIjdJyOMG8aTUAAOYkiEJC+Q9+dAr4QUwbNHuXmHNM89fE9GYYLLF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QctH4dFz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QctH4dFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779130245; x=1810666245;
  h=date:from:to:cc:subject:message-id;
  bh=i7BLZfkVXAOpmWJyd6GA6+xE20MAIF0yrjnJod7pgEU=;
  b=QctH4dFz80G8bXnjAau23FCiPV20ch93CvjyET2NiT7ftcTe+HotiObk
   79EjULQU5xf8N6fa7Z0suJkUrgZiQ+zY/a8ozETVMxB8jYScsosIxF1l3
   S6aqJ+3EU2ZN56zpxGPR3/EY4wNqCOdJFibaHOdFRnYa5iOi9s5Z9oypc
   2qF6V8nIR8zkL0wuNO8j+Sc5ytVtKjw7Gmibpd5S0K4XsOj88uS3jdq+y
   40lXKhL/oVlsKcpooKKouQJedZHcHu6P1g9G4JBhDz4qR9ldEqyAWTWb4
   49kLskSoGLvtEF0AoKWA0gG3xBklgnCQ7EUjfbwI+022cHO6m26TmvjBZ
   g==;
X-CSE-ConnectionGUID: moBiVoVSSCmbcwIHQBSYVg==
X-CSE-MsgGUID: NwkDox8MQ2u/7IZdwenQUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79136241"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79136241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 11:50:42 -0700
X-CSE-ConnectionGUID: 6k4Om+gzQLacrMu5wsrz9Q==
X-CSE-MsgGUID: myZR39q1SjeiBgWn+kSu/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239771241"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2026 11:50:41 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP330-000000003HQ-010v;
	Mon, 18 May 2026 18:50:38 +0000
Date: Tue, 19 May 2026 02:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 206/238]
 arch/sparc/kernel/ldc.c:1001:22: warning: variable 'order' set but not used
Message-ID: <202605190211.QNv3gBO4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 827f3babf39f0eb767d7e347bd5e45cb6657c0b2 [206/238] sparc: replace __get_free_pages() with kmalloc()
config: sparc64-randconfig-r073-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190211.QNv3gBO4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190211.QNv3gBO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190211.QNv3gBO4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/sparc/kernel/ldc.c:1001:22: warning: variable 'order' set but not used [-Wunused-but-set-variable]
    1001 |         unsigned long size, order;
         |                             ^
   arch/sparc/kernel/ldc.c:1103:42: warning: variable 'order' set but not used [-Wunused-but-set-variable]
    1103 |         unsigned long num_tsb_entries, tsbsize, order;
         |                                                 ^
   2 warnings generated.


vim +/order +1001 arch/sparc/kernel/ldc.c

e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09   998  
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09   999  static void free_queue(unsigned long num_entries, struct ldc_packet *q)
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1000  {
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09 @1001  	unsigned long size, order;
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1002  
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1003  	if (!q)
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1004  		return;
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1005  
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1006  	size = num_entries * LDC_PACKET_SIZE;
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1007  	order = get_order(size);
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1008  
827f3babf39f0e arch/sparc/kernel/ldc.c   Mike Rapoport (Microsoft  2026-02-10  1009) 	kfree((void *)(unsigned long)q);
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1010  }
e53e97ce3c7119 arch/sparc64/kernel/ldc.c David S. Miller           2007-07-09  1011  

:::::: The code at line 1001 was first introduced by commit
:::::: e53e97ce3c7119199d2788d8fd1618efa9c2d1eb [SPARC64]: Add LDOM virtual channel driver and VIO device layer.

:::::: TO: David S. Miller <davem@sunset.davemloft.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
