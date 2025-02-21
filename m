Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA112AE89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740136419; cv=none; b=qyev8UN0uitCNzmlUyTYamznFIhQ1AQFxLtKfOQySW+rjWf2I+Rx5POqSft2wjIUj1f/Rl1I9mvyGoSeSo9owfVPTuAUBhUgk2yMv5w2W8Nv0VjhDLAuFmT7xtaR+nyCUPhnsmXKNeAbg9JETlaQSpwE1I7nQ77Xg1iy9kdWHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740136419; c=relaxed/simple;
	bh=a9Xae8K7YqVRaN1OR8a0QwfwaV9gDf9chiM0JA/V0Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWIBYQmyEhrXMg5Y5ZuLELPTLKo1I3ve0uJfn/iyhPcex3K4xp6Ho4c7oBZuI3L55eLVcVyQVcbcY774NLaAQ+1uy5HDSZyJ69L88xYvrwO9Kg7A5mpMDOKbQEvAuZ8TFK9cTNdjkbtBPYK/LpG6L18Zwb+qOGFnXxK4PdBo1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kij3SgI/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kij3SgI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740136417; x=1771672417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a9Xae8K7YqVRaN1OR8a0QwfwaV9gDf9chiM0JA/V0Ig=;
  b=Kij3SgI/Lix32sZlwrxakWHZ7ggBe4coWY9G1owDQIf3KmkVoA66tnub
   WHXV73BXGMHK0lY0177v/Onz5CD9VQsvVaIu3vx3eQhM4LK+89jpc66qr
   Tyv+kiIodwz9z41k+bM/UyyoRtEY5r8TGnsAKNNYtBZtI/XIvhCtzYW/z
   KNgvfkL7e09c/eBtUahDnYYASmhxHVooq23CWElYXwt4NSRrB6T0JJ0+h
   SWAtWnAirzqm4ygB4Vb7WQV8t6VhRT+kv4R4JcaKrgLvb5XOlLXG/axlf
   WpF708TCqbEjNK/8QoHfAJAUlBvC4dWn1EcktFPi+KPqk/ioYIGZZb9/M
   g==;
X-CSE-ConnectionGUID: 4i0WFrAERNaKOLxuIeYgBA==
X-CSE-MsgGUID: iFMRbG6mQ4yUXksUN9ZcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51943246"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51943246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:13:37 -0800
X-CSE-ConnectionGUID: q6E5mfz1S9y8KZoKZnCKLA==
X-CSE-MsgGUID: uqx79RLGRr+dhtxsGkUfSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115178843"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Feb 2025 03:13:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlQyL-0005R1-2B;
	Fri, 21 Feb 2025 11:13:33 +0000
Date: Fri, 21 Feb 2025 19:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] btrfs: prepare extent_io.c for future larger folio
 support
Message-ID: <202502211908.aCcQQyEY-lkp@intel.com>
References: <19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu@suse.com>

Hi Qu,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on next-20250221]
[cannot apply to linus/master v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-prepare-subpage-c-for-larger-folios-support/20250220-172912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu%40suse.com
patch subject: [PATCH 4/5] btrfs: prepare extent_io.c for future larger folio support
config: arc-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211908.aCcQQyEY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211908.aCcQQyEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211908.aCcQQyEY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/btrfs/extent_io.c: In function 'extent_write_locked_range':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_439' declared with attribute error: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
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
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/btrfs/extent_io.c:2327:27: note: in expansion of macro 'min'
    2327 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
         |                           ^~~
--
   In file included from <command-line>:
   extent_io.c: In function 'extent_write_locked_range':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_439' declared with attribute error: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
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
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   extent_io.c:2327:27: note: in expansion of macro 'min'
    2327 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
         |                           ^~~


vim +/__compiletime_assert_439 +542 include/linux/compiler_types.h

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
