Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A144C68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726386940; cv=none; b=jIymgSNLosKW9l9fcLQGm/49f3zvREsAICyduhYZ9ESs9pwFNzYiuaGKbQ2NrQlTttMRN0RYBzjokGrGpg4wWzqlidI1UzlBIhqin4Nd2jN3PYEmpf/p8bbJvweHMEbo2RcBrHkeQg1owwYr/Ar+SAVF7CmwJ/rVSG1q8/z0HtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726386940; c=relaxed/simple;
	bh=xnw8yQYG02rpUnmKwwn4KFVj8A8LBBVzV72IFn2dQok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5RY+UGUTt2sykoDrDxEV/TKou7PKBLADjq07FCsctr7AMoMWrZBx9GwhKSgo5t+aRlej+YoMYXQU6RRxIGe8Tzf9InbbzIgMbhH/kRSiA2kMII6SiEnnisN9Y0eSERlSSycqnEiPlLrOpkFrj71KNu+t4jIOJ/nl7MHaS3j2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyfQUf0z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyfQUf0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726386939; x=1757922939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnw8yQYG02rpUnmKwwn4KFVj8A8LBBVzV72IFn2dQok=;
  b=VyfQUf0z4cRsKJf9fDzI72uRx9Y27cLbGeYWRCtj0uoJSqOtQD3ALU3F
   EJc0v9+wxaHKk7JTtF/HsEO+GTsfL70vLaysyAHWSLuDleHBQiF76hkKo
   P7iYhk1kE15fStRv13bvredjvYLBw3LWpNehPsWArtScdYscEG2eoyDH+
   ObR4vSJuB3+gEGkXFTc2rbhVu5hqj7LUa1fUxOuNZ2QvURy3tzNAHzn1k
   40VyZ8l9hS9pEm0xKDc5TAI12icuW6sJ7f05uA3xrMW40eu3giS8gqeqI
   va8HrPdqhMhEsJRM7RJeVZ/qE85R9PQAsUex7sD2iHUl3a6z0HVFcM/oJ
   w==;
X-CSE-ConnectionGUID: en7Wu1MuRS6EUL03XoEpsQ==
X-CSE-MsgGUID: TeRgd1l5Q5iLdrQwms37GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25400022"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25400022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 00:55:37 -0700
X-CSE-ConnectionGUID: ioNv4QWSRceVj6mYjBfEqA==
X-CSE-MsgGUID: VMY3uJWMRa2iNJHfeiecYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="68800143"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 00:55:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spk6Y-0008Va-06;
	Sun, 15 Sep 2024 07:55:34 +0000
Date: Sun, 15 Sep 2024 15:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18175/23714]
 include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of
 type 'void *', but argument 38 has type 'int'
Message-ID: <202409151507.N1J0YpSk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 2d2fe6b40444bd8f84f674930ac5f98a6314702e [18175/23714] ascend: mm: add an owner for mm_struct
config: arm64-randconfig-r051-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151507.N1J0YpSk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151507.N1J0YpSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151507.N1J0YpSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from mm/debug.c:9:
   mm/debug.c: In function 'dump_mm':
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of type 'void *', but argument 38 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 39 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 40 has type 'const long unsigned int *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:8:25: note: in expansion of macro 'KERN_SOH'
       8 | #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
         |                         ^~~~~~~~
   include/linux/printk.h:342:16: note: in expansion of macro 'KERN_EMERG'
     342 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   mm/debug.c:117:9: note: in expansion of macro 'pr_emerg'
     117 |         pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
         |         ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
