Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FDA1FA856
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287108; cv=none; b=AL3lFkPKRUk0h5ewFB/OZGW5Sjq4gvhf17fuPW+0avObd/3+cY5h58ElFXzgtcIjhROV8b6HD5hrhdqbzV0jPbxeSvZ7040Fe16xPC1ptIu+n80z/XCs3pWxNiyOxNPNKm7DbdxpT0/7bvX0c9B2ObkU4y5CVsJ7fotth4QnhsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287108; c=relaxed/simple;
	bh=d5vV211aS60eF6NNwbhxf77ujBr7dUOTnsKyj6aaYmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGDFGqskr7vSBN73tKnhsVkMEA4LcXomJ6vkD6UXy2PFVGSxrWb3nledj8Ksmz4tKNPP1rVdCuig6X+sIKILmlb48VFd55Xk07LlS4qOziz/VPwIEBc4DMw2NElKPyBRyWZG3c5MLujVDl0M/nlLXJpF27PDs/urxbVFBjd3KKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSfbdRV9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSfbdRV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739287106; x=1770823106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5vV211aS60eF6NNwbhxf77ujBr7dUOTnsKyj6aaYmY=;
  b=kSfbdRV97cLm4FxCpstoQ3CVGb/LE5nBgaMPB93aICdv8we0wcmFmMI2
   tQxl8ijuQ3sM36cJQ0L54OyL36eHpKDG1NzrCWT35san0MwQTwEFBGGp6
   +pVma/1tU7ObMyDcjJWo+1LyeEVdoet3vtm0w8eLSYg5qpmlXAgWzoZxw
   ETLaC0LThInpYJOA4dYDhYJY7lCasyvHr6FteW8r27Y//LaNmRE+S15kw
   FDBuqQuNrSZ5hDdqDYCbouFtsVEO2PYVAlLdq0VbOaa/bWERkcPJD3uf+
   HMEmvLNHqo5+J/6THVeCaG7pb3bnJtgmHFXDDeTS60VZwz/pcJ86rdyyn
   Q==;
X-CSE-ConnectionGUID: PRBysdypS+uT9wfC0Vbd0Q==
X-CSE-MsgGUID: TufVdEzoTwypxS2AO1Ziew==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43568821"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43568821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:18:26 -0800
X-CSE-ConnectionGUID: RHse6ImsTWCUcrN2lF3w4w==
X-CSE-MsgGUID: LxIJqDy8TrWqv85/EZxSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112753233"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Feb 2025 07:18:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ths1m-0014LT-1N;
	Tue, 11 Feb 2025 15:18:22 +0000
Date: Tue, 11 Feb 2025 23:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 6/6] io_uring: cache nodes and mapped buffers
Message-ID: <202502112335.EuJfv4N7-lkp@intel.com>
References: <20250211005646.222452-7-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211005646.222452-7-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-use-node-for-import/20250211-091231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250211005646.222452-7-kbusch%40meta.com
patch subject: [PATCHv2 6/6] io_uring: cache nodes and mapped buffers
config: i386-buildonly-randconfig-004-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112335.EuJfv4N7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112335.EuJfv4N7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112335.EuJfv4N7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'io_rsrc_buffer_alloc',
       inlined from 'io_clone_buffers' at io_uring/rsrc.c:1119:8:
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: imu_cache_size != 512
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:180:9: note: in expansion of macro 'BUILD_BUG_ON'
     180 |         BUILD_BUG_ON(imu_cache_size != 512);
         |         ^~~~~~~~~~~~
   In function 'io_rsrc_buffer_alloc',
       inlined from 'io_sqe_buffers_register' at io_uring/rsrc.c:881:8:
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: imu_cache_size != 512
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:180:9: note: in expansion of macro 'BUILD_BUG_ON'
     180 |         BUILD_BUG_ON(imu_cache_size != 512);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_432 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
