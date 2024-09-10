Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336E37165
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725932069; cv=none; b=YI3T5ox3i7keOS6kMGKwj/Zl2lVNYlyNiDAvqwN72OjIohJWvxHUCunCVGGm46aBfR5vILVosUhTfpx3qAukWnXTt4P94QNoK0o8I2F+w9d6OGJSC9b8VT7eADYwKBpZ3JhkDpLf7bZv4Tb64OBmF5sOt8kslTPYUm4THdH2vzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725932069; c=relaxed/simple;
	bh=QUxtSaAYmpbUkzJjIR2faDH04Hu615Kv8ZqRCadnoaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQIQVaZi+WFmm3MpZSBw63bS0eQIe40FbAREPOE7rmpiJmzdVP4LM6E/XgLGH5eiQWlyjy2H2jLO2fCl9HwcSicXOaRmXTWwFeDdM5CdzdX5Z5Bs3Z4RGnIN+LPIaUvosbmFWJRjhAXdDIUcCpJsLo91xUGB3oWtqYcY+Eg+Ua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2tAZNDB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2tAZNDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725932067; x=1757468067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QUxtSaAYmpbUkzJjIR2faDH04Hu615Kv8ZqRCadnoaA=;
  b=N2tAZNDBwHpbis1B4zwxpLo3KzQyRqH1FrY5OruzhBDswRVx3IUWqVzf
   HaXVUtDqVMlLy/DQESyvWrZ1S6BTzb1T7cRKjFzYEJVV0guCcvxXW1x2b
   oPQoVBsXeqYD7+hNwPMuzT13StR14ymRGHIrDxx3Fn79La5XxhcfNLV2D
   FVsQuFkxc1Rjc7qeXhzdr5Iyj0OX+mnk0CFJN6hzG43sfdQB+B7BqfrSr
   LCD/WwT3fPybUo6OLPZNoxJJOsw+q2p/JWzQh3oXVAinTnhkAiEpEvWYW
   gMwgw9Y6VIskcqbhL1uZg3aksCDY2wg2EmN3euKySqhT7fX9XokU0NEdl
   A==;
X-CSE-ConnectionGUID: oMP8y7jqTvGqVHhifCxwUA==
X-CSE-MsgGUID: eq6Zn7RjQ4i9PhOuYwNjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24767191"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24767191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:34:27 -0700
X-CSE-ConnectionGUID: SfIMpeOFTu+Z/gtDDSDxng==
X-CSE-MsgGUID: 2cw/JPAmQWKMh4bhmsf4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71828487"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Sep 2024 18:34:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snplv-000FSY-0v;
	Tue, 10 Sep 2024 01:34:23 +0000
Date: Tue, 10 Sep 2024 09:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10352/10516] include/linux/mm.h:101:35: error:
 'MAX_PHYSMEM_BITS' undeclared
Message-ID: <202409100913.RxkfrKU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15,
                    from kernel/resource.c:15:
   kernel/resource.c: In function 'gfr_start':
>> include/linux/mm.h:101:35: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
     101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:38: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   kernel/resource.c:1874:23: note: in expansion of macro 'min_t'
    1874 |                 end = min_t(resource_size_t, base->end, PHYSMEM_END);
         |                       ^~~~~
   kernel/resource.c:1874:57: note: in expansion of macro 'PHYSMEM_END'
    1874 |                 end = min_t(resource_size_t, base->end, PHYSMEM_END);
         |                                                         ^~~~~~~~~~~
   include/linux/mm.h:101:35: note: each undeclared identifier is reported only once for each function it appears in
     101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:38: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   kernel/resource.c:1874:23: note: in expansion of macro 'min_t'
    1874 |                 end = min_t(resource_size_t, base->end, PHYSMEM_END);
         |                       ^~~~~
   kernel/resource.c:1874:57: note: in expansion of macro 'PHYSMEM_END'
    1874 |                 end = min_t(resource_size_t, base->end, PHYSMEM_END);
         |                                                         ^~~~~~~~~~~
   kernel/resource.c: In function 'gfr_continue':
>> include/linux/mm.h:101:35: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
     101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:38: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   kernel/resource.c:1891:24: note: in expansion of macro 'min_t'
    1891 |                addr <= min_t(resource_size_t, base->end, PHYSMEM_END);
         |                        ^~~~~
   kernel/resource.c:1891:58: note: in expansion of macro 'PHYSMEM_END'
    1891 |                addr <= min_t(resource_size_t, base->end, PHYSMEM_END);
         |                                                          ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/MAX_PHYSMEM_BITS +101 include/linux/mm.h

d07e22597d1d35 Daniel Cashman  2016-01-14   99  
ea72ce5da22806 Thomas Gleixner 2024-08-14  100  #ifndef PHYSMEM_END
ea72ce5da22806 Thomas Gleixner 2024-08-14 @101  # define PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
ea72ce5da22806 Thomas Gleixner 2024-08-14  102  #endif
ea72ce5da22806 Thomas Gleixner 2024-08-14  103  

:::::: The code at line 101 was first introduced by commit
:::::: ea72ce5da22806d5713f3ffb39a6d5ae73841f93 x86/kaslr: Expose and use the end of the physical memory address space

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
