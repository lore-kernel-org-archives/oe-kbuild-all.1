Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646020;
	b=LRyVVfnaYDDAZDkVEUEnGHKtCWqq0j8PkyhvlTQZG1O/NrWGwAJ/QpeGcLz+/H93ndWm
	 rNS7D8gOmKWSnh0+dM63ZIIAiJI92v/lmVVbPkZu4RmKD+FkXDrpwPaI/MBx2XxJRtXyF
	 maIWR5CoWTdLMfAuOor37IldT4bAvnShwrjf7xMpP3kE+0xYKugTWmF/gcw7tBXXiQeTl
	 nX8QEFGg04MBaMHAFMBIyuk3dsh6htgHL85QcZ65pu2dME0xe/auLjijJheJS6ZNO+zIT
	 u2aBPVJlFZmT+k5RSucT8mQ6hMFmv+WTz7wgk+8UJmFFfJVRp+H7BOYJ6QLE7lZGzAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5R69Md8es7PuWV9p8MCvzJEgtmf78UBan1fjwOXPhpg=;
	b=stYfIbUcl+syKppHWi4VZNjvnXgC3WCCANaY33qU0udRiAaPBf72hs2TaElNETBBzFVO
	 tNCXajW+tca3r2CREHAcCX3ZXYSJdYWKJ7uBRFlZKkA4AdQjT59U1/n0e98j3+08amwHK
	 7HbVJ0UkcnJjpww0YVvrRSX26mFwoBUrF4MpnDCpKHjR+CY36sg1qKtBuUVmu+TUmP2EX
	 qyhPdpm9+BaTQxlj5IGO/gVBoIWfoM0MiVo/zY6stP4YPD1avpuGgolWAPEfy1l+qKJjI
	 mZty/jag5MwEQhAOAbUIiPN1Ux15HiI/02ORp5L5fSJEkKx3r+sUCjtdb7Tb49kkTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JbMw0xGn;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42E606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 05:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC42E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JbMw0xGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792646018; x=1824182018;
  h=date:from:to:cc:subject:message-id;
  bh=ACn7GZ11slScmNI4xIqtvZzcLobs6jbi2SR9M1XvB+Q=;
  b=JbMw0xGnooHKZvwlSCrZyCOm77PSTiCxZDaUVEE+f0SJVvocFwX3MGph
   o2hUgOqJDTGlqKqoqZ23Wt8pI5o2W8oO1R8LKmiGK98OnXo2epJDI7DBz
   4Tig9oi3P86CknMroR47lu73w060pZC0qw659VqsnI0jYUzG58JI2LCBH
   yzYEuDpFDboz4hzDrSSReE111QSMSzY+zDqw2gcWErE23FYyt4IYN3sr+
   LmAgW5bVggtieckfmOR8NYnxxlMVQakfiR1+JdSsF5zMWT/0wKDcDW7Tw
   Xjgsed19VKJJYvOPkwYJjgfUWmLhY++0n+hBgQzOStbDQCJbxoVXGThCb
   w==;
X-CSE-ConnectionGUID: iX6XEtBLSFKBZ2yAWzDqyw==
X-CSE-MsgGUID: SI494nWLS1ONZlJjvvms6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1385970"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1385970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 22:13:38 -0700
X-CSE-ConnectionGUID: 4x5PvGHkSuKTUOZy4Sz+SA==
X-CSE-MsgGUID: xufhmHJ/T5aRKt2oE81VvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3153131"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2026 22:13:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJl7M-000000000El-2Wbh;
	Thu, 22 Oct 2026 05:13:32 +0000
Date: Thu, 22 Oct 2026 07:12:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:b4/memalloc-prof-dont-waste-slabobj-ext-metadata
 7/18] radix-tree.c:1603:61: error: 'SLAB_MAY_ACCOUNT' undeclared; did you
 mean 'SLAB_ACCOUNT'?
Message-ID: <202610220721.Zgxl2HrQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git b4/memalloc-prof-dont-waste-slabobj-ext-metadata
head:   4eb758f1c30dafac114e68279058434bf6e617d9
commit: ee54e427065efb193ec34ec9db714ecce6eed651 [7/18] lib/xarray: specify SLAB_MAY_ACCOUNT for radix_tree_node cache
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261022/202610220721.Zgxl2HrQ-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220721.Zgxl2HrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220721.Zgxl2HrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from radix-tree.c:26:
   radix-tree.c: In function 'radix_tree_init':
>> radix-tree.c:1603:61: error: 'SLAB_MAY_ACCOUNT' undeclared (first use in this function); did you mean 'SLAB_ACCOUNT'?
    1603 |                         SLAB_PANIC | SLAB_RECLAIM_ACCOUNT | SLAB_MAY_ACCOUNT,
         |                                                             ^~~~~~~~~~~~~~~~
   ../../include/linux/slab.h:183:78: note: in definition of macro 'kmem_cache_create'
     183 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                                              ^~~~~~~~~~~
   radix-tree.c:1603:61: note: each undeclared identifier is reported only once for each function it appears in
    1603 |                         SLAB_PANIC | SLAB_RECLAIM_ACCOUNT | SLAB_MAY_ACCOUNT,
         |                                                             ^~~~~~~~~~~~~~~~
   ../../include/linux/slab.h:183:78: note: in definition of macro 'kmem_cache_create'
     183 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                                              ^~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
