Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E541DF75D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771052480; cv=none; b=MGYORDMv9bnmwEIFs3pPCnoDTpXsX87hSsCFqJbVLe+/2AVxAPFS01EHixDJSH5wrmv3XS8QLAYJCQCVtXLLNMyKiMJ7pw1B6LYccIBRbWbacsW/0KzXVMEs9mHho+5q01GkIaAAGH7Kz13wPNIXRGyKmnBEDMqbF5w60AR3FqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771052480; c=relaxed/simple;
	bh=M9bfoSDwaK3JdH+MqqXGq2GuX45dELB6WVSxM12D0yk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KrunX3bD3NOrXUysPtU2O5rokPp55IiFC62DlAWbJsqBaoTaWxtB3ioCnONx3p6/fPNLZIt+fbsRsuxxaxWaR/v/CebDV8f9zbHWnuo12rkZFS9aV2RGnoIvn3J6uSEr2T9O18Eg7de8ElrodL6AuzCpq7xRtAffhRQHbTp/9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnEa4b3t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnEa4b3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771052478; x=1802588478;
  h=date:from:to:cc:subject:message-id;
  bh=M9bfoSDwaK3JdH+MqqXGq2GuX45dELB6WVSxM12D0yk=;
  b=VnEa4b3t8LrZjlGD+rtXdp/uxTm3g+gqGrp02qm6Sav+H8JAvARwRqVc
   8vxWeZbORu93XotBhmGFT7hHEKx2TZbb6d1LfNfqH34+2EoXAxYMX+InS
   LF+NVnLn53vj2X7XxJrvK3d/AWN3m7zQSEXSSIa312cBnqAW3GibIvun0
   cUktY+Z/8AVyWAAEZWwXKgiI8FoN2a2CsJ52xOX0HR5mcdoV6/O61baKt
   preTkVmmAN0g+XWLBz72nSB3rx18zfuJMFdXzaV8GVEYIsecTbFmz6ecr
   SO7tXqIZ3u7JKUhpRpu3600sVF84FdGVCGvRDkz4PERhOQf7xuWzFq5C9
   Q==;
X-CSE-ConnectionGUID: y465S0JORmOLoEHJ72Hb4w==
X-CSE-MsgGUID: /aqAqAFNSRmoEY+O9amxAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76082082"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="76082082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 23:01:17 -0800
X-CSE-ConnectionGUID: 18qUrMnkS3iT604AGyGrKw==
X-CSE-MsgGUID: tiPt1j0BQxOm//FvVMs43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="250785715"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 23:01:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr9eT-00000000wKG-0mre;
	Sat, 14 Feb 2026 07:01:13 +0000
Date: Sat, 14 Feb 2026 15:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next 92/144]
 include/linux/compiler_types.h:696:45: error: call to
 '__compiletime_assert_771' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(*batch) < sizeof(*storage)
Message-ID: <202602141417.hsmt2AAb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next
head:   5cf574b306a01ec7f3a507e999b524ee39f0dee0
commit: 3405caa2fd58ffc59dc47f62588d10698bb49ec1 [92/144] smb: client: make use of smbdirect_connection_send_{single_iter,immediate_work}()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602141417.hsmt2AAb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141417.hsmt2AAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141417.hsmt2AAb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'smbdirect_init_send_batch_storage',
       inlined from 'smbd_send' at fs/smb/client/smbdirect.c:1220:10:
>> include/linux/compiler_types.h:696:45: error: call to '__compiletime_assert_771' declared with attribute error: BUILD_BUG_ON failed: sizeof(*batch) < sizeof(*storage)
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:677:25: note: in definition of macro '__compiletime_assert'
     677 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/smb/client/../common/smbdirect/smbdirect_connection.c:993:9: note: in expansion of macro 'BUILD_BUG_ON'
     993 |         BUILD_BUG_ON(sizeof(*batch) < sizeof(*storage));
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'smbdirect_init_send_batch_storage',
       inlined from 'smbd_send' at client/smbdirect.c:1220:10:
>> include/linux/compiler_types.h:696:45: error: call to '__compiletime_assert_771' declared with attribute error: BUILD_BUG_ON failed: sizeof(*batch) < sizeof(*storage)
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:677:25: note: in definition of macro '__compiletime_assert'
     677 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   client/../common/smbdirect/smbdirect_connection.c:993:9: note: in expansion of macro 'BUILD_BUG_ON'
     993 |         BUILD_BUG_ON(sizeof(*batch) < sizeof(*storage));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_771 +696 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  682  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  683  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  684  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @696  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697  

:::::: The code at line 696 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
