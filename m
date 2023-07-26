Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955381363
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 04:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690346832; x=1721882832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lm0hrUoNwVydk5eJaBqovRFEQT2bzN0X66jZCiWECkw=;
  b=TZ7S8gV0d17cp7afcqAnRcpYO6PFBbY0VZIcQI+u9TU6pBOXUt1ZwNak
   PNwz+pcmCZy2uEitUl81ogOwz2Jyb66eCg0UE0q/ovvZpODqjIazm/Hib
   0wGAieL5FU6NbV+6SnK8hxwjFWa9EQB6rxXG4jsLrKBgiIhSLYS4vyOOi
   fiagyweUUzqDSRYNsHFGlwcfiht/axkni8PUr0Jahr/gLHu6omTD9VIYf
   P9DQRSFDNRXGzQJPJOt1yz+yqJWObG7chm0UBUi5cWbv0GwDbL1IOjToS
   xJhxugyPbegEFI2Wdlftdzx0GwXd5spgrEknb9o4tUfXJP1rmHZVgjc7Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431715932"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431715932"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 21:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972953260"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="972953260"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 21:47:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOWPg-0000gR-2d;
	Wed, 26 Jul 2023 04:46:23 +0000
Date: Wed, 26 Jul 2023 12:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] workingset, lru_gen: apply refault-distance
 based re-activation
Message-ID: <202307261246.9mn3msOi-lkp@intel.com>
References: <20230725185733.43929-5-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725185733.43929-5-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230726-025946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230725185733.43929-5-ryncsn%40gmail.com
patch subject: [RFC PATCH 4/4] workingset, lru_gen: apply refault-distance based re-activation
config: i386-randconfig-i012-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261246.9mn3msOi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261246.9mn3msOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261246.9mn3msOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_test_recent':
   mm/workingset.c:537:67: warning: passing argument 3 of 'lru_gen_test_recent' makes pointer from integer without a cast [-Wint-conversion]
     537 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                                                                   ^~~~~~~~
         |                                                                   |
         |                                                                   long unsigned int
   mm/workingset.c:449:74: note: expected 'struct lruvec **' but argument is of type 'long unsigned int'
     449 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |                                                          ~~~~~~~~~~~~~~~~^~~~~~
   mm/workingset.c:537:24: error: too few arguments to function 'lru_gen_test_recent'
     537 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                        ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c:449:13: note: declared here
     449 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |             ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c: At top level:
>> mm/workingset.c:199:21: warning: 'lru_gen_bucket_order' defined but not used [-Wunused-variable]
     199 | static unsigned int lru_gen_bucket_order __read_mostly;
         |                     ^~~~~~~~~~~~~~~~~~~~


vim +/lru_gen_bucket_order +199 mm/workingset.c

   189	
   190	/*
   191	 * Eviction timestamps need to be able to cover the full range of
   192	 * actionable refaults. However, bits are tight in the xarray
   193	 * entry, and after storing the identifier for the lruvec there might
   194	 * not be enough left to represent every single actionable refault. In
   195	 * that case, we have to sacrifice granularity for distance, and group
   196	 * evictions into coarser buckets by shaving off lower timestamp bits.
   197	 */
   198	static unsigned int bucket_order __read_mostly;
 > 199	static unsigned int lru_gen_bucket_order __read_mostly;
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
