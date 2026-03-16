Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F495219A8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646300; cv=none; b=OCv5m9ux2uvmisvOAMQdiK3UkQlR79hpbZKEn07D0PF9LW56+vsobqbV0FIHAmXrgY0AB74Jy7Yzg6O/Gpyh1EvuisfQf6ldj0J7PQhFgEKtdlwqURCnhF3hXDuBDkR5BNC6vIi2XF9dfZVFO28KpeTl0ZSX2Zk6EMFHoGP2AyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646300; c=relaxed/simple;
	bh=TL9/uNPtM+Gy4VvRNaKTYhf4UaTESusijW0eUwQ5hOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iw87b9xJSP0EZaN72ZPwGunytYe39tJOeJGlX0Iv0nc9hGIn7U7Y6TkGGUASy/mccZ9zDjGSn9ky7opocSfpmFM2rcZ/4b6Kl8AH0HqgiKBHcibWAzUP22u5XFZ8SpTtq6l4iHKzQ6WpjVp43eoYrWlVrkuukh5TKElJpyxBZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6ashT/l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6ashT/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773646299; x=1805182299;
  h=date:from:to:cc:subject:message-id;
  bh=TL9/uNPtM+Gy4VvRNaKTYhf4UaTESusijW0eUwQ5hOQ=;
  b=k6ashT/lrVcZeJZHuOTwicgW0RqzWnkC+nX3/4OXe02DeIYebuQxZzOE
   S00tn8p2reqE0qe1/3gHJ8LwlHD/etWAERmaWRYUBM0+w4oQCy07PJ2wN
   ETxLsZZLC3OXl6VHq7ZPo4OSzfZh267Btfo0ti9t7lnT6ZAT9OmyrM/9n
   Zwe4VHYze/7h0KQi4/lhnI+68RBT3DUm8Uy1ZRqO4pI/tONMKceoABymX
   X9mOL5nuPY/IdIjnU+1gkZxbH7WXzz7exN3YjfNckuEKb1MPZjPsEIWq+
   N09XRF+cPjRlFHBotNM5iTaIEsqIHf75fgUQGujzgQx8mXfM94+m4u0SX
   w==;
X-CSE-ConnectionGUID: B8rr03lYTcac8lJmkWyO/Q==
X-CSE-MsgGUID: R6+uZFwnRjG+HRBsBd7KRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74629674"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="74629674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:31:38 -0700
X-CSE-ConnectionGUID: DbqIW08TQG6keoyhWCkABQ==
X-CSE-MsgGUID: dY/xz+RBRGyipYNg3AWqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="217686744"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2026 00:31:37 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22QI-000000000IU-3Pk6;
	Mon, 16 Mar 2026 07:31:34 +0000
Date: Mon, 16 Mar 2026 15:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 5/25] include/linux/err.h:28:49:
 warning: cast to pointer from integer of different size
Message-ID: <202603161533.uWdDAenY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   1aea2bfdfc039b008ff97eec23c755b5ac4b25a4
commit: 2b18c605a01d2114e02620507c1932f210bb7ea9 [5/25] cachefiles: Improve cache read performance by up to 3x for most use cases
config: xtensa-randconfig-001-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161533.uWdDAenY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161533.uWdDAenY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161533.uWdDAenY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/barrier.h:16,
                    from arch/xtensa/include/asm/barrier.h:29,
                    from include/linux/mount.h:14,
                    from fs/cachefiles/io.c:8:
   fs/cachefiles/io.c: In function 'cachefiles_query_occupancy':
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/cachefiles/io.c:243:21: note: in expansion of macro 'IS_ERR_VALUE'
     243 |                 if (IS_ERR_VALUE(ret)) {
         |                     ^~~~~~~~~~~~
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/cachefiles/io.c:256:21: note: in expansion of macro 'IS_ERR_VALUE'
     256 |                 if (IS_ERR_VALUE(ret)) {
         |                     ^~~~~~~~~~~~
--
   In file included from include/asm-generic/barrier.h:16,
                    from arch/xtensa/include/asm/barrier.h:29,
                    from include/linux/mount.h:14,
                    from io.c:8:
   io.c: In function 'cachefiles_query_occupancy':
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   io.c:243:21: note: in expansion of macro 'IS_ERR_VALUE'
     243 |                 if (IS_ERR_VALUE(ret)) {
         |                     ^~~~~~~~~~~~
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   io.c:256:21: note: in expansion of macro 'IS_ERR_VALUE'
     256 |                 if (IS_ERR_VALUE(ret)) {
         |                     ^~~~~~~~~~~~


vim +28 include/linux/err.h

ebba5f9fcb8823 Randy Dunlap   2006-09-27  21  
4d744ce9d5d7cf James Seo      2023-05-09  22  /**
4d744ce9d5d7cf James Seo      2023-05-09  23   * IS_ERR_VALUE - Detect an error pointer.
4d744ce9d5d7cf James Seo      2023-05-09  24   * @x: The pointer to check.
4d744ce9d5d7cf James Seo      2023-05-09  25   *
4d744ce9d5d7cf James Seo      2023-05-09  26   * Like IS_ERR(), but does not generate a compiler warning if result is unused.
4d744ce9d5d7cf James Seo      2023-05-09  27   */
aa00edc1287a69 Linus Torvalds 2016-05-27 @28  #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
07ab67c8d0d7c1 Linus Torvalds 2005-05-19  29  

:::::: The code at line 28 was first introduced by commit
:::::: aa00edc1287a693eadc7bc67a3d73555d969b35d make IS_ERR_VALUE() complain about non-pointer-sized arguments

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
