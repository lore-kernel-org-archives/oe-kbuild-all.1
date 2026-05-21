Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6F13D3331
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368008; cv=none; b=TIlCdHCWFRTpt1Rc/aV1rTCtf+YXbYtePaV8t+A/mQEq2gSpBgzYKg2uqSGLiuzLKnRQSfRhLJuwVBm25bHrb7uEZdI9nt52VBE3piid3xt/PE1VQXRryyZ8c/b5QDyMBWcDNGKfmgloDDNLJu9azd18XwFrlp/CRqH+imk6P8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368008; c=relaxed/simple;
	bh=d+rrYVJIaPmB1S/tNTNA2MioOY01fXxsJ5JLNlnfZZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s75VHaogLYYA9vBtpTDhsSWps5sFiPgvpz6mJmKNaJP9caPF+TOsODAI3GANVnntg3YMqu0b7Z79CcmSlrPLY6HXj3siKin5z6KaQaRGy+XFb23olXQEZNc6IJuB5VQjm8vNcpSSvkBAYqng1vkHQ9ExTmrnZRzivHz9Jpt/KKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7pTMIAZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7pTMIAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779368006; x=1810904006;
  h=date:from:to:cc:subject:message-id;
  bh=d+rrYVJIaPmB1S/tNTNA2MioOY01fXxsJ5JLNlnfZZM=;
  b=f7pTMIAZHNLh+WRRlcAlJZT0AI8Um8QdAduDzvRfXdbYdxSGIt/1Ac4p
   oYolmAqbXaAWYwxxxGqfehLOuyZ2T/JjTM7CNo50fC2fsFJFtbCVwXB4x
   ZcnBtW65+LEp1kmlldEcrF7cE3YWe2I/Wa8jL+ozqHIDuIUdHJIgT41qU
   HiOV27TcrRzSGJijm10xHjZRYTGAue45v1pZk/pLACUqWFpAAPWHQCnPT
   uqJcB1Q65HrmRdRiwmp6tFLNIjW0RsmwbrIzKngDIuWS+MpjZKEKMA0iS
   Arm6yajGameIMKgNIyBsYBO9yeHa6bdY2mzUb6T7mM2rpUG8OiOXM9zz9
   w==;
X-CSE-ConnectionGUID: z0bj2gq+SC6zuolHpaN+XQ==
X-CSE-MsgGUID: fCw6iv3tSGWWPD3c9qhU4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91675332"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91675332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:53:24 -0700
X-CSE-ConnectionGUID: yjphw7l/Sti8/an24P+PTw==
X-CSE-MsgGUID: +TmOfyGFSCSAJlaBKGR5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="270870154"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2026 05:53:22 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ2tr-000000000J9-1a5W;
	Thu, 21 May 2026 12:53:19 +0000
Date: Thu, 21 May 2026 20:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <aleksa@amutable.com>
Subject: [brauner-vfs:vfs-7.2.openat2 10/13]
 include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_414' declared with attribute error: __O_REGULAR must
 not alias any user-visible flag
Message-ID: <202605212006.aSKm3rRh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.openat2
head:   b07aaae343fe58c3f24eee4788dd477d6d5c4813
commit: 781c9128350949286c1d23f9e179da2dccefe373 [10/13] openat2: new OPENAT2_REGULAR flag support
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605212006.aSKm3rRh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212006.aSKm3rRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212006.aSKm3rRh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'build_open_flags',
       inlined from 'file_open_root' at fs/open.c:1379:12:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'file_open_name' at fs/open.c:1350:12,
       inlined from 'filp_open' at fs/open.c:1370:9:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   fs/open.c: In function 'build_open_flags':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'file_open_name' at fs/open.c:1350:12:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'do_sys_openat2' at fs/open.c:1390:12,
       inlined from 'do_sys_open' at fs/open.c:1401:9:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'do_sys_openat2' at fs/open.c:1390:12,
       inlined from 'do_sys_open' at fs/open.c:1401:9,
       inlined from '__do_sys_open' at fs/open.c:1409:9,
       inlined from '__se_sys_open' at fs/open.c:1405:1:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'do_sys_openat2' at fs/open.c:1390:12,
       inlined from 'do_sys_open' at fs/open.c:1401:9,
       inlined from '__do_sys_openat' at fs/open.c:1417:9,
       inlined from '__se_sys_openat' at fs/open.c:1412:1:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'do_sys_openat2' at fs/open.c:1390:12,
       inlined from '__do_sys_openat2' at fs/open.c:1444:9,
       inlined from '__se_sys_openat2' at fs/open.c:1420:1:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
   In function 'build_open_flags',
       inlined from 'do_sys_openat2' at fs/open.c:1390:12,
       inlined from 'do_sys_open' at fs/open.c:1401:9,
       inlined from '__do_sys_creat' at fs/open.c:1479:9,
       inlined from '__se_sys_creat' at fs/open.c:1473:1:
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_414' declared with attribute error: __O_REGULAR must not alias any user-visible flag
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/open.c:1194:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    1194 |         BUILD_BUG_ON_MSG(__O_REGULAR & VALID_OPENAT2_FLAGS,
         |         ^~~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   fs/fcntl.c: In function 'fcntl_init':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_402' declared with attribute error: BUILD_BUG_ON failed: 22 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC | __O_REGULAR)
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/fcntl.c:1172:9: note: in expansion of macro 'BUILD_BUG_ON'
    1172 |         BUILD_BUG_ON(22 - 1 /* for O_RDONLY being 0 */ !=
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_414 +699 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  

:::::: The code at line 699 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
