Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794455788;
	b=hDnqxvLaG0XB6j1qlpzrFjoj3K+505TpNXX9m0kx15I1LST+stZCKgi0V6gCNjULOYql
	 S8FqfDVUFIbasQfmLeZ+QfMg+EyZ/ieHzbilKijQRNvVFvQmfYM9vQkEAQiU/MIXJDgRj
	 YYOPseLu4HOgBBShfPi3od9ygLAytpQ3PYnpHsXlY189GOKWONJznRtSeic0XgFdUHxyu
	 TZD4Fu6CS6eiZM0+JMazMvOJuRCe9firrtu6jcxhOLO2bd1GmWGeA3M8BeX3Iv8H2rssl
	 bufuIPZxVF9KVJ6nvQJ24Rn+7O+FGP3CvJeXG8lKtnLw0bPvRb00BUarqRyEUC2SSHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455788;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6GssXKttDMVy2Z0Ups0u4mss2pxQ72pnbqnLBNLyVG4=;
	b=sPuV2IZFfA1bDbL5ROea0W3yockC5SxUuBLkm1MVeVFMFVs6byZbTY60DSMX/nRCBdNk
	 B27/j+vmGKvHEd7FD7qW4DRGuXeOGq02EDmUbsK9054pPdk8X0yO8OQ9SFAPbg3oJ7pqT
	 5VOFcwf48S651Aa1O/9XoZ+820b+Dk0AqEDxnB/gNsFFNz+wDvhDuYGkxTKcsUZrZR1JN
	 tWGRd35Qwr6ivsM274pCtRUobDBrzBkUKQiUdnt6sO4w6vQAE9U6sAb03nASgYMyVWucv
	 C3PTSNg8CFqmQEIyL+/ho8oBL3LvaWkUoJIy0r78GxFciKz9AIRVm2P5jopxsj22pog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lcnGtgqi;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 03:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lcnGtgqi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794455787; x=1825991787;
  h=date:from:to:cc:subject:message-id;
  bh=baH2/vFX8r1sy0eMq4emH9RCG3/ilnrtGu/AD6gLbVg=;
  b=lcnGtgqiumiqjw8oD4O+zOFDDFoedJy66Uy0YbwSWf6ZUASsMToAOfq4
   Vlb/a8i4X3kMXYuP+aVR6mXEsNBnru7UN0whsLDRdixIzFA6pvG8YRPPb
   qZl7Pmv5QIq7CiVpuenemEivA5P1TYUQgfu0R5IDrmxgSqloQajKLYs/+
   Q4Y9dtk/3121dR6dIZfIwiAw+/jZ8oZ/YAxl0fqBSVK9QZ9j82ZbV5/+g
   5gWysqtzLHtiYMAcWRbCMGStPdA9quEI8n98aO+oyWawVgmvdyOsHBhNY
   t8iJ2HOvJ3CXeX9WRiaIsPztyKaJAWaJqy3UUCm84r0iFF+f9/VrjsTPG
   Q==;
X-CSE-ConnectionGUID: NGbYYM/URDWyjl67BogOzA==
X-CSE-MsgGUID: jwfI+H29RlO6KWlUgxEjcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3227064"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3227064"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 19:56:27 -0800
X-CSE-ConnectionGUID: vTuj68cTRYKV17BJRQW60Q==
X-CSE-MsgGUID: DzK6auGNQs2rusp1IOxmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8419257"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2026 19:56:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRLvC-000000000nn-20kY;
	Thu, 12 Nov 2026 03:56:22 +0000
Date: Thu, 12 Nov 2026 04:55:59 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 8/8]
 include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_527' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct z_erofs_map_header) != 8
Message-ID: <202611120456.w89UAMqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   7cc7455426123221ba503e4251c3e829baf3a56c
commit: fba340769f186c3e8448148a5524c8f34daeb468 [8/8] erofs: add encoded extent on-disk definition
config: arm-randconfig-2000-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120456.w89UAMqR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120456.w89UAMqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120456.w89UAMqR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'erofs_check_ondisk_layout_definitions',
       inlined from 'erofs_module_init' at fs/erofs/super.c:934:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_527' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct z_erofs_map_header) != 8
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/erofs/erofs_fs.h:449:9: note: in expansion of macro 'BUILD_BUG_ON'
     449 |         BUILD_BUG_ON(sizeof(struct z_erofs_map_header) != 8);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_527 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
