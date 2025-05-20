Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D02620F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778083; cv=none; b=irssg3qO32RnmhGLS0XRk4SMrJVNecnl+IkaQwscrUMvBlp7PKrcQGoLVj8CnzPpt/yn779nr8PX/756MaS2yHeLlFn49JCr0q+7fLRa7bvXwH6WjHTrTcXYO3gXsqrlsq64dPG5p+1/15nGkNi37OllV0VNSdebh4u2rnfon+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778083; c=relaxed/simple;
	bh=wjTEHRjDdLSy4VE49yyo2IvWmHv2QV1h7mYB08wftAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDn1UKJzMnNpC9A/wLJry/oF4FyL4uWq7jNQtnDVMHS2LhTtD8/IXD1bscRrB/gVp2fn/Hr6meciMs9D68i05VZZlawiG2m+pd/OMMkqMQ3G7AJ8fyt5evMLLq2g2jszgQMHOZD5HLQ/d95wWIlr1P+TRjP3t+VFoLSh8FDKZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaHQANhJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaHQANhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747778080; x=1779314080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjTEHRjDdLSy4VE49yyo2IvWmHv2QV1h7mYB08wftAc=;
  b=kaHQANhJ3R8sMKsrJ9zAPbBXPjI5m62fxhEeLCpe+VVIvjdFR/wht8dM
   4RLS33OnmKyKtGaGWiBGHWj/ygx90R/KMlkQJ+LtZdQGzhVzYS7bxPhiK
   s3MERIBn02XoYPFhfCttDiCUvSyS5UdoCzaUl9gy7VwxHQN4WH1T4Oj6h
   8QK4e6D5B8kTlw5RcRTcP+mDuykxGyp91/oK1bRFIpHLg1Y0r8FU0Sqsl
   ORXfyf9arBbfc4DWLAWNHHr5WHb8Uu+l6YHacPxKwHtdrvGK8S44oITkV
   GGCpCK3M/U6DbHpwvldRri3qGr4m3JDongl9J1esF+kdvZ4J9rHY7FXk6
   g==;
X-CSE-ConnectionGUID: vsR/eKbwQCy6OA+yWnQP2Q==
X-CSE-MsgGUID: cYqKfXrgR/K5mry6Kid7og==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60389883"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60389883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:54:39 -0700
X-CSE-ConnectionGUID: 3DRtmlLOSkGQepdgjas3hA==
X-CSE-MsgGUID: prko2RN3SjCrxRoAEUQgSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140312831"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2025 14:54:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUux-000Nbi-34;
	Tue, 20 May 2025 21:54:35 +0000
Date: Wed, 21 May 2025 05:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2263/2263] mm/dynamic_pool.c:1612:51: warning:
 variable 'ret' is uninitialized when used here
Message-ID: <202505210529.5XGNL1lQ-lkp@intel.com>
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
head:   dea1e68d661266b45b33cc596c34b451de95000c
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [2263/2263] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250521/202505210529.5XGNL1lQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210529.5XGNL1lQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210529.5XGNL1lQ-lkp@intel.com/

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
