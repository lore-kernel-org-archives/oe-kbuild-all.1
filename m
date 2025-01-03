Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601EB186A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735936092; cv=none; b=Ia6MXryP16+ZLWxjlRF5a41pupCzIQQmnb4sYGCtzQIFT3HZyispA1FoeAMDyTs8LUrn3G3gg6S9imIe6TDGkas3ZWQY1jJrNciIXMxewtXqvk8gKJpEdQoj+1oesXQKRYlLpLMloENQmh810sQxEA8krkXbl7QZQWhLp/RrFIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735936092; c=relaxed/simple;
	bh=NrlEp6okl23zuUMFcNStNYQiuFSXd5KPI8AXNJo+Ccc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hi8QRsEP4BZo1Pnxgqizmlcp0a9mu/i7QbOcllvK5CezU+7paSu1LAuewEr70lmG8+E9R/kSgH3szUpFU7nF+kC5ZmyRaP5wvX1SIgVpOgYK5AkkVaG81qdCPgCBtEc+2tuPej6Rw4hlvriJ4oDP5tohDKAt5r/vNZMZKkSPx3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxcfXQ1x; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxcfXQ1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735936090; x=1767472090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NrlEp6okl23zuUMFcNStNYQiuFSXd5KPI8AXNJo+Ccc=;
  b=ZxcfXQ1xlhjQSKNHB/Em3MUCMRFnE/04VFqQBPSHLkf0ptMvZecTl+SV
   EsK6pTDeToKI4NKC3bCliCAzUArIQDXld6JLKveB8UiH+IijMcZfWyXQO
   6C/kz2RCUQpuonPFksjflSFKmW3tV0NYz2Gmfjy0j4awt1ATEf4BgwiKY
   iryuHQucjou76DgdXGNWStCA3L67IBI5CiotXXjPUtjOk8WS4qmv/Z/Dt
   qkxn/uCIg0P2aPDokIxDiXqOQpxWu2MTN3qWHdn/Or1EpyT6iJcZoMeGq
   eTTyRQHalmoNJ9TP/a7O2SIoniOPO3KZ4qJs3ya7ffjXbTatiYDkjRk5b
   A==;
X-CSE-ConnectionGUID: NF5TkHfwS2ycvKRDIWPQPw==
X-CSE-MsgGUID: V2ifwiW5Tl+hcl394Vsa8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36061412"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36061412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 12:28:09 -0800
X-CSE-ConnectionGUID: Nv2p4y9kTQGeC2IoXgjCNg==
X-CSE-MsgGUID: yQGqHuf/SKCliCc2BUL34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102371361"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 12:28:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tToH8-000AGl-10;
	Fri, 03 Jan 2025 20:28:06 +0000
Date: Sat, 4 Jan 2025 04:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 42/141]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_413' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202501040446.CrPCDN4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   cedff7a221491210ded37efd786e4095067faa84
commit: 08015b572224e06c290793e2b8be3cc94875d37b [42/141] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250104/202501040446.CrPCDN4l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040446.CrPCDN4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040446.CrPCDN4l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_413' declared with attribute error: clamp() low limit source_min greater than high limit source_max
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
   include/linux/minmax.h:109:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     109 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:116:9: note: in expansion of macro '__clamp_once'
     116 |         __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^~~~~~~~~~~~
   include/linux/minmax.h:192:28: note: in expansion of macro '__careful_clamp'
     192 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_backlight.c:47:22: note: in expansion of macro 'clamp'
      47 |         source_val = clamp(source_val, source_min, source_max);
         |                      ^~~~~


vim +/__compiletime_assert_413 +542 include/linux/compiler_types.h

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

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
