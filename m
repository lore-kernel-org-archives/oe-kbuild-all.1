Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1252C08B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411772; cv=none; b=s79IeK/eijylF4v+cV6lv9xcVaaP1BFRYyw3SELZEjAK8HYx5bqmI/vGvVQw32tn9Hdhkp08xnn5VkrhkwXyzdtd/z6vcYuI8VjNWHqU9UNxdGlpZsUC9LkOpUjFms5HxdHaTCC3j7Ke3aTD4mG/zW5vL+QKpfC5To6SPg7o1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411772; c=relaxed/simple;
	bh=cuLtFa4X5N8EDw4JojqtUoQ3rGWi3/cxlUCgRiMT6L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOakZUPYLXZZda2MzBehebvXYG9pgEyGnwLOmI3MKCcUPt92vH3hlB7PFvGGNahxE0QwfC4C7IDi017CDSMYpT1Wdyr0OgiT9NggebODxV0fC5kYjOXQagdUPp5iH/9VP4RSf/pm8QSqxML1MyIuZEiv6qSC/SMdYPFqhOzH06A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IieUf7SB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IieUf7SB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769411771; x=1800947771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuLtFa4X5N8EDw4JojqtUoQ3rGWi3/cxlUCgRiMT6L4=;
  b=IieUf7SBWAdoCgPVAPNJt+LJb9Yhw4AAthPMvmASaDRPa5MTeHU81FJt
   3a5MfRJE1NMETK0+AiYbDw5VVCXp6TJ4F3dWSh/eA+PYDGnPq32/qgs0L
   eSqbyRG7iupDP33BWKO3yIuV54SmI8OyF50Fr/xmohMmvaySO14oL/JQd
   ThYomC2nXwlsmWIZYz9/Ft0yrAbqII3+kHla7Tgzfz2yAycy8bWTmumoV
   06DdRtRzh2a3tVDjPVjNDKEhAoRYM6luTzxTqCGe78LzaA739F+Xcf30f
   7ntfzcttZ0MaeMSn5RKc7MSpjPeHp8M1JUJsYpxDs6yn/gqa6nfix7Nrm
   g==;
X-CSE-ConnectionGUID: LOg4GC2gQX2W8cRtlcdPJQ==
X-CSE-MsgGUID: PNDmmgR6QIS36dsy4aHjag==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="82019788"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="82019788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 23:16:10 -0800
X-CSE-ConnectionGUID: trsgUnd6SlCWjfR5ZCFcqQ==
X-CSE-MsgGUID: +0ide2moQIWlxfHbk/B9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207415440"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 23:16:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkGpP-00000000X2M-3B5n;
	Mon, 26 Jan 2026 07:16:03 +0000
Date: Mon, 26 Jan 2026 15:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 06/12] mm, swap: implement helpers for reserving data in
 the swap table
Message-ID: <202601261555.3oBvFZIt-lkp@intel.com>
References: <20260126-swap-table-p3-v1-6-a74155fab9b0@tencent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-swap-table-p3-v1-6-a74155fab9b0@tencent.com>

Hi Kairui,

kernel test robot noticed the following build errors:

[auto build test ERROR on 10de4550639e9df9242e32e9affc90ed75a27c7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-protect-si-swap_file-properly-and-use-as-a-mount-indicator/20260126-020149
base:   10de4550639e9df9242e32e9affc90ed75a27c7d
patch link:    https://lore.kernel.org/r/20260126-swap-table-p3-v1-6-a74155fab9b0%40tencent.com
patch subject: [PATCH 06/12] mm, swap: implement helpers for reserving data in the swap table
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601261555.3oBvFZIt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261555.3oBvFZIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261555.3oBvFZIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'pfn_to_swp_tb',
       inlined from 'folio_to_swp_tb' at mm/swap_table.h:115:9,
       inlined from '__swap_cache_add_folio' at mm/swap_state.c:151:11:
>> include/linux/compiler_types.h:631:45: error: call to '__compiletime_assert_601' declared with attribute error: BUILD_BUG_ON failed: SWAP_CACHE_PFN_BITS > (BITS_PER_LONG - SWP_TB_PFN_MARK_BITS - SWP_TB_COUNT_BITS)
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:612:25: note: in definition of macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/swap_table.h:104:9: note: in expansion of macro 'BUILD_BUG_ON'
     104 |         BUILD_BUG_ON(SWAP_CACHE_PFN_BITS >
         |         ^~~~~~~~~~~~
   In function 'pfn_to_swp_tb',
       inlined from 'folio_to_swp_tb' at mm/swap_table.h:115:9,
       inlined from '__swap_cache_replace_folio' at mm/swap_state.c:334:11:
>> include/linux/compiler_types.h:631:45: error: call to '__compiletime_assert_601' declared with attribute error: BUILD_BUG_ON failed: SWAP_CACHE_PFN_BITS > (BITS_PER_LONG - SWP_TB_PFN_MARK_BITS - SWP_TB_COUNT_BITS)
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:612:25: note: in definition of macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/swap_table.h:104:9: note: in expansion of macro 'BUILD_BUG_ON'
     104 |         BUILD_BUG_ON(SWAP_CACHE_PFN_BITS >
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_601 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  632  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
