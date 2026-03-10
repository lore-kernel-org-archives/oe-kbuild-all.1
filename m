Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677833BADB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 22:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180635; cv=none; b=Spc2X9dCyFM0kHG/Wp7h3t2hKizK/cUWeURyWL2YxWQY/fyXo7m4rxAKxqE5threfO20n27szT94mbsq9JYYEsc3Dtys1MDQ2N6IP/nVfQOVGn7AOYE121zC3wneBo7bLfZ2ogpw4akms3LYPZOGKE1gyhIdFJzv5KKkRRC8QMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180635; c=relaxed/simple;
	bh=l3IwrX0lj79WIdZdogeLJkhS3i620BiVrxYWOTYYZvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JBSXe1UkG2nCmAggRMgWkKZmeLQs6gV8ThptFDWCG5tvat6qtg0uhCH56XCcoeEf/QbJeFJCxOKq6q6Hychyy91F9v9Hyo31U0uRN0/1mCpm33Ivc/gyxCPwydl/tLZTaI0a/70rdZXBorW5lVkxmO0ra7HtrppO6Lr7uTrgCBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPK/NPik; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPK/NPik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773180634; x=1804716634;
  h=date:from:to:cc:subject:message-id;
  bh=l3IwrX0lj79WIdZdogeLJkhS3i620BiVrxYWOTYYZvw=;
  b=KPK/NPikxUagH5FAG0kziGhMD/bsMKfpRwRx7LVmz65wYJoCFPzVb4r7
   VeNlB2RK97jXG87hbvwPRI/Vu5o/PWxLIbbI2HIbMipNvjPgEoD746zsy
   fXpmxyAYNEqqQ5VpqvfkMlB1XNN2K7dpJK6yw+QndeDO2b8hnp7ZETDrJ
   bk6RRl9W9qQFeskrZjMGYKsO3b9HUu06xZ/+jOFhLhBF6TEBo9FsBdSGD
   rsUoo0sALru7AvbdMx+T37eP3JZ9fLaLs8acL9AJIZXgd7rUhL6cHIxId
   TevIz7GR0pwUQgOpUmgXfqF0YlQY7oTCpTgPqTzfobkwb898aKwtOnJ/D
   w==;
X-CSE-ConnectionGUID: PokI7KyySkOKY8tdYvSCEQ==
X-CSE-MsgGUID: 3kysIFVISc+XCSByrMbihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85717238"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85717238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:10:34 -0700
X-CSE-ConnectionGUID: v/8r5IJmToSqx2Sir2xZ4Q==
X-CSE-MsgGUID: yO/cNT5tTcuwo229D0ziJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224948100"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2026 15:10:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w05Ha-000000000Me-1Fuz;
	Tue, 10 Mar 2026 22:10:30 +0000
Date: Wed, 11 Mar 2026 06:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 14/14]
 include/linux/android_kabi.h:65:17: error: static assertion failed:
 "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned
 the same as atomic64_t nr_task_refs"
Message-ID: <202603110545.mXHb75ky-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b1ac27dd8a57803034f8361d820e3f2580714031
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [14/14] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260311/202603110545.mXHb75ky-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110545.mXHb75ky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110545.mXHb75ky-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/page_alloc.c:19:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1869:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1869 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~


vim +65 include/linux/android_kabi.h

e97af2a2f5563ac Giuliano Procida   2025-05-28  54  
e97af2a2f5563ac Giuliano Procida   2025-05-28  55  #define _ANDROID_KABI_RULE(hint, target, value) \
e97af2a2f5563ac Giuliano Procida   2025-05-28  56  	__ANDROID_KABI_RULE(hint, #target, #value)
e3e946868864503 Giuliano Procida   2025-04-16  57  
e3e946868864503 Giuliano Procida   2025-04-16  58  #define _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new)			\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  59  	union {								\
e3e946868864503 Giuliano Procida   2025-04-16  60  		_Static_assert(						\
e3e946868864503 Giuliano Procida   2025-04-16  61  			sizeof(struct { _new; }) <=			\
e3e946868864503 Giuliano Procida   2025-04-16  62  				sizeof(struct { _orig; }),		\
e3e946868864503 Giuliano Procida   2025-04-16  63  			FILE_LINE ": " __stringify(_new)		\
e3e946868864503 Giuliano Procida   2025-04-16  64  				" is larger than " __stringify(_orig));	\
e3e946868864503 Giuliano Procida   2025-04-16 @65  		_Static_assert(						\
e3e946868864503 Giuliano Procida   2025-04-16  66  			__alignof__(struct { _new; }) <=		\
e3e946868864503 Giuliano Procida   2025-04-16  67  				__alignof__(struct { _orig; }),		\
e3e946868864503 Giuliano Procida   2025-04-16  68  			FILE_LINE ": " __stringify(_orig)		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  69  				" is not aligned the same as "		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  70  				__stringify(_new));			\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  71  	}
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  72  

:::::: The code at line 65 was first introduced by commit
:::::: e3e946868864503f88b95a0d8ffe6d61b7df82d6 ANDROID: update KABI macros for gendwarfksyms

:::::: TO: Giuliano Procida <gprocida@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
