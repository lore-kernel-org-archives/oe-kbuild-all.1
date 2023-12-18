Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ADD37897
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXSgYsa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910730; x=1734446730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ln3IukuEpuxBWX0S8EkgJAQQfwl4bE3qF9acRnbEcao=;
  b=fXSgYsa0XBMkroQoU/a4rWizUB07PV8ODfrffKemjqb3h5etj/XI74SF
   DKdylLItez4qLuCnZtO7UWGY7mc4xwe9U2zvHbpWj3X2eoh3ezpCvr2sR
   lp19HJsnR50nMsUrVWqs8+8JqcPa2mkWdHfc9NtWm3Di9eb9bpgyyCRWK
   HQyntPsC3R0LMdpgmFTYxETq4YBo9I2KbN5UFxioDtAGj3kXVfRjKHXqR
   e7GEyMYDkJn5cidtDJQrh9hwtJ3MZiLvy/AwbHjwMH1qohtQn5RFtq8lF
   eKubsC5oAEDFyteLbwhO+rawGBjcgYJUmn4ObXoaS6LmnbY2hC1wnaY78
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="17073137"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="17073137"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="809862271"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="809862271"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2023 06:45:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFEs1-0004CX-0g;
	Mon, 18 Dec 2023 14:45:25 +0000
Date: Mon, 18 Dec 2023 22:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8322/9113] mm/zswap.c:644:9: error: too few
 arguments to function 'mem_cgroup_flush_stats'
Message-ID: <202312182206.dlCV0jBv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: 3e66d585be0b60d7cbf5cdb391dfeb5452040b5a [8322/9113] mm: memcg: restore subtree stats flushing
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231218/202312182206.dlCV0jBv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312182206.dlCV0jBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312182206.dlCV0jBv-lkp@intel.com/

Note: the linux-next/master HEAD ceb2fe0d438644e1de06b9a6468a1fb8e2199c70 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_shrinker_count':
>> mm/zswap.c:644:9: error: too few arguments to function 'mem_cgroup_flush_stats'
     644 |         mem_cgroup_flush_stats();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/swap.h:9,
                    from mm/zswap.c:24:
   include/linux/memcontrol.h:1054:6: note: declared here
    1054 | void mem_cgroup_flush_stats(struct mem_cgroup *memcg);
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_flush_stats +644 mm/zswap.c

b5ba474f3f5187 Nhat Pham 2023-11-30  631  
b5ba474f3f5187 Nhat Pham 2023-11-30  632  static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
b5ba474f3f5187 Nhat Pham 2023-11-30  633  		struct shrink_control *sc)
b5ba474f3f5187 Nhat Pham 2023-11-30  634  {
b5ba474f3f5187 Nhat Pham 2023-11-30  635  	struct zswap_pool *pool = shrinker->private_data;
b5ba474f3f5187 Nhat Pham 2023-11-30  636  	struct mem_cgroup *memcg = sc->memcg;
b5ba474f3f5187 Nhat Pham 2023-11-30  637  	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(sc->nid));
b5ba474f3f5187 Nhat Pham 2023-11-30  638  	unsigned long nr_backing, nr_stored, nr_freeable, nr_protected;
b5ba474f3f5187 Nhat Pham 2023-11-30  639  
b5ba474f3f5187 Nhat Pham 2023-11-30  640  	if (!zswap_shrinker_enabled)
b5ba474f3f5187 Nhat Pham 2023-11-30  641  		return 0;
b5ba474f3f5187 Nhat Pham 2023-11-30  642  
b5ba474f3f5187 Nhat Pham 2023-11-30  643  #ifdef CONFIG_MEMCG_KMEM
b5ba474f3f5187 Nhat Pham 2023-11-30 @644  	mem_cgroup_flush_stats();
b5ba474f3f5187 Nhat Pham 2023-11-30  645  	nr_backing = memcg_page_state(memcg, MEMCG_ZSWAP_B) >> PAGE_SHIFT;
b5ba474f3f5187 Nhat Pham 2023-11-30  646  	nr_stored = memcg_page_state(memcg, MEMCG_ZSWAPPED);
b5ba474f3f5187 Nhat Pham 2023-11-30  647  #else
b5ba474f3f5187 Nhat Pham 2023-11-30  648  	/* use pool stats instead of memcg stats */
b5ba474f3f5187 Nhat Pham 2023-11-30  649  	nr_backing = get_zswap_pool_size(pool) >> PAGE_SHIFT;
b5ba474f3f5187 Nhat Pham 2023-11-30  650  	nr_stored = atomic_read(&pool->nr_stored);
b5ba474f3f5187 Nhat Pham 2023-11-30  651  #endif
b5ba474f3f5187 Nhat Pham 2023-11-30  652  
b5ba474f3f5187 Nhat Pham 2023-11-30  653  	if (!nr_stored)
b5ba474f3f5187 Nhat Pham 2023-11-30  654  		return 0;
b5ba474f3f5187 Nhat Pham 2023-11-30  655  
b5ba474f3f5187 Nhat Pham 2023-11-30  656  	nr_protected =
b5ba474f3f5187 Nhat Pham 2023-11-30  657  		atomic_long_read(&lruvec->zswap_lruvec_state.nr_zswap_protected);
b5ba474f3f5187 Nhat Pham 2023-11-30  658  	nr_freeable = list_lru_shrink_count(&pool->list_lru, sc);
b5ba474f3f5187 Nhat Pham 2023-11-30  659  	/*
b5ba474f3f5187 Nhat Pham 2023-11-30  660  	 * Subtract the lru size by an estimate of the number of pages
b5ba474f3f5187 Nhat Pham 2023-11-30  661  	 * that should be protected.
b5ba474f3f5187 Nhat Pham 2023-11-30  662  	 */
b5ba474f3f5187 Nhat Pham 2023-11-30  663  	nr_freeable = nr_freeable > nr_protected ? nr_freeable - nr_protected : 0;
b5ba474f3f5187 Nhat Pham 2023-11-30  664  
b5ba474f3f5187 Nhat Pham 2023-11-30  665  	/*
b5ba474f3f5187 Nhat Pham 2023-11-30  666  	 * Scale the number of freeable pages by the memory saving factor.
b5ba474f3f5187 Nhat Pham 2023-11-30  667  	 * This ensures that the better zswap compresses memory, the fewer
b5ba474f3f5187 Nhat Pham 2023-11-30  668  	 * pages we will evict to swap (as it will otherwise incur IO for
b5ba474f3f5187 Nhat Pham 2023-11-30  669  	 * relatively small memory saving).
b5ba474f3f5187 Nhat Pham 2023-11-30  670  	 */
b5ba474f3f5187 Nhat Pham 2023-11-30  671  	return mult_frac(nr_freeable, nr_backing, nr_stored);
b5ba474f3f5187 Nhat Pham 2023-11-30  672  }
b5ba474f3f5187 Nhat Pham 2023-11-30  673  

:::::: The code at line 644 was first introduced by commit
:::::: b5ba474f3f518701249598b35c581b92a3c95b48 zswap: shrink zswap pool based on memory pressure

:::::: TO: Nhat Pham <nphamcs@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
