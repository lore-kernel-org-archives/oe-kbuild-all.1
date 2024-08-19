Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16315B11D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059239; cv=none; b=dwMGPAcSaoqdt6Qik7KzxoAD+EOFvdgKW1fic4hjr1h7Jlc6PaiYtcw5J02Bn2yw6wYMV2Ajh+DdRMENLE+ou776UWps6ZLVStpPzlouhO3C35LMbXW7TPOCSYYf7glhdlwcD503DSzYoEhgCb+nmCkNj4Y97RAV3TV2XsGpXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059239; c=relaxed/simple;
	bh=d4LQ/5jCxCErwpEAERUK/rz23ykLp55e7h6REfsBV04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXQierWAEZQWNKFBqUn/zOIjAJ6JSPss8Udprk0MTYxH++Yh/tAmFFr7dqgHG5DGaW1udKVB7/uBQG/xaJD0ZEyNqnKoGufabVkIawzitYT0SMUvokUrFQURmIcKHRPVaabWBs7d00bcZMl8ORdRNPQ+GphdzsUG2ki7AY2e3M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQzk/8hr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQzk/8hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724059237; x=1755595237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d4LQ/5jCxCErwpEAERUK/rz23ykLp55e7h6REfsBV04=;
  b=jQzk/8hrmBIC1F81dZdGSzujXGYbBEBWYNTU7U416nytPx7nIjm1baJz
   hG0ZGXMw8HgVeYv9yLMc6aR8Hxm2VgRYdYK4UX8mSKCon6UyGC9lrQ9x6
   z3+IcvECS2JSvZr9z+QtWvHMfqhO2EwmFrZQFg6iyCCSPbHsoiaBx6huY
   Q3zA1q+P7Yr0mjbwIvRzNYQu+IT8FRpneO5hG3ujdz0dqlVL53SEi8yFn
   3REIjSh0cKzPiil1MMSnSOkIcs7dls7+rYBg2WFy6faDdOXNv8mBLrfZz
   AjHgTvt8HLI2El3Wn8OGEFQnaxLFVpoJYBxRuBBLSSEtKaNDnDBEs70zb
   A==;
X-CSE-ConnectionGUID: ypSKhTQkTVWWOPhw/HqCZA==
X-CSE-MsgGUID: w0OiyBWTQ9mcanZAFXO7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13088691"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="13088691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:20:36 -0700
X-CSE-ConnectionGUID: ZSfZZRJQSXK/xkTHKrujCg==
X-CSE-MsgGUID: hsh4yqydSo6OOWWIKOJo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60021485"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 02:20:35 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfyYy-0008q2-2u;
	Mon, 19 Aug 2024 09:20:32 +0000
Date: Mon, 19 Aug 2024 17:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: skip less than check for MAX_NR_ZONES
Message-ID: <202408191739.UV22bvQV-lkp@intel.com>
References: <20240819031911.367900-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819031911.367900-1-alexs@kernel.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/alexs-kernel-org/mm-skip-less-than-check-for-MAX_NR_ZONES/20240819-111528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240819031911.367900-1-alexs%40kernel.org
patch subject: [PATCH] mm: skip less than check for MAX_NR_ZONES
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240819/202408191739.UV22bvQV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191739.UV22bvQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191739.UV22bvQV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:18,
                    from include/linux/sched/signal.h:14,
                    from include/linux/ptrace.h:7,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/page-flags-layout.h:17:20: error: token "=" is not valid in preprocessor expressions
      17 | #elif MAX_NR_ZONES = 2
         |                    ^
   make[3]: *** [scripts/Makefile.build:117: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +17 include/linux/page-flags-layout.h

     7	
     8	/*
     9	 * When a memory allocation must conform to specific limitations (such
    10	 * as being suitable for DMA) the caller will pass in hints to the
    11	 * allocator in the gfp_mask, in the zone modifier bits.  These bits
    12	 * are used to select a priority ordered list of memory zones which
    13	 * match the requested limits. See gfp_zone() in include/linux/gfp.h
    14	 */
    15	#if MAX_NR_ZONES < 2
    16	#define ZONES_SHIFT 0
  > 17	#elif MAX_NR_ZONES = 2
    18	#define ZONES_SHIFT 1
    19	#elif MAX_NR_ZONES <= 4
    20	#define ZONES_SHIFT 2
    21	#elif MAX_NR_ZONES <= 8
    22	#define ZONES_SHIFT 3
    23	#else
    24	#error ZONES_SHIFT "Too many zones configured"
    25	#endif
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
