Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA36FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687326917; x=1718862917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sy/1UFEzQ9uZ8qfK1iWbO3ykD6MhkF5vXQpYygIXJm0=;
  b=d3JKjOjR2bAVSKhLJWJO6doul6M5yYi+qLLRj7dLjYJyztMtyL2saNtr
   iG6bYg6hHHV1I7/WAq497tDK8lrm4JrZ6W4zQwDAToC72g9mKjDM2KNlc
   4BxRM4QKTCAv1qpzSN6HrJfjsKe3QLt8eosrs4oDTBOhMqPRN27IudWNY
   ZBaRYTDQ8FBDCWFE1sNCozZG4tgyjzRFxk9tAAEFbACtLByc8BBr+kFhB
   N/o+A7qYj778UeT7RiSTmlZg2D3txcLwVmpE6OmOT7QIlClpKw6hyig2L
   WkWstAT5fr9xu33l5XmspUISA9MO5qkf3My45lPXzRKNJMblVlVWOGL/t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357572545"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="357572545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 22:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="744035641"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="744035641"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2023 22:54:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBqnx-0006bJ-2E;
	Wed, 21 Jun 2023 05:54:57 +0000
Date: Wed, 21 Jun 2023 13:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	torvalds@linuxfoundation.org, vegard.nossum@oracle.com,
	mpe@ellerman.id.au, Liam.Howlett@oracle.com, lrh2000@pku.edu.cn,
	mgorman@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, surenb@google.com
Subject: Re: [PATCH 3/3] mm: check for VMA being detached before destroying it
Message-ID: <202306211345.Xt94CVTt-lkp@intel.com>
References: <20230620235726.3873043-3-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620235726.3873043-3-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-change-vma_start_read-to-fail-to-lock-a-detached-VMA/20230621-075833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230620235726.3873043-3-surenb%40google.com
patch subject: [PATCH 3/3] mm: check for VMA being detached before destroying it
config: sparc-randconfig-r022-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211345.Xt94CVTt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211345.Xt94CVTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211345.Xt94CVTt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/sound/pcm.h:15,
                    from sound/drivers/aloop.c:27:
   include/linux/mm.h: In function 'vma_init':
   include/linux/mm.h:753:12: error: 'struct vm_area_struct' has no member named 'detached'
     753 |         vma->detached = true;
         |            ^~
   In file included from include/linux/init.h:5,
                    from sound/drivers/aloop.c:18:
   sound/drivers/aloop.c: At top level:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/aloop.c:46:1: note: in expansion of macro 'module_param_array'
      46 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/drivers/aloop.c:39:12: warning: 'index' defined but not used [-Wunused-variable]
      39 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/sound/pcm.h:15,
                    from sound/drivers/dummy.c:20:
   include/linux/mm.h: In function 'vma_init':
   include/linux/mm.h:753:12: error: 'struct vm_area_struct' has no member named 'detached'
     753 |         vma->detached = true;
         |            ^~
   In file included from include/linux/init.h:5,
                    from sound/drivers/dummy.c:7:
   sound/drivers/dummy.c: At top level:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:62:1: note: in expansion of macro 'module_param_array'
      62 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:48:12: warning: 'index' defined but not used [-Wunused-variable]
      48 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
