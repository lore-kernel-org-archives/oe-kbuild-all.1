Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA23B0ADC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298183; cv=none; b=KAXs8mkeCrH1pRhvRsI6EopKkZwjZdH7ecD90RNUPBMF456kw2TEiYVQy95y7+O1BUEKRgcrwBvQG4QgD/22/ef+UgnHH7vefXaf4/hPJptCpu7IGtRtHILsIg9pd845H/8aZHMiW58Mk1+DSRIKaiU7JzEgaMDxhBDcxRWhZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298183; c=relaxed/simple;
	bh=n92oaTwzuIDIlDAYFtjna6xrHmcjxCuUj+OIEvHizuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkQi7tA6S+k7mu9gOMdDfcNnW+Sb3PF75Nko48eDZNcGZAbwP2pu4dhI8+XIAyVLHWuVvZ33Y193gvwLiFwv+S4McXkmOPtpRayRP+tqOzFpQ77BZ+qM0ALwbMkLQI4hbq2o2GsAc2uhCs52QDPxhc4c+d51/hrD1by2ed1vCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dt78HLyg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dt78HLyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787298180; x=1818834180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n92oaTwzuIDIlDAYFtjna6xrHmcjxCuUj+OIEvHizuI=;
  b=dt78HLyguuMTW1PaU7pwKCOkDf7jmbO5zFvVIZGfdrkjpQ8v6OaW/GpE
   tEOUdd9QmBLuOuQ5P+ycbLiERd6m1Uq9+qxh0eVJp/am+oIFGYUvPq/uK
   J51ChrLeYhE4x8A0ZVRek0NyWTVi5g90RMnTJPLc/Viqr22Gc5V9Bmrx8
   in0uEYps+AB/UpLaoYIXvi3EaNvoriijX/lPUtRGLFcAbZyT3tMBtBoew
   ihlKyvklJfHjAiPEazp8DumD9QyPC5EI7YRpJioZiNCCyUA2f8g6OkyJL
   Ua6I5Re4LHkxHoQyW7u/WdNJSyVsheLODpLKn21h2mNoD4qqquH2S6ReW
   w==;
X-CSE-ConnectionGUID: vvo5aWR1RJW9Ag6i5wT9jg==
X-CSE-MsgGUID: 8Zy2t9BuTwKMMO8fcJPQnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="110631222"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="110631222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 00:42:58 -0700
X-CSE-ConnectionGUID: pxnUpv0zRjGJH6XSkLtgQA==
X-CSE-MsgGUID: tgZuX/ldSvuwoE4kDYuTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="264983479"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2026 00:42:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxJtr-00000000pZJ-3EXX;
	Fri, 21 Aug 2026 07:42:51 +0000
Date: Fri, 21 Aug 2026 15:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmstat: add per-order allocation slow path statistics
Message-ID: <202608211553.F2rJl3PW-lkp@intel.com>
References: <20260820133659.712111-1-d-tatianin@yandex-team.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820133659.712111-1-d-tatianin@yandex-team.ru>

Hi Daniil,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2]
[cannot apply to akpm-mm/mm-everything next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniil-Tatianin/mm-vmstat-add-per-order-allocation-slow-path-statistics/20260820-163658
base:   linus/master
patch link:    https://lore.kernel.org/r/20260820133659.712111-1-d-tatianin%40yandex-team.ru
patch subject: [PATCH] mm/vmstat: add per-order allocation slow path statistics
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260821/202608211553.F2rJl3PW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211553.F2rJl3PW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211553.F2rJl3PW-lkp@intel.com/

All errors (new ones prefixed by >>):

    1537 |         TEXTS_FOR_ORDERS(PGALLOC_FAIL_ORDER_FIRST, "pgalloc_fail_order")
         |         ^~~~~~~~~~~~~~~~
   mm/vmstat.c:1537:52: warning: initialized field overwritten [-Woverride-init]
    1537 |         TEXTS_FOR_ORDERS(PGALLOC_FAIL_ORDER_FIRST, "pgalloc_fail_order")
         |                                                    ^~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1537:9: note: in expansion of macro 'TEXTS_FOR_ORDERS'
    1537 |         TEXTS_FOR_ORDERS(PGALLOC_FAIL_ORDER_FIRST, "pgalloc_fail_order")
         |         ^~~~~~~~~~~~~~~~
   mm/vmstat.c:1537:52: note: (near initialization for 'vmstat_text[156]')
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1537:9: note: in expansion of macro 'TEXTS_FOR_ORDERS'
    1537 |         TEXTS_FOR_ORDERS(PGALLOC_FAIL_ORDER_FIRST, "pgalloc_fail_order")
         |         ^~~~~~~~~~~~~~~~
   mm/vmstat.c:1540:34: warning: initialized field overwritten [-Woverride-init]
    1540 |                                  "compact_stall_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1213:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1213 |         [I((xx) + 1)] = yy "1",                 \
         |                         ^~
   mm/vmstat.c:1540:34: note: (near initialization for 'vmstat_text[160]')
   mm/vmstat.c:1213:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1213 |         [I((xx) + 1)] = yy "1",                 \
         |                         ^~
   mm/vmstat.c:1540:34: warning: initialized field overwritten [-Woverride-init]
    1540 |                                  "compact_stall_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1214:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1214 |         [I((xx) + 2)] = yy "2",                 \
         |                         ^~
   mm/vmstat.c:1540:34: note: (near initialization for 'vmstat_text[161]')
   mm/vmstat.c:1214:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1214 |         [I((xx) + 2)] = yy "2",                 \
         |                         ^~
   mm/vmstat.c:1540:34: warning: initialized field overwritten [-Woverride-init]
    1540 |                                  "compact_stall_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1540:34: note: (near initialization for 'vmstat_text[162]')
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1540:34: warning: initialized field overwritten [-Woverride-init]
    1540 |                                  "compact_stall_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1216:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1216 |         [I((xx) + 4)] = yy "4",                 \
         |                         ^~
   mm/vmstat.c:1540:34: note: (near initialization for 'vmstat_text[163]')
   mm/vmstat.c:1216:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1216 |         [I((xx) + 4)] = yy "4",                 \
         |                         ^~
   mm/vmstat.c:1542:34: warning: initialized field overwritten [-Woverride-init]
    1542 |                                  "compact_success_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1213:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1213 |         [I((xx) + 1)] = yy "1",                 \
         |                         ^~
   mm/vmstat.c:1542:34: note: (near initialization for 'vmstat_text[166]')
   mm/vmstat.c:1213:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1213 |         [I((xx) + 1)] = yy "1",                 \
         |                         ^~
   mm/vmstat.c:1542:34: warning: initialized field overwritten [-Woverride-init]
    1542 |                                  "compact_success_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1214:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1214 |         [I((xx) + 2)] = yy "2",                 \
         |                         ^~
   mm/vmstat.c:1542:34: note: (near initialization for 'vmstat_text[167]')
   mm/vmstat.c:1214:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1214 |         [I((xx) + 2)] = yy "2",                 \
         |                         ^~
   mm/vmstat.c:1542:34: warning: initialized field overwritten [-Woverride-init]
    1542 |                                  "compact_success_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1542:34: note: (near initialization for 'vmstat_text[168]')
   mm/vmstat.c:1215:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1215 |         [I((xx) + 3)] = yy "3",                 \
         |                         ^~
   mm/vmstat.c:1542:34: warning: initialized field overwritten [-Woverride-init]
    1542 |                                  "compact_success_order")
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   mm/vmstat.c:1216:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1216 |         [I((xx) + 4)] = yy "4",                 \
         |                         ^~
   mm/vmstat.c:1542:34: note: (near initialization for 'vmstat_text[169]')
   mm/vmstat.c:1216:25: note: in definition of macro 'TEXTS_FOR_NONZERO_ORDERS'
    1216 |         [I((xx) + 4)] = yy "4",                 \
         |                         ^~
   In file included from <command-line>:
   mm/vmstat.c: In function 'vmstat_start':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_467' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/vmstat.c:1941:9: note: in expansion of macro 'BUILD_BUG_ON'
    1941 |         BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_467 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
