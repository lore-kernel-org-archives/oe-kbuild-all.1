Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875833A005
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977969; cv=none; b=cooti09u2f+F/CkGoOpcV1GEJTR0qjnOP9E6AK6RfFtV4ZOwBkhfqXq31ruZsS6ZdhfozIU6B8bWQMBeBHqvW/fgF+MnktnjUzhFWNdUWKYBcaX0OfmIG/2myn8csQ0wrkizdq4RWD1uDpJPgdo34LqCOAaqUXsFnpAYrsikt1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977969; c=relaxed/simple;
	bh=tZebGlq1/QroWx+3x/utP0XPuYVgJtZb6QdAdEJAZq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nc06WOGan2HpCQt89YEtHFqe5vRCaBRZt8vTvFgHlWZ435zf0zN3MAIgIO3y4kJKg3ch6wrgUJKWg5Nc8p9ws3afo5+WF3AEBHRkQrRHT9spsBZl0hhcEVF3BP43qhQukFPRUn2A6d6wl26DmKqiUaQbJq6MeDsGMzjoIuz3aek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iuu+HjhH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iuu+HjhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783977966; x=1815513966;
  h=date:from:to:cc:subject:message-id;
  bh=tZebGlq1/QroWx+3x/utP0XPuYVgJtZb6QdAdEJAZq4=;
  b=Iuu+HjhH1Jl5I3HGgCvYBqqSqyvwm4ecwIiPD2b76l74dt+P/gv3fwOE
   zyuPF5mGlk2kG0MGPN96Tf7lyHauvlMPJ1+9I3O7O11nEHfjM3GhqxWfD
   2Osxrf1vT0xjmwNXVWPZkDM8slb8onlNmJ08T5/QZmkqPWRN+LuQ2dp6v
   dLe28WQ0eklUlFK5qA6SwKLsOMQS98SPXwn8mcNosCUvxRrQaUGETjPPx
   p2Cce+X9XrqmNWiuDFo1wkNtqBmErxhdJ5wgtJtvw2wNYRYcl5Ab+xUxJ
   b5rFD96sfixP/lbn0AUa4aaLFuliY3qIafPK8XpQ3bWFIiSYG4jA76YGu
   w==;
X-CSE-ConnectionGUID: /j8mDOkMRW20NnU/9TFyZA==
X-CSE-MsgGUID: 9nLYNPmISk2W74BUhK0HAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88418856"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88418856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 14:26:05 -0700
X-CSE-ConnectionGUID: 8pdAgZ43TXeINc098NiOgQ==
X-CSE-MsgGUID: uK8n+kIRRsSIMELGgohq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252279004"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2026 14:26:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjOA5-00000000M4z-2f5W;
	Mon, 13 Jul 2026 21:26:01 +0000
Date: Tue, 14 Jul 2026 05:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cwang@multikernel.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:seccomp-pinned-memfd-remote 3/8]
 include/uapi/asm-generic/mman-common.h:31:9: warning: 'MAP_FIXED_NOREPLACE'
 redefined
Message-ID: <202607140556.Wkmgl0ou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/congwang/linux.git seccomp-pinned-memfd-remote
head:   a1dd66697189e5897e848eeda268ea2997ebe279
commit: 6ea2e7d2758698b92d07e23ee484f0e53a1134b0 [3/8] seccomp: introduce SECCOMP_IOCTL_NOTIF_PIN_INSTALL
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260714/202607140556.Wkmgl0ou-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140556.Wkmgl0ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140556.Wkmgl0ou-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/seccomp.c:52:
   include/uapi/asm-generic/mman-common.h:22:9: warning: 'MAP_FIXED' redefined
      22 | #define MAP_FIXED       0x10            /* Interpret addr exactly */
         |         ^~~~~~~~~
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/mman.h:10,
                    from kernel/seccomp.c:48:
   arch/alpha/include/uapi/asm/mman.h:15:9: note: this is the location of the previous definition
      15 | #define MAP_FIXED       0x100           /* Interpret addr exactly */
         |         ^~~~~~~~~
   include/uapi/asm-generic/mman-common.h:23:9: warning: 'MAP_ANONYMOUS' redefined
      23 | #define MAP_ANONYMOUS   0x20            /* don't use a file */
         |         ^~~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:16:9: note: this is the location of the previous definition
      16 | #define MAP_ANONYMOUS   0x10            /* don't use a file */
         |         ^~~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:26:9: warning: 'MAP_POPULATE' redefined
      26 | #define MAP_POPULATE            0x008000        /* populate (prefault) pagetables */
         |         ^~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:29:9: note: this is the location of the previous definition
      29 | #define MAP_POPULATE    0x20000         /* populate (prefault) pagetables */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:27:9: warning: 'MAP_NONBLOCK' redefined
      27 | #define MAP_NONBLOCK            0x010000        /* do not block on IO */
         |         ^~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:30:9: note: this is the location of the previous definition
      30 | #define MAP_NONBLOCK    0x40000         /* do not block on IO */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:28:9: warning: 'MAP_STACK' redefined
      28 | #define MAP_STACK               0x020000        /* give out an address that is best suited for process/thread stacks */
         |         ^~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:31:9: note: this is the location of the previous definition
      31 | #define MAP_STACK       0x80000         /* give out an address that is best suited for process/thread stacks */
         |         ^~~~~~~~~
   include/uapi/asm-generic/mman-common.h:29:9: warning: 'MAP_HUGETLB' redefined
      29 | #define MAP_HUGETLB             0x040000        /* create a huge page mapping */
         |         ^~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:32:9: note: this is the location of the previous definition
      32 | #define MAP_HUGETLB     0x100000        /* create a huge page mapping */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:30:9: warning: 'MAP_SYNC' redefined
      30 | #define MAP_SYNC                0x080000 /* perform synchronous page faults for the mapping */
         |         ^~~~~~~~
   include/linux/mman.h:32:9: note: this is the location of the previous definition
      32 | #define MAP_SYNC 0
         |         ^~~~~~~~
>> include/uapi/asm-generic/mman-common.h:31:9: warning: 'MAP_FIXED_NOREPLACE' redefined
      31 | #define MAP_FIXED_NOREPLACE     0x100000        /* MAP_FIXED which doesn't unmap underlying mapping */
         |         ^~~~~~~~~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:33:9: note: this is the location of the previous definition
      33 | #define MAP_FIXED_NOREPLACE     0x200000/* MAP_FIXED which doesn't unmap underlying mapping */
         |         ^~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:33:9: warning: 'MAP_UNINITIALIZED' redefined
      33 | #define MAP_UNINITIALIZED 0x4000000     /* For anonymous mmap, memory could be
         |         ^~~~~~~~~~~~~~~~~
   include/linux/mman.h:29:9: note: this is the location of the previous definition
      29 | #define MAP_UNINITIALIZED 0
         |         ^~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:42:9: warning: 'MS_INVALIDATE' redefined
      42 | #define MS_INVALIDATE   2               /* invalidate the caches */
         |         ^~~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:37:9: note: this is the location of the previous definition
      37 | #define MS_INVALIDATE   4               /* invalidate the caches */
         |         ^~~~~~~~~~~~~
   include/uapi/asm-generic/mman-common.h:43:9: warning: 'MS_SYNC' redefined
      43 | #define MS_SYNC         4               /* synchronous memory sync */
         |         ^~~~~~~
   arch/alpha/include/uapi/asm/mman.h:36:9: note: this is the location of the previous definition
      36 | #define MS_SYNC         2               /* synchronous memory sync */
         |         ^~~~~~~
>> include/uapi/asm-generic/mman-common.h:49:9: warning: 'MADV_DONTNEED' redefined
      49 | #define MADV_DONTNEED   4               /* don't need these pages */
         |         ^~~~~~~~~~~~~
   arch/alpha/include/uapi/asm/mman.h:50:9: note: this is the location of the previous definition
      50 | #define MADV_DONTNEED   6               /* don't need these pages */
         |         ^~~~~~~~~~~~~


vim +/MAP_FIXED_NOREPLACE +31 include/uapi/asm-generic/mman-common.h

4ed28639519c7b include/uapi/asm-generic/mman-common.h Michal Hocko       2018-04-10  24  
8aa3c927ec10d1 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  25  /* 0x0100 - 0x4000 flags are defined in asm-generic/mman.h */
8aa3c927ec10d1 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  26  #define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
8aa3c927ec10d1 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  27  #define MAP_NONBLOCK		0x010000	/* do not block on IO */
8aa3c927ec10d1 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  28  #define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
8aa3c927ec10d1 include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  29  #define MAP_HUGETLB		0x040000	/* create a huge page mapping */
22fcea6f85f2cc include/uapi/asm-generic/mman-common.h Aneesh Kumar K.V   2019-07-16  30  #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
4ed28639519c7b include/uapi/asm-generic/mman-common.h Michal Hocko       2018-04-10 @31  #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  32  
0bf5f9492389aa include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16  33  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
0bf5f9492389aa include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16  34  					 * uninitialized */
0bf5f9492389aa include/uapi/asm-generic/mman-common.h Christoph Hellwig  2019-07-16  35  
b0f205c2a3082d include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  36  /*
b0f205c2a3082d include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  37   * Flags for mlock
b0f205c2a3082d include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  38   */
b0f205c2a3082d include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  39  #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
b0f205c2a3082d include/uapi/asm-generic/mman-common.h Eric B Munson      2015-11-05  40  
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  41  #define MS_ASYNC	1		/* sync memory asynchronously */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  42  #define MS_INVALIDATE	2		/* invalidate the caches */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  43  #define MS_SYNC		4		/* synchronous memory sync */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  44  
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  45  #define MADV_NORMAL	0		/* no further special treatment */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  46  #define MADV_RANDOM	1		/* expect random page references */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  47  #define MADV_SEQUENTIAL	2		/* expect sequential page references */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  48  #define MADV_WILLNEED	3		/* will need these pages */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @49  #define MADV_DONTNEED	4		/* don't need these pages */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  50  

:::::: The code at line 31 was first introduced by commit
:::::: 4ed28639519c7bad5f518e70b3284c6e0763e650 fs, elf: drop MAP_FIXED usage from elf_map

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
