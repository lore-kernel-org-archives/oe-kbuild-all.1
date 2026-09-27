Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0B2798F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482581; cv=none; b=h5tlNF+Eqc+dl9NzgKKhyfSSQp5IPuJFg0xgiCvMCNdyx+Mvp0w1eQSJOgxSpy/RLbQpLWRIFlgpr65LF5UkJ/v2qBN4Ubi74qDVC/JW+iFglLEtYX/edWTD+BCZnCtoASJFXxJgykK/wagtFYQfW7DnyavGAlZLy4KHCGANbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482581; c=relaxed/simple;
	bh=DFq2kunWevqAn2ktzrMzyuc3g/sY8K2+kBE2zc+sZbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V9cUgkFRCf86y1U+P3+cHv9Mi+xd3dZc/BYa0OYMcMcwg10kT6RzDkWhrMQ50Gl3aUpaezcflUOpKBOFhUaYYAhvMurdCNHWO9qfKrSQjRbHHjtOhc+4x2dplf+1ns+wM1KRFTotJtziqmYqYs4tiBDe8eP8Ctv1dOuxlcfqDCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCfNm/vD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCfNm/vD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790482579; x=1822018579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFq2kunWevqAn2ktzrMzyuc3g/sY8K2+kBE2zc+sZbY=;
  b=nCfNm/vDsCQZ1kffovlurGtPFXArB1Nasv+e0RRYXe+bi43IT08HbX2W
   0iKSPPY+UlWdvx4hBF0ZV5aCDWmCOkIQS3pOibR1Gjc1jdNl2vXLvhRGH
   iPD73ib2Nrv72PXvYPWuSi+R8FeTY97JVvPgN5gaXtN5mJj2pWr7wHQKI
   d7922sVFjPMp2phNFyoP/aFN2bZb/ESXBWAZhLF709/bxWXJUV8O7MKcS
   PfmSjCNGGIkY9I5juvK/1PR1uYi69gdvb3IxXwjZ6TGyBcD1f2zqffVDg
   Da19CK5fv0/XPGAj2PqkLV/taZGC4sAxLPineWjoCGkTrECuO7a2Le7+H
   g==;
X-CSE-ConnectionGUID: os9GapCrRXWc7ouJ31j48g==
X-CSE-MsgGUID: bu6/CKq0TCCSH7obpdad4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="108706398"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="108706398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 21:16:18 -0700
X-CSE-ConnectionGUID: VSCQmULLQfOLgXyJwevgsg==
X-CSE-MsgGUID: 3tcBkL/JQpyTbdcpyt+6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="282776478"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2026 21:16:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAgJB-00000000MOx-2YOu;
	Sun, 27 Sep 2026 04:16:13 +0000
Date: Sun, 27 Sep 2026 12:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
 Christian Brauner <brauner@kernel.org>,
 =?utf-8?Q?"G=C3=BCnther?= Noack" <gnoack@google.com>
Subject: [linux-next:master 1600/10910]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_636' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(a->u) > sizeof(void *)*2
Message-ID: <202609271254.ivVsYFHQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: e26307d83048803274837abf33f65396a88e21ac [1600/10910] lsm: add LSM_AUDIT_DATA_NS for namespace audit records
config: arm-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271254.ivVsYFHQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271254.ivVsYFHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271254.ivVsYFHQ-lkp@intel.com/

Note: the linux-next/master HEAD f5f84daefcd92d7a630066635ecea1433ed5eac7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   security/lsm_audit.c: In function 'audit_log_lsm_data':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_636' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(void *)*2
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:185:9: note: in expansion of macro 'BUILD_BUG_ON'
     185 |         BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
         |         ^~~~~~~~~~~~
   In function 'audit_log_lsm_data',
       inlined from 'dump_common_audit_data' at security/lsm_audit.c:425:2,
       inlined from 'common_lsm_audit' at security/lsm_audit.c:455:2:
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_636' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(void *)*2
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:185:9: note: in expansion of macro 'BUILD_BUG_ON'
     185 |         BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_636 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
