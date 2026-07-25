Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1C2690F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785003852; cv=none; b=oz4qYqz+eLkwbA9ziWojXeYzckU59Fe1JEAgX/BfJNvDKxLoHrWV4D0fKXFyscrZfulLbcbP/SJ5JoW3LIL2CZg+IMno6S4KJ6JgLY4DDBnKP8meK2rn6IDUDQI2Mp466rQntzwEppaDSXmMsIdp2w46bIbS3NvZ7mft5T/aG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785003852; c=relaxed/simple;
	bh=CL+lq1/Tse3Vrz/Q75+tOOIzHdsNBd+q54oqxWIwaGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TpJaL6UoaDFgc0Jisd7DVQ2b1qPJJTvKrzRZL0h5Iw84Q/SC1n+ANPgoTSpfzooaIEz+85vPhGSbUQ2RslkcDldfj2Lj+w+HDdROPet4WUvksPi3nd7RCHePj0+C2lqNW264lN5H4eYyvf551i79ve8/52yhZAx0QH6TPE0U6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RegJXjZM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RegJXjZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785003849; x=1816539849;
  h=date:from:to:cc:subject:message-id;
  bh=CL+lq1/Tse3Vrz/Q75+tOOIzHdsNBd+q54oqxWIwaGA=;
  b=RegJXjZM7/1HjuwOZrw3qL9mTVyDafgdHnl8P4q+veQx+7dGfwgK3dO6
   sqobl6zkNeoPquHjmqy7/RpVk1gUdyPvGc+wfkajLH4Q7crwbNl/4vhtl
   kORwubv9ocdQ9A6Y5Nm+waPY7yNQKa4GsQFJYfMKyey+ucbLmyyb/p+SK
   xgeBAzfHD2dCEh408fgbScGAyRU4GzFtSIGsbGi3PUD2Pj6Zs1Xtnpo7q
   NT4y1vrcZxa4AyF2Y2bzVez7tHfmjD2cgxxTvXT7sSeLg9uuVZPdJwiSL
   65uEIdA703xZth/jau6aYy5uotTl/8RFeo6xuA5ajKCKKn3B4bTEfl95x
   g==;
X-CSE-ConnectionGUID: yXm9hpihSbipVpxlq0I8GQ==
X-CSE-MsgGUID: LUP4EUoZRP2w4NGFJLAAKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85723472"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="85723472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 11:24:08 -0700
X-CSE-ConnectionGUID: p4TWw3PCSLiDbzsSxDQdnA==
X-CSE-MsgGUID: dB9OENHZSl2i31h1gAFkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="256345279"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jul 2026 11:24:06 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnh2a-000000001Ek-14ZT;
	Sat, 25 Jul 2026 18:24:04 +0000
Date: Sat, 25 Jul 2026 20:23:39 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-ioctl-cleanups 8/11]
 ./arch/s390/include/asm/uaccess.h:319:21: error: void value not ignored as it
 ought to be
Message-ID: <202607252046.8AFGFpuw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-ioctl-cleanups
head:   918653f059a2c63c9ed5316428d963be8a1d072a
commit: 254f860b51b8d3b64bf5660c9028edd4fc248bfe [8/11] xfs: split out the handler for XFS_IOC_GOINGDOWN
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260725/202607252046.8AFGFpuw-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607252046.8AFGFpuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607252046.8AFGFpuw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/xfs/xfs_ioctl.c: In function 'xfs_ioc_growfs_rt':
   fs/xfs/xfs_ioctl.c:1329:34: warning: unused variable 'mp' [-Wunused-variable]
    1329 |         struct xfs_mount        *mp = XFS_I(file_inode(file))->i_mount;
         |                                  ^~
   In file included from ./include/linux/uaccess.h:13,
                    from ./include/linux/sched/task.h:13,
                    from ./include/linux/sched/signal.h:9,
                    from ./include/linux/rcuwait.h:6,
                    from ./include/linux/mm.h:36,
                    from fs/xfs/xfs_platform.h:12,
                    from fs/xfs/xfs_ioctl.c:6:
   fs/xfs/xfs_ioctl.c: In function 'xfs_ioc_goingdown':
>> ./arch/s390/include/asm/uaccess.h:319:23: warning: dereferencing 'void *' pointer
     319 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
>> ./arch/s390/include/asm/uaccess.h:319:21: error: void value not ignored as it ought to be
     319 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                     ^
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:327:23: warning: dereferencing 'void *' pointer
     327 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:327:21: error: void value not ignored as it ought to be
     327 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                     ^
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:335:23: warning: dereferencing 'void *' pointer
     335 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:335:21: error: void value not ignored as it ought to be
     335 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                     ^
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:343:23: warning: dereferencing 'void *' pointer
     343 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~
   ./arch/s390/include/asm/uaccess.h:343:21: error: void value not ignored as it ought to be
     343 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                     ^
   ./arch/s390/include/asm/uaccess.h:356:9: note: in expansion of macro '__get_user'
     356 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1353:13: note: in expansion of macro 'get_user'
    1353 |         if (get_user(in, arg))
         |             ^~~~~~~~


vim +319 ./arch/s390/include/asm/uaccess.h

454ede3f1424c3 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-01  306  
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  307  #define __get_user(x, ptr)						\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  308  ({									\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  309  	const __user void *____guptr = (ptr);				\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  310  	int __grc;							\
d144182ed19af0 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-29  311  									\
17566c3c5ed3ea include/asm-s390/uaccess.h      Al Viro            2005-08-23  312  	__chk_user_ptr(ptr);						\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  313  	switch (sizeof(*(ptr))) {					\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  314  	case 1: {							\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  315  		const unsigned char __user *__guptr = ____guptr;	\
454ede3f1424c3 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-01  316  		unsigned char __x;					\
d144182ed19af0 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-29  317  									\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  318  		__grc = __get_user_char(&__x, __guptr, sizeof(*(ptr)));	\
97fa5a664e69f2 include/asm-s390/uaccess.h      Al Viro            2006-02-03 @319  		(x) = *(__force __typeof__(*(ptr)) *)&__x;		\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  320  		break;							\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  321  	};								\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  322  	case 2: {							\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  323  		const unsigned short __user *__guptr = ____guptr;	\
454ede3f1424c3 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-01  324  		unsigned short __x;					\
d144182ed19af0 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-29  325  									\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  326  		__grc = __get_user_short(&__x, __guptr, sizeof(*(ptr)));\
97fa5a664e69f2 include/asm-s390/uaccess.h      Al Viro            2006-02-03  327  		(x) = *(__force __typeof__(*(ptr)) *)&__x;		\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  328  		break;							\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  329  	};								\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  330  	case 4: {							\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  331  		const unsigned int __user *__guptr = ____guptr;		\
454ede3f1424c3 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-01  332  		unsigned int __x;					\
d144182ed19af0 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-29  333  									\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  334  		__grc = __get_user_int(&__x, __guptr, sizeof(*(ptr)));	\
97fa5a664e69f2 include/asm-s390/uaccess.h      Al Viro            2006-02-03  335  		(x) = *(__force __typeof__(*(ptr)) *)&__x;		\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  336  		break;							\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  337  	};								\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  338  	case 8: {							\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  339  		const unsigned long __user *__guptr = ____guptr;	\
454ede3f1424c3 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-01  340  		unsigned long __x;					\
d144182ed19af0 arch/s390/include/asm/uaccess.h Heiko Carstens     2022-05-29  341  									\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  342  		__grc = __get_user_long(&__x, __guptr, sizeof(*(ptr)));	\
97fa5a664e69f2 include/asm-s390/uaccess.h      Al Viro            2006-02-03  343  		(x) = *(__force __typeof__(*(ptr)) *)&__x;		\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  344  		break;							\
1047aa77239976 include/asm-s390/uaccess.h      Martin Schwidefsky 2005-11-07  345  	};								\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  346  	default:							\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  347  		__grc = __get_user_bad();				\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  348  		break;							\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  349  	}								\
718056f9d96872 arch/s390/include/asm/uaccess.h Heiko Carstens     2025-01-13  350  	__builtin_expect(__grc, 0);					\
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  351  })
^1da177e4c3f41 include/asm-s390/uaccess.h      Linus Torvalds     2005-04-16  352  

:::::: The code at line 319 was first introduced by commit
:::::: 97fa5a664e69f2fcdd2120e7f4765f8c1df56282 [PATCH] s390 __get_user() bogus warnings removal

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
