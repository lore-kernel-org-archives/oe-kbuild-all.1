Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED7101F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694780040; x=1726316040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zgee8zDq5uKDULAwPLWtzSfzZ94ccRmOL76tpinp1co=;
  b=RiQqvWqIfOZ7RDLQtlqjB5P2HLvqMzBcLmFidXc2XGMFj+sT1aN6Zw47
   Sqi3y3T62+OCXPmfHRA1M+d1Ndt0Y/9b/5PriJKqlqVFQLIfq3gyTgr+o
   6ybAKLQcMEtFYAX6VTtg7UUUEQ8xgnvYjIKg+IFdJVda5P8H8JZckxoPo
   9WoU3eu1CIvVmg0Y0n8xgUgmjtrFa+5vWWB4n4jp4My3R9RNO5EL4EzP8
   b+UMAn1Lj2pyaH5Ckoe/MfFHCqo/nyXhS/L3vG/CVXA90kNhnmfQCxhpi
   Gwv1c9x29Y7mLqyFBZoBLhziqHnJn9/OFwfBKXcyTfFQVJVtPmdWahjKq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358647962"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="358647962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810499293"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="810499293"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2023 05:13:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh7ho-0002wZ-0z;
	Fri, 15 Sep 2023 12:13:52 +0000
Date: Fri, 15 Sep 2023 20:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com, yosryahmed@google.com,
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH 2/2] zswap: shrinks zswap pool based on memory pressure
Message-ID: <202309152048.GDMxTtFF-lkp@intel.com>
References: <20230911164024.2541401-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911164024.2541401-3-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zswap-make-shrinking-memcg-aware/20230912-004147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230911164024.2541401-3-nphamcs%40gmail.com
patch subject: [PATCH 2/2] zswap: shrinks zswap pool based on memory pressure
config: loongarch-randconfig-001-20230914 (https://download.01.org/0day-ci/archive/20230915/202309152048.GDMxTtFF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152048.GDMxTtFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152048.GDMxTtFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_lru_add':
   mm/zswap.c:341:17: error: implicit declaration of function 'get_mem_cgroup_from_objcg'; did you mean 'get_mem_cgroup_from_mm'? [-Werror=implicit-function-declaration]
     341 |                 get_mem_cgroup_from_objcg(entry->objcg) : NULL;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 get_mem_cgroup_from_mm
   mm/zswap.c:341:57: warning: pointer/integer type mismatch in conditional expression
     341 |                 get_mem_cgroup_from_objcg(entry->objcg) : NULL;
         |                                                         ^
   mm/zswap.c: In function 'zswap_lru_del':
   mm/zswap.c:366:57: warning: pointer/integer type mismatch in conditional expression
     366 |                 get_mem_cgroup_from_objcg(entry->objcg) : NULL;
         |                                                         ^
   mm/zswap.c: In function 'zswap_shrinker_count':
>> mm/zswap.c:546:9: error: implicit declaration of function 'cgroup_rstat_flush' [-Werror=implicit-function-declaration]
     546 |         cgroup_rstat_flush(memcg->css.cgroup);
         |         ^~~~~~~~~~~~~~~~~~
   mm/zswap.c:546:33: error: invalid use of undefined type 'struct mem_cgroup'
     546 |         cgroup_rstat_flush(memcg->css.cgroup);
         |                                 ^~
   mm/zswap.c: In function 'shrink_memcg_cb':
   mm/zswap.c:816:80: warning: pointer/integer type mismatch in conditional expression
     816 |                 memcg = entry->objcg ? get_mem_cgroup_from_objcg(entry->objcg) : NULL;
         |                                                                                ^
   mm/zswap.c: In function 'shrink_worker':
   mm/zswap.c:896:51: error: invalid use of undefined type 'struct mem_cgroup'
     896 |                         css_put(&pool->next_shrink->css);
         |                                                   ^~
   mm/zswap.c: In function 'zswap_pool_destroy':
   mm/zswap.c:1054:43: error: invalid use of undefined type 'struct mem_cgroup'
    1054 |                 css_put(&pool->next_shrink->css);
         |                                           ^~
   mm/zswap.c: In function 'zswap_store':
   mm/zswap.c:1446:23: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1446 |                 memcg = get_mem_cgroup_from_objcg(objcg);
         |                       ^
   mm/zswap.c:1448:39: error: invalid use of undefined type 'struct mem_cgroup'
    1448 |                         css_put(&memcg->css);
         |                                       ^~
   mm/zswap.c:1451:31: error: invalid use of undefined type 'struct mem_cgroup'
    1451 |                 css_put(&memcg->css);
         |                               ^~
   mm/zswap.c:1497:23: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1497 |                 memcg = get_mem_cgroup_from_objcg(objcg);
         |                       ^
   mm/zswap.c:1499:31: error: invalid use of undefined type 'struct mem_cgroup'
    1499 |                 css_put(&memcg->css);
         |                               ^~
   cc1: some warnings being treated as errors


vim +/cgroup_rstat_flush +546 mm/zswap.c

   537	
   538	static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
   539			struct shrink_control *sc)
   540	{
   541		struct zswap_pool *pool = container_of(shrinker, typeof(*pool), shrinker);
   542		struct mem_cgroup *memcg = sc->memcg;
   543		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(sc->nid));
   544		unsigned long nr_backing, nr_stored, nr_freeable, flags;
   545	
 > 546		cgroup_rstat_flush(memcg->css.cgroup);
   547		nr_backing = memcg_page_state(memcg, MEMCG_ZSWAP_B) >> PAGE_SHIFT;
   548		nr_stored = memcg_page_state(memcg, MEMCG_ZSWAPPED);
   549	
   550		if (!is_shrinker_enabled(memcg) || !nr_stored)
   551			return 0;
   552	
   553		nr_freeable  = list_lru_shrink_count(&pool->list_lru, sc);
   554		/*
   555		 * Subtract the lru size by an estimate of the number of pages
   556		 * that should be protected.
   557		 */
   558		spin_lock_irqsave(&lruvec->lru_lock, flags);
   559		nr_freeable = nr_freeable > lruvec->nr_zswap_protected ?
   560			nr_freeable - lruvec->nr_zswap_protected : 0;
   561		spin_unlock_irqrestore(&lruvec->lru_lock, flags);
   562	
   563		/*
   564		 * Scale the number of freeable pages by the memory saving factor.
   565		 * This ensures that the better zswap compresses memory, the fewer
   566		 * pages we will evict to swap (as it will otherwise incur IO for
   567		 * relatively small memory saving).
   568		 */
   569		return mult_frac(nr_freeable, nr_backing, nr_stored);
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
