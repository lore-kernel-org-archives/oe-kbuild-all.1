Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5337F721
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241087; cv=none; b=IY2hIoIIwSuLPt+obsidu9iZPPbNvKsrOijfuOhcp0c0Hgz+vTMG/oDoaEzDvY8VAsvzYE0VZxVBwInJfSoZOLK0Hk+5aVt+UnxAvzKkIHqj3pxiEJhg9J3h9D5VfykD3kx4HYIaPnXmfEzJ8WbyHKZIX/x5orVMxFJN8Lz1/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241087; c=relaxed/simple;
	bh=msN1r6LqQKaLnzzKDClX353rKg2UoerFY6LMpEDzQrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iOPbCwWyPZWqHAQA4Bh5OCGS6LUx8AI6KQV24KUjhuN2wjwXdM00c2qrcAgamNMx06ThpgA+UICCL9JN517yl61EVuyS8CokE6FewFddg5drYCDUJeg4txDPt7jcOn0LFQbeX33K4QnaICceNr6qR4kh8sXXTkBkyBMaQ+lZBUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0e1FgB8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0e1FgB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768241086; x=1799777086;
  h=date:from:to:cc:subject:message-id;
  bh=msN1r6LqQKaLnzzKDClX353rKg2UoerFY6LMpEDzQrg=;
  b=O0e1FgB8FWrpNxe7nceXZW4U1i52Efg/4opVoDxWvhW8n31R1dTAeGDB
   uo1CEfKmWBNOMCDCTFpStpSkHXPqRoBO9nm2M7sX7bzRYLPaeZ1ym74Ak
   RxPl1qOUdHWRVD9xkSdMTtZKO/6W9ZoRmFJCWeur90AChPodkU6vPPn33
   1cvm53X+159g+MypOrqs5QgCoECnVqY9XnLfh91zLocgXYYDThht1Kw5x
   skMZYhiAMEZRFzMFJDX+D9Lncq3wO5ap4V+YNHVLBlPoWu4NzBvgPgc3Q
   AckFXClehz5LZnV/iEbpyp6IRFRJAs+XlCy+ZfRiXjhxhzTENH461A+7h
   Q==;
X-CSE-ConnectionGUID: ol47wBTES6KOg1M+DvtCYg==
X-CSE-MsgGUID: H2yRDdArQSyJPyudX5KU7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68525869"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68525869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:04:45 -0800
X-CSE-ConnectionGUID: zDrs2G8WSp2iXD9cQP3A7Q==
X-CSE-MsgGUID: 0Z4YNi0kS1WZq1z8aowkgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="227398832"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 10:04:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfMHR-00000000Di0-1NwG;
	Mon, 12 Jan 2026 18:04:41 +0000
Date: Tue, 13 Jan 2026 02:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 include/linux/minmax.h:93:30: warning: large integer implicitly truncated to
 unsigned type
Message-ID: <202601130116.e7iXv0Le-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Huang,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   61696be7d168821cd5d06be99980a27a34dbab12
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b [1/1] resource, kunit: add test case for region_intersects()
config: arm-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130116.e7iXv0Le-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130116.e7iXv0Le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130116.e7iXv0Le-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15:0,
                    from kernel/resource.c:15:
   kernel/resource.c: In function 'gfr_start':
>> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                 ^
   include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
     __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   kernel/resource.c:1838:9: note: in expansion of macro 'min_t'
      end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
            ^~~~~
   kernel/resource.c: In function 'gfr_continue':
>> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                 ^
   include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
     __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   kernel/resource.c:1855:11: note: in expansion of macro 'min_t'
      addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
              ^~~~~


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
