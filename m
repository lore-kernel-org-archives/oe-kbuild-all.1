Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6F3B193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711227622; cv=none; b=U0WWrTHQao3e+Iu3vA6eH5GdddVHHHNR0biw3gb+J6qAitQLctzaBakjlgvfwXq/CEGUajUhuM7CMNAIZQWscCjg6vRxG5WdEnZZou5n+DgwqBGzxp1R16vWU6o1zxDSoP/Od8geKT/E04f73L3/elzZzr2DcrrczyOBbeEHFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711227622; c=relaxed/simple;
	bh=29rDG0mFv1NV7Xgl0zYqQ/sDGYW/SS/CLuBrbcHLkko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duU3yLFLngfbFHxPbFotuZvnry5J7zCwfg1+7Xt8HVtB8HCwnMdsHVgMJo36X/jMksMOdITkL9M/HQHhTwV5WNeK2WjM9IvvW2aJ1xMdvGqJN4/TgKxl0COtJFwMfiFgmI9Sk6iFNUkO9/d7VPV4qlBZ88s9PMyNl+hUlDKQvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSotrkKi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSotrkKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711227621; x=1742763621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29rDG0mFv1NV7Xgl0zYqQ/sDGYW/SS/CLuBrbcHLkko=;
  b=WSotrkKiwuOl38xiyb3zcLTdNu2rYmsgX9HWsQPb//EBRGHlXlbQtwHS
   bXtrQiD2Og+NNnqxqK5una24pdfaHaKXkltonuH3Gva0wFpJJ/JtvHeW7
   9UKsFWAyFAMtDbD1ThOXcHkMdNY/AQazUqFHdRl2hSYL/sMaW8MPaPMhw
   aK6hdHoOjcXS8ZQwbfEocpy3rCRL0F/xkWDuhQvTZMZV782GFJlEiqZek
   8Xd3zcw+xvY7doB5w/hXvV/MlcG231Nv8XDIbR1MzKQCdbWMxNV5gPtJh
   s/C3UYTSO0dUK6ZdWbXNvxeA9WeaICNxVYguhI4UnGsBVH7JfQz8pKwhL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10063057"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="10063057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 14:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15128338"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2024 14:00:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro8TN-000LSu-1G;
	Sat, 23 Mar 2024 21:00:13 +0000
Date: Sun, 24 Mar 2024 04:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 15/22]
 include/linux/compiler_types.h:449:45: error: call to
 '__compiletime_assert_277' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202403240459.cGmhE3y2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   6d4dafd8301ee8645d4814a7e75a9135acf67613
commit: 9a3702e1d161f5b03a7b42122f9f693af1144fc8 [15/22] netfs: New writeback implementation
config: arm-vexpress_defconfig (https://download.01.org/0day-ci/archive/20240324/202403240459.cGmhE3y2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240459.cGmhE3y2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240459.cGmhE3y2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/netfs/write_issue.c:34:
   fs/netfs/write_issue.c: In function 'netfs_unbuffered_write':
   fs/netfs/internal.h:405:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     405 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                    ^~~~~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:405:26: note: in expansion of macro 'no_printk'
     405 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:594:9: note: in expansion of macro '_enter'
     594 |         _enter("%lx", len);
         |         ^~~~~~
   fs/netfs/write_issue.c:602:24: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     602 |                 _debug("unbuffered %lx", len);
         |                        ^~~~~~~~~~~~~~~~  ~~~
         |                                          |
         |                                          size_t {aka unsigned int}
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:407:26: note: in expansion of macro 'no_printk'
     407 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:602:17: note: in expansion of macro '_debug'
     602 |                 _debug("unbuffered %lx", len);
         |                 ^~~~~~
   fs/netfs/write_issue.c:602:38: note: format string is defined here
     602 |                 _debug("unbuffered %lx", len);
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %x
   In file included from <command-line>:
   fs/netfs/write_issue.c: In function 'netfs_write_folio':
>> include/linux/compiler_types.h:449:45: error: call to '__compiletime_assert_277' declared with attribute error: Need native word sized stores/loads for atomicity.
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:430:25: note: in definition of macro '__compiletime_assert'
     430 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:452:9: note: in expansion of macro 'compiletime_assert'
     452 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     141 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   fs/netfs/write_issue.c:415:17: note: in expansion of macro 'smp_store_release'
     415 |                 smp_store_release(&wreq->issuer_cursor, fpos + stream->submit_off);
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:449:45: error: call to '__compiletime_assert_279' declared with attribute error: Need native word sized stores/loads for atomicity.
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:430:25: note: in definition of macro '__compiletime_assert'
     430 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:452:9: note: in expansion of macro 'compiletime_assert'
     452 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     141 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   fs/netfs/write_issue.c:426:9: note: in expansion of macro 'smp_store_release'
     426 |         smp_store_release(&wreq->issuer_cursor, fpos + fsize);
         |         ^~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_277 +449 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  435  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  437  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  438  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  439  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  440   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  441   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  442   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  443   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  444   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  445   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  446   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @449  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  

:::::: The code at line 449 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
