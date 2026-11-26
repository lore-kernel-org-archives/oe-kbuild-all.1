Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696798;
	b=37TJbnhxnjaZl4wsIvUd9SOu+52gbopyFmCSYEjYrm4AgulKAdMtriugnixQje0MP5lS
	 h0Ts4+6ZHFEig8cnnflEW6DjzPaXnWJQYLy2FsdfG5sm+36/8M7WMadZLU6oSdWvsRSDQ
	 z8jE6IX+L0gGFTLoh0h0CJj1+f6Wez/MxbNlHyF1/4lmLYwW7u04wVjEUQHDV7GJ3nodW
	 6MZT+dUKt/aFotA4Lx2suDAnVzlw2fHXboYoWMiV+bHjtJ3qyjeLZy8TTupkis7wIRM07
	 Pa2FynY1WpSHxPL4yA2N81NelnhbST927/tyi2WwJ+9inuaIQ967j7VYgdKeOSPM7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s1YhxHTsj4qcWVTzptzqlKTxIgI+FCISc6m5u0pbfTk=;
	b=oq5zEJRxNqVo7AkhhCjgPgPpwOqAtt/xWB92UUl5rid8HvYtovqkTpmgJ10GJap+cU9e
	 x6R5d6x/Cq1Mn0frXbJjguoYZdYyCpL/KFajjGjrWEUet9CVqIXQ+qS5ZfBdYK5IE33rJ
	 cDhfcIGELlWhuuT3N3YZDwWhHB0d/eYsl4+ibie3nI0CHdT5idgH3t3YV2MyKqNnhCMF7
	 tMtigdUAALEnuPxREZ2XbPKwCUudIWqzTOreyPJTulWSNfac1cVRuE7DBUXNBa/jPc6i8
	 /4VXyAWBtRfLXzzlnT51veXgFbTYFSJtL9sxNwPKE4SOB+E+KwGYTGk12NLusFEHH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1sNbyj+;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F882606A32E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F882606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1sNbyj+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795696799; x=1827232799;
  h=date:from:to:cc:subject:message-id;
  bh=SAxbJWRD0Th3sJpoDmrK+wyPqX0GTqQP1ITTYhWbqP4=;
  b=V1sNbyj+I9UEjuLRvAgP6BaRJe6rXvA6/tGbLig5mhsErUwbacoFf2CZ
   BJiE4hV9luePrenKqDcBUnuC9DYpiTf1k2x9v25hNJRBCRVkksXUvEV3D
   sau8Jjxlf6GD85DIUmTZuW0gclAWs//HpZtL4idE4/hjneigeH2hU/Tv2
   qpq6eW6FFZijYxQaYCtK2Qg9PMO+ZH6AQioOPRSPYDs74e+BZoILbv/et
   IUiz8Ps01/rM9KyH8zC1dtS+IRZ+ThD9326Yirx7XpES2bQauqJvcf/AD
   itxTSuRuWXWrnaxorjd3A7+nLr1Dt0wdruQK2Qwj3UWX3EcGmcin3UIv8
   g==;
X-CSE-ConnectionGUID: fzLLbDhuSv+DoRro2w+t4g==
X-CSE-MsgGUID: 6cnpyUZ+RsS/0aUpWz31UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4615147"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4615147"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:39:58 -0800
X-CSE-ConnectionGUID: jRMrEt6+SHO+CmDhaBBaDA==
X-CSE-MsgGUID: kczn4tWJTDuMLmjx6okh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13932144"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Nov 2026 04:39:56 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYlV-0000000003e-1qEa;
	Thu, 26 Nov 2026 12:39:53 +0000
Date: Thu, 26 Nov 2026 13:39:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 1/1]
 include/linux/minmax.h:93:37: warning: conversion from 'long long unsigned
 int' to 'resource_size_t' {aka 'unsigned int'} changes value from
 '68719476735' to '4294967295'
Message-ID: <20261126133256.pf0yDLEK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Huang,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   96e6653e8ca7d0446e82ff4170986314fd2fece2
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b [1/1] resource, kunit: add test case for region_intersects()
config: arm-randconfig-2002-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126133256.pf0yDLEK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126133256.pf0yDLEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 99185c10d5d9 ("resource, kunit: add test case for region_intersects()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126133256.pf0yDLEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15,
                    from kernel/resource.c:15:
   kernel/resource.c: In function 'gfr_start':
>> include/linux/minmax.h:93:37: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '68719476735' to '4294967295' [-Woverflow]
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                     ^
   include/linux/minmax.h:96:9: note: in expansion of macro '__cmp_once_unique'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   kernel/resource.c:1838:23: note: in expansion of macro 'min_t'
    1838 |                 end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
         |                       ^~~~~
   kernel/resource.c: In function 'gfr_continue':
>> include/linux/minmax.h:93:37: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '68719476735' to '4294967295' [-Woverflow]
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                     ^
   include/linux/minmax.h:96:9: note: in expansion of macro '__cmp_once_unique'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   kernel/resource.c:1855:25: note: in expansion of macro 'min_t'
    1855 |                 addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
         |                         ^~~~~


vim +93 include/linux/minmax.h

d03eba99f5bf7cb David Laight   2023-09-18  91  
017fa3e89187848 Linus Torvalds 2024-07-28  92  #define __cmp_once_unique(op, type, x, y, ux, uy) \
017fa3e89187848 Linus Torvalds 2024-07-28 @93  	({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
017fa3e89187848 Linus Torvalds 2024-07-28  94  

:::::: The code at line 93 was first introduced by commit
:::::: 017fa3e89187848fd056af757769c9e66ac3e93d minmax: simplify and clarify min_t()/max_t() implementation

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
