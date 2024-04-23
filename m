Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF826288
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905929; cv=none; b=SrhvwQkHNnCJf+YnlPueeAVgEtqGbTi462ATpEaNIdYH55qX1pX/nuBwlpMw9QqUqWjLYSRQvHjfCNO2G4dVCI/t6/jcho1jlDvg/69yeMcYYuZ7HSOMcB3dl37lXvJmQB35RiSS1w3q2/DuCaaxDs9qjiQ7nN5nQDz6/OyYyxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905929; c=relaxed/simple;
	bh=Qy4sdg29Juz2GTiSo4BncU5Hy/MIfwj3g5FQMQmTjtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw3hqGJnZ+0wL/wdBjEvYT6aSj8g/Skkj++tDgtBerYpLkhKtCcY3oVsEW7T5goBhEeg5NdbeXm5TkqUq83067Ktl1X8hK8CXtzhlfapogOcwfRi5EB63lC9g/GEF1SLWA7LfmwKNlLW4OX9nqBc6fgWHynS64K5or2QPPvvZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F74bQ2WI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F74bQ2WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713905927; x=1745441927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qy4sdg29Juz2GTiSo4BncU5Hy/MIfwj3g5FQMQmTjtA=;
  b=F74bQ2WIIFPwoWGUhhq54nrnXQIjaV62+JV43E4geArTDqLkpA1+23KP
   5QuHek90L7xkB8AZBwcQ/UhBxm7TlPaMY1rQDuQSp2I75/J7NFHaxh1DB
   ZdItjNImFvNrCqFxVCdNPbkGhSROnOgYY2HObDO/7LZz7PBneDo56AH45
   MvH4NbLk/6GQF4DXruz+67gROqercIOIvqCupRZTLMzgAf3bydfDMHrqq
   UL04z9poEScS6xkkXmoSEIAmyeP5pO47BKgMtVUKE+5IKdQWeVlLkibl0
   hpbiPVLP7IJFaH8ElpBjerq7KxOF/4GSIJ+2nuWUPpX/HhhFnWhckcM6y
   Q==;
X-CSE-ConnectionGUID: aooXPyPuSTOY80rg94RWgw==
X-CSE-MsgGUID: pSMXqUpgSjSzHTdLqg5phA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20919131"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20919131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:58:46 -0700
X-CSE-ConnectionGUID: TVdTZWOwTDejY2K5PtYvfg==
X-CSE-MsgGUID: rAD7FQdgRGKbFpNCKufyng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55692766"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2024 13:58:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzNDu-0000Wi-0j;
	Tue, 23 Apr 2024 20:58:42 +0000
Date: Wed, 24 Apr 2024 04:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] memcg: reduce memory for the lruvec and memcg stats
Message-ID: <202404240415.fucxk6Ix-lkp@intel.com>
References: <20240423051826.791934-3-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423051826.791934-3-shakeel.butt@linux.dev>

Hi Shakeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240422]
[cannot apply to akpm-mm/mm-everything linus/master v6.9-rc5 v6.9-rc4 v6.9-rc3 v6.9-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/mm-rearrange-node_stat_item-to-put-memcg-stats-at-start/20240423-132451
base:   next-20240422
patch link:    https://lore.kernel.org/r/20240423051826.791934-3-shakeel.butt%40linux.dev
patch subject: [PATCH 2/4] memcg: reduce memory for the lruvec and memcg stats
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240415.fucxk6Ix-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240415.fucxk6Ix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240415.fucxk6Ix-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'memcg_stat_format',
       inlined from 'memory_stat_format.constprop' at mm/memcontrol.c:1707:3:
>> include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_633' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(memory_stats) != MEMCG_NR_STAT - 1
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/memcontrol.c:1651:9: note: in expansion of macro 'BUILD_BUG_ON'
    1651 |         BUILD_BUG_ON(ARRAY_SIZE(memory_stats) != MEMCG_NR_STAT - 1);
         |         ^~~~~~~~~~~~
   In function 'memcg_stat_format',
       inlined from 'memory_stat_format' at mm/memcontrol.c:1707:3,
       inlined from 'memory_stat_show' at mm/memcontrol.c:6946:2:
>> include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_633' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(memory_stats) != MEMCG_NR_STAT - 1
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/memcontrol.c:1651:9: note: in expansion of macro 'BUILD_BUG_ON'
    1651 |         BUILD_BUG_ON(ARRAY_SIZE(memory_stats) != MEMCG_NR_STAT - 1);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_633 +460 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  446  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  449  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  451   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  452   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  453   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  454   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  455   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  456   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  457   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  458   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  459  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @460  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
