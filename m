Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268F19CCF5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462079; cv=none; b=sSMpu1zb+5I4klA0LfIV98cNSIEMA9mKxj6EMGaYSOfMFMUj7Di2kL8BgBCQOjT7Xdh+6l1UuPYvldbb+wu3ymjSInxG10xmQHAStUxNfeqfsw6xNjM0G09dU4QQuPrtwg2Ciw/7CEETdg6f64IZtedSnTP7ejSJ8c3UXmQpFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462079; c=relaxed/simple;
	bh=r9g9tayX2BNzBOsoO4LKPiYpdJzteplfqHExhwjZ1SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUI813df0XWWcoln1IJ/IFdrBEBrFURqx+DC5Pz/yoHu4/QPwCvcl1dRjD0d62Tg0DZYxYCtq4jrKqDW24eDsOOJS05u7r+wBkLnezxceIQQhEDeJZe0SNukqsJJLZTCoODsrsV7we0kfOxrKx6/uCEquRxH4x9pROGbyLKAmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSM2wBaX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSM2wBaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746462078; x=1777998078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r9g9tayX2BNzBOsoO4LKPiYpdJzteplfqHExhwjZ1SI=;
  b=VSM2wBaXr849WUmHItuqbio2lu6Zjv8/1tsrxGuk49kL/b1GiK46YsX4
   aYPlsCHQDeyyRzGZgSqw0Rr4hsUWqS1bMPBhstMxTKdUr+XbBDjFUN5Rx
   rTdELnfqBd/snbPLD7H93VQQvWqqR5rYDe3DbDGeT9NDBcO8bctizrue1
   nbM5T8gFzbhIP5o1N8yDMxM12ZMFMDeU7BrT5Hf0PaZlGcrdl5STW9WjH
   yTx3byKp/phtHJC8F1m0SDh/kg9g0P08CYh2g0xMK0AsGAvLrbccH2vsh
   aDOOVFzBIcB14aBEWWpZpYxvEN0r3d8vkPOdOwQd/CSKlnR2UMjUv6H1k
   g==;
X-CSE-ConnectionGUID: RCVl0CyJTEi+JW9B6xColA==
X-CSE-MsgGUID: wyysY7aiQ4SSVWWPjNshwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35701625"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="35701625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:21:17 -0700
X-CSE-ConnectionGUID: y8uBKpPkRR2srnwxgjQT6A==
X-CSE-MsgGUID: dDhYFdsOSrauaASKg0LeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="135260364"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2025 09:21:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uByZ7-0005uj-2E;
	Mon, 05 May 2025 16:21:13 +0000
Date: Tue, 6 May 2025 00:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <202505060013.Qh7iYBWr-lkp@intel.com>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502080156.1672957-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-zblock-use-vmalloc-for-page-allocations/20250502-160411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250502080156.1672957-1-vitaly.wool%40konsulko.se
patch subject: [PATCH] mm/zblock: use vmalloc for page allocations
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250506/202505060013.Qh7iYBWr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060013.Qh7iYBWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060013.Qh7iYBWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zblock.c:29:
   mm/zblock.h:22:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      22 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~
   In file included from <command-line>:
   In function 'create_rbtree',
       inlined from 'init_zblock' at mm/zblock.c:479:12:
>> include/linux/compiler_types.h:563:45: error: call to '__compiletime_assert_318' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE
     563 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:544:25: note: in definition of macro '__compiletime_assert'
     544 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:563:9: note: in expansion of macro '_compiletime_assert'
     563 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/zblock.c:444:9: note: in expansion of macro 'BUILD_BUG_ON'
     444 |         BUILD_BUG_ON(ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE);
         |         ^~~~~~~~~~~~
--
   In file included from zblock.c:29:
   zblock.h:22:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      22 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~
   In file included from <command-line>:
   In function 'create_rbtree',
       inlined from 'init_zblock' at zblock.c:479:12:
>> include/linux/compiler_types.h:563:45: error: call to '__compiletime_assert_318' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE
     563 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:544:25: note: in definition of macro '__compiletime_assert'
     544 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:563:9: note: in expansion of macro '_compiletime_assert'
     563 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   zblock.c:444:9: note: in expansion of macro 'BUILD_BUG_ON'
     444 |         BUILD_BUG_ON(ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_318 +563 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  549  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @563  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
