Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542171E88C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705534105; cv=none; b=Cd36ysKL9Veo3eKqKT887z2gKv0tAvczirEbiyx0zA+DsYyYH7gZB3MnO2B3/TlH3TzH0jZcDIhY4V9CB5tfSXpk8yRMVJg9JOCDIKMjpUj2hmsOs+BmcKiLfmTrGtGEbujE/pcIHNFeo8s5+kfZnvHdOVHDT7lQNSCErdXOZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705534105; c=relaxed/simple;
	bh=uqk7b+nU9UcZ0xN46p67XrN/YBHPBDvg1LzK9eFX/dE=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=WBTGAZqgB8rAsuqcH96OmgclEY78eBliNUvdHf1W0Hv1Z9HbjWgTahuG8VHvzdaFO5L5pC/SrjG2lY0MKFRN8oEkkiycCtnXJOvg3zSUvylex69yc3oHrpgXqeLoC103Hhs+TEtin0v89ml4RcRa/6wGSv7/b8+cDFzrEx9UudI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCjx4F3X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCjx4F3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705534103; x=1737070103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqk7b+nU9UcZ0xN46p67XrN/YBHPBDvg1LzK9eFX/dE=;
  b=bCjx4F3XnAEYy0Gt97VJnmXUNVr/7Q4ZU+iF30vkAJWAKP+AWeiXrhQA
   02A5gCaish2aTm4/hWXDsE9bdxItGieiVsAiSzBhmls2hNJuPlMI/FXhc
   jOSceLuqx01BAASAOO/F2QW0xkeSU0gCXy0+b51gvEwmFd5a6AybH9jzv
   LJVgCSPA7hfLjg+sRmzlEv8QZqOPxA1FnnGKuf050mXl3qK/j75aAxRlh
   Yk1TqUR17Kv+i3G4lFdczG6PSOa8O2zR0VNY774rGbAHROqAEMfbOYngE
   kuFLhZP5buNbgeMtCls2bc9TYM+cclV759mUJkf1rk6eKhD3etmk4Tu+A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7390736"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7390736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 15:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="18957148"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2024 15:28:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQFKV-0002QU-0P;
	Wed, 17 Jan 2024 23:28:19 +0000
Date: Thu, 18 Jan 2024 07:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2401/2425] mm/dynamic_pool.c:822:6: warning:
 variable 'type' is used uninitialized whenever 'if' condition is true
Message-ID: <202401180746.D0P3weh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 643880149acaedeaceeedc399e3ccaaad4f838ae [2401/2425] mm/dynamic_pool: add tracepoints for dpool
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240118/202401180746.D0P3weh6-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180746.D0P3weh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180746.D0P3weh6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/dynamic_pool.c:822:6: warning: variable 'type' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     822 |         if (!dpool->online)
         |             ^~~~~~~~~~~~~~
   mm/dynamic_pool.c:851:36: note: uninitialized use occurs here
     851 |         trace_dpool_alloc_hugepage(dpool, type, folio, pool->free_huge_pages,
         |                                           ^~~~
   mm/dynamic_pool.c:822:2: note: remove the 'if' if its condition is always false
     822 |         if (!dpool->online)
         |         ^~~~~~~~~~~~~~~~~~~
     823 |                 goto unlock;
         |                 ~~~~~~~~~~~
   mm/dynamic_pool.c:812:10: note: initialize the variable 'type' to silence this warning
     812 |         int type;
         |                 ^
         |                  = 0
>> mm/dynamic_pool.c:822:6: warning: variable 'pool' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     822 |         if (!dpool->online)
         |             ^~~~~~~~~~~~~~
   mm/dynamic_pool.c:851:49: note: uninitialized use occurs here
     851 |         trace_dpool_alloc_hugepage(dpool, type, folio, pool->free_huge_pages,
         |                                                        ^~~~
   mm/dynamic_pool.c:822:2: note: remove the 'if' if its condition is always false
     822 |         if (!dpool->online)
         |         ^~~~~~~~~~~~~~~~~~~
     823 |                 goto unlock;
         |                 ~~~~~~~~~~~
   mm/dynamic_pool.c:809:25: note: initialize the variable 'pool' to silence this warning
     809 |         struct pages_pool *pool;
         |                                ^
         |                                 = NULL
   2 warnings generated.


vim +822 mm/dynamic_pool.c

d5ea6f5f46c383 Liu Shixin 2024-01-13  804  
8ce9d44df8ec1c Liu Shixin 2024-01-13  805  struct folio *dynamic_pool_alloc_hugepage(struct hugetlbfs_inode_info *p,
8ce9d44df8ec1c Liu Shixin 2024-01-13  806  					  struct hstate *h, bool reserved)
8ce9d44df8ec1c Liu Shixin 2024-01-13  807  {
8ce9d44df8ec1c Liu Shixin 2024-01-13  808  	struct dynamic_pool *dpool;
8ce9d44df8ec1c Liu Shixin 2024-01-13  809  	struct pages_pool *pool;
8ce9d44df8ec1c Liu Shixin 2024-01-13  810  	struct folio *folio = NULL;
8ce9d44df8ec1c Liu Shixin 2024-01-13  811  	unsigned long flags;
8ce9d44df8ec1c Liu Shixin 2024-01-13  812  	int type;
8ce9d44df8ec1c Liu Shixin 2024-01-13  813  
8ce9d44df8ec1c Liu Shixin 2024-01-13  814  	if (!dpool_enabled)
8ce9d44df8ec1c Liu Shixin 2024-01-13  815  		return NULL;
8ce9d44df8ec1c Liu Shixin 2024-01-13  816  
8ce9d44df8ec1c Liu Shixin 2024-01-13  817  	dpool = p->dpool;
8ce9d44df8ec1c Liu Shixin 2024-01-13  818  	if (!dpool)
8ce9d44df8ec1c Liu Shixin 2024-01-13  819  		return NULL;
8ce9d44df8ec1c Liu Shixin 2024-01-13  820  
8ce9d44df8ec1c Liu Shixin 2024-01-13  821  	spin_lock_irqsave(&dpool->lock, flags);
8ce9d44df8ec1c Liu Shixin 2024-01-13 @822  	if (!dpool->online)
8ce9d44df8ec1c Liu Shixin 2024-01-13  823  		goto unlock;
8ce9d44df8ec1c Liu Shixin 2024-01-13  824  
8ce9d44df8ec1c Liu Shixin 2024-01-13  825  	if (hstate_is_gigantic(h))
8ce9d44df8ec1c Liu Shixin 2024-01-13  826  		type = PAGES_POOL_1G;
8ce9d44df8ec1c Liu Shixin 2024-01-13  827  	else
8ce9d44df8ec1c Liu Shixin 2024-01-13  828  		type = PAGES_POOL_2M;
8ce9d44df8ec1c Liu Shixin 2024-01-13  829  	pool = &dpool->pool[type];
8ce9d44df8ec1c Liu Shixin 2024-01-13  830  
8ce9d44df8ec1c Liu Shixin 2024-01-13  831  	list_for_each_entry(folio, &pool->freelist, lru) {
8ce9d44df8ec1c Liu Shixin 2024-01-13  832  		if (folio_test_hwpoison(folio))
8ce9d44df8ec1c Liu Shixin 2024-01-13  833  			continue;
8ce9d44df8ec1c Liu Shixin 2024-01-13  834  
8ce9d44df8ec1c Liu Shixin 2024-01-13  835  		list_del(&folio->lru);
8ce9d44df8ec1c Liu Shixin 2024-01-13  836  		__folio_clear_dpool(folio);
8ce9d44df8ec1c Liu Shixin 2024-01-13  837  		folio_ref_unfreeze(folio, 1);
8ce9d44df8ec1c Liu Shixin 2024-01-13  838  		pool->free_huge_pages--;
8ce9d44df8ec1c Liu Shixin 2024-01-13  839  		pool->used_huge_pages++;
8ce9d44df8ec1c Liu Shixin 2024-01-13  840  		if (reserved) {
8ce9d44df8ec1c Liu Shixin 2024-01-13  841  			folio_set_hugetlb_restore_reserve(folio);
8ce9d44df8ec1c Liu Shixin 2024-01-13  842  			pool->resv_huge_pages--;
8ce9d44df8ec1c Liu Shixin 2024-01-13  843  		}
8ce9d44df8ec1c Liu Shixin 2024-01-13  844  		folio_set_pool(folio);
8ce9d44df8ec1c Liu Shixin 2024-01-13  845  		goto unlock;
8ce9d44df8ec1c Liu Shixin 2024-01-13  846  	}
8ce9d44df8ec1c Liu Shixin 2024-01-13  847  	folio = NULL;
8ce9d44df8ec1c Liu Shixin 2024-01-13  848  
8ce9d44df8ec1c Liu Shixin 2024-01-13  849  unlock:
8ce9d44df8ec1c Liu Shixin 2024-01-13  850  	spin_unlock_irqrestore(&dpool->lock, flags);
643880149acaed Liu Shixin 2024-01-13  851  	trace_dpool_alloc_hugepage(dpool, type, folio, pool->free_huge_pages,
643880149acaed Liu Shixin 2024-01-13  852  				   pool->resv_huge_pages);
8ce9d44df8ec1c Liu Shixin 2024-01-13  853  
8ce9d44df8ec1c Liu Shixin 2024-01-13  854  	return folio;
8ce9d44df8ec1c Liu Shixin 2024-01-13  855  }
8ce9d44df8ec1c Liu Shixin 2024-01-13  856  

:::::: The code at line 822 was first introduced by commit
:::::: 8ce9d44df8ec1c75e96b296f3c6dcbcd47d99188 mm/dynamic_pool: support HugeTLB page allocation from dpool

:::::: TO: Liu Shixin <liushixin2@huawei.com>
:::::: CC: Liu Shixin <liushixin2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
