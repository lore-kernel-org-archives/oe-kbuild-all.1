Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3311D435F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776056803; cv=none; b=kt66WZV8BwiIfitHHBXAVnrUcP/7UmhgP7kSdgpisKKgTP/fgZ/2cf4YiznCcrJwFKaqXwlw/Ba7O5SYMq8xCB0bi2okXI60bwlHfJP4KN67q5RUEwAKqi0nuDM/IGqmpfVEeklxx4Ucrr9NyDyvfxXnVROYz2QnsJILC4giIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776056803; c=relaxed/simple;
	bh=P+b7uaFGTUV3bTP6yciBUHO15N2Azg/BFtHQI7h1is8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nZc0/crp8rZFQQIb7LmyymsIKe1FnZzVkbn7K6n7y74pgaUToBeYBdRq5AGeQv5EPFwfJ/0UQG+jPmNjcEaBNeFMEyt6nNXETxHV3O8/F6pA+l47multKOIJIk3CakODTdeszfKOGXp2iuihJBA6PH4mznhrK1vf2h1EjdHk33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMgDp1wp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMgDp1wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776056802; x=1807592802;
  h=date:from:to:cc:subject:message-id;
  bh=P+b7uaFGTUV3bTP6yciBUHO15N2Azg/BFtHQI7h1is8=;
  b=nMgDp1wpPG80PUsspZ7MwjdnlEi5adDZd8VFyPFcX6ZcmiPcq/0qUSmp
   /EzWnFaoOGGB49U7NkGmWFG3fBUNI61yLCXxsDgBplrsXaYIbNeNYLB6Z
   a8hJtq+7OO7Jud/t7xraT/Ad4hxRJT86DvkXIrnyLB5AfOI6lEj2DU7Tl
   WFCda0B7TV7VF88f6Bl7ep085nxeS2UZUvOB3iv6sc+h/jb6iSzI3IY9u
   izs2zT4/InjjN+S7ec2cnVh8256PDBKLwDq+/yDniarv36ySYM5ULlUK8
   RJJoew5jPmTK3mi3GHkgIS558M3atu8OPEKEVv7pL0aW/tNzUw+MV8z/s
   g==;
X-CSE-ConnectionGUID: Oj48YtYZScawT6TOE8JXcg==
X-CSE-MsgGUID: c97JfvwuQKemsQ9Xw6kGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76019859"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76019859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 22:06:41 -0700
X-CSE-ConnectionGUID: z0ees/fkRs6+wnZ/spFGtA==
X-CSE-MsgGUID: 3ani71wNQO6Da1QbjyqTgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="229592895"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Apr 2026 22:06:40 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC9VN-00000000BRx-2ohW;
	Mon, 13 Apr 2026 05:06:37 +0000
Date: Mon, 13 Apr 2026 07:05:38 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/cgroup/dmem.c:638:32: error: 'memory_cgrp_subsys'
 undeclared; did you mean 'dmem_cgrp_subsys'?
Message-ID: <202604130746.rTvdZdvd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Chanudet/mm-memcontrol-add-page-level-charge-uncharge-functions/20260412-024958
head:   d432aa1b86c612f87412ed0e6bd36d1818b7522d
commit: d432aa1b86c612f87412ed0e6bd36d1818b7522d cgroup/dmem: add a node to double charge in memcg
date:   34 hours ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260413/202604130746.rTvdZdvd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130746.rTvdZdvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130746.rTvdZdvd-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/dmem.c: In function 'mem_cgroup_from_cgroup':
>> kernel/cgroup/dmem.c:638:32: error: 'memory_cgrp_subsys' undeclared (first use in this function); did you mean 'dmem_cgrp_subsys'?
     638 |         css = cgroup_e_css(c, &memory_cgrp_subsys);
         |                                ^~~~~~~~~~~~~~~~~~
         |                                dmem_cgrp_subsys
   kernel/cgroup/dmem.c:638:32: note: each undeclared identifier is reported only once for each function it appears in
   kernel/cgroup/dmem.c: In function 'dmem_cgroup_uncharge':
>> kernel/cgroup/dmem.c:663:17: error: implicit declaration of function 'mem_cgroup_uncharge_pages'; did you mean 'mem_cgroup_uncharge_folios'? [-Wimplicit-function-declaration]
     663 |                 mem_cgroup_uncharge_pages(memcg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 mem_cgroup_uncharge_folios
   kernel/cgroup/dmem.c: In function 'dmem_cgroup_try_charge':
>> kernel/cgroup/dmem.c:720:23: error: implicit declaration of function 'mem_cgroup_try_charge_pages'; did you mean 'dmem_cgroup_try_charge'? [-Wimplicit-function-declaration]
     720 |                 ret = mem_cgroup_try_charge_pages(memcg, GFP_KERNEL, nr_pages);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       dmem_cgroup_try_charge


vim +638 kernel/cgroup/dmem.c

   629	
   630	static struct mem_cgroup *mem_cgroup_from_cgroup(struct cgroup *c)
   631	{
   632		struct cgroup_subsys_state *css;
   633	
   634		if (mem_cgroup_disabled())
   635			return NULL;
   636	
   637		rcu_read_lock();
 > 638		css = cgroup_e_css(c, &memory_cgrp_subsys);
   639		rcu_read_unlock();
   640	
   641		return mem_cgroup_from_css(css);
   642	}
   643	
   644	/**
   645	 * dmem_cgroup_uncharge() - Uncharge a pool.
   646	 * @pool: Pool to uncharge.
   647	 * @size: Size to uncharge.
   648	 *
   649	 * Undoes the effects of dmem_cgroup_try_charge.
   650	 * Must be called with the returned pool as argument,
   651	 * and same @index and @size.
   652	 */
   653	void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
   654	{
   655		if (!pool)
   656			return;
   657	
   658		page_counter_uncharge(&pool->cnt, size);
   659	
   660		struct mem_cgroup *memcg = mem_cgroup_from_cgroup(pool->cs->css.cgroup);
   661	
   662		if (pool->memcg && memcg)
 > 663			mem_cgroup_uncharge_pages(memcg,
   664						  PAGE_ALIGN(size) >> PAGE_SHIFT);
   665	
   666		css_put(&pool->cs->css);
   667		dmemcg_pool_put(pool);
   668	}
   669	EXPORT_SYMBOL_GPL(dmem_cgroup_uncharge);
   670	
   671	/**
   672	 * dmem_cgroup_try_charge() - Try charging a new allocation to a region.
   673	 * @region: dmem region to charge
   674	 * @size: Size (in bytes) to charge.
   675	 * @ret_pool: On succesfull allocation, the pool that is charged.
   676	 * @ret_limit_pool: On a failed allocation, the limiting pool.
   677	 *
   678	 * This function charges the @region region for a size of @size bytes.
   679	 *
   680	 * If the function succeeds, @ret_pool is set, which must be passed to
   681	 * dmem_cgroup_uncharge() when undoing the allocation.
   682	 *
   683	 * When this function fails with -EAGAIN and @ret_limit_pool is non-null, it
   684	 * will be set to the pool for which the limit is hit. This can be used for
   685	 * eviction as argument to dmem_cgroup_evict_valuable(). This reference must be freed
   686	 * with @dmem_cgroup_pool_state_put().
   687	 *
   688	 * Return: 0 on success, -EAGAIN on hitting a limit, or a negative errno on failure.
   689	 */
   690	int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
   691				  struct dmem_cgroup_pool_state **ret_pool,
   692				  struct dmem_cgroup_pool_state **ret_limit_pool)
   693	{
   694		struct dmemcg_state *cg;
   695		struct dmem_cgroup_pool_state *pool;
   696		struct page_counter *fail;
   697		struct mem_cgroup *memcg;
   698		unsigned long nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
   699		int ret;
   700	
   701		*ret_pool = NULL;
   702		if (ret_limit_pool)
   703			*ret_limit_pool = NULL;
   704	
   705		/*
   706		 * hold on to css, as cgroup can be removed but resource
   707		 * accounting happens on css.
   708		 */
   709		cg = get_current_dmemcs();
   710	
   711		pool = get_cg_pool_unlocked(cg, region);
   712		if (IS_ERR(pool)) {
   713			ret = PTR_ERR(pool);
   714			goto err_css_put;
   715		}
   716	
   717		pool->memcg_locked = true;
   718		memcg = get_mem_cgroup_from_current();
   719		if (pool->memcg && memcg) {
 > 720			ret = mem_cgroup_try_charge_pages(memcg, GFP_KERNEL, nr_pages);
   721			if (ret) {
   722				/*
   723				 * No dmem_cgroup_state_evict_valuable() could help,
   724				 * there's no ret_limit_pool to return.
   725				 */
   726				ret = -ENOMEM;
   727				dmemcg_pool_put(pool);
   728				goto err_memcg_put;
   729			}
   730		}
   731	
   732		if (!page_counter_try_charge(&pool->cnt, size, &fail)) {
   733			if (ret_limit_pool) {
   734				*ret_limit_pool = container_of(fail, struct dmem_cgroup_pool_state, cnt);
   735				css_get(&(*ret_limit_pool)->cs->css);
   736				dmemcg_pool_get(*ret_limit_pool);
   737			}
   738			dmemcg_pool_put(pool);
   739			ret = -EAGAIN;
   740			goto err_uncharge_memcg;
   741		}
   742	
   743		mem_cgroup_put(memcg);
   744	
   745		/* On success, reference from get_current_dmemcs is transferred to *ret_pool */
   746		*ret_pool = pool;
   747		return 0;
   748	
   749	err_uncharge_memcg:
   750		if (pool->memcg && memcg)
   751			mem_cgroup_uncharge_pages(memcg, nr_pages);
   752	err_memcg_put:
   753		mem_cgroup_put(memcg);
   754	err_css_put:
   755		css_put(&cg->css);
   756		return ret;
   757	}
   758	EXPORT_SYMBOL_GPL(dmem_cgroup_try_charge);
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
