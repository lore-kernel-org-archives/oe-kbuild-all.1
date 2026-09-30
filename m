Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F949B443
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810905; cv=none; b=OSg56ctugjZAuNlWpDa+2a5LCgXRGQUkLz6w0FXLl+c1qrV9DQNFGLHjNYX3R6/rLjlhHLDE8qTnGIa6GJQIqHUHg407D3vZYcpKcdU45B/v/ZFn/gVgx2PCS401qGPBeqXifE/NEfrVhBJh+K3JAdhM7COTq5LJK3C7X2oY2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810905; c=relaxed/simple;
	bh=awqUHkLPaDbQ4w8BxwA1nwJawvLW5hJFdh3B+xoI0nE=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkybdBIzaMT6jk9PWpZAtLQT68IQMtuP+mioa2GM9kHIoT743BQutaDIbJl94FofIwvIqn8ovNcXQLKa7UlfCNy+UJqclYf8/zDzCdBC96S8nIgl1uteBe0iyM6f3J1j95ravY/ZEQl44+gRcyzIdK04rnEwbWxigjgBzqEggh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+hv54ee; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+hv54ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790810903; x=1822346903;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=awqUHkLPaDbQ4w8BxwA1nwJawvLW5hJFdh3B+xoI0nE=;
  b=g+hv54ee/RKW9n5PLc5DX3dskeaS2SfyVWxN1+kPzs5nlYHEQsrZXM3d
   yBQsrAGQzr0bt9GW3ljE8w4VdwEc9ETf2QilPUpyCFAQUYBFMFU+U8MvN
   0To4y6RYGH61/8bDlP0oTMWmvxvLqQF9KTCMEkJBgSOtnZ9QIlI0ZNIoJ
   +83pExol4x/+cY3WNVG6KEubOlKR6gCKxlBJQKcytgyl9LRwZIKZbhHlA
   BiAOyO/qDIzHwOafccCmhoGQjdczrdwT7Rl9MKB5/EdXztkxtX6D3xdJP
   i4xDkp3aKITVZ2E0Pm/qUbRsSs96qmQdiqeHskVGuHuRE8xxKqx4O398Z
   Q==;
X-CSE-ConnectionGUID: gP6EndobTzGjOW3gLiw/dA==
X-CSE-MsgGUID: Y8uaFaIiS82f+nvS6AQvdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94274759"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="94274759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 16:28:22 -0700
X-CSE-ConnectionGUID: Z96d9A7RTX6WWshEdgXJTw==
X-CSE-MsgGUID: o8fDk2DzQjKDfMzfMsvTow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275025398"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2026 16:28:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC3ik-00000000RFO-390C
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 23:28:18 +0000
Date: Thu, 1 Oct 2026 07:27:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: tracing: Make branch profiler counters atomic
Message-ID: <202610010712.OWcuDJOr-lkp@intel.com>
References: <202610010712.OWcuDJOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610010712.OWcuDJOr-lkp@intel.com>

Hi nanshuaibo,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/nanshuaibo/tracing-Make-branch-profiler-counters-atomic/20260930-110728
base:   
patch link:    https://lore.kernel.org/r/202610010712.OWcuDJOr-lkp%40intel.com
config: arm64-randconfig-1001-20261001 (https://download.01.org/0day-ci/archive/20261001/202610010712.OWcuDJOr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010712.OWcuDJOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010712.OWcuDJOr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/test_bitmap.c: In function 'test_bitmap_const_eval':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_490' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(res)
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
     683 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   lib/test_bitmap.c:1326:2: note: in expansion of macro 'BUILD_BUG_ON'
    1326 |  BUILD_BUG_ON(!__builtin_constant_p(res));
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_490 +702 include/linux/compiler_types.h

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
