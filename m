Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212837647B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596963; cv=none; b=mkketSpxQF7g+IXc4dojthGFmdY8RDPD9WWzPXUolC3B3hc9RTnsONJjnzVSFeV3bcA1XAasuZWb+IG4lEwLLAE9fq1HWrFyojQL5YayHgipcQ10tKvEFEVCyxYTzqcUKPuHm8D5oxhso6VB+T4NoG4TD/uo1WJ13Rys1klCYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596963; c=relaxed/simple;
	bh=/+REivr2tSEA6yQjflHdCoXb1xW+e30zB3zefEJCqNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d3ESY/H/BQS8rn+FPjjivun6W1LMOk4jZ1/UgdSvXEMfm5grT9GgfOpSv5jyqo9g+SQbgzWizPapBj279mdYnEmoZ8DsfbWbfKGT5Z2pAauki6+GxQ6ndAQ4UdW/XQWWuhCdAVSbX9QfuTxXSepbchPaUCObAb08BfjS/0a25n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkKbBmW9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkKbBmW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786596960; x=1818132960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+REivr2tSEA6yQjflHdCoXb1xW+e30zB3zefEJCqNI=;
  b=ZkKbBmW9Pgs1DG69w1Y+cOniRP135Zcgbyh8XH9rflV4A2E4oXc4NSmP
   UYud6NmQmZRzeZ5XeJNvswwKr3gv+WTqUzARVb8b1RqJ1OMus22PsK0O1
   2jwYuiG6gZKk4jM2CU2YF1sQbeF0NsOGhsZMgrZdoTXwxKcBio26uySG3
   fPTRka6lCBLH+557U7fFBbZ7JsMr9mr3P4iCGXoLM4KgYpFVRkZzpiMV8
   XHQ6VDuDioyDRbvZixf+rcIPqw4U48WnD/Sg34WY4xY88URiTzxjH/m+1
   +IsIOx1EGEq+J6S3yUQaYsIvY1285YBtLsIa+sz+wM99awyPTDmwGHGWU
   w==;
X-CSE-ConnectionGUID: pE/wVWe4ST601QjKVwERDw==
X-CSE-MsgGUID: Smj7bMZSRhyrRHGglVY6Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104698347"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104698347"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:55:59 -0700
X-CSE-ConnectionGUID: NvvF9au8T2ibGTD2urs/vw==
X-CSE-MsgGUID: ihdHizXTRQqBvXnQnLoK7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260016004"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 21:55:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuNTv-00000000Sri-0gWZ;
	Thu, 13 Aug 2026 04:55:55 +0000
Date: Thu, 13 Aug 2026 12:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
 Christian Brauner <brauner@kernel.org>,
 =?utf-8?Q?"G=C3=BCnther?= Noack" <gnoack@google.com>
Subject: [linuxsecuritymodule:dev-staging 8/8]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_850' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(a->u) > sizeof(void *)*2
Message-ID: <202608131232.Owej9tlx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   1f2f7a1fd1fc34e757107e3a3849f8d22b14cc6b
commit: 1f2f7a1fd1fc34e757107e3a3849f8d22b14cc6b [8/8] lsm: add LSM_AUDIT_DATA_NS for namespace audit records
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260813/202608131232.Owej9tlx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131232.Owej9tlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131232.Owej9tlx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   security/lsm_audit.c: In function 'audit_log_lsm_data':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_850' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(void *)*2
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
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_850' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(void *)*2
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


vim +/__compiletime_assert_850 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
