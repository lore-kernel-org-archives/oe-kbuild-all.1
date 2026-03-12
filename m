Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84D3264F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278675; cv=none; b=IC76AtJC/CMBxazyPceQYNM+Sxd6UEXFcmt68xP/cey0Q8q8j8/xESRqrE+N0xDk2joYPTgv8uKHK8loMMxR1+AMIeVebbvSdONBZV8eV2EN/E/8Vgu4vA4+hWVqlWjdqneTDX0dadQSZT/NVpJ1++z4tufrS5tCR0jX+GzkHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278675; c=relaxed/simple;
	bh=jzNA//J4o+6q7IUEST4C81xICzv/V0+Nfnf3s3NQiS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YFA2rullwJ/m0asH0kubRWcjD3VPFuZJiR/n6cmx/ncnfA3gwrjE3owqwXoTBC4vNt0YRzOKx70EQMPdIBXqawlnks5jwCnrdO+AYkDrzR2gvmjmp5DKK8+pAd6j+QM1fvWZVP/i1PkLbNMBwwGQmf00+Z2JdHcWs4Q4lzY6+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljpFFbPE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljpFFbPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773278672; x=1804814672;
  h=date:from:to:cc:subject:message-id;
  bh=jzNA//J4o+6q7IUEST4C81xICzv/V0+Nfnf3s3NQiS4=;
  b=ljpFFbPE7xlqSjdKA/7wpYl/AiRmm5UyDPUebPrxfgzcDFZCbZ86OBgY
   3xBvZfyoBjn1ILPr8nDpSJ5Bsho6LfEuRa5hrghERHPlfFZBOkwrkf9Ss
   QydbFTdNhygd5V4CXIgsCwQER8IH0kPnRg3lw4IDNIbpOnw/dGFxVW5lN
   1WNqZEpNyrS+Eq9HC5rx24VBM++gxpWlWl0iKX80UI3MGPzpsXw4IWbK8
   uASmZSE4sOqCkz6aW9MCaRLoWef/NY71st+/AwGeUSciQk9bWvAEmP6IS
   47LZZ6SixduUU1xiEhSGxMxaP921ZUQmo7mCf4tweeAkrj0VEEOvT6oTV
   w==;
X-CSE-ConnectionGUID: XQTEQVhsQ/yNUw8zmRmqAw==
X-CSE-MsgGUID: X7Tf0evuRZGgbdx8B7/rgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78253615"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78253615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 18:24:32 -0700
X-CSE-ConnectionGUID: jf/YOpTdQJyxxhPCGju13w==
X-CSE-MsgGUID: rRc0lXjtTj65zJ0L5vaRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="258559698"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2026 18:24:30 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Ump-000000001tx-0xov;
	Thu, 12 Mar 2026 01:24:27 +0000
Date: Thu, 12 Mar 2026 09:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miklos Szeredi <mszeredi@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 2597/5731]
 include/linux/compiler_types.h:706:38: error: call to
 '__compiletime_assert_770' declared with attribute error: min(outarg.size,
 ((loff_t)((long long)(~0ULL >> 1))) - pos) signedness error
Message-ID: <202603120912.KzwPUTG9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
commit: 25307ca50b815c14a21f82fc5b10e8a621af32ad [2597/5731] fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
config: arm64-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260312/202603120912.KzwPUTG9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120912.KzwPUTG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120912.KzwPUTG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'fuse_notify_store',
       inlined from 'fuse_notify' at fs/fuse/dev.c:2109:10:
>> include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_770' declared with attribute error: min(outarg.size, ((loff_t)((long long)(~0ULL >> 1))) - pos) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   fs/fuse/dev.c:1790:8: note: in expansion of macro 'min'
     num = min(outarg.size, MAX_LFS_FILESIZE - pos);
           ^~~
--
   In file included from <command-line>:
   In function 'fuse_notify_store',
       inlined from 'fuse_notify' at dev.c:2109:10:
>> include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_770' declared with attribute error: min(outarg.size, ((loff_t)((long long)(~0ULL >> 1))) - pos) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   dev.c:1790:8: note: in expansion of macro 'min'
     num = min(outarg.size, MAX_LFS_FILESIZE - pos);
           ^~~


vim +/__compiletime_assert_770 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
