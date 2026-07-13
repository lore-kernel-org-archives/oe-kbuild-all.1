Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A278F3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976918; cv=none; b=t9XbOWMujuiLJVVj8OJImj707gvA0MxvqGkOphrPOwnF0yOZggqT/2Bn05+AUKDj3YgTiF48BHmpmEeBoS+DDHSkRYK8k3voObylwXSRKUYMjgynSkvD39BQ3M6pYNYiAuLSWRc5KYA9KhR6PWT1jc80cDCgxwadXGilmqmr5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976918; c=relaxed/simple;
	bh=4jC5BDls/JWZUGIDU2rwJ4Mc8RcJ+piRe4RZWvvCiFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QkEsu+728cCTPB93GNA8VqQT3Bv8qV7tgZjs56pMNPgLO52pffkHjDxa5gpY8tEaE4id0S4dND85JZ0rJK4B0ew29rYBjLkxXkeHFqTVWVd3OmbW9uXSrCEcuYYTYdShdu+G8duQ3pW5yBd3C6bBnHFZyohUdffwpRWeueV03XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg0WW5Ut; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg0WW5Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783976916; x=1815512916;
  h=date:from:to:cc:subject:message-id;
  bh=4jC5BDls/JWZUGIDU2rwJ4Mc8RcJ+piRe4RZWvvCiFo=;
  b=bg0WW5UtUbdglIAy5GJOqZV1KlWI4MtY/WGUyOMu4rQd8AjnJi9kUx0q
   5Ze3iJh/fREj09o8hqK+j87XH9uAi6nqnWsheMgWkcr3MdRFAac2Xr35X
   8k8h4RJlUAS5GbNZ9wvq2ogk7Z1+Tup5w+z6NtR+b/PhKfW/3gdLQsEIz
   0Ok9nBit34dfKgBPwy1XybjlNscQUZWuMuN69vvpu0JnHrbzPNWteWJFL
   l4QIxkLeyGK0kbifEAwN32XMdnZDGBFyK7XkZ2xVnEZZpydLyyDsQmb+s
   SHm620gliSawM7sSouHJiqz4YkIiLu/6bUN37KJWt1Y9eJ8S4ZQZXr1jH
   g==;
X-CSE-ConnectionGUID: 2GtOj/CSQSypoQjklGwwIw==
X-CSE-MsgGUID: EPpBpM4LRQ+SLMkQ+StEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83713136"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83713136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 14:08:35 -0700
X-CSE-ConnectionGUID: tc1bgJXsQOyqn3/+ZM8aEw==
X-CSE-MsgGUID: 93Kn7fwkRvedt3KPnBni2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251231258"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jul 2026 14:08:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjNsz-00000000M41-0r6S;
	Mon, 13 Jul 2026 21:08:31 +0000
Date: Tue, 14 Jul 2026 05:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cwang@multikernel.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:seccomp-pinned-memfd-remote 3/8]
 include/uapi/asm-generic/mman-common.h:21:9: warning: 'MAP_TYPE' redefined
Message-ID: <202607140421.sQchvGWt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/congwang/linux.git seccomp-pinned-memfd-remote
head:   a1dd66697189e5897e848eeda268ea2997ebe279
commit: 6ea2e7d2758698b92d07e23ee484f0e53a1134b0 [3/8] seccomp: introduce SECCOMP_IOCTL_NOTIF_PIN_INSTALL
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260714/202607140421.sQchvGWt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140421.sQchvGWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140421.sQchvGWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/seccomp.c:52:
>> include/uapi/asm-generic/mman-common.h:21:9: warning: 'MAP_TYPE' redefined
      21 | #define MAP_TYPE        0x0f            /* Mask for type of mapping */
         |         ^~~~~~~~
   In file included from arch/parisc/include/asm/mman.h:6,
                    from include/uapi/linux/mman.h:5,
                    from include/linux/mman.h:10,
                    from kernel/seccomp.c:48:
   arch/parisc/include/uapi/asm/mman.h:14:9: note: this is the location of the previous definition
      14 | #define MAP_TYPE        0x2b            /* Mask for type of mapping, includes bits 0x08 and 0x20 */
         |         ^~~~~~~~
>> include/uapi/asm-generic/mman-common.h:22:9: warning: 'MAP_FIXED' redefined
      22 | #define MAP_FIXED       0x10            /* Interpret addr exactly */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:15:9: note: this is the location of the previous definition
      15 | #define MAP_FIXED       0x04            /* Interpret addr exactly */
         |         ^~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:23:9: warning: 'MAP_ANONYMOUS' redefined
      23 | #define MAP_ANONYMOUS   0x20            /* don't use a file */
         |         ^~~~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:16:9: note: this is the location of the previous definition
      16 | #define MAP_ANONYMOUS   0x10            /* don't use a file */
         |         ^~~~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:26:9: warning: 'MAP_POPULATE' redefined
      26 | #define MAP_POPULATE            0x008000        /* populate (prefault) pagetables */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:23:9: note: this is the location of the previous definition
      23 | #define MAP_POPULATE    0x10000         /* populate (prefault) pagetables */
         |         ^~~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:27:9: warning: 'MAP_NONBLOCK' redefined
      27 | #define MAP_NONBLOCK            0x010000        /* do not block on IO */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:24:9: note: this is the location of the previous definition
      24 | #define MAP_NONBLOCK    0x20000         /* do not block on IO */
         |         ^~~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:28:9: warning: 'MAP_STACK' redefined
      28 | #define MAP_STACK               0x020000        /* give out an address that is best suited for process/thread stacks */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:25:9: note: this is the location of the previous definition
      25 | #define MAP_STACK       0x40000         /* give out an address that is best suited for process/thread stacks */
         |         ^~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:29:9: warning: 'MAP_HUGETLB' redefined
      29 | #define MAP_HUGETLB             0x040000        /* create a huge page mapping */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:26:9: note: this is the location of the previous definition
      26 | #define MAP_HUGETLB     0x80000         /* create a huge page mapping */
         |         ^~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:30:9: warning: 'MAP_SYNC' redefined
      30 | #define MAP_SYNC                0x080000 /* perform synchronous page faults for the mapping */
         |         ^~~~~~~~
   include/linux/mman.h:32:9: note: this is the location of the previous definition
      32 | #define MAP_SYNC 0
         |         ^~~~~~~~
>> include/uapi/asm-generic/mman-common.h:33:9: warning: 'MAP_UNINITIALIZED' redefined
      33 | #define MAP_UNINITIALIZED 0x4000000     /* For anonymous mmap, memory could be
         |         ^~~~~~~~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:28:9: note: this is the location of the previous definition
      28 | #define MAP_UNINITIALIZED 0             /* uninitialized anonymous mmap */
         |         ^~~~~~~~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:41:9: warning: 'MS_ASYNC' redefined
      41 | #define MS_ASYNC        1               /* sync memory asynchronously */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:31:9: note: this is the location of the previous definition
      31 | #define MS_ASYNC        2               /* sync memory asynchronously */
         |         ^~~~~~~~
>> include/uapi/asm-generic/mman-common.h:42:9: warning: 'MS_INVALIDATE' redefined
      42 | #define MS_INVALIDATE   2               /* invalidate the caches */
         |         ^~~~~~~~~~~~~
   arch/parisc/include/uapi/asm/mman.h:32:9: note: this is the location of the previous definition
      32 | #define MS_INVALIDATE   4               /* invalidate the caches */
         |         ^~~~~~~~~~~~~
>> include/uapi/asm-generic/mman-common.h:43:9: warning: 'MS_SYNC' redefined
      43 | #define MS_SYNC         4               /* synchronous memory sync */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/mman.h:30:9: note: this is the location of the previous definition
      30 | #define MS_SYNC         1               /* synchronous memory sync */
         |         ^~~~~~~


vim +/MAP_TYPE +21 include/uapi/asm-generic/mman-common.h

5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  19  
746c9398f5ac2b3 include/uapi/asm-generic/mman-common.h Michael S. Tsirkin 2019-02-08  20  /* 0x01 - 0x03 are defined in linux/mman.h */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @21  #define MAP_TYPE	0x0f		/* Mask for type of mapping */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @22  #define MAP_FIXED	0x10		/* Interpret addr exactly */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @23  #define MAP_ANONYMOUS	0x20		/* don't use a file */
4ed28639519c7ba include/uapi/asm-generic/mman-common.h Michal Hocko       2018-04-10  24  
8aa3c927ec10d12 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  25  /* 0x0100 - 0x4000 flags are defined in asm-generic/mman.h */
8aa3c927ec10d12 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16 @26  #define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
8aa3c927ec10d12 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16 @27  #define MAP_NONBLOCK		0x010000	/* do not block on IO */
8aa3c927ec10d12 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16 @28  #define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
8aa3c927ec10d12 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16 @29  #define MAP_HUGETLB		0x040000	/* create a huge page mapping */
22fcea6f85f2cc7 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16 @30  #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
4ed28639519c7ba include/uapi/asm-generic/mman-common.h Michal Hocko       2018-04-10  31  #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  32  
0bf5f9492389aa8 include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16 @33  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
0bf5f9492389aa8 include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16  34  					 * uninitialized */
0bf5f9492389aa8 include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16  35  
b0f205c2a3082dd include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  36  /*
b0f205c2a3082dd include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  37   * Flags for mlock
b0f205c2a3082dd include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  38   */
b0f205c2a3082dd include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  39  #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
b0f205c2a3082dd include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  40  
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @41  #define MS_ASYNC	1		/* sync memory asynchronously */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @42  #define MS_INVALIDATE	2		/* invalidate the caches */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @43  #define MS_SYNC		4		/* synchronous memory sync */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  44  

:::::: The code at line 21 was first introduced by commit
:::::: 5f6164f3092832e0d9b12eed52e09a76bf39c64a [PATCH] add asm-generic/mman.h

:::::: TO: Michael S. Tsirkin <mst@mellanox.co.il>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
