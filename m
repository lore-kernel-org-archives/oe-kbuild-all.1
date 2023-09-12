Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EABB64C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694552799; x=1726088799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cw22/moUFtf9A0iJvuGutCWN5elSyS3g5jzGF4nmW7I=;
  b=L3J+j1SavbaY/wSTUPZtu6ygdMZ4W+2ytownUHLLnJmKJmOY00QedMT7
   Bd6bGEQpJ8ePfz2T/xar3PAgFRDNgp6MBJaBl/KeY1fhr5xKUyUO9S8TF
   hl+JI7af+miVxEboWofJg0PYS3o1rVFKhCTPSnbKcTQ3PnsUBG4nTYFzH
   Lj5eqxmpQRzqy1kLOld47Ru5hysYCPpvSgB7ZFgAJhLu7CcHz/+7//1DO
   EPV17WaSJYqycyJliCBj+KI4/bMUMIpAdwBPCtX8JRu7FdjNhZuKL4NG5
   x7SFn8/MFRa8zVC1AwiQxn4y/iBHd8T+lZMb+6SZMnx7zMZnE2gROBuEx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378401566"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="378401566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 14:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773181987"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="773181987"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 14:06:36 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgAag-0000H7-0i;
	Tue, 12 Sep 2023 21:06:34 +0000
Date: Wed, 13 Sep 2023 05:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] workingset: simplify and use a more intuitive
 model
Message-ID: <202309130414.AExd7FVY-lkp@intel.com>
References: <20230912184511.49333-2-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912184511.49333-2-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1]
[cannot apply to akpm-mm/mm-everything next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230913-024648
base:   linus/master
patch link:    https://lore.kernel.org/r/20230912184511.49333-2-ryncsn%40gmail.com
patch subject: [RFC PATCH v2 1/5] workingset: simplify and use a more intuitive model
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230913/202309130414.AExd7FVY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130414.AExd7FVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130414.AExd7FVY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/workingset.c: In function 'lru_refault':
>> mm/workingset.c:253:43: warning: unused variable 'inactive' [-Wunused-variable]
     253 |         unsigned long workingset, active, inactive, inactive_file, inactive_anon = 0;
         |                                           ^~~~~~~~
>> mm/workingset.c:253:23: warning: unused variable 'workingset' [-Wunused-variable]
     253 |         unsigned long workingset, active, inactive, inactive_file, inactive_anon = 0;
         |                       ^~~~~~~~~~


vim +/inactive +253 mm/workingset.c

   243	
   244	/*
   245	 * Calculate and test refault distance
   246	 */
   247	static inline bool lru_refault(struct mem_cgroup *memcg,
   248				       struct lruvec *lruvec,
   249				       unsigned long eviction, bool file,
   250				       int bits, int bucket_order)
   251	{
   252		unsigned long refault, distance;
 > 253		unsigned long workingset, active, inactive, inactive_file, inactive_anon = 0;
   254	
   255		eviction <<= bucket_order;
   256		refault = atomic_long_read(&lruvec->nonresident_age);
   257	
   258		/*
   259		 * The unsigned subtraction here gives an accurate distance
   260		 * across nonresident_age overflows in most cases. There is a
   261		 * special case: usually, shadow entries have a short lifetime
   262		 * and are either refaulted or reclaimed along with the inode
   263		 * before they get too old.  But it is not impossible for the
   264		 * nonresident_age to lap a shadow entry in the field, which
   265		 * can then result in a false small refault distance, leading
   266		 * to a false activation should this old entry actually
   267		 * refault again.  However, earlier kernels used to deactivate
   268		 * unconditionally with *every* reclaim invocation for the
   269		 * longest time, so the occasional inappropriate activation
   270		 * leading to pressure on the active list is not a problem.
   271		 */
   272		distance = (refault - eviction) & (~0UL >> (BITS_PER_LONG - bits));
   273	
   274		active = lruvec_page_state(lruvec, NR_ACTIVE_FILE);
   275		inactive_file = lruvec_page_state(lruvec, NR_INACTIVE_FILE);
   276		if (mem_cgroup_get_nr_swap_pages(memcg) > 0) {
   277			active += lruvec_page_state(lruvec, NR_ACTIVE_ANON);
   278			inactive_anon = lruvec_page_state(lruvec, NR_INACTIVE_ANON);
   279		}
   280	
   281		/*
   282		 * Compare the distance to the existing workingset size. We
   283		 * don't activate pages that couldn't stay resident even if
   284		 * all the memory was available to the workingset. Whether
   285		 * workingset competition needs to consider anon or not depends
   286		 * on having free swap space.
   287		 *
   288		 * When there are already enough active pages, be less aggressive
   289		 * on reactivating pages, challenge an already established set of
   290		 * active pages with one time refaulted page may not be a good idea.
   291		 */
   292		if (active >= (inactive_anon + inactive_file))
   293			return distance < inactive_anon + inactive_file;
   294		else
   295			return distance < active + (file ? inactive_anon : inactive_file);
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
