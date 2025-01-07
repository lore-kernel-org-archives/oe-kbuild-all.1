Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569E18EAB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272995; cv=none; b=kt9qADiNbcW8hnwtlYfvSZXEmq6SH/P/XmybjzXDWjdDfNSWM3YFjTBt4R5gZGCYfDf1kADPb670dAEzv3RK3doY6G+ufFKjmYUM+R+BYdzi7wkRFLjtSRwxPToDSP8bD4tP6nJ6409n4uPLVm2rFt/Q1yJp3gWvFPma2HoinOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272995; c=relaxed/simple;
	bh=Out9VPrtCqzENqSbZe2Gs18juMhuV9aCVH478P7evNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n27gqmrs5eYSnZolfSqcocPWjmeUhJEWis3x+hPhUJrsp6bg4IT1Vs+CmEVB3gsRc0LqwhgfybwKYnCpjYqEgM2tGpeZ1ho+TIinMtYDXEvNEAprptONv08vsTi8kPFbT6PPfSBdk6zv4FDc/WNynAQKjV4IXlje1Bkiw1fB7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI1qYSRL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI1qYSRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736272992; x=1767808992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Out9VPrtCqzENqSbZe2Gs18juMhuV9aCVH478P7evNA=;
  b=nI1qYSRL/aUE3YRu1j3ZGZuJc6SBmUNCkkH1YGlT3Y6PRUrG4Odb0N/5
   Jd8C8lfbstxX3q/cWHQ10k2zPMFrX6E9mfjqzmhDRQJ3KURR5xf442aUy
   5DUTcre4DtNE1beLALkw2SLvqpEB1hY8rZydhbjPK8z0GB0Mo+rXVUxVM
   Ms7sonllA+0sdX1asWN+cB+A36zsM5ih76K9tQ8x8OAij7LzJvnLV5gMH
   DwHkJKoCogaT1wzw7Vr3/vuVygWNIYktfzgPYJoUB1CS7cYbvzADYZeHX
   KGTMbpaYdSbZEMbv6ZyV8XqKNvnoCzBDDMvXPttJ7fnklrgDsmQDLHTfA
   w==;
X-CSE-ConnectionGUID: wArVyz4VTpaTBm7ss+4TfA==
X-CSE-MsgGUID: jq921nGgSWiRJGkUvWPSxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36355754"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36355754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:03:11 -0800
X-CSE-ConnectionGUID: acr018HrTyCNUVWw+pzCUA==
X-CSE-MsgGUID: TQ5a9GjoS3OH3jeQ7dwX5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107892731"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2025 10:03:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVDv1-000F4L-0A;
	Tue, 07 Jan 2025 18:03:07 +0000
Date: Wed, 8 Jan 2025 02:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Ying <ying.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/minmax.h:93:37: warning: conversion from 'long long
 unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from
 '68719476735' to '4294967295'
Message-ID: <202501080156.C8DDTI70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b resource, kunit: add test case for region_intersects()
date:   4 months ago
config: arm-randconfig-r006-20230802 (https://download.01.org/0day-ci/archive/20250108/202501080156.C8DDTI70-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080156.C8DDTI70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080156.C8DDTI70-lkp@intel.com/

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

d03eba99f5bf7c David Laight   2023-09-18  91  
017fa3e8918784 Linus Torvalds 2024-07-28  92  #define __cmp_once_unique(op, type, x, y, ux, uy) \
017fa3e8918784 Linus Torvalds 2024-07-28 @93  	({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
017fa3e8918784 Linus Torvalds 2024-07-28  94  

:::::: The code at line 93 was first introduced by commit
:::::: 017fa3e89187848fd056af757769c9e66ac3e93d minmax: simplify and clarify min_t()/max_t() implementation

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
