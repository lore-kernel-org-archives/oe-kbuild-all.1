Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521A1B0421
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386537; cv=none; b=iXbc84BQtYzd8oBEFfDjOmRTxwkkcl+RlwQn8DT/CecXsgcDo7Cu02Q2+frryU9KJ1CuBbyvfbhAxK2WQb6eW0Vj0+X3QzaLbIIWJOMm27fRJyaj9S15DYz73HnTz4V2MeYWxtSNZ1HrgBQx9rqWKJB7eELuMCiow5cBYcxd9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386537; c=relaxed/simple;
	bh=9Jyqh7GOGRMj2tRDQFM6cC+w0CPbXNXH15CmPYf7WRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0iCt2LAP9+wo8pwMg+s201VVeGbkMp9ta8Fd7SEjCna+7v4NvockdmGq/4xFWe+sq9QF8qijJjz1dyUNxM0RGlxvh2ZpRSitIjOJRTJ1V32gDwuLv3b7P7r+swvTg1p21usi9I5lRvr4LQQK8MJuu8Nbj2cQUUOuPzGq+ytANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMqqDe3G; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMqqDe3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386536; x=1782922536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Jyqh7GOGRMj2tRDQFM6cC+w0CPbXNXH15CmPYf7WRM=;
  b=OMqqDe3G3tg4fPzQ3N4vZiNEguvhhXFF/QoQa6efprThT0rFk3UTPLDr
   ztp6Cqnzys6vgGi7gpJDhQgCHjG+UgdT8AfzCzlg4x726i3xih5bs+ruq
   27oqlSoUvcXjZ5SAn/glU47VYhWml+8HUau44ZobFxnkMQWnK2rsBJycs
   JL3T8+/x8VJm9d8nagN7tw/Iqhk0xDhsQboyJm5MoZnDIsUv0WI9A8DIK
   dstiFXZ2aAYGQro50a3kinIT23Kz9md+44Uw5x72jUqLX8tUBz5v2q2B/
   knw0LdNfsG+Lf/nhgnfcKMMdCmfm+kEM4t8DnCCF1yZs6KGL0B8oOa/wV
   A==;
X-CSE-ConnectionGUID: 5+csQCZeTnGpqm7JhbDVXA==
X-CSE-MsgGUID: RAuaSkK4SACQojoEOR4ciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57438037"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57438037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:15:36 -0700
X-CSE-ConnectionGUID: wJ0TkbI6TvGqHRsz0iK1VA==
X-CSE-MsgGUID: oOVjTAoPTN6I8AqFauY0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153422033"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 09:15:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWddr-000aPG-2s;
	Tue, 01 Jul 2025 16:15:31 +0000
Date: Wed, 2 Jul 2025 00:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.17.fileattr 6/7]
 include/linux/compiler_types.h:568:45: error: call to
 '__compiletime_assert_375' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST
Message-ID: <202507020046.0nwQbZmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.17.fileattr
head:   afc0c34f518daf3960102b1862ea26e7b1d12f6c
commit: 5897a32d41a80276c1ab9706459124b7b43925e3 [6/7] fs: introduce file_getattr and file_setattr syscalls
config: x86_64-buildonly-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020046.0nwQbZmp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020046.0nwQbZmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020046.0nwQbZmp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function '__do_sys_file_getattr',
       inlined from '__se_sys_file_getattr' at fs/file_attr.c:381:1,
       inlined from '__x64_sys_file_getattr' at fs/file_attr.c:381:1:
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_375' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/file_attr.c:393:9: note: in expansion of macro 'BUILD_BUG_ON'
     393 |         BUILD_BUG_ON(sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST);
         |         ^~~~~~~~~~~~
   fs/file_attr.c: In function '__ia32_sys_file_getattr':
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_375' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/file_attr.c:393:9: note: in expansion of macro 'BUILD_BUG_ON'
     393 |         BUILD_BUG_ON(sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST);
         |         ^~~~~~~~~~~~
   In function '__do_sys_file_setattr',
       inlined from '__se_sys_file_setattr' at fs/file_attr.c:434:1,
       inlined from '__x64_sys_file_setattr' at fs/file_attr.c:434:1:
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_377' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/file_attr.c:446:9: note: in expansion of macro 'BUILD_BUG_ON'
     446 |         BUILD_BUG_ON(sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST);
         |         ^~~~~~~~~~~~
   fs/file_attr.c: In function '__ia32_sys_file_setattr':
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_377' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/file_attr.c:446:9: note: in expansion of macro 'BUILD_BUG_ON'
     446 |         BUILD_BUG_ON(sizeof(struct fsx_fileattr) != FSX_FILEATTR_SIZE_LATEST);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_375 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
