Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787818F2C3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 03:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741318815; cv=none; b=eD7e2GJGIdtzML8W9ur/0Tzh3nj00DD0I49uvUwtvK4n9d6yeoBF/kkAVXswDgEHSLD8H4nrrFomoJ8fvUlQUZfkKbO0TS87ZOQ4kBTcZdlAUauVHDuK6683xi1v+JdY2imLlPgOgVsyJXqrJd+6F+Vu0Bi45Keybq43tYXKo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741318815; c=relaxed/simple;
	bh=fyQXl3brd3qQYlZIRU/OdbZDDvjbA6fU9y98rBfw7qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YguvVoK9ZfyGyn2jzMlQa0BvwX76Xs7Av6EtuPRotfYoOT7scUOInR2dzFEXHa+XP6zpEaCNrUDVBV70rJ5QCtsOr+AV5iE5S8hCPieAqxkBGDPpc1BH1c6F7JG1S2+YHm3PdQ7B+KBs1a3ibyym9kR1HgpjVzjfJJarPuD4u7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5WM0jWz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5WM0jWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741318814; x=1772854814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyQXl3brd3qQYlZIRU/OdbZDDvjbA6fU9y98rBfw7qw=;
  b=m5WM0jWz3X2ZKUZ/2AjUvRUTuCbD4TDxt9svj1WwPWQBRnJtU5uJGdxO
   c954lzZV8b8MhvkP8EoL2SS9brt7fI15sVDi2y4CiS8PKc/3zfVVkm5iG
   gpvln01qsCZrfEhQY3x57m46DTaF8mZxbagUhsUDGrPI0eaMYTgCSVxW7
   CcVE8R4WGdq7lPF4glsncH78L8ZUVnIjYt5m70ttOcVM57BaSseHVZPfA
   oNmRVAMOh9bbzHm6mOKDw1zXxk4gGWGtJ9m+hl7pN/jc+4vwwt11oYNS1
   D7ZlJ6Pa+G53/ZNxOnIT/zH2CI111YPz2ZHqhydAHuWzOutrGpW1jqXh+
   g==;
X-CSE-ConnectionGUID: PMIAyaePRyWsco+VvijGXQ==
X-CSE-MsgGUID: iRBru55HRWiE6KQXuDqmQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53756965"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53756965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:40:13 -0800
X-CSE-ConnectionGUID: 0msCiQSVSdKczjqOYJy2cw==
X-CSE-MsgGUID: ALOC+wvaShmuMYFgaF3wYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124139530"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2025 19:40:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqOZC-000OEQ-05;
	Fri, 07 Mar 2025 03:40:06 +0000
Date: Fri, 7 Mar 2025 11:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: arthur@arthurfabre.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 02/20] trait: XDP support
Message-ID: <202503071156.Q2Vf0mLs-lkp@intel.com>
References: <20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797@cloudflare.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01]

url:    https://github.com/intel-lab-lkp/linux/commits/arthur-arthurfabre-com/trait-limited-KV-store-for-packet-metadata/20250305-224338
base:   42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01
patch link:    https://lore.kernel.org/r/20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797%40cloudflare.com
patch subject: [PATCH RFC bpf-next 02/20] trait: XDP support
config: arc-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071156.Q2Vf0mLs-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071156.Q2Vf0mLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071156.Q2Vf0mLs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/cache.h:28,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from fs/select.c:18:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct xdp_frame) == _XDP_FRAME_SIZE"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/xdp.h:283:1: note: in expansion of macro 'static_assert'
     283 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
