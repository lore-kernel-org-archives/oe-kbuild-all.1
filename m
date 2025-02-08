Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF611A9B4A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739008662; cv=none; b=QktRcZJ8Ggen8pusR0fa1L1seHxgMYTUt1TyYcy1ADbKdM6AwWTPgbeZS8K45nBItk6uWyb6PdLxzkU1OsizVCtP1g6WHxylvKwDQw+6RrCSl4XuqiApQncws51X01a/7kSAuMorIXzc/O3Ld45LVLjdyBKjakWfQHLGZyP7fzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739008662; c=relaxed/simple;
	bh=MsOoM44tNhtRuFG8eU190U0aYT5Sx1/aOAd5u3KQVH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IoVGvK+T0nkoe9dL60c0VVv/N/d93q+YaChzFMjjO1Ngajyez4bTh/+pg9KP5SzaFw/tswB0FJUlvWEHs+H8Xs5thwGvIs937+hXWQ0MK7/4Jtwb40VooCq9okoLbtTe1qgFhIwz34L6LdATxbrJSY9QrgiZAiJ9zCnrZLJIUKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3RPjPy2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3RPjPy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739008660; x=1770544660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsOoM44tNhtRuFG8eU190U0aYT5Sx1/aOAd5u3KQVH8=;
  b=N3RPjPy2cmswZkHVRbRZvoupgTd4ffyYfXdF18lPQ1FV6c7QoLghqw2e
   lGwnd5FBhbi4AqVp4pehfxDAscvlLnappi3ziXUkP8HUAqoocYsnxTudF
   CEzWYnpnHTR5BqdwPkbCVweB4pOQjkxejTh/QrkpvYVgUOAH/bTELLTvS
   K6cELb/6iYQqaDIt2kK/HDhfbIq9B8NmEp379oPxhjalMBRyffnCvjKkJ
   pNuVl2VXLfT7JJra/T8ZWBtxQl3DED+hPYd8cbvtKTZuT8srYdW1wolVq
   HMaKhYi/E7yUtwX9XJm0mLm8cG2t+hONgJVRt68a/gLwZLlYCeo8depgu
   g==;
X-CSE-ConnectionGUID: lCsF2OgRTzmgRi0onREGPQ==
X-CSE-MsgGUID: d5fzLRJBSJOAYDW+xDwFVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57184525"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57184525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 01:57:36 -0800
X-CSE-ConnectionGUID: 2TILAU9CQbaZJxI1mTBrPA==
X-CSE-MsgGUID: F/fLRxn8Sn2R/ciryOSkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="142612651"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 01:57:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tghae-000zpV-2Q;
	Sat, 08 Feb 2025 09:57:32 +0000
Date: Sat, 8 Feb 2025 17:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1899/1899] mm/dynamic_pool.c:1612:51: warning:
 variable 'ret' is uninitialized when used here
Message-ID: <202502081751.f1v777Vf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8673e7441a723dd5e885e372a4d0351658286304
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [1899/1899] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250208/202502081751.f1v777Vf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081751.f1v777Vf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081751.f1v777Vf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/dynamic_pool.c:10:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   mm/dynamic_pool.c:836:6: warning: variable 'type' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     836 |         if (!dpool->online)
         |             ^~~~~~~~~~~~~~
   mm/dynamic_pool.c:865:36: note: uninitialized use occurs here
     865 |         trace_dpool_alloc_hugepage(dpool, type, folio, pool->free_huge_pages,
         |                                           ^~~~
   mm/dynamic_pool.c:836:2: note: remove the 'if' if its condition is always false
     836 |         if (!dpool->online)
         |         ^~~~~~~~~~~~~~~~~~~
     837 |                 goto unlock;
         |                 ~~~~~~~~~~~
   mm/dynamic_pool.c:826:10: note: initialize the variable 'type' to silence this warning
     826 |         int type;
         |                 ^
         |                  = 0
   mm/dynamic_pool.c:836:6: warning: variable 'pool' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     836 |         if (!dpool->online)
         |             ^~~~~~~~~~~~~~
   mm/dynamic_pool.c:865:49: note: uninitialized use occurs here
     865 |         trace_dpool_alloc_hugepage(dpool, type, folio, pool->free_huge_pages,
         |                                                        ^~~~
   mm/dynamic_pool.c:836:2: note: remove the 'if' if its condition is always false
     836 |         if (!dpool->online)
         |         ^~~~~~~~~~~~~~~~~~~
     837 |                 goto unlock;
         |                 ~~~~~~~~~~~
   mm/dynamic_pool.c:823:25: note: initialize the variable 'pool' to silence this warning
     823 |         struct pages_pool *pool;
         |                                ^
         |                                 = NULL
>> mm/dynamic_pool.c:1612:51: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1612 |                 pr_err("init failed, create failed. ret: %d\n", ret);
         |                                                                 ^~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/dynamic_pool.c:1586:9: note: initialize the variable 'ret' to silence this warning
    1586 |         int ret;
         |                ^
         |                 = 0
   8 warnings generated.


vim +/ret +1612 mm/dynamic_pool.c

  1582	
  1583	int dpool_init(struct dpool_info *arg)
  1584	{
  1585		struct dynamic_pool *dpool;
  1586		int ret;
  1587	
  1588		if (!dpool_enabled)
  1589			return -EINVAL;
  1590	
  1591		if (!arg || !arg->memcg || arg->range_cnt <= 0) {
  1592			pr_err("init failed, arg is invalid\n");
  1593			return -EINVAL;
  1594		}
  1595	
  1596		mutex_lock(&dpool_mutex);
  1597	
  1598		if (dpool_global_pool || arg->memcg->dpool) {
  1599			pr_err("init failed, dpool is already exist\n");
  1600			ret = -EINVAL;
  1601			goto unlock;
  1602		}
  1603	
  1604		if (!(arg->memcg->css.cgroup->self.flags & CSS_ONLINE)) {
  1605			pr_err("init failed, memcg is not online\n");
  1606			ret = -EINVAL;
  1607			goto unlock;
  1608		}
  1609	
  1610		dpool = dpool_create(arg->memcg, &pagelist_dpool_ops);
  1611		if (!dpool) {
> 1612			pr_err("init failed, create failed. ret: %d\n", ret);
  1613			ret = -ENOMEM;
  1614			goto unlock;
  1615		}
  1616	
  1617		dpool_global_pool = dpool;
  1618	
  1619		BUG_ON(!dpool->ops->fill_pool);
  1620		ret = dpool->ops->fill_pool(dpool, arg);
  1621		if (ret)
  1622			dpool_put(dpool);
  1623	
  1624	unlock:
  1625		mutex_unlock(&dpool_mutex);
  1626	
  1627		return ret;
  1628	}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
